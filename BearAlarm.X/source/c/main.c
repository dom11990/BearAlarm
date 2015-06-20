/* 
 * File:   main.c
 * Author: Dominik
 * Created on June 8th, 2015
 */


#include "main.h"
#include "LCD.h"


static QueueHandle_t TopQueue;

//TODO: create semaphores for modules i.e the SPI2 engine, ADC etc
int main()
{
    //Task Handles
    TaskHandle_t MonitorTaskRef;
    TaskHandle_t LCDTaskRef;
    TaskHandle_t TemperatureTaskRef;
    TaskHandle_t CC2500TaskRef;
    TaskHandle_t TopTaskRef;
    
    

    //Task Data
    MonitorTaskData_t * MonitorTaskData = 0;
    LCDTaskData_t * LCDTaskData = 0;
    TemperatureTaskData_t * TemperatureTaskData = 0;
    CC2500TaskData_t * CC2500TaskData = 0;
    TopTaskData_t * TopTaskData = 0;
    
    //initialize the clock speed and the output latches of the pic
    PICInit();

    
    //create any shared variables
    char * SPIConfigured = pvPortMalloc(sizeof(char));
    
    CreateLCDTask(&LCDTaskData,&LCDTaskRef, SPIConfigured);
    
    CreateTemperatureTask(&TemperatureTaskData,&TemperatureTaskRef,
            LCDTaskData->LCDQueue);
    
    CreateCC2500Task(&CC2500TaskData, &CC2500TaskRef, LCDTaskData->LCDQueue,
            SPIConfigured);
    
    CreateMonitorTask(&MonitorTaskData,&MonitorTaskRef,5,LCDTaskData->LCDQueue);
    MonitorTaskData->Tasks[MONITOR_TASK] = MonitorTaskRef;
    MonitorTaskData->Tasks[LCD_TASK] = LCDTaskRef;
    MonitorTaskData->Tasks[TEMPERATURE_TASK] = TemperatureTaskRef;
    MonitorTaskData->Tasks[CC2500_TASK] = CC2500TaskRef;
    MonitorTaskData->Tasks[TOP_TASK] = 0;

    CreateTopTask(&TopTaskData,&TopTaskRef,MonitorTaskData->Tasks);
    TopTaskData->RFQueue = CC2500TaskData->RFQueue;
    TopTaskData->LCDQueue = LCDTaskData->LCDQueue;
    
    MonitorTaskData->Tasks[TOP_TASK] = TopTaskRef;
    

    
    
    vTaskStartScheduler();
    while(1)
        Nop();
    
    return 0;
}

void DebounceTimer(TimerHandle_t xTimer)
{
    pMessage msg = MessageCreate(0);
    msg->Command = TOP_COMMAND_DEBOUNCE;
    MessageSend(TopQueue,&msg,1000);
}
void TopTask(void * parameters)
{
    pMessage Message = 0;
    TopTaskData_t * Data = (TopTaskData_t*) parameters;
    TopQueue = MessageQueueCreate(10);
    Data->TopQueue = TopQueue;
    Data->Debounce = xTimerCreate(
            "Debounce",300,pdFALSE,(void *) Data,DebounceTimer);  
    
    INTCON2bits.INT0EP = 1; //interrupt on negative edge
    IFS0bits.INT0IF = 0;
    IEC0bits.INT0IE = 1;
    
    
    Message = CreateClearLCDMessage();
    MessageSend(Data->LCDQueue,&Message,1000);
    
    while(1)
    {
        if(MessageReceive(Data->TopQueue,&Message,1000))
        {
            switch(Message->Command)
            {
                case TOP_COMMAND_INTTERUPT:
                    xTimerReset(Data->Debounce,100);
                    break;
                case TOP_COMMAND_DEBOUNCE:
                    Message = MessageCreate(0);
                    Message->Command = CC2500_COMMAND_RX;
                    MessageSend(Data->RFQueue,&Message,1000);
                    break;
                    default:
                        break;
            }           
            MessageDelete(Message);
        }
    }
}

BaseType_t CreateTopTask(TopTaskData_t ** TopTaskData,
        TaskHandle_t * TaskRef, TaskHandle_t * Tasks)
{
    BaseType_t pass = pdFAIL;
    (*TopTaskData) = pvPortMalloc(sizeof(TopTaskData_t));
    
    (*TopTaskData)->Tasks = Tasks;
    
    pass = xTaskCreate(TopTask,"Top",200,(*TopTaskData),
            0,TaskRef);
    
    return pass;
    
}
    

/**
 * Initializes the PIC, sets pins to input and Fcy to 60MHz
 */
void PICInit(void)
{
    CLKDIV = 0x00;
    PLLFBD = 63;            //somehow 63 puts Fcy close to 60MHz -> (60.24-59.88)

    //configure output ports
    TRISA = 0xFFFF;         //set to HIGH-Z
    TRISB = 0xFFFF;         //set to HIGH-Z
}


void __attribute__((__interrupt__, auto_psv)) _INT0Interrupt( void )
{

    portBASE_TYPE xHigherPriorityTaskWoken = pdFALSE;

    pMessage Message = MessageCreate(0);
    Message->Command = TOP_COMMAND_INTTERUPT;
    IFS0bits.INT0IF = 0;
    xQueueSendFromISR(TopQueue,&Message,&xHigherPriorityTaskWoken);

    
    
    //if we woke a higher priority task than the one that was interrupted
    //via the interrupt, we need to exit this ISR in a way that will cause
    //a context switch
	if( xHigherPriorityTaskWoken != pdFALSE )
	{
		taskYIELD();
	}
}