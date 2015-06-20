/* 
 * File:   LCDTask.h
 * Author: dom
 *
 * Created on June 14, 2015, 9:55 AM
 */

#ifndef LCDTASK_H
#define	LCDTASK_H

#ifdef	__cplusplus
extern "C" {
#endif
#include <string.h>


#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
    
    
#include "LCD.h"
#include "MessageQueue.h"
#include "Global.h"
    
    
//LCD MESSAGE COMMANDS//////////////////////////////////////////////////////////
#define COMMAND_INIT        0x1
#define COMMAND_OFF         0x2
#define COMMAND_ON          0x3
#define COMMAND_CLEAR       0x4
#define COMMAND_HOME        0x5
#define COMMAND_WRITE       0x6
#define COMMAND_WRITE_AT    0x7
#define COMMAND_WRITE_LINE  0x8
#define COMMAND_SET_POS     0x9 
////////////////////////////////////////////////////////////////////////////////

#define LCD_TASK_PRIORITY   configMAX_PRIORITIES - 2
    typedef struct
    {
        QueueHandle_t LCDQueue;
        char * SPIConfigured;

    
    } LCDTaskData_t;

    

    BaseType_t CreateLCDTask(LCDTaskData_t ** LCDTaskData,
            TaskHandle_t * TaskRef, char * SPIConfigured);
    
    void LCDTask(void * parameters);


    pMessage CreateWriteAtLCDMessage(const char * Text, char TextLength, 
        char Row, char Column);

    pMessage CreateWriteLineLCDMessage(const char * Text, char TextLength, 
        char Row);

    pMessage CreateClearLCDMessage(void);

    pMessage CreateGenericLCDMessage(char command, char data_size);

#ifdef	__cplusplus
}
#endif

#endif	/* LCDTASK_H */

