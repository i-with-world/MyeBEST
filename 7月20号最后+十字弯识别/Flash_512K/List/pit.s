///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    05/May/2015  18:17:08 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\2014���ܳ�\���ܳ�����\5��3��ת���\Library\Drivers /
//                    \PIT\pit.c                                              /
//    Command line =  E:\2014���ܳ�\���ܳ�����\5��3��ת���\Library\Drivers /
//                    \PIT\pit.c -D IAR -lCN E:\2014���ܳ�\���ܳ�����\5��3��� /
//                    ����\Flash_512K\List\ -lB                            /
//                    E:\2014���ܳ�\���ܳ�����\5��3��ת���\Flash_512K\List /
//                    \ -o E:\2014���ܳ�\���ܳ�����\5��3��ת���\Flash_512K /
//                    \Obj\ --no_cse --no_unroll --no_inline                  /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --char_is_signed --fpu=None          /
//                    --dlib_config "D:\Program Files                         /
//                    (x86)\IAR\arm\INC\c\DLib_Config_Normal.h" -I            /
//                    E:\2014���ܳ�\���ܳ�����\5��3��ת���\Library\CPU\    /
//                    -I E:\2014���ܳ�\���ܳ�����\5��3��ת���\Library\Driv /
//                    ers\ADC\ -I E:\2014���ܳ�\���ܳ�����\5��3��ת���\Lib /
//                    rary\Drivers\FTM\ -I E:\2014���ܳ�\���ܳ�����\5��3��ת� /
//                    ��\Library\Drivers\GPIO\ -I                          /
//                    E:\2014���ܳ�\���ܳ�����\5��3��ת���\Library\Drivers /
//                    \PIT\ -I E:\2014���ܳ�\���ܳ�����\5��3��ת���\Librar /
//                    y\Drivers\I2C\ -I E:\2014���ܳ�\���ܳ�����\5��3��ת� /
//                    ��\Library\Drivers\UART\ -I                             /
//                    E:\2014���ܳ�\���ܳ�����\5��3��ת���\Library\Drivers /
//                    \FTFL\ -I E:\2014���ܳ�\���ܳ�����\5��3��ת���\MyFun /
//                    ction\ -I E:\2014���ܳ�\���ܳ�����\5��3��ת���\SD_Sy /
//                    stem\ -I E:\2014���ܳ�\���ܳ�����\5��3��ת���\Delay\ /
//                     -I E:\2014���ܳ�\���ܳ�����\5��3��ת���\System_Init /
//                    \ -I E:\2014���ܳ�\���ܳ�����\5��3��ת���\OLED\ -I   /
//                    E:\2014���ܳ�\���ܳ�����\5��3��ת���\ZLG7290\ -I     /
//                    E:\2014���ܳ�\���ܳ�����\5��3��ת���\Simple_AD\ -I   /
//                    E:\2014���ܳ�\���ܳ�����\5��3��ת���\Make_Desicion\  /
//                    -I E:\2014���ܳ�\���ܳ�����\5��3��ת���\Make_Desicio /
//                    n\Judge_Way\ -I E:\2014���ܳ�\���ܳ�����\5��3��ת��� /
//                    \Make_Desicion\Speed_Control\ -I                        /
//                    E:\2014���ܳ�\���ܳ�����\5��3��ת���\Source\ -I      /
//                    E:\2014���ܳ�\���ܳ�����\5��3��ת���\Peripheral_Opar /
//                    ation\ -I E:\2014���ܳ�\���ܳ�����\5��3��ת���\Balan /
//                    ce_control\ -Ol                                         /
//    List file    =  E:\2014���ܳ�\���ܳ�����\5��3��ת���\Flash_512K\List /
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

