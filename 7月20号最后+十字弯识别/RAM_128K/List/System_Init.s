///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      30/Oct/2014  20:44:55 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\创新活动\智能车\第十届\本车程序\1029调试版\System_In /
//                    it\System_Init.c                                        /
//    Command line =  E:\创新活动\智能车\第十届\本车程序\1029调试版\System_In /
//                    it\System_Init.c -D IAR -lCN                            /
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
//                    List\System_Init.s                                      /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME System_Init

        #define SHT_PROGBITS 0x1

        EXTERN ADC_ClockCtrl
        EXTERN ADC_SetCFG1
        EXTERN ADC_SetCFG2
        EXTERN ADC_SetSC
        EXTERN FTM_enablePWMCh
        EXTERN FTM_initPWM
        EXTERN FTM_setPWMDty
        EXTERN GPIO_SetPinDir
        EXTERN GPIO_SetPinDriveStrgth
        EXTERN GPIO_SetPinMod
        EXTERN PIT_setTime

        PUBLIC Buzzer_Init
        PUBLIC CCD_Init
        PUBLIC Motor_Init
        PUBLIC Servo_Init
        PUBLIC Switch_Init
        PUBLIC System_Init
        PUBLIC User_Init

// E:\创新活动\智能车\第十届\本车程序\1029调试版\System_Init\System_Init.c
//    1 #include "AllHeaders.h"
//    2 
//    3 /*******************************************************************************
//    4 * 函数名：CCD_Init(void)
//    5 * 描  述：完成对CCD有关引脚的初始化
//    6 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    7 void CCD_Init(void)
//    8 {
CCD_Init:
        PUSH     {R4,LR}
//    9   //CCD port init
//   10   GPIO_SetPinMod(PORTB, 1,0);                               // 配置相应引脚的功能号,ADC0_SE9 定CCD采集
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable5  ;; 0x400ff040
        BL       GPIO_SetPinMod
//   11   GPIO_SetPinMod(PORTC,16,1);                             
        LDR.N    R4,??DataTable5_1  ;; 0x400ff080
        MOVS     R2,#+1
        MOVS     R1,#+16
        MOV      R0,R4
        BL       GPIO_SetPinMod
//   12   GPIO_SetPinDir(PORTC,16,1);                               // 设置PTC16口为输出，SI信号
        MOVS     R2,#+1
        MOVS     R1,#+16
        MOV      R0,R4
        BL       GPIO_SetPinDir
//   13   GPIO_SetPinMod(PORTD,0,1);
        LDR.N    R4,??DataTable5_2  ;; 0x400ff0c0
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOV      R0,R4
        BL       GPIO_SetPinMod
//   14   GPIO_SetPinDir(PORTD,0,1);                                // 设置PTD0口为输出，CLK信号
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOV      R0,R4
        BL       GPIO_SetPinDir
//   15   //CCD ADC module init
//   16   ADC_ClockCtrl(ADC0);
        LDR.N    R4,??DataTable5_3  ;; 0x4003b000
        MOV      R0,R4
        BL       ADC_ClockCtrl
//   17   ADC_SetCFG1(ADC0, 1, 0, 1);                        // ADC 采样精度8位，时钟频率48MHZ（总线时钟）
        MOVS     R3,#+1
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOV      R0,R4
        BL       ADC_SetCFG1
//   18   ADC_SetCFG2(ADC0, 0, 0, 3);                        //第二个参数选择ADC A或B
        MOVS     R2,#+0
        MOVS     R3,#+3
        MOV      R1,R2
        MOV      R0,R4
        BL       ADC_SetCFG2
//   19   ADC_SetSC(ADC0, 1, 0, 0);                          // 硬件平均滤波采样次数为 8，查询方式 8MHZ采样率 6个时钟周期完成一次转换
        MOV      R0,R4
        POP      {R4,LR}
        MOVS     R3,#+0
        MOV      R2,R3
        MOVS     R1,#+1
        B.W      ADC_SetSC
