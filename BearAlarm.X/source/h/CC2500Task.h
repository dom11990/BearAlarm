/* 
 * File:   CC2500Task.h
 * Author: Dominik
 *
 * Created on June 14, 2015, 11:13 PM
 */

#ifndef CC2500TASK_H
#define	CC2500TASK_H

#ifdef	__cplusplus
extern "C" {
#endif

    
#include <stdio.h>
#include <string.h>

    
#include "CC2500.h"
#include "LCDTask.h"
#include "MessageQueue.h"
#include "Global.h"
    
    
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

#define CC2500_STATE_IDLE   0x0
#define CC2500_STATE_RX     0x1
#define CC2500_STATE_TX     0x2


    
#define CC2500_CS_TRIS      TRISBbits.TRISB15 = 0;
#define CC2500_CS           LATBbits.LATB15 
    
#define CC2500_Q_TIMEOUT    5000

#define CC2500_TASK_PRIORITY    1
    
#define CC2500_COMMAND_RX       1
    
    enum CC2500_States {CC2500_IDLE = 0, CC2500_RX = 1, CC2500_PING_REPLY = 2};
    
    typedef struct 
    {
        CC2500_Session Session;
        QueueHandle_t RFQueue;
        QueueHandle_t LCDQueue;
        char * SPIConfigured;
        enum CC2500_States State;
        
    } CC2500TaskData_t;
    

    BaseType_t CreateCC2500Task(CC2500TaskData_t ** CC2500TaskData,
        TaskHandle_t * TaskRef, QueueHandle_t LCDQueue, char * SPIConfigured);
    
    void CC2500Task(void * parameters);
    
    void ChipSelect(char active);
    
    int readData(CC2500_Session Session);
    
#ifdef	__cplusplus
}
#endif

#endif	/* CC2500TASK_H */

