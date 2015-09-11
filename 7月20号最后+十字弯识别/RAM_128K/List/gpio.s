///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      30/Oct/2014  20:23:23 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Library\D /
//                    rivers\GPIO\gpio.c                                      /
//    Command line =  E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Library\D /
//                    rivers\GPIO\gpio.c -D IAR -lCN                          /
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
//                    List\gpio.s                                             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME gpio

        #define SHT_PROGBITS 0x1

        PUBLIC GPIO_ConfigPinInt
        PUBLIC GPIO_ReadPortStat
        PUBLIC GPIO_SetPinDir
        PUBLIC GPIO_SetPinDriveStrgth
        PUBLIC GPIO_SetPinMod
        PUBLIC GPIO_SetPinOpenDrain
        PUBLIC GPIO_SetPinPassiveFilter
        PUBLIC GPIO_SetPinPull
        PUBLIC GPIO_SetPinStat
        PUBLIC GPIO_SetPortDir
        PUBLIC GPIO_SetPortStat
        PUBLIC GPIO_TogglePinStat
        PUBLIC GPIO_get

// E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Library\Drivers\GPIO\gpio.c
//    1 /*******************************************************************************
//    2 * �ļ����ƣ�gpio.c
//    3 * ��    ��: GPIO���������򣨲ο��ͳ�ʦ����������
//    4 * ��    �ߣ������
//    5 * �ر���л���ͳ�ʦ��(����http://blog.chinaaet.com/jihceng0622)
//    6 * ʱ    �䣺2012��5��17��
//    7 *******************************************************************************/
//    8 
//    9 #include "gpio.h"
//   10 
//   11 
//   12 static PORT_MemMapPtr GPIO_GetPortMapPtr(GPIO_MemMapPtr gpio);
//   13 
//   14 /*******************************************************************************
//   15 * �������ƣ�GPIO_SetPinMod
//   16 * ��ڲ�����gpio   GPIO��
//   17             pin    gpio�ڵ����ź�
//   18             mux    �����ŵĹ��ܺ�
//   19 * ��    ��������GPIO�е� pin �����ŵĹ��ܺ�
//   20 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 void GPIO_SetPinMod(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t mux)
//   22 {
//   23   PORT_MemMapPtr port;
//   24   int32u_t       readReg = 0;
//   25   
//   26   port = GPIO_GetPortMapPtr(gpio);
GPIO_SetPinMod:
        LDR.W    R12,??DataTable4  ;; 0x400ff000
        SUBS     R0,R0,R12
        BEQ.N    ??GPIO_SetPinMod_0
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinMod_1
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinMod_2
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinMod_3
        SUBS     R0,R0,#+64
        BNE.N    ??GPIO_SetPinMod_4
        LDR.N    R3,??DataTable4_1  ;; 0x4004d000
        B.N      ??GPIO_SetPinMod_4
??GPIO_SetPinMod_3:
        LDR.N    R3,??DataTable4_2  ;; 0x4004c000
        B.N      ??GPIO_SetPinMod_4
??GPIO_SetPinMod_2:
        LDR.N    R3,??DataTable4_3  ;; 0x4004b000
        B.N      ??GPIO_SetPinMod_4
??GPIO_SetPinMod_1:
        LDR.N    R3,??DataTable4_4  ;; 0x4004a000
        B.N      ??GPIO_SetPinMod_4
??GPIO_SetPinMod_0:
        LDR.N    R3,??DataTable4_5  ;; 0x40049000