//   20 }
//   21 
//   22 /*******************************************************************************
//   23 * 函数名称：Servo_Init(void)
//   24 * 描    述：设置舵机控制 PWM 模块                                         
//   25 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   26 void Servo_Init(void)                           //完成对PWM0的初始化，用于控制转向舵机
//   27 {  
Servo_Init:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
//   28   GPIO_SetPinMod(PORTA, 13, 3);                       // 配置相应引脚的功能号,FTM1_CH1
        MOVS     R2,#+3
        MOVS     R1,#+13
        LDR.N    R0,??DataTable5_4  ;; 0x400ff000
        BL       GPIO_SetPinMod
//   29   FTM_initPWM(FTM1, 1, 5);                           // 配置 PWM 时钟和分频数
        LDR.N    R4,??DataTable5_5  ;; 0x40039000
        MOVS     R2,#+5
        MOVS     R1,#+1
        MOV      R0,R4
        BL       FTM_initPWM
//   30   FTM_enablePWMCh(FTM1, 1, 0, 30000, 0);             // PWM  频率 600-->10KHZ
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVW     R3,#+30000
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOV      R0,R4
        BL       FTM_enablePWMCh
//   31   FTM_setPWMDty(FTM1, 1, 0);                         // 配置 PWM 占空比
        MOV      R0,R4
        ADD      SP,SP,#+8
        POP      {R4,LR}
        MOVS     R2,#+0
        MOVS     R1,#+1
        B.W      FTM_setPWMDty
//   32 }
//   33 
//   34 /*******************************************************************************
//   35 * 函数名称：Motor_Init
//   36 * 描    述：设置电机控制 PWM 模块                                         
//   37 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   38 void Motor_Init(void) 
//   39 { 
Motor_Init:
        PUSH     {R3-R5,LR}
//   40   FTM_initPWM(FTM0, 1, 5);
        LDR.N    R4,??DataTable5_6  ;; 0x40038000
        MOVS     R2,#+5
        MOVS     R1,#+1
        MOV      R0,R4
        BL       FTM_initPWM
//   41   
//   42   GPIO_SetPinMod(PORTD, 4, 4);                       // 配置相应引脚的功能号,FTM2_CH0
        LDR.N    R5,??DataTable5_2  ;; 0x400ff0c0
        MOVS     R2,#+4
        MOVS     R1,#+4
        MOV      R0,R5
        BL       GPIO_SetPinMod
//   43   GPIO_SetPinMod(PORTD, 6, 4);                       // 配置相应引脚的功能号,FTM2_CH1
        MOVS     R2,#+4
        MOVS     R1,#+6
        MOV      R0,R5
        BL       GPIO_SetPinMod
//   44   
//   45   FTM_enablePWMCh(FTM0, 4, 0, 500, 0);               // PWM  频率 600-->10KHZ
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOV      R2,R0
        MOV      R3,#+500
        MOVS     R1,#+4
        MOV      R0,R4
        BL       FTM_enablePWMCh
//   46   FTM_enablePWMCh(FTM0, 6, 0, 500, 0);
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOV      R2,R0
        MOV      R3,#+500
        MOVS     R1,#+6
        MOV      R0,R4
        BL       FTM_enablePWMCh
//   47   
//   48   FTM_setPWMDty(FTM0, 4, 0);                         // 配置 PWM 占空比
        MOVS     R2,#+0
        MOVS     R1,#+4
        MOV      R0,R4
        BL       FTM_setPWMDty
//   49   FTM_setPWMDty(FTM0, 6, 0);
        MOV      R0,R4
        POP      {R3-R5,LR}
        MOVS     R2,#+0
        MOVS     R1,#+6
        B.W      FTM_setPWMDty
//   50 }
//   51 
//   52 /*******************************************************************************
//   53 * 函数名称：Buzzer_Init
//   54 * 描    述：设置蜂鸣器模块                                         
//   55 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   56 void Buzzer_Init(void)
//   57 {
Buzzer_Init:
        PUSH     {R4,LR}
//   58   GPIO_SetPinMod(PORTD, 2, 1);                   // 配置相应引脚的功能号
        LDR.N    R4,??DataTable5_2  ;; 0x400ff0c0
        MOVS     R2,#+1
        MOVS     R1,#+2
        MOV      R0,R4
        BL       GPIO_SetPinMod
//   59   GPIO_SetPinDir(PORTD, 2, 1);
        MOVS     R2,#+1
        MOVS     R1,#+2
        MOV      R0,R4
        BL       GPIO_SetPinDir
