///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      30/Oct/2014  20:23:35 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\创新活动\智能车\第十届\本车程序\1029调试版\Library\D /
//                    rivers\PIT\pit.c                                        /
//    Command line =  E:\创新活动\智能车\第十届\本车程序\1029调试版\Library\D /
//                    rivers\PIT\pit.c -D IAR -lCN                            /
//                    E:\创新活动\智能车\第十届\本车程序\1029调试版\RAM_128K\ /
//                    List\ -lB E:\创新活动\智能车\第十届\本车程序\1029调试版 /
//                    \RAM_128K\List\ -o E:\创新活动\智能车\第十届\本车程序\1 /
//                    029调试版\RAM_128K\Obj\ --debug --endian=little         /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files\IAR Systems\Embedded Workbench 6.0    /
//                    Evaluation\arm\INC\c\DLib_Config_Normal.h" -I           /
//                    E:\创新活动\智能车\第十届\本车程序\1029调试版\Library\C /
//                    PU\ -I E:\创新活动\智能车\第十届\本车程序\1029调试版\Li /
//                    brary\Drivers\ADC\ -I E:\创新活动\智能车\第十届\本车程� /
//                    騖1029调试版\Library\Drivers\FTM\ -I                    /
//                    E:\创新活动\智能车\第十届\本车程序\1029调试版\Library\D /
//                    rivers\GPIO\ -I E:\创新活动\智能车\第十届\本车程序\1029 /
//                    调试版\Library\Drivers\PIT\ -I                          /
//                    E:\创新活动\智能车\第十届\本车程序\1029调试版\System_In /
//                    it\ -I E:\创新活动\智能车\第十届\本车程序\1029调试版\So /
//                    urce\ -I E:\创新活动\智能车\第十届\本车程序\1029调试版\ /
//                    OLED\ -I E:\创新活动\智能车\第十届\本车程序\1029调试版\ /
//                    SD_System\ -I E:\创新活动\智能车\第十届\本车程序\1029调 /
//                    试版\Simple_AD\ -I E:\创新活动\智能车\第十届\本车程序\1 /
//                    029调试版\Delay\ -I E:\创新活动\智能车\第十届\本车程序\ /
//                    1029调试版\Make_Desicion\ -Oh                           /
//    List file    =  E:\创新活动\智能车\第十届\本车程序\1029调试版\RAM_128K\ /
//                    List\pit.s                                              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME pit

        #define SHT_PROGBITS 0x1

        EXTERN EnableInt_Kinetis
        EXTERN SetIntPri_Kinetis

        PUBLIC PIT_clearIntFlg
        PUBLIC PIT_readValue
        PUBLIC PIT_setTime
        PUBLIC PIT_start
        PUBLIC PIT_stop

// E:\创新活动\智能车\第十届\本车程序\1029调试版\Library\Drivers\PIT\pit.c
//    1 /*******************************************************************************
//    2 * 文件名称：pit.c
//    3 * 描    述: PIT(周期定时中断)驱动程序
//    4 * 作    者：万冰冰
//    5 * 特别鸣谢：纪成师兄(博客http://blog.chinaaet.com/jihceng0622)
//    6 * 时    间：2012年5月21日
//    7 *******************************************************************************/
//    8 
//    9 #include "pit.h"
//   10 
//   11 
//   12 /*******************************************************************************
//   13 * 函数名称：PIT_setIntTime
//   14 * 入口参数：timer  PIT定时器器选择
//   15                     TIMER0
//   16                     TIMER1
//   17                     TIMER2
//   18                     TIMER3
//   19             time   定时时间,单位 us
//   20             pie    中断使能选择
//   21             prio   中断优先级(取值0-15,值越小优先级越高)
//   22 * 描    述：设置定时器
//   23 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   24 void PIT_setTime(int8u_t timer, int32u_t time, int8u_t pie, int8u_t prio)
//   25 {
PIT_setTime:
        PUSH     {R3-R7,LR}
        MOV      R4,R3
//   26   SIM_SCGC6 |= SIM_SCGC6_PIT_MASK;               // 打开 PIT 时钟 
        LDR.N    R3,??DataTable4  ;; 0x4004803c
