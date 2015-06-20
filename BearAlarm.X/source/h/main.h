/* 
 * File:   main.h
 * Author: Dominik
 *
 * Created on April 20, 2014, 1:10 PM
 */

#ifndef MAIN_H
#define	MAIN_H

#ifdef	__cplusplus
extern "C" {
#endif

#ifndef FCY
#define FCY 60000000UL
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <xc.h>
#include "libpic30.h"

       
#include "LCD.h"
#include "CC2500.h"
#include "LCDTask.h"
#include "MonitorTask.h"
#include "TemperatureTask.h"
#include "CC2500Task.h"
    
    
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"
#include "semphr.h"



//_FBS(BSS_OFF&BWRP_OFF);
//_FGS(GWRP_OFF&GSS0_OFF);
_FOSCSEL(FNOSC_FRCPLL&IESO_OFF);
_FOSC(OSCIOFNC_ON&FCKSM_CSECMD);
_FWDT(FWDTEN_OFF&WINDIS_OFF);
//_FPOR(BOREN_BOR0&LVRCFG_OFF&PWRTEN_ON&I2C1SEL_PRI&BORV_V30&MCLRE_ON);
_FICD(ICS_PGD3&JTAGEN_OFF);
//_FDS(DSWDTPS_DSWDTPSF&DSWDTOSC_LPRC&DSBOREN_OFF&DSWDTEN_OFF);


#define MONITOR_TASK            0
#define LCD_TASK                1
#define TEMPERATURE_TASK        2
#define CC2500_TASK             3
#define TOP_TASK                4

#define TOP_COMMAND_INTTERUPT   1
#define TOP_COMMAND_DEBOUNCE    2

typedef struct
{
    TaskHandle_t * Tasks;
    xTimerHandle Debounce;
    QueueHandle_t TopQueue;
    QueueHandle_t RFQueue;
    QueueHandle_t LCDQueue;
}TopTaskData_t;


void TopTask(void * parameters);

void DebounceTimer(TimerHandle_t xTimer);

BaseType_t CreateTopTask(TopTaskData_t ** TopTaskData,
        TaskHandle_t * TaskRef, TaskHandle_t * Tasks);

void PICInit(void);

void __attribute__((__interrupt__, auto_psv)) _INT0Interrupt( void );

#ifdef	__cplusplus
}
#endif

#endif	/* MAIN_H */

