/* 
 * File:   MonitorTask.h
 * Author: dom
 *
 * Created on June 14, 2015, 11:34 AM
 */

#ifndef MONITORTASK_H
#define	MONITORTASK_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <stdio.h>
#include <string.h>
    
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
    
    
#include "LCDTask.h"
#include "MessageQueue.h"
#include "Global.h"
    
    
#define MONITOR_TASK_PRIORITY   0
    
typedef struct
{
    TaskHandle_t * Tasks;
    char NumberOfTasks;
    QueueHandle_t LCDQueue;
    char Enabled;
} MonitorTaskData_t;

BaseType_t CreateMonitorTask(MonitorTaskData_t ** MonitorTaskData,
        TaskHandle_t * TaskRef, unsigned char TaskCount, QueueHandle_t LCDQueue);

void MonitorTask(void * parameters);


#ifdef	__cplusplus
}
#endif

#endif	/* MONITORTASK_H */

