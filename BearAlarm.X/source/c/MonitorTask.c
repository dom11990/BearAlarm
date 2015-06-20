#include "MonitorTask.h"

/**
 * Creates the Monitor Task. The user may modify it's data after calling this
 * method.
 * @param MonitorTaskData Pointer to the Monitor Task data. This function
 * will allocate the necessary space under the hood.
 * @param TaskRef Reference to the Monitor Task
 * @param TaskCount The number of tasks that Monitor Task will be managing
 * @param LCDQueue Reference to the LCD Queue that this task should use to send
 * updated
 * @return  pdPASS (1) on success, pdFAIL(0) on failure
 */
BaseType_t CreateMonitorTask(MonitorTaskData_t ** MonitorTaskData,
        TaskHandle_t * TaskRef, unsigned char TaskCount, QueueHandle_t LCDQueue)
{
    BaseType_t pass;
    
    //allocate space for the task data
    (*MonitorTaskData) = pvPortMalloc(sizeof(MonitorTaskData_t));
     
    (*MonitorTaskData)->NumberOfTasks = TaskCount;
    //Monitor needs this to send LCD updates
    (*MonitorTaskData)->LCDQueue = LCDQueue;
    (*MonitorTaskData)->Enabled = 1;
    //Create the Monitor task, pass in its data, hold on to the task ref
    pass = xTaskCreate(MonitorTask,"Monitor",200,(*MonitorTaskData),
            MONITOR_TASK_PRIORITY,TaskRef);
    (*MonitorTaskData)->Tasks = pvPortMalloc(sizeof(TaskHandle_t)*TaskCount);

    return pass;
}


void MonitorTask(void * parameters)
{
    unsigned int remaining_stack;
    unsigned int remaining_heap;
    unsigned char loop_count;
    
    char * task_name;
    char text[32];
    MonitorTaskData_t * Data;
    pMessage Message;

    Data = (MonitorTaskData_t*) parameters;
    
    while(1)
    {
        if(Data->Enabled)
        {
            remaining_heap = xPortGetFreeHeapSize();
            for(loop_count = 0;loop_count<Data->NumberOfTasks;loop_count++)
            {
                remaining_stack = uxTaskGetStackHighWaterMark(Data->Tasks[loop_count]);


                //get the task name
                task_name = pcTaskGetTaskName(Data->Tasks[loop_count]);
               
                sprintf(text,"%s:%d",task_name,remaining_stack);

                Message  = CreateWriteLineLCDMessage(text,strlen(text),1);
                MessageSend(Data->LCDQueue,&Message,0);

                //write Heap:remaining_heap
                //5 because Heap: is 5 chars, 8 for ':' '\\0' and the number
                //remaining_heap = xPortGetFreeHeapSize();
                //sprintf(text,"Heap:%d",remaining_heap);
                //Message = CreateWriteLineLCDMessage(text,strlen(text),1);
                //MessageSend(Data->LCDQueue,&Message,0);
                vTaskDelay(1000);
            } 
        }
    }    
}    
