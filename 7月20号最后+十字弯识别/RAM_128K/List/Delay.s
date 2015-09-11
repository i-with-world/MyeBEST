///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      30/Oct/2014  20:23:22 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\创新活动\智能车\第十届\本车程序\1029调试版\Delay\Del /
//                    ay.c                                                    /
//    Command line =  E:\创新活动\智能车\第十届\本车程序\1029调试版\Delay\Del /
//                    ay.c -D IAR -lCN E:\创新活动\智能车\第十届\本车程序\102 /
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
//                    List\Delay.s                                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Delay

        #define SHT_PROGBITS 0x1

        PUBLIC Delay1
        PUBLIC Delay_us
        PUBLIC Integration_delay
        PUBLIC delay
        PUBLIC delay_ms

// E:\创新活动\智能车\第十届\本车程序\1029调试版\Delay\Delay.c
//    1 #include "AllHeaders.h"
//    2 
//    3 //----------------------------------------------------------------------
//    4 //函 数 名:延时函数 delay(), DelayMs()                                                     
//    5 //功    能:延时函数                                                              
//    6 //返    回:无                                                                                       
//    7 //----------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//    8  void Integration_delay()
//    9 {
//   10   unsigned int i;
//   11   for(i=0;i<2;i++)
//   12   {
//   13     asm("nop");
Integration_delay:
        nop              
        nop              
//   14   }
//   15 
//   16 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   17 void delay()
//   18 {
//   19   unsigned int i;
//   20   for(i=0;i<2;i++)
//   21   {
//   22     asm("nop");
delay:
        nop              
        nop              
//   23   }
//   24 }
        BX       LR               ;; return
//   25 
//   26 /******************************
//   27 函数名：Delay_us()
//   28 作用  ：用于简单的延时
//   29 备注  ：
//   30 ******************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   31 void Delay_us(unsigned int t) 
//   32 {
Delay_us:
        CBZ.N    R0,??Delay_us_0
??Delay_us_1:
        SUBS     R0,R0,#+1
//   33  while(t--);   
        BNE.N    ??Delay_us_1
//   34 }
??Delay_us_0:
        BX       LR               ;; return
//   35 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   36 void delay_ms(unsigned int delay_time) 
//   37 {
//   38   unsigned int i,delay_temp;
//   39   for(i=0;i<delay_time;i++) 
//   40   {
//   41     for(delay_temp=0;delay_temp<10000;delay_temp++);  
//   42   }
//   43 }
delay_ms:
        BX       LR               ;; return
//   44 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   45 void Delay1(int16u_t Delay1)
//   46 {
//   47    int16u_t i;
//   48    for(i=0;i<Delay1;i++)
//   49    {
//   50    }
//   51 }
Delay1:
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   52 
// 
// 24 bytes in section .text
// 
// 24 bytes of CODE memory
//
//Errors: none
//Warnings: none
