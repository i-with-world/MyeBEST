///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      18/Jan/2013  21:34:39 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽��� /
//                    �ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130118\V0.0.0\MyFunct /
//                    ion\Parameter_Adjust.c                                  /
//    Command line =  E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽��� /
//                    �ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130118\V0.0.0\MyFunct /
//                    ion\Parameter_Adjust.c -D IAR -lCN                      /
//                    E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽��� /
//                    �ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130118\V0.0.0\RAM_128 /
//                    K\List\ -lB E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�� /
//                    ���\�ڰ˽����ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130118\V0 /
//                    .0.0\RAM_128K\List\ -o E:\��������\��˼�������ܳ�\�ճ�� /
//                    ���\�ڰ˽�����\�ڰ˽����ܳ�\ֱ��������\ARM\ARMѧϰʹ��\ /
//                    20130118\V0.0.0\RAM_128K\Obj\ --no_cse --no_unroll      /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    D:\Tools\IAR6.30\arm\INC\c\DLib_Config_Normal.h -I      /
//                    E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽��� /
//                    �ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130118\V0.0.0\Library /
//                    \CPU\ -I E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽����� /
//                    \�ڰ˽����ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130118\V0.0. /
//                    0\Library\Drivers\ADC\ -I E:\��������\��˼�������ܳ�\�� /
//                    ������\�ڰ˽�����\�ڰ˽����ܳ�\ֱ��������\ARM\ARMѧϰʹ /
//                    ��\20130118\V0.0.0\Library\Drivers\FTM\ -I              /
//                    E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽��� /
//                    �ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130118\V0.0.0\Library /
//                    \Drivers\GPIO\ -I E:\��������\��˼�������ܳ�\�ճ�����\� /
//                    ڰ˽�����\�ڰ˽����ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130 /
//                    118\V0.0.0\Library\Drivers\PIT\ -I                      /
//                    E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽��� /
//                    �ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130118\V0.0.0\MyFunct /
//                    ion\ -Ol                                                /
//    List file    =  E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽��� /
//                    �ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130118\V0.0.0\RAM_128 /
//                    K\List\Parameter_Adjust.s                               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Parameter_Adjust

        #define SHT_PROGBITS 0x1

        PUBLIC ObjectSpeed_Out

// E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽����ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130118\V0.0.0\MyFunction\Parameter_Adjust.c
//    1 #include "AllHeaders.h"
//    2 

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//    3 int16s_t ObjectSpeed_Out=200;
ObjectSpeed_Out:
        DATA
        DC16 200

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
// 2 bytes in section .data
// 
// 2 bytes of DATA memory
//
//Errors: none
//Warnings: none
