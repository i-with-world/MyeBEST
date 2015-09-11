///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      30/Oct/2014  20:25:33 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\创新活动\智能车\第十届\本车程序\1029调试版\Source\ma /
//                    in.c                                                    /
//    Command line =  E:\创新活动\智能车\第十届\本车程序\1029调试版\Source\ma /
//                    in.c -D IAR -lCN E:\创新活动\智能车\第十届\本车程序\102 /
//                    9调试版\RAM_128K\List\ -lB                              /
//                    E:\创新活动\智能车\第十届\本车程序\1029调试版\RAM_128K\ /
//                    List\ -o E:\创新活动\智能车\第十届\本车程序\1029调试版\ /
//                    RAM_128K\Obj\ --debug --endian=little --cpu=Cortex-M4   /
//                    -e --fpu=None --dlib_config "C:\Program Files\IAR       /
//                    Systems\Embedded Workbench 6.0                          /
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
//                    List\main.s                                             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME main

        #define SHT_PROGBITS 0x1

        EXTERN System_Init
        EXTERN delay_ms

        PUBLIC main

// E:\创新活动\智能车\第十届\本车程序\1029调试版\Source\main.c
//    1 
//    2 #include "AllHeaders.h"
//    3 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//    4 void main(void) 
//    5 {
main:
        PUSH     {R7,LR}
//    6   DisableInterrupts();                               //程序一开始需要关闭所有中断，防止单片机初始化过程中被某个中断打断
        CPSID i          
//    7   /***************************调用初始化函数*******************************/
//    8   delay_ms(100);
        MOVS     R0,#+100
        BL       delay_ms
//    9   System_Init();
        BL       System_Init
//   10   EnableInterrupts();                               //允许中断，用到实时时钟定时中断、定时器溢出中断等中断的话，必须允许总中断
        CPSIE i          
//   11   
//   12   for(;;) 
??main_0:
        B.N      ??main_0
//   13   {
//   14 
//   15   }
//   16 }        

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   17 
//   18     
//   19     
// 
// 18 bytes in section .text
// 
// 18 bytes of CODE memory
//
//Errors: none
//Warnings: none
