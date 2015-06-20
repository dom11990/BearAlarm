#include "CC2500Task.h"



BaseType_t CreateCC2500Task(CC2500TaskData_t ** CC2500TaskData,
        TaskHandle_t * TaskRef, QueueHandle_t LCDQueue, char * SPIConfigured)
{
    BaseType_t pass = pdFAIL;
    (*CC2500TaskData) = pvPortMalloc(sizeof(CC2500TaskData_t));
    (*CC2500TaskData)->LCDQueue = LCDQueue;
    (*CC2500TaskData)->SPIConfigured = SPIConfigured;
    (*CC2500TaskData)->RFQueue = MessageQueueCreate(20);
    pass = xTaskCreate(CC2500Task,"CC2500",200,
            (*CC2500TaskData),CC2500_TASK_PRIORITY,TaskRef);
    
    return pass;
}


void CC2500Task(void * parameters)
{
    CC2500TaskData_t * Data = (CC2500TaskData_t*) parameters;
    pMessage Message = 0;
    __eds__ char temp = 0;
    //allocate string space for writing LCD messages
    char * string = pvPortMalloc(sizeof(char)*20);
    
    //configure the Chip Select line to be an output
    CC2500_CS_TRIS
    //set the current state to be idle
    Data->State = CC2500_IDLE;
    
    //wait for the Temperature task to configure the SPI module
    while(0 == *Data->SPIConfigured)
        vTaskDelay(100);
    
    //open a session to the CC2500 module and configure it for use
    Data->Session = CC2500_Init(ChipSelect,0xFA,0);
    
    

    
    while(1)
    {
        if(MessageReceive(Data->RFQueue,&Message,100))
        {
            switch(Message->Command)
            {
                case CC2500_COMMAND_RX:
                    CC2500_WriteStrobe(Data->Session,CC2500_SRX);
                    vTaskDelay(50);
                    break;
                default:
                    break;
            }
        }
         
        CC2500_ReadStatusRegister(Data->Session,&temp,0);
        switch(temp&0xf0)
        {
                case 0x00:  //IDLE mode
                    CC2500_ReadRxBytes(Data->Session,&temp,0);
                    Message = CreateWriteLineLCDMessage(string,
                            sprintf(string,"In IDLE Mode: %d",temp),0);
                    MessageSend(Data->LCDQueue,&Message,CC2500_Q_TIMEOUT);

                    if(temp>3){
                        CC2500_Packet * packet = 
                                CC2500_ReadPacket(Data->Session);
                        //TODO do something with the packet
                        CC2500_PacketFree(packet);
                    }
                    break;
                case 0x10:
                    Message = CreateWriteLineLCDMessage("In RX Mode",10,0);
                    MessageSend(Data->LCDQueue,&Message,CC2500_Q_TIMEOUT);
                      break;
                default:
                    
                    Message = CreateWriteLineLCDMessage(string, 
                            sprintf(string,"Unknown: 0x%x",temp),0);
                    MessageSend(Data->LCDQueue,&Message,CC2500_Q_TIMEOUT);
        }                   
    }
        
}

int readData(CC2500_Session Session)
{

    
    CC2500_Packet * packet = CC2500_ReadPacket(Session);

    Nop();
    vPortFree(packet);
    //0D BD
    return 0;
}


//active low
void ChipSelect(char state)
{
    CC2500_CS = state;    
}


void ProcessPacket(CC2500_Packet * packet)
{
    switch(packet->Payload[0])
    {
        case 0x1:
            break;
        default:
            break;
    }
}
