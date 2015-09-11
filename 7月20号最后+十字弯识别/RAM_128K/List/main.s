///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      30/Oct/2014  20:25:33 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Source\ma /
//                    in.c                                                    /
//    Command line =  E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Source\ma /
//                    in.c -D IAR -lCN E:\���»\���ܳ�\��ʮ��\��������\102 /
//                    9���԰�\RAM_128K\List\ -lB                              /
//                    E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\RAM_128K\ /
//                    List\ -o E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\ /
//                    RAM_128K\Obj\ --debug --endian=little --cpu=Cortex-M4   /
//                    -e --fpu=None --dlib_config "C:\Program Files\IAR       /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\arm\INC\c\DLib_Config_Normal.h" -I           /
//                    E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Library\C /
//                    PU\ -I E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Li /
//                    brary\Drivers\ADC\ -I E:\���»\���ܳ�\��ʮ��\������� /
//                    �\1029���԰�\Library\Drivers\FTM\ -I                    /
//                    E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Library\D /
//                    rivers\GPIO\ -I E:\���»\���ܳ�\��ʮ��\��������\1029 /
//                    ���԰�\Library\Drivers\PIT\ -I                          /
//                    E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\System_In /
//                    it\ -I E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\So /
//                    urce\ -I E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\ /
//                    OLED\ -I E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\ /
//                    SD_System\ -I E:\���»\���ܳ�\��ʮ��\��������\1029�� /
//                    �԰�\Simple_AD\ -I E:\���»\���ܳ�\��ʮ��\��������\1 /
//                    029���԰�\Delay\ -I E:\���»\���ܳ�\��ʮ��\��������\ /
//                    1029���԰�\Make_Desicion\ -Oh                           /
//    List file    =  E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\RAM_128K\ /
//                    List\main.s                                             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME main

        #define SHT_PROGBITS 0x1

        EXTERN System_Init
        EXTERN delay_ms

        PUBLIC main

// E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Source\main.c
//    1 
//    2 #include "AllHeaders.h"
//    3 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//    4 void main(void) 
//    5 {
main:
        PUSH     {R7,LR}
//    6   DisableInterrupts();                               //����һ��ʼ��Ҫ�ر������жϣ���ֹ��Ƭ����ʼ�������б�ĳ���жϴ��
        CPSID i          
//    7   /***************************���ó�ʼ������*******************************/
//    8   delay_ms(100);
        MOVS     R0,#+100
        BL       delay_ms
//    9   System_Init();
        BL       System_Init
//   10   EnableInterrupts();                               //�����жϣ��õ�ʵʱʱ�Ӷ�ʱ�жϡ���ʱ������жϵ��жϵĻ��������������ж�
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
