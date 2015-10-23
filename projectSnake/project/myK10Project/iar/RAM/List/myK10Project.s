///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       23/Oct/2015  00:30:30
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\app\myK10Project.c
//    Command line =  
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\app\myK10Project.c
//        -D LPLD_K60 -D USE_K60DZ10 -lCN
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\RAM\List\
//        -lB
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\RAM\List\
//        -o
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\RAM\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config "D:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\app\
//        -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\..\..\lib\CPU\
//        -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\..\..\lib\common\
//        -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\..\..\lib\LPLD\
//        -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\..\..\lib\LPLD\HW\
//        -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\..\..\lib\FatFs\
//        -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\..\..\lib\FatFs\option\
//        -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\..\..\lib\USB\common\
//        -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\..\..\lib\USB\driver\
//        -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\..\..\lib\USB\descriptor\
//        -I
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\..\..\..\lib\USB\class\
//        -Ol -I "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\" -D ARM_MATH_CM4
//    List file    =  
//        E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\iar\RAM\List\myK10Project.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC main

// E:\gitProject\MyeBEST\LPLD_OSKinetis_V3\project\myK10Project\app\myK10Project.c
//    1 /**
//    2  * --------------����"��������K60�ײ��V3"�Ĺ��̣�myK10Project��-----------------
//    3  * @file myK10Project.c
//    4  * @version 0.0
//    5  * @date 2013-9-29
//    6  * @brief ���ڸù��̵�����
//    7  *
//    8  * ��Ȩ����:�����������µ��Ӽ������޹�˾
//    9  * http://www.lpld.cn
//   10  * mail:support@lpld.cn
//   11  * Ӳ��ƽ̨:  LPLD K60 Card / LPLD K60 Nano
//   12  *
//   13  * �����̻���"��������K60�ײ��V3"������
//   14  * ���п�Դ�������"lib"�ļ����£��û����ظ��ĸ�Ŀ¼�´��룬
//   15  * �����û������豣����"project"�ļ����£��Թ����������ļ�������
//   16  * �ײ��ʹ�÷���������ĵ��� 
//   17  *
//   18  */
//   19 #include "common.h"
//   20 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 void main (void)
//   22 {
//   23 
//   24   while(1)
main:
??main_0:
        B.N      ??main_0
//   25   {
//   26 
//   27   } 
//   28 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   29 
// 
// 2 bytes in section .text
// 
// 2 bytes of CODE memory
//
//Errors: none
//Warnings: none
