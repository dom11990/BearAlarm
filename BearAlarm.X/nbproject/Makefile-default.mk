#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/BearAlarm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/BearAlarm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=source/c/main.c source/c/LCDTask.c source/c/TemperatureTask.c source/c/MonitorTask.c source/c/CC2500Task.c source/c/MessageQueue.c source/FreeRTOS/portable/MemMang/heap.c source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.c source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S source/FreeRTOS/croutine.c source/FreeRTOS/event_groups.c source/FreeRTOS/list.c source/FreeRTOS/queue.c source/FreeRTOS/tasks.c source/FreeRTOS/timers.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/source/c/main.o ${OBJECTDIR}/source/c/LCDTask.o ${OBJECTDIR}/source/c/TemperatureTask.o ${OBJECTDIR}/source/c/MonitorTask.o ${OBJECTDIR}/source/c/CC2500Task.o ${OBJECTDIR}/source/c/MessageQueue.o ${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o ${OBJECTDIR}/source/FreeRTOS/croutine.o ${OBJECTDIR}/source/FreeRTOS/event_groups.o ${OBJECTDIR}/source/FreeRTOS/list.o ${OBJECTDIR}/source/FreeRTOS/queue.o ${OBJECTDIR}/source/FreeRTOS/tasks.o ${OBJECTDIR}/source/FreeRTOS/timers.o
POSSIBLE_DEPFILES=${OBJECTDIR}/source/c/main.o.d ${OBJECTDIR}/source/c/LCDTask.o.d ${OBJECTDIR}/source/c/TemperatureTask.o.d ${OBJECTDIR}/source/c/MonitorTask.o.d ${OBJECTDIR}/source/c/CC2500Task.o.d ${OBJECTDIR}/source/c/MessageQueue.o.d ${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o.d ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o.d ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d ${OBJECTDIR}/source/FreeRTOS/croutine.o.d ${OBJECTDIR}/source/FreeRTOS/event_groups.o.d ${OBJECTDIR}/source/FreeRTOS/list.o.d ${OBJECTDIR}/source/FreeRTOS/queue.o.d ${OBJECTDIR}/source/FreeRTOS/tasks.o.d ${OBJECTDIR}/source/FreeRTOS/timers.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/source/c/main.o ${OBJECTDIR}/source/c/LCDTask.o ${OBJECTDIR}/source/c/TemperatureTask.o ${OBJECTDIR}/source/c/MonitorTask.o ${OBJECTDIR}/source/c/CC2500Task.o ${OBJECTDIR}/source/c/MessageQueue.o ${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o ${OBJECTDIR}/source/FreeRTOS/croutine.o ${OBJECTDIR}/source/FreeRTOS/event_groups.o ${OBJECTDIR}/source/FreeRTOS/list.o ${OBJECTDIR}/source/FreeRTOS/queue.o ${OBJECTDIR}/source/FreeRTOS/tasks.o ${OBJECTDIR}/source/FreeRTOS/timers.o

# Source Files
SOURCEFILES=source/c/main.c source/c/LCDTask.c source/c/TemperatureTask.c source/c/MonitorTask.c source/c/CC2500Task.c source/c/MessageQueue.c source/FreeRTOS/portable/MemMang/heap.c source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.c source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S source/FreeRTOS/croutine.c source/FreeRTOS/event_groups.c source/FreeRTOS/list.c source/FreeRTOS/queue.c source/FreeRTOS/tasks.c source/FreeRTOS/timers.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/BearAlarm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24EP256MC202
MP_LINKER_FILE_OPTION=,--script=p24EP256MC202.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/source/c/main.o: source/c/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/c" 
	@${RM} ${OBJECTDIR}/source/c/main.o.d 
	@${RM} ${OBJECTDIR}/source/c/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/c/main.c  -o ${OBJECTDIR}/source/c/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/c/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/c/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/c/LCDTask.o: source/c/LCDTask.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/c" 
	@${RM} ${OBJECTDIR}/source/c/LCDTask.o.d 
	@${RM} ${OBJECTDIR}/source/c/LCDTask.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/c/LCDTask.c  -o ${OBJECTDIR}/source/c/LCDTask.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/c/LCDTask.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/c/LCDTask.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/c/TemperatureTask.o: source/c/TemperatureTask.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/c" 
	@${RM} ${OBJECTDIR}/source/c/TemperatureTask.o.d 
	@${RM} ${OBJECTDIR}/source/c/TemperatureTask.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/c/TemperatureTask.c  -o ${OBJECTDIR}/source/c/TemperatureTask.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/c/TemperatureTask.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/c/TemperatureTask.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/c/MonitorTask.o: source/c/MonitorTask.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/c" 
	@${RM} ${OBJECTDIR}/source/c/MonitorTask.o.d 
	@${RM} ${OBJECTDIR}/source/c/MonitorTask.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/c/MonitorTask.c  -o ${OBJECTDIR}/source/c/MonitorTask.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/c/MonitorTask.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/c/MonitorTask.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/c/CC2500Task.o: source/c/CC2500Task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/c" 
	@${RM} ${OBJECTDIR}/source/c/CC2500Task.o.d 
	@${RM} ${OBJECTDIR}/source/c/CC2500Task.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/c/CC2500Task.c  -o ${OBJECTDIR}/source/c/CC2500Task.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/c/CC2500Task.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/c/CC2500Task.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/c/MessageQueue.o: source/c/MessageQueue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/c" 
	@${RM} ${OBJECTDIR}/source/c/MessageQueue.o.d 
	@${RM} ${OBJECTDIR}/source/c/MessageQueue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/c/MessageQueue.c  -o ${OBJECTDIR}/source/c/MessageQueue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/c/MessageQueue.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/c/MessageQueue.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o: source/FreeRTOS/portable/MemMang/heap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS/portable/MemMang" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/portable/MemMang/heap.c  -o ${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o: source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.c  -o ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/croutine.o: source/FreeRTOS/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/croutine.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/croutine.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/croutine.c  -o ${OBJECTDIR}/source/FreeRTOS/croutine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/croutine.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/croutine.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/event_groups.o: source/FreeRTOS/event_groups.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/event_groups.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/event_groups.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/event_groups.c  -o ${OBJECTDIR}/source/FreeRTOS/event_groups.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/event_groups.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/event_groups.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/list.o: source/FreeRTOS/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/list.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/list.c  -o ${OBJECTDIR}/source/FreeRTOS/list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/list.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/list.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/queue.o: source/FreeRTOS/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/queue.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/queue.c  -o ${OBJECTDIR}/source/FreeRTOS/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/queue.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/queue.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/tasks.o: source/FreeRTOS/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/tasks.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/tasks.c  -o ${OBJECTDIR}/source/FreeRTOS/tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/tasks.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/tasks.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/timers.o: source/FreeRTOS/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/timers.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/timers.c  -o ${OBJECTDIR}/source/FreeRTOS/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/timers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/timers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/source/c/main.o: source/c/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/c" 
	@${RM} ${OBJECTDIR}/source/c/main.o.d 
	@${RM} ${OBJECTDIR}/source/c/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/c/main.c  -o ${OBJECTDIR}/source/c/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/c/main.o.d"      -mno-eds-warn  -g -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/c/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/c/LCDTask.o: source/c/LCDTask.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/c" 
	@${RM} ${OBJECTDIR}/source/c/LCDTask.o.d 
	@${RM} ${OBJECTDIR}/source/c/LCDTask.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/c/LCDTask.c  -o ${OBJECTDIR}/source/c/LCDTask.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/c/LCDTask.o.d"      -mno-eds-warn  -g -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/c/LCDTask.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/c/TemperatureTask.o: source/c/TemperatureTask.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/c" 
	@${RM} ${OBJECTDIR}/source/c/TemperatureTask.o.d 
	@${RM} ${OBJECTDIR}/source/c/TemperatureTask.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/c/TemperatureTask.c  -o ${OBJECTDIR}/source/c/TemperatureTask.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/c/TemperatureTask.o.d"      -mno-eds-warn  -g -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/c/TemperatureTask.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/c/MonitorTask.o: source/c/MonitorTask.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/c" 
	@${RM} ${OBJECTDIR}/source/c/MonitorTask.o.d 
	@${RM} ${OBJECTDIR}/source/c/MonitorTask.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/c/MonitorTask.c  -o ${OBJECTDIR}/source/c/MonitorTask.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/c/MonitorTask.o.d"      -mno-eds-warn  -g -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/c/MonitorTask.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/c/CC2500Task.o: source/c/CC2500Task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/c" 
	@${RM} ${OBJECTDIR}/source/c/CC2500Task.o.d 
	@${RM} ${OBJECTDIR}/source/c/CC2500Task.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/c/CC2500Task.c  -o ${OBJECTDIR}/source/c/CC2500Task.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/c/CC2500Task.o.d"      -mno-eds-warn  -g -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/c/CC2500Task.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/c/MessageQueue.o: source/c/MessageQueue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/c" 
	@${RM} ${OBJECTDIR}/source/c/MessageQueue.o.d 
	@${RM} ${OBJECTDIR}/source/c/MessageQueue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/c/MessageQueue.c  -o ${OBJECTDIR}/source/c/MessageQueue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/c/MessageQueue.o.d"      -mno-eds-warn  -g -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/c/MessageQueue.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o: source/FreeRTOS/portable/MemMang/heap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS/portable/MemMang" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/portable/MemMang/heap.c  -o ${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o.d"      -mno-eds-warn  -g -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/portable/MemMang/heap.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o: source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.c  -o ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o.d"      -mno-eds-warn  -g -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/port.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/croutine.o: source/FreeRTOS/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/croutine.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/croutine.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/croutine.c  -o ${OBJECTDIR}/source/FreeRTOS/croutine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/croutine.o.d"      -mno-eds-warn  -g -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/croutine.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/event_groups.o: source/FreeRTOS/event_groups.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/event_groups.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/event_groups.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/event_groups.c  -o ${OBJECTDIR}/source/FreeRTOS/event_groups.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/event_groups.o.d"      -mno-eds-warn  -g -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/event_groups.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/list.o: source/FreeRTOS/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/list.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/list.c  -o ${OBJECTDIR}/source/FreeRTOS/list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/list.o.d"      -mno-eds-warn  -g -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/list.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/queue.o: source/FreeRTOS/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/queue.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/queue.c  -o ${OBJECTDIR}/source/FreeRTOS/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/queue.o.d"      -mno-eds-warn  -g -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/queue.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/tasks.o: source/FreeRTOS/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/tasks.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/tasks.c  -o ${OBJECTDIR}/source/FreeRTOS/tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/tasks.o.d"      -mno-eds-warn  -g -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/tasks.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/FreeRTOS/timers.o: source/FreeRTOS/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/timers.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  source/FreeRTOS/timers.c  -o ${OBJECTDIR}/source/FreeRTOS/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/timers.o.d"      -mno-eds-warn  -g -omf=elf -mlarge-code -mlarge-data -O0 -I"source/h" -I"source/FreeRTOS/include" -I"source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" -I"../../LCD_Board/LCD_Board.X/source/h" -I"../../CC2500/CC2500.X/source/h" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/timers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o: source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S  -o ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -Wa,-MD,"${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d" "${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.asm.d"  -t $(SILENT)  -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o: source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.S  -o ${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d"  -omf=elf -Wa,-MD,"${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.d" "${OBJECTDIR}/source/FreeRTOS/portable/MPLAB/PIC24_dsPIC/portasm_PIC24.o.asm.d"  -t $(SILENT)  -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/BearAlarm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../LCD_Board/LCD_Board.X/dist/default/debug/LCD_Board.X.a ../../CC2500/CC2500.X/dist/default/debug/CC2500.X.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/BearAlarm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\LCD_Board\LCD_Board.X\dist\default\debug\LCD_Board.X.a ..\..\CC2500\CC2500.X\dist\default\debug\CC2500.X.a  -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf  -mreserve=data@0x1000:0x101B -mreserve=data@0x101C:0x101D -mreserve=data@0x101E:0x101F -mreserve=data@0x1020:0x1021 -mreserve=data@0x1022:0x1023 -mreserve=data@0x1024:0x1027 -mreserve=data@0x1028:0x104F   -Wl,--local-stack,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--heap=1000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/BearAlarm.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../LCD_Board/LCD_Board.X/dist/default/production/LCD_Board.X.a ../../CC2500/CC2500.X/dist/default/production/CC2500.X.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/BearAlarm.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\LCD_Board\LCD_Board.X\dist\default\production\LCD_Board.X.a ..\..\CC2500\CC2500.X\dist\default\production\CC2500.X.a  -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -Wl,--local-stack,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=1000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/BearAlarm.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:
	cd /D ../../LCD_Board/LCD_Board.X && ${MAKE}  -f Makefile CONF=default
	cd /D ../../CC2500/CC2500.X && ${MAKE}  -f Makefile CONF=default


# Subprojects
.clean-subprojects:
	cd /D ../../LCD_Board/LCD_Board.X && rm -rf "build/default" "dist/default"
	cd /D ../../CC2500/CC2500.X && rm -rf "build/default" "dist/default"

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
