///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      10/Jan/2013  19:05:29 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽��� /
//                    �ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130110\V0.0.3\Library /
//                    \CPU\KinetisOperate.c                                   /
//    Command line =  E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽��� /
//                    �ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130110\V0.0.3\Library /
//                    \CPU\KinetisOperate.c -D IAR -lCN                       /
//                    E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽��� /
//                    �ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130110\V0.0.3\Debug\L /
//                    ist\ -lB E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽����� /
//                    \�ڰ˽����ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130110\V0.0. /
//                    3\Debug\List\ -o E:\��������\��˼�������ܳ�\�ճ�����\�� /
//                    �˽�����\�ڰ˽����ܳ�\ֱ��������\ARM\ARMѧϰʹ��\201301 /
//                    10\V0.0.3\Debug\Obj\ --no_cse --no_unroll --no_inline   /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    D:\Tools\IAR6.30\arm\INC\c\DLib_Config_Normal.h -I      /
//                    E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽��� /
//                    �ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130110\V0.0.3\Library /
//                    \CPU\ -I E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽����� /
//                    \�ڰ˽����ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130110\V0.0. /
//                    3\Library\Drivers\ADC\ -I E:\��������\��˼�������ܳ�\�� /
//                    ������\�ڰ˽�����\�ڰ˽����ܳ�\ֱ��������\ARM\ARMѧϰʹ /
//                    ��\20130110\V0.0.3\Library\Drivers\FTM\ -I              /
//                    E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽��� /
//                    �ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130110\V0.0.3\Library /
//                    \Drivers\GPIO\ -I E:\��������\��˼�������ܳ�\�ճ�����\� /
//                    ڰ˽�����\�ڰ˽����ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130 /
//                    110\V0.0.3\Library\Drivers\PIT\ -Ol                     /
//    List file    =  E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽��� /
//                    �ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130110\V0.0.3\Debug\L /
//                    ist\KinetisOperate.s                                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME KinetisOperate

        #define SHT_PROGBITS 0x1

        PUBLIC EnableInt_Kinetis
        PUBLIC NullFun_Kinetis
        PUBLIC SetIntPri_Kinetis
        PUBLIC WriteVTOR_Kinetis

