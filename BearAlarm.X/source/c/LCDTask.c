
#include "LCDTask.h"

BaseType_t CreateLCDTask(LCDTaskData_t ** LCDTaskData,TaskHandle_t * TaskRef,
        char * SPIConfigured)
{
    //Create the LCD task, pass in its data, hold on to the task ref for the monitor task
    (*LCDTaskData) = pvPortMalloc(sizeof(LCDTaskData_t));
    //this is used to signal when the PIC has had it's SPI module configured
    (*LCDTaskData)->SPIConfigured = SPIConfigured;
    
    BaseType_t pass = xTaskCreate(LCDTask,"LCD",200,(*LCDTaskData),
            LCD_TASK_PRIORITY,TaskRef);
    (*LCDTaskData)->LCDQueue = MessageQueueCreate(20);
    return pass;
}

/**
 * This task manages the LCD board. It receives messages and performs
 * the appropriate actions such as writing text to the LCD or turning it off.
 * @param parameters
 */
void LCDTask(void * parameters)
{
    LCDTaskData_t * Data;

    pMessage Message = 0;
    Data = (LCDTaskData_t*) parameters;
#ifndef DEBUG
    LCD_TEST();
#endif
    *Data->SPIConfigured = 1;
    
    while(1)
    {
        //process all pending messages
        while(MessageReceive(Data->LCDQueue,&Message,1000))
        {
#ifndef DEBUG
            switch(Message->Command)
            {
                case COMMAND_INIT:
                    break;
                case COMMAND_OFF:
                    LCD_WriteCommand(LCD_CMD_DISPLAY_DOFF_COFF_BOFF);
                    break;
                case COMMAND_ON:
                    LCD_WriteCommand(LCD_CMD_DISPLAY_DON_COFF_BOFF);
                    break;
                case COMMAND_CLEAR:
                    LCD_WriteCommand(LCD_CMD_CLEAR_DISPLAY);
                    break;
                case COMMAND_HOME:
                    LCD_WriteCommand(LCD_CMD_RETURN_HOME);
                    break;
                case COMMAND_WRITE:
                    LCD_WriteStringNullTerm(Message->Data);
                    break;
                 case COMMAND_WRITE_AT:
                     //the first two bytes are the location of the write
                     LCD_SetPosition(Message->Data[0],Message->Data[1]);
                     //add two because the first two bytes are the location
                     //subtract two from the size because this size includes
                     //the row/column information which we don't want to write
                     LCD_WriteBuffer(Message->Data+2,Message->Size-2);
                                      
                     //data[0] is line number, data[1] is where the text starts
                    //LCD_write_line(Message->data+1,*Message->data);
                    break;
                case COMMAND_SET_POS:
                    LCD_SetPosition(Message->Data[0],Message->Data[1]);
                    break;
                default:
                    Nop();
                    break;                    
            }
#endif
            MessageDelete(Message);
        }
        //free up the CPU
        vTaskDelay(50);
    }
}



/**
 * Creates a message that can be filled with data to be sent to the LCD task
 * @param command The type of message this will be
 * @param data_size The size of the data block of the message
 * @return The LCDMessag that can be sent to the LCD Task
 */
pMessage CreateGenericLCDMessage(char Command, char Size)
{
    pMessage Message = MessageCreate(Size);
    Message->Command = Command;
    return Message;
}

/**
 * Creates a Message loaded with the input Text. This message can then be
 * sent to the LCD Task for displaying
 * @param Text
 * @param TextLength
 * @return 
 */
pMessage CreateWriteAtLCDMessage(const char * Text, char TextLength, 
        char Row, char Column)
{
    pMessage Message = 
            CreateGenericLCDMessage(COMMAND_WRITE_AT,TextLength+2);
    memcpy((Message->Data)+2, Text, TextLength);
    Message->Data[0] = Row;
    Message->Data[1] = Column;
    return Message;
}


pMessage CreateWriteLineLCDMessage(const char * Text, char TextLength, 
        char Row)
{
    pMessage Message = 
            CreateGenericLCDMessage(COMMAND_WRITE_AT,18);
    //fill the text buffer with spaces
    memset(Message->Data,' ',18);    
    //write the text into the buffer, unused elements will come out as space
    memcpy((Message->Data)+2, Text, TextLength);
    Message->Data[0] = Row;
    Message->Data[1] = 0;
    return Message;
}

/**
 * Creates a message that can be sent to the LCD Task that will clear the LCD
 * @return The correctly configured message to clear the LCD
 */
pMessage CreateClearLCDMessage(void)
{
    pMessage Message = CreateGenericLCDMessage(COMMAND_CLEAR,0);
    return Message;
}