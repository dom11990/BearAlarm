/* 
 * File:   MessageQueue.h
 * Author: Dominik
 *
 * Created on June 17, 2015, 1:10 PM
 */

#ifndef MESSAGEQUEUE_H
#define	MESSAGEQUEUE_H

#ifdef	__cplusplus
extern "C" {
#endif

    
    
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

    
    typedef struct
    {
        char Command;
        char Size;
        char * Data;
    } Message_t;

    
    typedef Message_t * pMessage;
    
    pMessage MessageCreate(char size);

    QueueHandle_t MessageQueueCreate(char QueueSize);

    BaseType_t MessageSend(QueueHandle_t Queue, const pMessage * Message, 
        TickType_t TicksToWait);
    
     BaseType_t MessageReceive(QueueHandle_t Queue, pMessage * Message, 
        TickType_t TicksToWait);

    void MessageDelete(pMessage Message);



#ifdef	__cplusplus
}
#endif

#endif	/* MESSAGEQUEUE_H */