// E:\��������\��˼�������ܳ�\�ճ�����\�ڰ˽�����\�ڰ˽����ܳ�\ֱ��������\ARM\ARMѧϰʹ��\20130110\V0.0.3\Library\CPU\KinetisOperate.c
//    1 /************************************************************************************
//    2 * �ļ����ƣ�KinetisOperate.c
//    3 * ��    ��������Kinetis�Ļ����ײ��������(�жϵ�������CPUģʽ������)��
//    4 
//    5 * ��    �ߣ����Ľ���ԭ���ߣ�
//    6 *           ��������޸ģ�
//    7 * �ر���л���ͳ�ʦ��(����http://blog.chinaaet.com/jihceng0622)
//    8 * ʱ    �䣺2012��5��17��
//    9 *************************************************************************************/
//   10 
//   11 #include "KinetisConfig.h"
//   12 
//   13 
//   14 /************************************************************************************************ 
//   15 * WriteVTOR_Kinetis
//   16 * ע���ж�����
//   17 * ��ڲ���   vtor:�ж������ţ������ж��������е�ƫ������
//   18 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   19 void WriteVTOR_Kinetis(int32u_t vtor)
//   20 {
//   21   /* Write the VTOR with the new value */
//   22   /* SCB_VTOR�ĵ�λֻ����0,���뱣֤".lcf"�ж���� __VECTOR_RAM ���ϸ�����. */
//   23   SCB_VTOR = vtor;
WriteVTOR_Kinetis:
        LDR.N    R1,??DataTable1  ;; 0xe000ed08
        STR      R0,[R1, #+0]
//   24 }
        BX       LR               ;; return
//   25 
//   26 /************************************************************************************************ 
//   27 * EnableInt_Kinetis
//   28 * ����ĳ�ж�
//   29 * ��ڲ���  irq:�жϱ��(ע�ⲻ���������е�������,��������-16)
//   30 * ���ز���  �趨���,�趨�ɹ�����NOERR_Kinetis
//   31 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   32 Kinetis_Error_t EnableInt_Kinetis(int32u_t irq)
//   33 {
//   34   int32u_t div;
//   35 
//   36 #if EN_CheckOpt_Kinetis != 0
//   37   Kinetis_Error_t err = NOERR_Kinetis;
//   38   if (irq > 91)
//   39   {
//   40       err |= ERR_IntNum_Kinetis; 
//   41       return err;
//   42   }
//   43 #endif
//   44 
//   45   /* Determine which of the NVICISERs corresponds to the irq */
//   46   div = irq >> 5;
EnableInt_Kinetis:
        LSRS     R1,R0,#+5
//   47 
//   48   if(div == 0)
        CMP      R1,#+0
        BNE.N    ??EnableInt_Kinetis_0
//   49   {
//   50       NVICICPR0 = 1 << (irq & 0x1F);
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        LDR.N    R2,??DataTable1_1  ;; 0xe000e280
        STR      R1,[R2, #+0]
//   51       NVICISER0 = 1 << (irq & 0x1F);
        MOVS     R1,#+1
        ANDS     R0,R0,#0x1F
        LSLS     R0,R1,R0
        LDR.N    R1,??DataTable1_2  ;; 0xe000e100
        STR      R0,[R1, #+0]
        B.N      ??EnableInt_Kinetis_1
//   52   } 
//   53   else if(div == 1)
??EnableInt_Kinetis_0:
        CMP      R1,#+1
        BNE.N    ??EnableInt_Kinetis_2
//   54   {
//   55       NVICICPR1 = 1 << (irq & 0x1F);
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        LDR.N    R2,??DataTable1_3  ;; 0xe000e284
        STR      R1,[R2, #+0]
//   56       NVICISER1 = 1 << (irq & 0x1F);
        MOVS     R1,#+1
        ANDS     R0,R0,#0x1F
        LSLS     R0,R1,R0
        LDR.N    R1,??DataTable1_4  ;; 0xe000e104
        STR      R0,[R1, #+0]
        B.N      ??EnableInt_Kinetis_1
//   57   }
//   58   else
//   59   {
//   60       NVICICPR2 = 1 << (irq & 0x1F);
??EnableInt_Kinetis_2:
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        LDR.N    R2,??DataTable1_5  ;; 0xe000e288
        STR      R1,[R2, #+0]
//   61       NVICISER2 = 1 << (irq & 0x1F);
        MOVS     R1,#+1
        ANDS     R0,R0,#0x1F
        LSLS     R0,R1,R0
        LDR.N    R1,??DataTable1_6  ;; 0xe000e108
        STR      R0,[R1, #+0]
//   62   }   
//   63   
//   64   return NOERR_Kinetis;
??EnableInt_Kinetis_1:
        MOVS     R0,#+0
        BX       LR               ;; return
//   65 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0xe000ed08

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0xe000e284

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0xe000e104

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0xe000e288

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0xe000e108
//   66 
//   67 /************************************************************************************************ 
//   68 * SetIntPri_Kinetis
//   69 * �趨�ж����ȼ�
//   70 * ��ڲ���   irq:�жϱ��(ע�ⲻ���������е�������,��������-16)
//   71              prio:�ж����ȼ�(ȡֵ0-15,ֵԽС���ȼ�Խ��)
//   72 * ���ز���  �趨���,�趨�ɹ�����NOERR_Kinetis
//   73 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   74 Kinetis_Error_t SetIntPri_Kinetis(int32u_t irq, int32u_t prio)
//   75 {
//   76   /*irq priority pointer*/
//   77   int8u_t *prio_reg;
//   78 
//   79 #if EN_CheckOpt_Kinetis != 0
//   80   Kinetis_Error_t err = NOERR_Kinetis;
//   81   if (irq > 91) 
//   82   {
//   83       err |= ERR_IntNum_Kinetis;	
//   84   }
//   85   if (prio > 15)
//   86   {
//   87       err |= ERR_IntPri_Kinetis;
//   88   }
//   89   
//   90   if(err != NOERR_Kinetis)
//   91   {
//   92       return err;
//   93   }
//   94 #endif
//   95 
//   96   /* Determine which of the NVICIPx corresponds to the irq */
//   97   prio_reg = (int8u_t *)(((int32u_t)&NVICIP0) + irq);
SetIntPri_Kinetis:
        ADD      R0,R0,#-536870912
        ADDS     R0,R0,#+58368
//   98   /* Assign priority to IRQ */
//   99   *prio_reg = ( (prio & 0x000F) << (8 - ARM_INTERRUPT_LEVEL_BITS) );   
        LSLS     R1,R1,#+4
        STRB     R1,[R0, #+0]
//  100 
//  101   return NOERR_Kinetis;
        MOVS     R0,#+0
        BX       LR               ;; return
//  102 }
//  103 
//  104 #if EN_DisableInt_Kinetis != 0
//  105 /************************************************************************************************ 
//  106 * DisableInt_Kinetis
//  107 * ����ĳ�ж�
//  108 * ��ڲ���   irq:�жϱ��(ע�ⲻ���������е�������,��������-16)
//  109 * ���ز���  �趨���,�趨�ɹ�����NOERR_Kinetis
//  110 ************************************************************************************************/
//  111 Kinetis_Error_t DisableInt_Kinetis(int32u_t irq)
//  112 {
//  113   int32u_t div;
//  114     
//  115 #if EN_CheckOpt_Kinetis != 0
//  116   Kinetis_Error_t err = NOERR_Kinetis;  
//  117   if (irq > 91)
//  118   {
//  119       err |= ERR_IntNum_Kinetis;  
//  120       return err;
//  121   }
//  122 #endif
//  123 
//  124   /* Determine which of the NVICICERs corresponds to the irq */
//  125   div = irq >> 5;
//  126 
//  127   if(div == 0)
//  128   {
//  129       NVICICER0 = 1 << (irq & 0x1F);
//  130   }
//  131   else if(div == 1)
//  132   {
//  133       NVICICER1 = 1 << (irq & 0x1F);
//  134   }
//  135   else
//  136   {
//  137       NVICICER2 = 1 << (irq & 0x1F);
//  138   } 
//  139 
//  140   return NOERR_Kinetis;
//  141 }
//  142 #endif
//  143 
//  144 #if EN_Stop_Kinetis != 0
//  145 /************************************************************************************************ 
//  146 * Stop_Kinetis
//  147 * ��Kinetis������Stopģʽ
//  148 ************************************************************************************************/
//  149 void Stop_Kinetis(void)
//  150 {
//  151   /* Set the SLEEPDEEP bit to enable deep sleep mode (STOP) */
//  152   SCB_SCR |= SCB_SCR_SLEEPDEEP_MASK;	
//  153 
//  154   /* WFI instruction will start entry into STOP mode */
//  155   asm("WFI");
//  156 }
//  157 #endif
//  158 
//  159 #if EN_Wait_Kinetis != 0
//  160 /************************************************************************************************ 
//  161 * Wait_Kinetis
//  162 * ��Kinetis������Waitģʽ
//  163 ************************************************************************************************/
//  164 void Wait_Kinetis(void)
//  165 {
//  166   /* 
//  167    * Clear the SLEEPDEEP bit to make sure we go into WAIT (sleep) mode instead
//  168    * of deep sleep.
//  169    */
//  170   SCB_SCR &= ~SCB_SCR_SLEEPDEEP_MASK;	
//  171 
//  172   /* WFI instruction will start entry into WAIT mode */
//  173   asm("WFI");
//  174 }
//  175 #endif
//  176 
//  177 /************************************************************************************************ 
//  178 * NullFun_Kinetis
//  179 * Kinetis�Ŀղ�������
//  180 ************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  181 void NullFun_Kinetis(void)
//  182 {
//  183 }
NullFun_Kinetis:
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
// 148 bytes in section .text
// 
// 148 bytes of CODE memory
//
//Errors: none
//Warnings: none
