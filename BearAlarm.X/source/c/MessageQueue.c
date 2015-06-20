#include "MessageQueue.h"

pMessage MessageCreate(char size)
{
    pMessage retval = 0;
    retval = pvPortMalloc(sizeof(Message_t));
    retval->Size = size;
    retval->Data = pvPortMalloc(size);
    return retval;
}

/**
 * Creates a queue that uses pMessages.
 * @param QueueSize The number of elements that can be in the queue at a time.
 * @return Returns a QueueHandle_t to the queue.
 */
QueueHandle_t MessageQueueCreate(char QueueSize)
{
    return xQueueCreate(QueueSize,sizeof(pMessage));
}

BaseType_t MessageSend(QueueHandle_t Queue, const pMessage * ppMessage,
        TickType_t TicksToWait)
{
    return xQueueSend(Queue, ppMessage, TicksToWait);
}


BaseType_t MessageReceive(QueueHandle_t Queue, pMessage * ppMessage, 
        TickType_t TicksToWait)
{
    return xQueueReceive(Queue, ppMessage, TicksToWait);
}

/**
 * Frees the memory occupied by the Message
 * @param Message
 */
void MessageDelete(pMessage Message)
{
    vPortFree(Message->Data);
    vPortFree(Message);
}