//   27   readReg = PORT_PCR_REG(port,pin);
//   28   readReg &= ~PORT_PCR_MUX_MASK;
//   29   readReg |= PORT_PCR_MUX(mux);
//   30   PORT_PCR_REG(port,pin) = readReg;
??GPIO_SetPinMod_4:
        LDR      R0,[R3, R1, LSL #+2]
        BFI      R0,R2,#+8,#+3
        B.N      ?Subroutine0
//   31 }
//   32 
//   33 /*******************************************************************************
//   34 * �������ƣ�GPIO_ConfigPinInt
//   35 * ��ڲ�����gpio   GPIO��ָ��
//   36             pin    gpio�ڵ����ź�
//   37             irqc   �����ŵ��ж�����
//   38                     0000 Interrupt/DMA Request disabled.
//   39                     0001 DMA Request on rising edge.
//   40                     0010 DMA Request on falling edge.
//   41                     0011 DMA Request on either edge.
//   42                     0100 Reserved.
//   43                     1000 Interrupt when logic zero
//   44                     1001 Interrupt on rising edge.
//   45                     1010 Interrupt on falling edge.
//   46                     1011 Interrupt on either edge.
//   47                     1100 Interrupt when logic one.
//   48                     Others Reserved.
//   49 * ��    ��������GPIO�е� pin �����ŵ��ж�����
//   50 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   51 void GPIO_ConfigPinInt(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t irqc)
//   52 {
//   53   PORT_MemMapPtr port;
//   54   int32u_t       readReg = 0;
//   55   
//   56   port = GPIO_GetPortMapPtr(gpio);
GPIO_ConfigPinInt:
        LDR.W    R12,??DataTable4  ;; 0x400ff000
        SUBS     R0,R0,R12
        BEQ.N    ??GPIO_ConfigPinInt_0
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_ConfigPinInt_1
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_ConfigPinInt_2
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_ConfigPinInt_3
        SUBS     R0,R0,#+64
        BNE.N    ??GPIO_ConfigPinInt_4
        LDR.N    R3,??DataTable4_1  ;; 0x4004d000
        B.N      ??GPIO_ConfigPinInt_4
??GPIO_ConfigPinInt_3:
        LDR.N    R3,??DataTable4_2  ;; 0x4004c000
        B.N      ??GPIO_ConfigPinInt_4
??GPIO_ConfigPinInt_2:
        LDR.N    R3,??DataTable4_3  ;; 0x4004b000
        B.N      ??GPIO_ConfigPinInt_4
??GPIO_ConfigPinInt_1:
        LDR.N    R3,??DataTable4_4  ;; 0x4004a000
        B.N      ??GPIO_ConfigPinInt_4
??GPIO_ConfigPinInt_0:
        LDR.N    R3,??DataTable4_5  ;; 0x40049000
//   57   readReg = PORT_PCR_REG(port,pin);
//   58   readReg &= ~PORT_PCR_IRQC_MASK;
//   59   readReg |= PORT_PCR_IRQC(irqc); 
//   60   PORT_PCR_REG(port,pin) = readReg; 
??GPIO_ConfigPinInt_4:
        LDR      R0,[R3, R1, LSL #+2]
        BFI      R0,R2,#+16,#+4
        REQUIRE ?Subroutine0
        ;; // Fall through to label ?Subroutine0
//   61 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
?Subroutine0:
        STR      R0,[R3, R1, LSL #+2]
        BX       LR               ;; return
//   62 
//   63 /*******************************************************************************
//   64 * �������ƣ�GPIO_SetPinDriveStrgth
//   65 * ��ڲ�����gpio   GPIO��ָ��
//   66             pin    gpio�ڵ����ź�
//   67             mux    �����ŵĹ��ܺ�
//   68                     0: ����������
//   69                     1��ǿ��������
//   70 * ��    ��������GPIO�е� pin �����ŵ���������
//   71 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   72 void GPIO_SetPinDriveStrgth(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t dse)
//   73 {
//   74   PORT_MemMapPtr port;
//   75   
//   76   port = GPIO_GetPortMapPtr(gpio);
GPIO_SetPinDriveStrgth:
        LDR.W    R12,??DataTable4  ;; 0x400ff000
        SUBS     R0,R0,R12
        BEQ.N    ??GPIO_SetPinDriveStrgth_0
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinDriveStrgth_1
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinDriveStrgth_2
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinDriveStrgth_3
        SUBS     R0,R0,#+64
        BNE.N    ??GPIO_SetPinDriveStrgth_4
        LDR.N    R3,??DataTable4_1  ;; 0x4004d000
        B.N      ??GPIO_SetPinDriveStrgth_4
??GPIO_SetPinDriveStrgth_3:
        LDR.N    R3,??DataTable4_2  ;; 0x4004c000
        B.N      ??GPIO_SetPinDriveStrgth_4
??GPIO_SetPinDriveStrgth_2:
        LDR.N    R3,??DataTable4_3  ;; 0x4004b000
        B.N      ??GPIO_SetPinDriveStrgth_4
??GPIO_SetPinDriveStrgth_1:
        LDR.N    R3,??DataTable4_4  ;; 0x4004a000
        B.N      ??GPIO_SetPinDriveStrgth_4
??GPIO_SetPinDriveStrgth_0:
        LDR.N    R3,??DataTable4_5  ;; 0x40049000
//   77   if(dse == 1)
??GPIO_SetPinDriveStrgth_4:
        CMP      R2,#+1
        LDR      R0,[R3, R1, LSL #+2]
        ITE      EQ 
        ORREQ    R0,R0,#0x40
        BICNE    R0,R0,#0x40
//   78   {
//   79     PORT_PCR_REG(port,pin) |= PORT_PCR_DSE_MASK;
//   80   }
//   81   else
//   82   {
//   83     PORT_PCR_REG(port,pin) &= ~PORT_PCR_DSE_MASK;
        B.N      ?Subroutine0
//   84   }
//   85 }
//   86 
//   87 /*******************************************************************************
//   88 * �������ƣ�GPIO_SetPinOpenDrain
//   89 * ��ڲ�����gpio   GPIO��ָ��
//   90             pin    gpio�ڵ����ź�
//   91             ode    �����ŵĹ��ܺ�
//   92                     0: ��ֹ��©���
//   93                     1��ʹ�ܿ�©���
//   94 * ��    ��������GPIO�е� pin �����ŵĿ�©ģʽ
//   95 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   96 void GPIO_SetPinOpenDrain(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t ode)
//   97 {
//   98   PORT_MemMapPtr port;
//   99   
//  100   port = GPIO_GetPortMapPtr(gpio);
GPIO_SetPinOpenDrain:
        LDR.W    R12,??DataTable4  ;; 0x400ff000
        SUBS     R0,R0,R12
        BEQ.N    ??GPIO_SetPinOpenDrain_0
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinOpenDrain_1
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinOpenDrain_2
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinOpenDrain_3
        SUBS     R0,R0,#+64
        BNE.N    ??GPIO_SetPinOpenDrain_4
        LDR.N    R3,??DataTable4_1  ;; 0x4004d000
        B.N      ??GPIO_SetPinOpenDrain_4
??GPIO_SetPinOpenDrain_3:
        LDR.N    R3,??DataTable4_2  ;; 0x4004c000
        B.N      ??GPIO_SetPinOpenDrain_4
??GPIO_SetPinOpenDrain_2:
        LDR.N    R3,??DataTable4_3  ;; 0x4004b000
        B.N      ??GPIO_SetPinOpenDrain_4
??GPIO_SetPinOpenDrain_1:
        LDR.N    R3,??DataTable4_4  ;; 0x4004a000
        B.N      ??GPIO_SetPinOpenDrain_4
??GPIO_SetPinOpenDrain_0:
        LDR.N    R3,??DataTable4_5  ;; 0x40049000
//  101   if(ode == 1)
??GPIO_SetPinOpenDrain_4:
        CMP      R2,#+1
        LDR      R0,[R3, R1, LSL #+2]
        ITE      EQ 
        ORREQ    R0,R0,#0x20
        BICNE    R0,R0,#0x20
//  102   {
//  103     PORT_PCR_REG(port,pin) |= PORT_PCR_ODE_MASK;
//  104   }
//  105   else
//  106   {
//  107     PORT_PCR_REG(port,pin) &= ~PORT_PCR_ODE_MASK;
        B.N      ?Subroutine0
//  108   }
//  109 }
//  110 
//  111 /*******************************************************************************
//  112 * �������ƣ�GPIO_SetPinPassiveFilter
//  113 * ��ڲ�����gpio   GPIO��ָ��
//  114             pin    gpio�ڵ����ź�
//  115             ode    �����ŵĹ��ܺ�
//  116                     0: ��ֹ��ͨ�˲�
//  117                     1��ʹ�ܵ�ͨ�˲���10MHZ~30MHZ�������ź�Ƶ�ʸ���2MHZʱӦ��ֹ�ù���
//  118 * ��    ��������GPIO�е� pin �����ŵ��˲�ģʽ
//  119 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  120 void GPIO_SetPinPassiveFilter(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t pfe)
//  121 {
//  122   PORT_MemMapPtr port;
//  123   
//  124   port = GPIO_GetPortMapPtr(gpio);
GPIO_SetPinPassiveFilter:
        LDR.W    R12,??DataTable4  ;; 0x400ff000
        SUBS     R0,R0,R12
        BEQ.N    ??GPIO_SetPinPassiveFilter_0
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinPassiveFilter_1
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinPassiveFilter_2
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinPassiveFilter_3
        SUBS     R0,R0,#+64
        BNE.N    ??GPIO_SetPinPassiveFilter_4
        LDR.N    R3,??DataTable4_1  ;; 0x4004d000
        B.N      ??GPIO_SetPinPassiveFilter_4
??GPIO_SetPinPassiveFilter_3:
        LDR.N    R3,??DataTable4_2  ;; 0x4004c000
        B.N      ??GPIO_SetPinPassiveFilter_4
??GPIO_SetPinPassiveFilter_2:
        LDR.N    R3,??DataTable4_3  ;; 0x4004b000
        B.N      ??GPIO_SetPinPassiveFilter_4
??GPIO_SetPinPassiveFilter_1:
        LDR.N    R3,??DataTable4_4  ;; 0x4004a000
        B.N      ??GPIO_SetPinPassiveFilter_4
??GPIO_SetPinPassiveFilter_0:
        LDR.N    R3,??DataTable4_5  ;; 0x40049000
//  125   if(pfe == 1)
??GPIO_SetPinPassiveFilter_4:
        CMP      R2,#+1
        LDR      R0,[R3, R1, LSL #+2]
        ITE      EQ 
        ORREQ    R0,R0,#0x10
        BICNE    R0,R0,#0x10
//  126   {
//  127     PORT_PCR_REG(port,pin) |= PORT_PCR_PFE_MASK;
//  128   }
//  129   else
//  130   {
//  131     PORT_PCR_REG(port,pin) &= ~PORT_PCR_PFE_MASK;
        B.N      ?Subroutine0
//  132   }
//  133 }
//  134 
//  135 /*******************************************************************************
//  136 * �������ƣ�GPIO_SetPinPull
//  137 * ��ڲ�����gpio   GPIO��ָ��
//  138             pin    gpio�ڵ����ź�
//  139             pe     �����ŵĹ��ܺ�
//  140                     0: ��ֹ�������������蹦��
//  141                     1��ʹ���������������蹦��
//  142             ps     �����ŵĹ��ܺţ��� pe=1 ʱ��Ч
//  143                     0: ʹ���������蹦��
//  144                     1��ʹ���������蹦��
//  145 * ��    ��������GPIO�е� pin �����ŵ�������������ģʽ
//  146 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  147 void GPIO_SetPinPull(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t pe, int8u_t ps)
//  148 {
GPIO_SetPinPull:
        PUSH     {R4,R5}
//  149   PORT_MemMapPtr port;
//  150   
//  151   port = GPIO_GetPortMapPtr(gpio);
        LDR.N    R5,??DataTable4  ;; 0x400ff000
        SUBS     R0,R0,R5
        BEQ.N    ??GPIO_SetPinPull_0
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinPull_1
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinPull_2
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_SetPinPull_3
        SUBS     R0,R0,#+64
        BNE.N    ??GPIO_SetPinPull_4
        LDR.N    R4,??DataTable4_1  ;; 0x4004d000
        B.N      ??GPIO_SetPinPull_4
??GPIO_SetPinPull_3:
        LDR.N    R4,??DataTable4_2  ;; 0x4004c000
        B.N      ??GPIO_SetPinPull_4
??GPIO_SetPinPull_2:
        LDR.N    R4,??DataTable4_3  ;; 0x4004b000
        B.N      ??GPIO_SetPinPull_4
??GPIO_SetPinPull_1:
        LDR.N    R4,??DataTable4_4  ;; 0x4004a000
        B.N      ??GPIO_SetPinPull_4
??GPIO_SetPinPull_0:
        LDR.N    R4,??DataTable4_5  ;; 0x40049000
//  152   if(pe == 1)
??GPIO_SetPinPull_4:
        CMP      R2,#+1
        LDR      R0,[R4, R1, LSL #+2]
        BNE.N    ??GPIO_SetPinPull_5
//  153   {
//  154     PORT_PCR_REG(port,pin) |= PORT_PCR_PE_MASK;
        ORR      R0,R0,#0x2
        STR      R0,[R4, R1, LSL #+2]
//  155     if(ps == 1)
        CMP      R3,#+1
        LDR      R0,[R4, R1, LSL #+2]
        ITTE     NE 
        LSRNE    R0,R0,#+1
        LSLNE    R0,R0,#+1
        ORREQ    R0,R0,#0x1
//  156     {
//  157       PORT_PCR_REG(port,pin) |= PORT_PCR_PS_MASK;
        B.N      ??GPIO_SetPinPull_6
//  158     }
//  159     else
//  160     {
//  161       PORT_PCR_REG(port,pin) &= ~PORT_PCR_PS_MASK;
//  162     }
//  163   }
//  164   else
//  165   {
//  166     PORT_PCR_REG(port,pin) &= ~PORT_PCR_PE_MASK;
??GPIO_SetPinPull_5:
        BIC      R0,R0,#0x2
??GPIO_SetPinPull_6:
        STR      R0,[R4, R1, LSL #+2]
//  167   }
//  168 }
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x4004c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x4004b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x40049000
//  169 
//  170 /*******************************************************************************
//  171 * �������ƣ�GPIO_SetPortDir
//  172 * ��ڲ�����gpio   GPIO��ָ��
//  173             dir    gpio�ڵ��������ģʽ
//  174 * ��    ��������GPIO�������ģʽ
//  175 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  176 void GPIO_SetPortDir(GPIO_MemMapPtr gpio, int32u_t dir)
//  177 {
//  178   GPIO_PDDR_REG(gpio) = GPIO_PDDR_PDD(dir);
GPIO_SetPortDir:
        STR      R1,[R0, #+20]
//  179 }
        BX       LR               ;; return
//  180   
//  181 /*******************************************************************************
//  182 * �������ƣ�GPIO_SetPinDir
//  183 * ��ڲ�����gpio   GPIO��
//  184             pin    gpio�ڵ����ź�
//  185             dir    gpio�ڵ��������ģʽ
//  186                     0������
//  187                     1�����  
//  188 * ��    ��������GPIO�е� pin λ���������ģʽ
//  189 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  190 void GPIO_SetPinDir(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t dir)
//  191 {
GPIO_SetPinDir:
        MOVS     R3,#+1
        CMP      R2,#+1
        LSL      R1,R3,R1
        LDR      R2,[R0, #+20]
        ITE      EQ 
        ORREQ    R1,R1,R2
        BICNE    R1,R2,R1
//  192   if(dir == 1)                                        // ��������Ϊ�����ʽ
//  193   {
//  194     GPIO_PDDR_REG(gpio) |= 1<<pin;                    // set the GPIO_DDR as output 
//  195   }
//  196   else
//  197   {
//  198     GPIO_PDDR_REG(gpio) &= ~(1<<pin);                 // set the GPIO_DDR as input 
        STR      R1,[R0, #+20]
//  199   }
//  200 }
        BX       LR               ;; return
//  201 
//  202 /*******************************************************************************
//  203 * �������ƣ�GPIO_SetPortStat
//  204 * ��ڲ�����gpio   GPIO��ָ��
//  205             state  gpio�ڵ������ƽ
//  206 * ��    ��������GPIO�������ƽ
//  207 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  208 void GPIO_SetPortStat(GPIO_MemMapPtr gpio, int32u_t state)
//  209 {
//  210   GPIO_PDOR_REG(gpio) = state;
GPIO_SetPortStat:
        STR      R1,[R0, #+0]
//  211 }
        BX       LR               ;; return
//  212 
//  213 /*******************************************************************************
//  214 * �������ƣ�GPIO_SetPinStat
//  215 * ��ڲ�����gpio   GPIO��ָ��
//  216             pin    gpio�ڵ����ź�
//  217             state  gpio�ڵ������ƽ
//  218 * ��    ��������GPIO�е� pin λ�ĵ�ƽ
//  219 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  220 void GPIO_SetPinStat(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t state)
//  221 {
GPIO_SetPinStat:
        MOVS     R3,#+1
        CMP      R2,#+1
        LSL      R1,R3,R1
        LDR      R2,[R0, #+0]
        ITE      EQ 
        ORREQ    R1,R1,R2
        BICNE    R1,R2,R1
//  222   if(state==1)
//  223   {
//  224     GPIO_PDOR_REG(gpio) |= 1<<pin;                     // set 1 to corresponding pin
//  225   }    
//  226   else 
//  227   {
//  228     GPIO_PDOR_REG(gpio) &= ~(1<<pin);                  // set 0 to corresponding pin
        STR      R1,[R0, #+0]
//  229   }
//  230 }
        BX       LR               ;; return
//  231 
//  232 /*******************************************************************************
//  233 * �������ƣ�GPIO_ReadPortStat
//  234 * ��ڲ�����gpio   GPIO��ָ��
//  235             state  gpio�ڵĵ�ƽ
//  236 * ��    ������ȡ gpio �ڵ�״̬
//  237 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  238 void GPIO_ReadPortStat(GPIO_MemMapPtr gpio, int32u_t * state)
//  239 {
//  240   *state = GPIO_PDIR_REG(gpio);            
GPIO_ReadPortStat:
        LDR      R0,[R0, #+16]
        STR      R0,[R1, #+0]
//  241 }
        BX       LR               ;; return
//  242 
//  243 /*******************************************************************************
//  244 * �������ƣ�GPIO_TogglePinStat
//  245 * ��ڲ�����gpio   GPIO��ָ��
//  246             pin    gpio�ڵ����ź�
//  247 * ��    ������תGPIO�е� pin λ�ĵ�ƽ
//  248 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  249 void GPIO_TogglePinStat(GPIO_MemMapPtr gpio, int8u_t pin)
//  250 {
//  251   GPIO_PTOR_REG(gpio) ^= 1<<pin;                       // toggle the corresponding pin's state
GPIO_TogglePinStat:
        LDR      R2,[R0, #+12]
        MOVS     R3,#+1
        LSL      R1,R3,R1
        EORS     R1,R1,R2
        STR      R1,[R0, #+12]
//  252 }
        BX       LR               ;; return
//  253 
//  254 /*******************************************************************************
//  255 * �������ƣ�GPIO_GetPortMapPtr
//  256 * ��ڲ�����gpio   GPIO��ָ��
//  257 * ���ز�����p      gpio�ڼĴ���ָ��
//  258 * ��    ����ͨ�� GPIO_MemMapPtr ָ����� PORT_MemMapPtr ָ��
//  259 *******************************************************************************/
//  260 static PORT_MemMapPtr GPIO_GetPortMapPtr(GPIO_MemMapPtr gpio)
//  261 {
//  262   PORT_MemMapPtr p;
//  263   switch((int32u_t)gpio)
//  264   {
//  265     case 0x400FF000u:
//  266                       p = PORTA_BASE_PTR;
//  267                       break;
//  268     case 0x400FF040u:
//  269                       p = PORTB_BASE_PTR;
//  270                       break;
//  271     case 0x400FF080u:
//  272                       p = PORTC_BASE_PTR;
//  273                       break;
//  274     case 0x400FF0C0u:
//  275                       p = PORTD_BASE_PTR;
//  276                       break;
//  277     case 0x400FF100u: 
//  278                       p = PORTE_BASE_PTR;
//  279                       break;
//  280     default:
//  281             break;
//  282             
//  283   }
//  284   return p;
//  285 }
//  286 
//  287 //===========================================================================
//  288 //�������ƣ�GPIO_get
//  289 //�������أ�ָ������״̬��0=�͵�ƽ��1=�ߵ�ƽ��
//  290 //����˵����port���˿ںš��ɺ궨�塣
//  291 //          pin�����źš�0��31��
//  292 //���ܸ�Ҫ����ȡָ������״̬��
//  293 //===========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  294 int8u_t GPIO_get(GPIO_MemMapPtr gpio, int8u_t pin)
//  295 {
//  296         //PORT_MemMapPtr port;
//  297 	int8u_t i; 
//  298 	//��GPIO�˿ں�ת���ɶ˿ڼĴ�����ָ��
//  299 	//GPIO_MemMapPtr pt = gpio_get_pt_addr(port);
//  300 	//�鿴����״̬
//  301 	i = BGET(pin, GPIO_PDIR_REG(gpio));
GPIO_get:
        LDR      R0,[R0, #+16]
//  302 	return i;     //��������״̬��0��1��
        LSRS     R0,R0,R1
        AND      R0,R0,#0x1
        BX       LR               ;; return
//  303 }

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
// 492 bytes in section .text
// 
// 492 bytes of CODE memory
//
//Errors: none
//Warnings: none
