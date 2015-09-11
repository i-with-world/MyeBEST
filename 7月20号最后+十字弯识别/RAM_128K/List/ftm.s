///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      30/Oct/2014  20:23:21 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Library\D /
//                    rivers\FTM\ftm.c                                        /
//    Command line =  E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Library\D /
//                    rivers\FTM\ftm.c -D IAR -lCN                            /
//                    E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\RAM_128K\ /
//                    List\ -lB E:\���»\���ܳ�\��ʮ��\��������\1029���԰� /
//                    \RAM_128K\List\ -o E:\���»\���ܳ�\��ʮ��\��������\1 /
//                    029���԰�\RAM_128K\Obj\ --debug --endian=little         /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files\IAR Systems\Embedded Workbench 6.0    /
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
//                    List\ftm.s                                              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ftm

        #define SHT_PROGBITS 0x1

        PUBLIC FTM_enablePWMCh
        PUBLIC FTM_enableQUAD
        PUBLIC FTM_initPWM
        PUBLIC FTM_initQUAD
        PUBLIC FTM_readQUADValue
        PUBLIC FTM_setPWMDty

// E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Library\Drivers\FTM\ftm.c
//    1 /*****************************************************************
//    2 * �ļ����ƣ�ftm.c
//    3 * ��    ��: FTM(�๦�ܶ�ʱ��ģ��,����PWM��������벶׽������Ƚϡ�
//    4             ��ʱ�жϡ�����Ӽ����������������������)�����ļ�ֻ��
//    5             PWM������������������(�ο����Ľ�PWM��ʼ������)
//    6 * ��    �ߣ������
//    7 * �ر���л���ͳ�ʦ��(����http://blog.chinaaet.com/jihceng0622)
//    8 * ʱ    �䣺2012��5��21��
//    9 *****************************************************************/
//   10 
//   11 #include "ftm.h"
//   12 
//   13 
//   14 /**********************************************************************************
//   15 * �������ƣ�FTM_initPWM
//   16 * ��ڲ�����ftm    FTMģ��
//   17                     FTM0
//   18                     FTM1
//   19                     FTM2
//   20             clks  FTMʱ��Դѡ��
//   21                     00 No clock selected (This in effect disables the FTM counter.)
//   22                     01 System clock(��Bus Clock)
//   23                     10 Fixed frequency clock
//   24                     11 External clock
//   25             div   ʱ�ӷ�Ƶ��
//   26                     000 Divide by 1
//   27                     001 Divide by 2
//   28                     010 Divide by 4
//   29                     011 Divide by 8
//   30                     100 Divide by 16
//   31                     101 Divide by 32
//   32                     110 Divide by 64
//   33                     111 Divide by 128                 
//   34 * ��    ����PWM������ʼ��
//   35 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   36 void FTM_initPWM(FTM_MemMapPtr ftm, int8u_t clks, int8u_t div)
//   37 {
//   38   if(ftm == FTM0)
FTM_initPWM:
        LDR.N    R3,??DataTable1  ;; 0x40038000
        PUSH     {R4}
        CMP      R0,R3
        ITTT     EQ 
        LDREQ.N  R3,??DataTable1_1  ;; 0x40048030
        LDREQ    R4,[R3, #+12]
        ORREQ    R4,R4,#0x1000000
//   39   {
//   40     SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;                       // ʹ��FTM0ʱ�� 
        BEQ.N    ??FTM_initPWM_0
//   41   }
//   42   else if(ftm == FTM1)
        LDR.N    R3,??DataTable1_2  ;; 0x40039000
        CMP      R0,R3
        BNE.N    ??FTM_initPWM_1
//   43   {
//   44     SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;                       // ʹ��FTM1ʱ�� 
        LDR.N    R3,??DataTable1_1  ;; 0x40048030
        LDR      R4,[R3, #+12]
        ORR      R4,R4,#0x2000000
??FTM_initPWM_0:
        STR      R4,[R3, #+12]
        B.N      ??FTM_initPWM_2
//   45   }
//   46   else if(ftm == FTM2)
??FTM_initPWM_1:
        LDR.N    R3,??DataTable1_3  ;; 0x400b8000
        CMP      R0,R3
        BNE.N    ??FTM_initPWM_2
//   47   {
//   48     SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                       // ʹ��FTM2ʱ�� 
        LDR.N    R3,??DataTable1_1  ;; 0x40048030
        LDR      R4,[R3, #+0]
        ORR      R4,R4,#0x1000000
        STR      R4,[R3, #+0]
//   49   }
//   50   FTM_MODE_REG(ftm) |= FTM_MODE_WPDIS_MASK;                 // ����д����
??FTM_initPWM_2:
        LDR      R3,[R0, #+84]
        LSLS     R1,R1,#+3
        ORR      R3,R3,#0x4
        STR      R3,[R0, #+84]
//   51   FTM_SC_REG(ftm) &= ~FTM_SC_CLKS_MASK;                     // ��CLK[1:0]��Ϊ0:0 
        LDR      R3,[R0, #+0]
        AND      R1,R1,#0x18
        BIC      R3,R3,#0x18
        STR      R3,[R0, #+0]
//   52   FTM_SC_REG(ftm) &= ~FTM_SC_PS_MASK;                       // ��PS[2:0]��Ϊ0:0:0
        LDR      R3,[R0, #+0]
        AND      R2,R2,#0x7
        LSRS     R3,R3,#+3
        LSLS     R3,R3,#+3
        STR      R3,[R0, #+0]
//   53   FTM_QDCTRL_REG(ftm) &= ~FTM_QDCTRL_QUADEN_MASK;           // ��ֹ��������ģʽ
        LDR      R3,[R0, #+128]
        ADDS     R1,R2,R1
        LSRS     R3,R3,#+1
        LSLS     R3,R3,#+1
        STR      R3,[R0, #+128]
//   54   FTM_OUTINIT_REG(ftm) = 0;                                 // ��ͨ����ʼ��ʱ�����Ϊ"0" 
        MOVS     R3,#+0
        STR      R3,[R0, #+92]
//   55   FTM_OUTMASK_REG(ftm) = 0x0FF;                             // ��������ͨ��
        MOVS     R3,#+255
        STR      R3,[R0, #+96]
//   56   
//   57   FTM_SC_REG(ftm) = FTM_SC_CLKS(clks) + FTM_SC_PS(div);     // ��ֹ�жϣ�����������ʼ����Դclks����Ƶ��div
        STR      R1,[R0, #+0]
//   58 }
        POP      {R4}
        BX       LR               ;; return
//   59 
//   60 /**********************************************************************************
//   61 * �������ƣ�FTM_enablePWMCh
//   62 * ��ڲ�����ftm     FTMģ��
//   63                      FTM0
//   64                      FTM1
//   65                      FTM2
//   66             channel PWMͨ����
//   67             st      ������������ʼֵ
//   68             end     ��������ֵֹ(���� = end-st+1)
//   69             dty     ����(ռ�ձ� = wid/(end+1-st))
//   70 * ��    ��������PWMͨ������,PWM��ʼ����
//   71 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   72 void FTM_enablePWMCh(FTM_MemMapPtr ftm, int8u_t channel, int16u_t st, int16u_t end, int16u_t dty)
//   73 {
FTM_enablePWMCh:
        PUSH     {R4-R7}
        LDR      R4,[SP, #+16]
        ADD      R5,R0,R1, LSL #+3
        LDR      R6,[R5, #+12]
        MOVS     R7,#+1
        BIC      R6,R6,#0x4
        STR      R6,[R5, #+12]
//   74   FTM_CnSC_REG(ftm,channel) &= ~FTM_CnSC_ELSA_MASK;       // ELSA=0��ELSB=1������룬�ȸߺ��
//   75   FTM_CnSC_REG(ftm,channel) |= FTM_CnSC_ELSB_MASK;  
        LDR      R6,[R5, #+12]
        LSL      R1,R7,R1
        ORR      R6,R6,#0x8
        STR      R6,[R5, #+12]
//   76   FTM_CnSC_REG(ftm,channel) |= FTM_CnSC_MSB_MASK;         // MSB=1��ģʽѡ����ض���
        LDR      R6,[R5, #+12]
        UXTH     R4,R4
        ORR      R6,R6,#0x20
        STR      R6,[R5, #+12]
//   77   
//   78   FTM_OUTMASK_REG(ftm) &= ~((int32u_t)(1)<<channel);      // �����ǰͨ������
        LDR      R6,[R0, #+96]
        BIC      R1,R6,R1
        STR      R1,[R0, #+96]
//   79   FTM_CNTIN_REG(ftm) = st;                                // ���ü�����ʼֵ
        STR      R2,[R0, #+76]
//   80   FTM_MOD_REG(ftm) = end;                                 // ���ü�����ֵֹ
        STR      R3,[R0, #+8]
//   81   FTM_CnV_REG(ftm,channel) = dty;                         // ���õ�ƽ��תֵ
        STR      R4,[R5, #+16]
//   82   FTM_CNT_REG(ftm) = 0;                                   // ���������
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
//   83 
//   84   FTM_MODE_REG(ftm) &= ~FTM_MODE_FTMEN_MASK;              //FTMʹ��
        LDR      R1,[R0, #+84]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        STR      R1,[R0, #+84]
//   85 }
        POP      {R4-R7}
        BX       LR               ;; return
//   86 
//   87 /**********************************************************************************
//   88 * �������ƣ�FTM_setPWMDty
//   89 * ��ڲ�����ftm     FTMģ��
//   90                      FTM0
//   91                      FTM1
//   92                      FTM2
//   93             channel PWMͨ����
//   94             dty     ����(ռ�ձ� = (wid+1)/(end+1-st))
//   95 * ��    ��������PWMռ�ձ�
//   96 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   97 void FTM_setPWMDty(FTM_MemMapPtr ftm, int8u_t channel, int16u_t dty)
//   98 {
//   99   FTM_CnV_REG(ftm,channel) = dty;                         // ���õ�ƽ��תֵ  
FTM_setPWMDty:
        ADD      R0,R0,R1, LSL #+3
        STR      R2,[R0, #+16]
//  100 }
        BX       LR               ;; return
//  101 
//  102 /**********************************************************************************
//  103 * �������ƣ�FTM_initQUAD
//  104 * ��ڲ�����ftm    FTMģ��
//  105                      FTM0
//  106                      FTM1
//  107                      FTM2
//  108             mod    ��������ģʽ
//  109                     0 Phase A and phase B encoding mode.
//  110                     1 Count and direction encoding mode.
//  111             st     ������������ʼֵ
//  112             end    ��������ֵֹ
//  113 * ��    �����������빦������
//  114 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  115 void FTM_initQUAD(FTM_MemMapPtr ftm,int8u_t mod, int16s_t st, int16u_t end)
//  116 {
FTM_initQUAD:
        PUSH     {R4,R5}
//  117   if(ftm == FTM1)
        LDR.N    R4,??DataTable1_2  ;; 0x40039000
        CMP      R0,R4
        BNE.N    ??FTM_initQUAD_0
//  118   {
//  119     SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;                     // ʹ��FTM1ʱ�� 
        LDR.N    R4,??DataTable1_1  ;; 0x40048030
        LDR      R5,[R4, #+12]
        ORR      R5,R5,#0x2000000
        STR      R5,[R4, #+12]
        B.N      ??FTM_initQUAD_1
//  120   }
//  121   else if(ftm == FTM2)
??FTM_initQUAD_0:
        LDR.N    R4,??DataTable1_3  ;; 0x400b8000
        CMP      R0,R4
        BNE.N    ??FTM_initQUAD_1
//  122   {
//  123     SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                     // ʹ��FTM2ʱ�� 
        LDR.N    R4,??DataTable1_1  ;; 0x40048030
        LDR      R5,[R4, #+0]
        ORR      R5,R5,#0x1000000
        STR      R5,[R4, #+0]
//  124   }
//  125   FTM_MODE_REG(ftm) |= FTM_MODE_WPDIS_MASK;               // ����д����
??FTM_initQUAD_1:
        LDR      R4,[R0, #+84]
//  126   
//  127   if(mod == 1)
        CMP      R1,#+1
        ORR      R4,R4,#0x4
        STR      R4,[R0, #+84]
        LDR      R1,[R0, #+128]
        ITE      EQ 
        ORREQ    R1,R1,#0x8
        BICNE    R1,R1,#0x8
//  128   {
//  129     FTM_QDCTRL_REG(ftm) |= FTM_QDCTRL_QUADMODE_MASK;      // AB��ͬʱ����ģʽ
//  130   }
//  131   else
//  132   {
//  133     FTM_QDCTRL_REG(ftm) &= ~FTM_QDCTRL_QUADMODE_MASK;     // ����ͷ�������ģʽ
        STR      R1,[R0, #+128]
//  134   }
//  135   FTM_CNTIN_REG(ftm) = st;                                // ���ü�����ʼֵ
        STR      R2,[R0, #+76]
//  136   FTM_MOD_REG(ftm) = end;                                 // ���ü�����ֵֹ
        STR      R3,[R0, #+8]
//  137   FTM_QDCTRL_REG(ftm) |= FTM_QDCTRL_QUADEN_MASK;          // ����FTM��������ģʽ
        LDR      R1,[R0, #+128]
        ORR      R1,R1,#0x1
        STR      R1,[R0, #+128]
//  138   FTM_CNT_REG(ftm) = 0;                                   // ���������
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
//  139 }
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40038000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x40039000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x400b8000
//  140 
//  141 /*******************************************************************************
//  142 * �������ƣ�FTM_enableQUAD
//  143 * ��ڲ�����ftm     FTMģ��
//  144                      FTM0
//  145                      FTM1
//  146                      FTM2
//  147 * ��    �����������뿪ʼ����
//  148 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  149 void FTM_enableQUAD(FTM_MemMapPtr ftm)
//  150 {
//  151   FTM_MODE_REG(ftm) |= FTM_MODE_FTMEN_MASK;              // FTM2EN=1	
FTM_enableQUAD:
        LDR      R1,[R0, #+84]
        ORR      R1,R1,#0x1
        STR      R1,[R0, #+84]
//  152 }
        BX       LR               ;; return
//  153 
//  154 /*******************************************************************************
//  155 * �������ƣ�FTM_setPWMDty
//  156 * ��ڲ�����ftm    FTMģ��
//  157                      FTM0
//  158                      FTM1
//  159                      FTM2
//  160             val    ����ֵ
//  161 * ��    ������ȡ����ֵ������������Ĵ���
//  162 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  163 void FTM_readQUADValue(FTM_MemMapPtr ftm, int16s_t * val)
//  164 {
//  165   *val = FTM_CNT_REG(ftm);                                 // ��ȡ����ֵ
FTM_readQUADValue:
        LDR      R2,[R0, #+4]
        STRH     R2,[R1, #+0]
//  166   FTM_CNT_REG(ftm)=0;                                    // �����Ĵ�������
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
//  167 }
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
// 
// 316 bytes in section .text
// 
// 316 bytes of CODE memory
//
//Errors: none
//Warnings: none
