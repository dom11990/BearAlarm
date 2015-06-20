/* 
 * File:   TemperatureTask.h
 * Author: dom
 *
 * Created on June 14, 2015, 10:02 AM
 */

#ifndef TEMPERATURETASK_H
#define	TEMPERATURETASK_H

#ifdef	__cplusplus
extern "C" {
#endif

    
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

#include <stdlib.h>
#include <stdio.h>
    
#include "LCDTask.h"
#include "MessageQueue.h"
#include "Global.h"

#define TEMPERATURE_TASK_PRIORITY   1
    
    typedef struct
    {
        QueueHandle_t LCDQueue;
        double Kelvin;
        double Fahrenheit;
        double Celsius;
        double Volts;
    
    } TemperatureTaskData_t;


            
double RemoveOutliersAverage(void);
int ConfigADC(void);

BaseType_t CreateTemperatureTask(TemperatureTaskData_t ** TemperatureData,
        TaskHandle_t * TaskRef, QueueHandle_t LCDQueue);

void TemperatureTask(void * parameters);


#ifdef	__cplusplus
}
#endif

#endif	/* TEMPERATURETASK_H */

