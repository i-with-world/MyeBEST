///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    05/May/2015  18:17:08 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\2014智能车\智能车程序\5月3号转差开环\Library\Drivers /
//                    \PIT\pit.c                                              /
//    Command line =  E:\2014智能车\智能车程序\5月3号转差开环\Library\Drivers /
//                    \PIT\pit.c -D IAR -lCN E:\2014智能车\智能车程序\5月3号� /
//                    羁穃Flash_512K\List\ -lB                            /
//                    E:\2014智能车\智能车程序\5月3号转差开环\Flash_512K\List /
//                    \ -o E:\2014智能车\智能车程序\5月3号转差开环\Flash_512K /
//                    \Obj\ --no_cse --no_unroll --no_inline                  /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --char_is_signed --fpu=None          /
//                    --dlib_config "D:\Program Files                         /
//                    (x86)\IAR\arm\INC\c\DLib_Config_Normal.h" -I            /
//                    E:\2014智能车\智能车程序\5月3号转差开环\Library\CPU\    /
//                    -I E:\2014智能车\智能车程序\5月3号转差开环\Library\Driv /
//                    ers\ADC\ -I E:\2014智能车\智能车程序\5月3号转差开环\Lib /
//                    rary\Drivers\FTM\ -I E:\2014智能车\智能车程序\5月3号转� /
//                    羁穃Library\Drivers\GPIO\ -I                          /
//                    E:\2014智能车\智能车程序\5月3号转差开环\Library\Drivers /
//                    \PIT\ -I E:\2014智能车\智能车程序\5月3号转差开环\Librar /
//                    y\Drivers\I2C\ -I E:\2014智能车\智能车程序\5月3号转差开 /
//                    环\Library\Drivers\UART\ -I                             /
//                    E:\2014智能车\智能车程序\5月3号转差开环\Library\Drivers /
//                    \FTFL\ -I E:\2014智能车\智能车程序\5月3号转差开环\MyFun /
//                    ction\ -I E:\2014智能车\智能车程序\5月3号转差开环\SD_Sy /
//                    stem\ -I E:\2014智能车\智能车程序\5月3号转差开环\Delay\ /
//                     -I E:\2014智能车\智能车程序\5月3号转差开环\System_Init /
//                    \ -I E:\2014智能车\智能车程序\5月3号转差开环\OLED\ -I   /
//                    E:\2014智能车\智能车程序\5月3号转差开环\ZLG7290\ -I     /
//                    E:\2014智能车\智能车程序\5月3号转差开环\Simple_AD\ -I   /
//                    E:\2014智能车\智能车程序\5月3号转差开环\Make_Desicion\  /
//                    -I E:\2014智能车\智能车程序\5月3号转差开环\Make_Desicio /
//                    n\Judge_Way\ -I E:\2014智能车\智能车程序\5月3号转差开环 /
//                    \Make_Desicion\Speed_Control\ -I                        /
//                    E:\2014智能车\智能车程序\5月3号转差开环\Source\ -I      /
//                    E:\2014智能车\智能车程序\5月3号转差开环\Peripheral_Opar /
//                    ation\ -I E:\2014智能车\智能车程序\5月3号转差开环\Balan /
//                    ce_control\ -Ol                                         /
//    List file    =  E:\2014智能车\智能车程序\5月3号转差开环\Flash_512K\List /
//                    \pit.s                                                  /
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

// E:\2014智能车\智能车程序\5月3号转差开环\Library\Drivers\PIT\pit.c
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
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R3
//   26   SIM_SCGC6 |= SIM_SCGC6_PIT_MASK;               // 打开 PIT 时钟 
        LDR.N    R0,??DataTable4  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R3,??DataTable4  ;; 0x4004803c
        STR      R0,[R3, #+0]
//   27   PIT_TCTRL(timer) &= ~PIT_TCTRL_TEN_MASK;       // 停止定时
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_1  ;; 0x40037100
        ADDS     R0,R0,R4, LSL #+4
        LDR      R0,[R0, #+8]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R3,??DataTable4_1  ;; 0x40037100
        ADDS     R3,R3,R4, LSL #+4
        STR      R0,[R3, #+8]
//   28   PIT_MCR = 0x00;                                // 使能PIT功能
        LDR.N    R0,??DataTable4_2  ;; 0x40037000
        MOVS     R3,#+0
        STR      R3,[R0, #+0]
//   29   PIT_LDVAL(timer) = PIT_LDVAL_TSV(time*BUS_ClK);// 设置定时时间
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R0,R4,#+4
        LDR.N    R3,??DataTable4_1  ;; 0x40037100
        MOVS     R6,#+48
        MULS     R1,R6,R1
        STR      R1,[R0, R3]
//   30   if(pie == 1)
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BNE.N    ??PIT_setTime_0
//   31   {
//   32     EnableInt_Kinetis(68+timer);                 // 开启对应的中断
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+68
        BL       EnableInt_Kinetis
//   33     SetIntPri_Kinetis(68+timer,prio);            // 设置中断优先级
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,R5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+68
        BL       SetIntPri_Kinetis
//   34     PIT_TCTRL(timer) |= PIT_TCTRL_TIE_MASK;      // 使能定时中断
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_1  ;; 0x40037100
        ADDS     R0,R0,R4, LSL #+4
        LDR      R0,[R0, #+8]
        ORRS     R0,R0,#0x2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable4_1  ;; 0x40037100
        ADDS     R1,R1,R4, LSL #+4
        STR      R0,[R1, #+8]
        B.N      ??PIT_setTime_1
//   35   }
//   36   else
//   37   {
//   38     PIT_TCTRL(timer) &= ~PIT_TCTRL_TIE_MASK;     // 禁止定时中断
??PIT_setTime_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_1  ;; 0x40037100
        ADDS     R0,R0,R4, LSL #+4
        LDR      R0,[R0, #+8]
        BICS     R0,R0,#0x2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable4_1  ;; 0x40037100
        ADDS     R1,R1,R4, LSL #+4
        STR      R0,[R1, #+8]
//   39   }
//   40   PIT_TCTRL(timer) |= PIT_TCTRL_TEN_MASK;        // 开始定时
??PIT_setTime_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_1  ;; 0x40037100
        ADDS     R0,R0,R4, LSL #+4
        LDR      R0,[R0, #+8]
        ORRS     R0,R0,#0x1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable4_1  ;; 0x40037100
        ADDS     R1,R1,R4, LSL #+4
        STR      R0,[R1, #+8]
//   41 }
        POP      {R4-R6,PC}       ;; return
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
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable4_1  ;; 0x40037100
        ADDS     R1,R1,R0, LSL #+4
        LDR      R1,[R1, #+8]
        ORRS     R1,R1,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable4_1  ;; 0x40037100
        ADDS     R0,R2,R0, LSL #+4
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
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable4_1  ;; 0x40037100
        ADDS     R1,R1,R0, LSL #+4
        LDR      R1,[R1, #+8]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable4_1  ;; 0x40037100
        ADDS     R0,R2,R0, LSL #+4
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
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable4_1  ;; 0x40037100
        ADDS     R0,R1,R0, LSL #+4
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
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable4_1  ;; 0x40037100
        ADDS     R0,R2,R0, LSL #+4
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
// 258 bytes in section .text
// 
// 258 bytes of CODE memory
//
//Errors: none
//Warnings: none