//   60   GPIO_SetPinDriveStrgth(PORTD, 2, 1);           //设置强驱动模式
        MOV      R0,R4
        POP      {R4,LR}
        MOVS     R2,#+1
        MOVS     R1,#+2
        B.W      GPIO_SetPinDriveStrgth
//   61 }
//   62 
//   63 /*******************************************************************************
//   64 * 函数名称：Buzzer_Init
//   65 * 描    述：设置蜂鸣器模块                                         
//   66 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   67 void Switch_Init(void)
//   68 {
Switch_Init:
        PUSH     {R4,LR}
//   69   GPIO_SetPinMod(PORTA, 12, 1);                   // 配置相应引脚的功能号
        LDR.N    R4,??DataTable5_4  ;; 0x400ff000
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOV      R0,R4
        BL       GPIO_SetPinMod
//   70   GPIO_SetPinDir(PORTA, 12, 1);                   // 配置相应引脚的方向
        MOVS     R2,#+1
        MOVS     R1,#+12
        MOV      R0,R4
        BL       GPIO_SetPinDir
//   71   
//   72   GPIO_SetPinMod(PORTA, 14, 1);                   // 配置相应引脚的功能号
        MOVS     R2,#+1
        MOVS     R1,#+14
        MOV      R0,R4
        BL       GPIO_SetPinMod
//   73   GPIO_SetPinDir(PORTA, 14, 1);                   // 配置相应引脚的方向
        MOVS     R2,#+1
        MOVS     R1,#+14
        MOV      R0,R4
        BL       GPIO_SetPinDir
//   74   
//   75   GPIO_SetPinMod(PORTA, 16, 1);                   // 配置相应引脚的功能号
        MOVS     R2,#+1
        MOVS     R1,#+16
        MOV      R0,R4
        BL       GPIO_SetPinMod
//   76   GPIO_SetPinDir(PORTA, 16, 1);                   // 配置相应引脚的方向
        MOVS     R2,#+1
        MOVS     R1,#+16
        MOV      R0,R4
        BL       GPIO_SetPinDir
//   77   
//   78   GPIO_SetPinMod(PORTA, 5, 1);                   // 配置相应引脚的功能号
        MOVS     R2,#+1
        MOVS     R1,#+5
        MOV      R0,R4
        BL       GPIO_SetPinMod
//   79   GPIO_SetPinDir(PORTA, 5, 1);                   // 配置相应引脚的方向
        MOV      R0,R4
        POP      {R4,LR}
        MOVS     R2,#+1
        MOVS     R1,#+5
        B.W      GPIO_SetPinDir
//   80 
//   81 }
//   82 
//   83 /*******************************************************************************
//   84 * 函数名称：User_Init
//   85 * 描    述：用户附加的初始化代码                                         
//   86 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   87 void User_Init(void)
//   88 {
User_Init:
        PUSH     {R7,LR}
//   89   //定时器中断设定
//   90   PIT_setTime(0,1000,1,2);        //允许中断，用到实时时钟定时中断、定时器溢出中断等中断的话，必须允许总中断 
        MOVS     R3,#+2
        MOVS     R2,#+1
        MOV      R1,#+1000
        MOVS     R0,#+0
        BL       PIT_setTime
//   91   //舵机打到中指
//   92   ServeAction_(dutyMid);
        POP      {R3,LR}
        MOVW     R2,#+3500
        MOVS     R1,#+1
        LDR.N    R0,??DataTable5_5  ;; 0x40039000
        B.W      FTM_setPWMDty
//   93   
//   94 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x400ff0c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x4003b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x40039000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x40038000
//   95 
//   96 /*******************************************************************************
//   97 * 函数名称: System_Init                          
//   98 * 描    述：调用各模块初始化函数 
//   99 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  100 void System_Init(void)
//  101 {
System_Init:
        PUSH     {R7,LR}
//  102   CCD_Init();
        BL       CCD_Init
//  103   Servo_Init();
        BL       Servo_Init
//  104   Motor_Init();
        BL       Motor_Init
//  105   Buzzer_Init();
        BL       Buzzer_Init
//  106   Switch_Init();
        BL       Switch_Init
//  107   User_Init();
        POP      {R0,LR}
        B.N      User_Init
//  108   
//  109 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 474 bytes in section .text
// 
// 474 bytes of CODE memory
//
//Errors: none
//Warnings: none