//   27   PIT_TCTRL(timer) &= ~PIT_TCTRL_TEN_MASK;       // 停止定时
        LDR.N    R6,??DataTable4_1  ;; 0x40037100
        LDR      R5,[R3, #+0]
//   28   PIT_MCR = 0x00;                                // 使能PIT功能
        MOV      R12,#+0
        ORR      R5,R5,#0x800000
        STR      R5,[R3, #+0]
        LSLS     R3,R0,#+4
        ADDS     R5,R3,R6
        LDR      R7,[R5, #+8]
        LSRS     R7,R7,#+1
        LSLS     R7,R7,#+1
        STR      R7,[R5, #+8]
        LDR.N    R7,??DataTable4_2  ;; 0x40037000
        STR      R12,[R7, #+0]
//   29   PIT_LDVAL(timer) = PIT_LDVAL_TSV(time*BUS_ClK);// 设置定时时间
        ADD      R7,R1,R1, LSL #+1
        LSLS     R1,R7,#+4
        STR      R1,[R3, R6]
//   30   if(pie == 1)
        CMP      R2,#+1
        BNE.N    ??PIT_setTime_0
//   31   {
//   32     EnableInt_Kinetis(68+timer);                 // 开启对应的中断
        ADD      R6,R0,#+68
        MOV      R0,R6
        BL       EnableInt_Kinetis
//   33     SetIntPri_Kinetis(68+timer,prio);            // 设置中断优先级
        MOV      R1,R4
        MOV      R0,R6
        BL       SetIntPri_Kinetis
//   34     PIT_TCTRL(timer) |= PIT_TCTRL_TIE_MASK;      // 使能定时中断
        LDR      R0,[R5, #+8]
        ORR      R0,R0,#0x2
        B.N      ??PIT_setTime_1
//   35   }
//   36   else
//   37   {
//   38     PIT_TCTRL(timer) &= ~PIT_TCTRL_TIE_MASK;     // 禁止定时中断
??PIT_setTime_0:
        LDR      R0,[R5, #+8]
        BIC      R0,R0,#0x2
??PIT_setTime_1:
        STR      R0,[R5, #+8]
//   39   }
//   40   PIT_TCTRL(timer) |= PIT_TCTRL_TEN_MASK;        // 开始定时
        LDR      R0,[R5, #+8]
        ORR      R0,R0,#0x1
        STR      R0,[R5, #+8]
//   41 }
        POP      {R0,R4-R7,PC}    ;; return
//   42 
//   43 /*******************************************************************************
//   44 * 函数名称：PIT_start
//   45 * 入口参数：timer  PIT定时器器选择
//   46                     TIMER0
//   47                     TIMER1
//   48                     TIMER2
//   49                     TIMER3
//   50 * 描    述：开始定时
//   51 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   52 void PIT_start(int8u_t timer)
//   53 {
//   54   PIT_TCTRL(timer) |= PIT_TCTRL_TEN_MASK;        // 开始定时
PIT_start:
        LDR.N    R1,??DataTable4_1  ;; 0x40037100
        ADD      R0,R1,R0, LSL #+4
        LDR      R1,[R0, #+8]
        ORR      R1,R1,#0x1
        STR      R1,[R0, #+8]
//   55 }
        BX       LR               ;; return
//   56 
//   57 /*******************************************************************************
//   58 * 函数名称：PIT_stop
//   59 * 入口参数：timer  PIT定时器器选择
//   60                     TIMER0
//   61                     TIMER1
//   62                     TIMER2
//   63                     TIMER3
//   64 * 描    述：停止定时
//   65 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   66 void PIT_stop(int8u_t timer)
//   67 {
//   68   PIT_TCTRL(timer) &= ~PIT_TCTRL_TEN_MASK;      // 停止定时
PIT_stop:
        LDR.N    R1,??DataTable4_1  ;; 0x40037100
        ADD      R0,R1,R0, LSL #+4
        LDR      R1,[R0, #+8]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        STR      R1,[R0, #+8]
//   69 }
        BX       LR               ;; return
//   70  
//   71 /*******************************************************************************
//   72 * 函数名称：PIT_stop
//   73 * 入口参数：timer  PIT定时器器选择
//   74                     TIMER0
//   75                     TIMER1
//   76                     TIMER2
//   77                     TIMER3
//   78 * 描    述：清零中断标志位
//   79 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   80 void PIT_clearIntFlg(int8u_t timer)
//   81 {
//   82   PIT_TFLG(timer) = PIT_TFLG_TIF_MASK;         // 清零中断标志位
PIT_clearIntFlg:
        LDR.N    R1,??DataTable4_1  ;; 0x40037100
        ADD      R0,R1,R0, LSL #+4
        MOVS     R1,#+1
        STR      R1,[R0, #+12]
//   83 }
        BX       LR               ;; return
//   84 
//   85 /*******************************************************************************
//   86 * 函数名称：PIT_readValue
//   87 * 入口参数：timer  PIT定时器器选择
//   88                     TIMER0
//   89                     TIMER1
//   90                     TIMER2
//   91                     TIMER3
//   92             result 计数器当前数值
//   93 * 描    述：读取计数器当前数值
//   94 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   95 void PIT_readValue(int8u_t timer, int32u_t * result)
//   96 {
//   97   *result = PIT_CVAL(timer);
PIT_readValue:
        LDR.N    R2,??DataTable4_1  ;; 0x40037100
        ADD      R0,R2,R0, LSL #+4
        LDR      R0,[R0, #+4]
        STR      R0,[R1, #+0]
//   98 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40037100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x40037000

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   99 
// 
// 162 bytes in section .text
// 
// 162 bytes of CODE memory
//
//Errors: none
//Warnings: none
