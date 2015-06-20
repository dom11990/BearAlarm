#include "TemperatureTask.h"



BaseType_t CreateTemperatureTask(TemperatureTaskData_t ** TemperatureTaskData,
        TaskHandle_t * TaskRef, QueueHandle_t LCDQueue)
{
    BaseType_t pass = pdFAIL;
    (*TemperatureTaskData) = pvPortMalloc(sizeof(TemperatureTaskData_t));
    (*TemperatureTaskData)->LCDQueue = LCDQueue;
    pass = xTaskCreate(TemperatureTask,"Temp",200,
            (*TemperatureTaskData),TEMPERATURE_TASK_PRIORITY,TaskRef);
    
    return pass;
}


void TemperatureTask(void * parameters)
{

    double average;
    //char string[16];
    //LCDMessage_t * Message;
    TemperatureTaskData_t * Data = (TemperatureTaskData_t * )parameters;
    
    ConfigADC();
    
    while(1)
    {
        IFS0bits.AD1IF = 0;

        AD1CON1bits.SAMP = 1;

        while(IFS0bits.AD1IF < 1)
            Nop();

        average = RemoveOutliersAverage();


        Data->Volts = average/4096.0 * 3.3;
        Data->Kelvin = Data->Volts * 2 * 100;
        Data->Celsius = Data->Kelvin - 273.15;
        Data->Fahrenheit = 32 + 1.8 * Data->Celsius;
                
        /*
        Message = CreateWriteLineLCDMessage(string,
                sprintf(string,"Volts: %.3f",Data->Volts),0);
        MessageSend(Data->LCDQueue,&Message,0);
        
        Message = CreateWriteLineLCDMessage(string,
                sprintf(string,"Temp: %.1f",Data->Fahrenheit),1);
        MessageSend(Data->LCDQueue,&Message,0);
        */
        vTaskDelay(8000);
    }
    
}


int ConfigADC()
{
    AD1CON1bits.ADSIDL = 1;     //disable module in idle mode
    AD1CON1bits.ADDMABM = 1;    //DMA buffers are written in order of
                                //conversion (not used)
    AD1CON1bits.AD12B = 1;      //12 bit mode
    AD1CON1bits.FORM = 0b00;    //Integer 0000 xxxx xxxx xxxx
    AD1CON1bits.SSRC = 0b111;   //internal counter handles conversion (auto)
    AD1CON1bits.SSRCG = 0b0;    //needed for SSRC
    AD1CON1bits.SIMSAM = 0;     //channels sampled in sequence
    AD1CON1bits.ASAM = 1;       //auto sample after conversion

    AD1CON2bits.VCFG = 0b000;   //AVdd and AVss used as references
    AD1CON2bits.CSCNA = 0;      //dont scan inputs, only convert one channel
    AD1CON2bits.CHPS = 0b00;    //converts channel 0
    AD1CON2bits.SMPI = 0xf; //generate interrupt after every 16th sample
    AD1CON2bits.BUFM = 0;       //always start filling the buffer from start
    AD1CON2bits.ALTS = 0;       //always use channel input from MUXA

    AD1CON3bits.ADRC = 0;       //use ADC internal RC clock
    AD1CON3bits.SAMC = 0b11111; //auto sample time bits: 31 T_AD
    AD1CON3bits.ADCS = 0xFF;    //TP*(ADCS<7:0> + 1) = TP*256 = TAD


    AD1CON4bits.ADDMAEN = 0;    //dont use DMA, just use ADCBUFF

    AD1CHS123bits.CH123NA = 0;  //VREFL for negative input
    AD1CHS0bits.CH0NA = 0;      //channel 0 negative input is VRFL
    AD1CHS0bits.CH0SA = 0;      //channel 0 = AN0
    ANSELAbits.ANSA0 = 1;       //enable analog buffer
    TRISAbits.TRISA0 = 1;       //set as input

    AD1CON1bits.ADON = 1;           //AD module is on

    return 0;
}




/**
 * Computes the average of the non-outlying ADCBUF registers. This is 
 * accomplished by first finding the value with the least sum differential
 * to the other 15 values. Then, any ADCBUF value that is within 5 points
 * of the min-differential value is considered good, all others are considered
 * outliers and are not used in the average calculation.
 * @return The computed average. Returns 0 if no coherent data was found
 */
double RemoveOutliersAverage(void)
{
    double retval;
    unsigned char i,j, index;
    long * differential = pvPortMalloc(sizeof(long)*16);
    long min;
    
    //loop through each item in the ADC buffer and find the value with the
    //lowest sum of differences to the other values
    for(j=0;j<16;j++)
    {
        differential[j] = 0;
        for(i=0;i<16;i++)
            differential[j] += abs((&ADC1BUF0)[j]-(&ADC1BUF0)[i]);
        
        if(0==j)
        {
            min = differential[0];
            index = 0;
        }
        else
        {
            //update the minimum index and value as needed
            min = (min < differential[j])?min:differential[j];
            index = j;
        }
    }
    //now convert min to contain the actually value of the ADC value with 
    //the lowest differential
    min = (&ADC1BUF0)[index];
    
    char count = 0;
    retval = 0;
    for(i=0;i<16;i++)
    {
        if(min-(&ADC1BUF0)[i] < 5)
        {
            retval += (&ADC1BUF0)[i];
            count++;
        }
    }
    //compute the average of non-outlying data set
    //return 0 if count = 0;
    retval = (count)?retval / count:0;
    //clean up
    vPortFree(differential);
    
    return retval;
}