// E:\2014���ܳ�\���ܳ�����\5��3��ת���\Library\Drivers\PIT\pit.c
//    1 /*******************************************************************************
//    2 * �ļ����ƣ�pit.c
//    3 * ��    ��: PIT(���ڶ�ʱ�ж�)��������
//    4 * ��    �ߣ������
//    5 * �ر���л���ͳ�ʦ��(����http://blog.chinaaet.com/jihceng0622)
//    6 * ʱ    �䣺2012��5��21��
//    7 *******************************************************************************/
//    8 
//    9 #include "pit.h"
//   10 
//   11 
//   12 /*******************************************************************************
//   13 * �������ƣ�PIT_setIntTime
//   14 * ��ڲ�����timer  PIT��ʱ����ѡ��
//   15                     TIMER0
//   16                     TIMER1
//   17                     TIMER2
//   18                     TIMER3
//   19             time   ��ʱʱ��,��λ us
//   20             pie    �ж�ʹ��ѡ��
//   21             prio   �ж����ȼ�(ȡֵ0-15,ֵԽС���ȼ�Խ��)
//   22 * ��    �������ö�ʱ��
//   23 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   24 void PIT_setTime(int8u_t timer, int32u_t time, int8u_t pie, int8u_t prio)
//   25 {
PIT_setTime:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R3
//   26   SIM_SCGC6 |= SIM_SCGC6_PIT_MASK;               // �� PIT ʱ�� 
        LDR.N    R0,??DataTable4  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R3,??DataTable4  ;; 0x4004803c
        STR      R0,[R3, #+0]
//   27   PIT_TCTRL(timer) &= ~PIT_TCTRL_TEN_MASK;       // ֹͣ��ʱ
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
//   28   PIT_MCR = 0x00;                                // ʹ��PIT����
        LDR.N    R0,??DataTable4_2  ;; 0x40037000
        MOVS     R3,#+0
        STR      R3,[R0, #+0]
//   29   PIT_LDVAL(timer) = PIT_LDVAL_TSV(time*BUS_ClK);// ���ö�ʱʱ��
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
//   32     EnableInt_Kinetis(68+timer);                 // ������Ӧ���ж�
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+68
        BL       EnableInt_Kinetis
//   33     SetIntPri_Kinetis(68+timer,prio);            // �����ж����ȼ�
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,R5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+68
        BL       SetIntPri_Kinetis
//   34     PIT_TCTRL(timer) |= PIT_TCTRL_TIE_MASK;      // ʹ�ܶ�ʱ�ж�
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
//   38     PIT_TCTRL(timer) &= ~PIT_TCTRL_TIE_MASK;     // ��ֹ��ʱ�ж�
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
//   40   PIT_TCTRL(timer) |= PIT_TCTRL_TEN_MASK;        // ��ʼ��ʱ
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
//   44 * �������ƣ�PIT_start
//   45 * ��ڲ�����timer  PIT��ʱ����ѡ��
//   46                     TIMER0
//   47                     TIMER1
//   48                     TIMER2
//   49                     TIMER3
//   50 * ��    ������ʼ��ʱ
//   51 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   52 void PIT_start(int8u_t timer)
//   53 {
//   54   PIT_TCTRL(timer) |= PIT_TCTRL_TEN_MASK;        // ��ʼ��ʱ
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
//   58 * �������ƣ�PIT_stop
//   59 * ��ڲ�����timer  PIT��ʱ����ѡ��
//   60                     TIMER0
//   61                     TIMER1
//   62                     TIMER2
//   63                     TIMER3
//   64 * ��    ����ֹͣ��ʱ
//   65 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   66 void PIT_stop(int8u_t timer)
//   67 {
//   68   PIT_TCTRL(timer) &= ~PIT_TCTRL_TEN_MASK;      // ֹͣ��ʱ
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
//   72 * �������ƣ�PIT_stop
//   73 * ��ڲ�����timer  PIT��ʱ����ѡ��
//   74                     TIMER0
//   75                     TIMER1
//   76                     TIMER2
//   77                     TIMER3
//   78 * ��    ���������жϱ�־λ
//   79 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   80 void PIT_clearIntFlg(int8u_t timer)
//   81 {
//   82   PIT_TFLG(timer) = PIT_TFLG_TIF_MASK;         // �����жϱ�־λ
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
//   86 * �������ƣ�PIT_readValue
//   87 * ��ڲ�����timer  PIT��ʱ����ѡ��
//   88                     TIMER0
//   89                     TIMER1
//   90                     TIMER2
//   91                     TIMER3
//   92             result ��������ǰ��ֵ
//   93 * ��    ������ȡ��������ǰ��ֵ
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
