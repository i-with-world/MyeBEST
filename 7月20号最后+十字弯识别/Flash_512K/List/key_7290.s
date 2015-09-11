///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      22/Jul/2015  10:59:25 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\ZLG7290\ke /
//                    y_7290.c                                                /
//    Command line =  C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\ZLG7290\ke /
//                    y_7290.c -D IAR -lCN C:\Users\dong\Desktop\7��20�����+ /
//                    ʮ����ʶ��\Flash_512K\List\ -lB                         /
//                    C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Flash_512K /
//                    \List\ -o C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\ /
//                    Flash_512K\Obj\ --no_cse --no_unroll --no_inline        /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --char_is_signed --fpu=None          /
//                    --dlib_config "C:\Program Files\IAR Systems\Embedded    /
//                    Workbench 6.0 Evaluation\arm\INC\c\DLib_Config_Normal.h /
//                    " -I C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Libra /
//                    ry\CPU\ -I C:\Users\dong\Desktop\7��20�����+ʮ����ʶ�� /
//                    \Library\Drivers\ADC\ -I C:\Users\dong\Desktop\7��20��� /
//                    ��+ʮ����ʶ��\Library\Drivers\FTM\ -I                  /
//                    C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Library\Dr /
//                    ivers\GPIO\ -I C:\Users\dong\Desktop\7��20�����+ʮ���� /
//                    ʶ��\Library\Drivers\PIT\ -I                            /
//                    C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Library\Dr /
//                    ivers\I2C\ -I C:\Users\dong\Desktop\7��20�����+ʮ����� /
//                    ���\Library\Drivers\UART\ -I                            /
//                    C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Library\Dr /
//                    ivers\FTFL\ -I C:\Users\dong\Desktop\7��20�����+ʮ���� /
//                    ʶ��\MyFunction\ -I C:\Users\dong\Desktop\7��20�����+� /
//                    �����ʶ��\SD_System\ -I C:\Users\dong\Desktop\7��20���� /
//                    ��+ʮ����ʶ��\Delay\ -I C:\Users\dong\Desktop\7��20���� /
//                    ��+ʮ����ʶ��\System_Init\ -I                           /
//                    C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\OLED\ -I   /
//                    C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\ZLG7290\   /
//                    -I C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Simple_ /
//                    AD\ -I C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Mak /
//                    e_Desicion\ -I C:\Users\dong\Desktop\7��20�����+ʮ���� /
//                    ʶ��\Make_Desicion\Judge_Way\ -I                        /
//                    C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Make_Desic /
//                    ion\Speed_Control\ -I C:\Users\dong\Desktop\7��20����� /
//                    +ʮ����ʶ��\Source\ -I C:\Users\dong\Desktop\7��20���� /
//                    �+ʮ����ʶ��\Peripheral_Oparation\ -I                   /
//                    C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Balance_co /
//                    ntrol\ -Ol                                              /
//    List file    =  C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Flash_512K /
//                    \List\key_7290.s                                        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME key_7290

        #define SHT_PROGBITS 0x1

        PUBLIC ClearOne_7290
        PUBLIC DisplayOne_7290
        PUBLIC DisplayValue_7290
        PUBLIC GetKeyValue
        PUBLIC Init_7290
        PUBLIC Readkey_7290

// C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\ZLG7290\key_7290.c
//    1 /******************************************************************************
//    2 
//    3 * key_7290.c
//    4 
//    5 * Zlg7290�ײ�����Դ�ļ�. ֧�ְ�����ֵ��ȡ, �����������ʾ/���, ������ֵ��ʾ,
//    6 * �Լ������趨����.
//    7 
//    8 * ����     : ���Ľ� @ SDU  
//    9 * �汾     : Ver 1.01
//   10 * ����ʱ�� : 2013 - 04 - 19
//   11 
//   12 ******************************************************************************/
//   13 
//   14 #include "key_7290.h"
//   15 
//   16 /******************************************************************************
//   17 *                                 �ڲ���������
//   18 ******************************************************************************/
//   19 /* ����-�������ʾ�� */

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   20 static const unsigned char DigTab_7290[10]=
DigTab_7290:
        DATA
        DC8 252, 96, 218, 242, 102, 182, 190, 224, 254, 246, 0, 0
//   21 {                     
//   22     0xFC, 0x60, 0xDA, 0xF2, 0x66, 0xB6, 0xBE, 0xE0, 0xFE, 0xF6
//   23 };
//   24 
//   25 
//   26 /******************************************************************************
//   27 * ��������: LongDelay_7290
//   28 * ��������: 7290��ʱ����ʱ����.
//   29 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   30 static void LongDelay_7290(void)
//   31 {
LongDelay_7290:
        SUB      SP,SP,#+8
//   32     volatile unsigned int i, j;
//   33     
//   34     for(j = 120; j > 0; j--)
        MOVS     R0,#+120
        STR      R0,[SP, #+0]
        B.N      ??LongDelay_7290_0
//   35     {
//   36         for(i = LONG_DELAY_TIME_7290; i > 0; i--);
??LongDelay_7290_1:
        LDR      R0,[SP, #+4]
        SUBS     R0,R0,#+1
        STR      R0,[SP, #+4]
??LongDelay_7290_2:
        LDR      R0,[SP, #+4]
        CMP      R0,#+0
        BNE.N    ??LongDelay_7290_1
        LDR      R0,[SP, #+0]
        SUBS     R0,R0,#+1
        STR      R0,[SP, #+0]
??LongDelay_7290_0:
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??LongDelay_7290_3
        MOV      R0,#+900
        STR      R0,[SP, #+4]
        B.N      ??LongDelay_7290_2
//   37     }
//   38 }
??LongDelay_7290_3:
        ADD      SP,SP,#+8
        BX       LR               ;; return
//   39 /******************************************************************************
//   40 * ��������: ShortDelay_7290
//   41 * ��������: 7290��ʱ����ʱ����.
//   42 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   43 static void ShortDelay_7290(void)
//   44 { 
ShortDelay_7290:
        SUB      SP,SP,#+8
//   45     volatile int Num = SHORT_DELAY_TIME_7290;
        MOVS     R0,#+90
        STR      R0,[SP, #+4]
//   46     volatile int i;
//   47   
//   48     while(Num--)
??ShortDelay_7290_0:
        LDR      R0,[SP, #+4]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+4]
        CMP      R0,#+0
        BEQ.N    ??ShortDelay_7290_1
//   49     {
//   50         for(i = 0; i < 2; i++);
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
??ShortDelay_7290_2:
        LDR      R0,[SP, #+0]
        CMP      R0,#+2
        BGE.N    ??ShortDelay_7290_0
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
        B.N      ??ShortDelay_7290_2
//   51     }
//   52 }
??ShortDelay_7290_1:
        ADD      SP,SP,#+8
        BX       LR               ;; return
//   53 
//   54 /******************************************************************************
//   55 * ��������: StartI2C_7290
//   56 * ��������: I2C�����ź�.
//   57 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   58 static void StartI2C_7290(void)
//   59 {
StartI2C_7290:
        PUSH     {R7,LR}
//   60     SET_SCL_OUT_7290();
        LDR.W    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//   61     SET_SDA_OUT_7290();
        LDR.W    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//   62     
//   63     SET_SDA_HIGH_7290();  
        LDR.W    R0,??DataTable6_1  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable6_1  ;; 0x400ff104
        STR      R0,[R1, #+0]
//   64     ShortDelay_7290();
        BL       ShortDelay_7290
//   65   
//   66     SET_SCL_HIGH_7290();
        LDR.W    R0,??DataTable6_1  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable6_1  ;; 0x400ff104
        STR      R0,[R1, #+0]
//   67     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   68     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   69   
//   70     SET_SDA_LOW_7290();
        LDR.W    R0,??DataTable6_2  ;; 0x400ff108
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable6_2  ;; 0x400ff108
        STR      R0,[R1, #+0]
//   71     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   72     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   73 }
        POP      {R0,PC}          ;; return
//   74 /******************************************************************************
//   75 * ��������: StopI2C_7290
//   76 * ��������: I2C�����ź�.
//   77 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   78 static void StopI2C_7290(void)
//   79 {
StopI2C_7290:
        PUSH     {R7,LR}
//   80     SET_SCL_OUT_7290();
        LDR.W    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//   81     SET_SDA_OUT_7290();
        LDR.W    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//   82     
//   83     SET_SDA_LOW_7290();
        LDR.W    R0,??DataTable6_2  ;; 0x400ff108
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable6_2  ;; 0x400ff108
        STR      R0,[R1, #+0]
//   84     ShortDelay_7290();
        BL       ShortDelay_7290
//   85   
//   86     SET_SCL_HIGH_7290();
        LDR.W    R0,??DataTable6_1  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable6_1  ;; 0x400ff104
        STR      R0,[R1, #+0]
//   87     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   88     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   89   
//   90     SET_SDA_HIGH_7290();
        LDR.W    R0,??DataTable6_1  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable6_1  ;; 0x400ff104
        STR      R0,[R1, #+0]
//   91     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   92     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//   93 }
        POP      {R0,PC}          ;; return
//   94 
//   95 /******************************************************************************
//   96 * ��������: WackI2C_7290
//   97 * ��������: ����I2CӦ���ź�.
//   98 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   99 static void WackI2C_7290(void)
//  100 { 
WackI2C_7290:
        PUSH     {R7,LR}
//  101     SET_SCL_OUT_7290();
        LDR.W    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//  102     SET_SDA_OUT_7290();
        LDR.W    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//  103     SET_SDA_HIGH_7290();
        LDR.W    R0,??DataTable6_1  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable6_1  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  104     ShortDelay_7290();
        BL       ShortDelay_7290
//  105   
//  106     SET_SCL_LOW_7290();
        LDR.W    R0,??DataTable6_2  ;; 0x400ff108
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable6_2  ;; 0x400ff108
        STR      R0,[R1, #+0]
//  107     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  108     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  109   
//  110     SET_SCL_HIGH_7290();
        LDR.N    R0,??DataTable6_1  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable6_1  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  111     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  112     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  113   
//  114     SET_SCL_LOW_7290();
        LDR.N    R0,??DataTable6_2  ;; 0x400ff108
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable6_2  ;; 0x400ff108
        STR      R0,[R1, #+0]
//  115     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  116     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  117 }
        POP      {R0,PC}          ;; return
//  118 
//  119 /******************************************************************************
//  120 * ��������: WriteByteI2C_7290
//  121 * ��������: ͨ��I2C����һ�ֽ�����.
//  122 * ��ڲ���: dat  ����������
//  123 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  124 static void WriteByteI2C_7290(unsigned char dat)
//  125 {
WriteByteI2C_7290:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  126     unsigned char i = 8, temp;
        MOVS     R5,#+8
//  127     
//  128     SET_SCL_OUT_7290();
        LDR.N    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//  129     SET_SDA_OUT_7290();
        LDR.N    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//  130     
//  131     SET_SCL_LOW_7290();
        LDR.N    R0,??DataTable6_2  ;; 0x400ff108
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable6_2  ;; 0x400ff108
        STR      R0,[R1, #+0]
//  132     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  133     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
        B.N      ??WriteByteI2C_7290_0
//  134 
//  135     while(i--)
//  136     {     
//  137       temp = dat & 0x80;
//  138       if(temp == 0)
//  139       {
//  140           SET_SDA_LOW_7290();
//  141       }
//  142       else
//  143       {
//  144           SET_SDA_HIGH_7290();
??WriteByteI2C_7290_1:
        LDR.N    R0,??DataTable6_1  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable6_1  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  145       }
//  146       ShortDelay_7290();ShortDelay_7290();
??WriteByteI2C_7290_2:
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  147       ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  148 
//  149       dat <<= 1;
        LSLS     R4,R4,#+1
//  150 
//  151       SET_SCL_HIGH_7290();
        LDR.N    R0,??DataTable6_1  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable6_1  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  152       ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  153       ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  154 
//  155       SET_SCL_LOW_7290();
        LDR.N    R0,??DataTable6_2  ;; 0x400ff108
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable6_2  ;; 0x400ff108
        STR      R0,[R1, #+0]
//  156       ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  157       ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
??WriteByteI2C_7290_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??WriteByteI2C_7290_3
        ANDS     R0,R4,#0x80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??WriteByteI2C_7290_1
        LDR.N    R0,??DataTable6_2  ;; 0x400ff108
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable6_2  ;; 0x400ff108
        STR      R0,[R1, #+0]
        B.N      ??WriteByteI2C_7290_2
//  158     }
//  159 
//  160     ShortDelay_7290();ShortDelay_7290();
??WriteByteI2C_7290_3:
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  161     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  162     ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  163 }
        POP      {R0,R4,R5,PC}    ;; return
//  164 /******************************************************************************
//  165 * ��������: ReadByteI2C_7290
//  166 * ��������: ͨ��I2C��ȡһ�ֽ�����.
//  167 * ���ز���: ��ȡ���
//  168 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  169 static unsigned char ReadByteI2C_7290(void)
//  170 {
ReadByteI2C_7290:
        PUSH     {R3-R5,LR}
//  171     unsigned char dat = 0x00;
        MOVS     R4,#+0
//  172     unsigned char i   = 8;
        MOVS     R5,#+8
        B.N      ??ReadByteI2C_7290_0
//  173     
//  174     while(i--)
//  175     { 
//  176         SET_SCL_OUT_7290();
??ReadByteI2C_7290_1:
        LDR.N    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//  177         SET_SDA_OUT_7290();
        LDR.N    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//  178         
//  179         SET_SDA_HIGH_7290();
        LDR.N    R0,??DataTable6_1  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable6_1  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  180         ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  181         ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  182         
//  183         SET_SCL_OUT_7290();
        LDR.N    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//  184         SET_SDA_IN_7290();  /* SDA�ķ���ı�:SCL�����SDA���� */
        LDR.N    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x8
        LDR.N    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//  185         
//  186         dat <<= 1;
        LSLS     R4,R4,#+1
//  187         SET_SCL_LOW_7290();
        LDR.N    R0,??DataTable6_2  ;; 0x400ff108
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable6_2  ;; 0x400ff108
        STR      R0,[R1, #+0]
//  188         ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  189         ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  190 
//  191         SET_SCL_HIGH_7290();
        LDR.N    R0,??DataTable6_1  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable6_1  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  192         ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  193         ShortDelay_7290();ShortDelay_7290();
        BL       ShortDelay_7290
        BL       ShortDelay_7290
//  194 
//  195         if(READ_SDA_7290() != 0)
        LDR.N    R0,??DataTable6_3  ;; 0x400ff110
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL.N    ??ReadByteI2C_7290_0
//  196         {
//  197             dat |= 0x01;
        ORRS     R4,R4,#0x1
//  198         }
//  199     }
??ReadByteI2C_7290_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??ReadByteI2C_7290_1
//  200 
//  201     SET_SCL_OUT_7290();
        LDR.N    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//  202     SET_SDA_OUT_7290();
        LDR.N    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//  203     SET_SCL_LOW_7290();
        LDR.N    R0,??DataTable6_2  ;; 0x400ff108
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable6_2  ;; 0x400ff108
        STR      R0,[R1, #+0]
//  204     SET_SDA_HIGH_7290();
        LDR.N    R0,??DataTable6_1  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable6_1  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  205     
//  206     return dat;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//  207 }
//  208 
//  209 /******************************************************************************
//  210 * ��������: Init_7290
//  211 * ��������: ��ʼ��7290
//  212 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  213 void Init_7290(void)
//  214 {
Init_7290:
        PUSH     {R7,LR}
//  215   INIT_SCL_7290();
        LDR.N    R0,??DataTable6_4  ;; 0x4004d008
        MOVW     R1,#+259
        STR      R1,[R0, #+0]
//  216   INIT_SDA_7290();
        LDR.N    R0,??DataTable6_5  ;; 0x4004d00c
        MOVW     R1,#+259
        STR      R1,[R0, #+0]
//  217   INIT_INT_7290();
        LDR.N    R0,??DataTable6_6  ;; 0x4004d000
        MOVW     R1,#+259
        STR      R1,[R0, #+0]
//  218   SET_INT_IN_7290();
        LDR.N    R0,??DataTable6  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable6  ;; 0x400ff114
        STR      R0,[R1, #+0]
//  219   
//  220   StartI2C_7290();              
        BL       StartI2C_7290
//  221   WriteByteI2C_7290(SLVADDR_7290);
        MOVS     R0,#+112
        BL       WriteByteI2C_7290
//  222   WackI2C_7290();
        BL       WackI2C_7290
//  223 
//  224   WriteByteI2C_7290(0x0D);
        MOVS     R0,#+13
        BL       WriteByteI2C_7290
//  225   WackI2C_7290();
        BL       WackI2C_7290
//  226 
//  227   WriteByteI2C_7290(0x03);
        MOVS     R0,#+3
        BL       WriteByteI2C_7290
//  228   WackI2C_7290();
        BL       WackI2C_7290
//  229 
//  230   StopI2C_7290();
        BL       StopI2C_7290
//  231   LongDelay_7290();
        BL       LongDelay_7290
//  232 }
        POP      {R0,PC}          ;; return
//  233 
//  234 /******************************************************************************
//  235 * ��������: DisplayOne_7290
//  236 * ��������: ʹĳһλ�������ʾ�ַ�
//  237 * ��ڲ���: pos ��ʾҪ��ʾ��һλ�����(�����Ϊ��0λ)
//  238 *           c   Ҫ��ʾ���ַ�(ASCII��)
//  239 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  240 void DisplayOne_7290(unsigned char pos,unsigned char c)
//  241 {
DisplayOne_7290:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  242     unsigned char dis; 
//  243   
//  244     dis = 0xFF;    /* �ַ�����(�ǿ���ʾ�ַ�)ʱ,�������ж���ʾ���� */
        MOVS     R5,#+255
//  245   
//  246     if(c >= '0' && c <= '9')  dis = DigTab_7290[c-'0']; 
        SUBS     R0,R1,#+48
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+10
        BCS.N    ??DisplayOne_7290_0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable6_7
        ADDS     R0,R1,R0
        LDRB     R5,[R0, #-48]
        B.N      ??DisplayOne_7290_1
//  247     else if(c == '-')         dis = _DISP_7290__;
??DisplayOne_7290_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+45
        BNE.N    ??DisplayOne_7290_2
        MOVS     R5,#+2
        B.N      ??DisplayOne_7290_1
//  248     else if(c == 'A')         dis = _DISP_7290_A;
??DisplayOne_7290_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+65
        BNE.N    ??DisplayOne_7290_3
        MOVS     R5,#+238
        B.N      ??DisplayOne_7290_1
//  249     else if(c == 'b')         dis = _DISP_7290_b;
??DisplayOne_7290_3:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+98
        BNE.N    ??DisplayOne_7290_4
        MOVS     R5,#+62
        B.N      ??DisplayOne_7290_1
//  250     else if(c == 'C')         dis = _DISP_7290_C;
??DisplayOne_7290_4:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+67
        BNE.N    ??DisplayOne_7290_5
        MOVS     R5,#+156
        B.N      ??DisplayOne_7290_1
//  251     else if(c == 'c')         dis = _DISP_7290_c;
??DisplayOne_7290_5:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+99
        BNE.N    ??DisplayOne_7290_6
        MOVS     R5,#+26
        B.N      ??DisplayOne_7290_1
//  252     else if(c == 'd')         dis = _DISP_7290_d;
??DisplayOne_7290_6:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+100
        BNE.N    ??DisplayOne_7290_7
        MOVS     R5,#+122
        B.N      ??DisplayOne_7290_1
//  253     else if(c == 'E')         dis = _DISP_7290_E;            
??DisplayOne_7290_7:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+69
        BNE.N    ??DisplayOne_7290_8
        MOVS     R5,#+158
        B.N      ??DisplayOne_7290_1
//  254     else if(c == 'F')         dis = _DISP_7290_F;
??DisplayOne_7290_8:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+70
        BNE.N    ??DisplayOne_7290_9
        MOVS     R5,#+142
        B.N      ??DisplayOne_7290_1
//  255     else if(c == 'G')         dis = _DISP_7290_G;
??DisplayOne_7290_9:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+71
        BNE.N    ??DisplayOne_7290_10
        MOVS     R5,#+188
        B.N      ??DisplayOne_7290_1
//  256     else if(c == 'H')         dis = _DISP_7290_H;
??DisplayOne_7290_10:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+72
        BNE.N    ??DisplayOne_7290_11
        MOVS     R5,#+110
        B.N      ??DisplayOne_7290_1
//  257     else if(c == 'J')         dis = _DISP_7290_J;
??DisplayOne_7290_11:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+74
        BNE.N    ??DisplayOne_7290_12
        MOVS     R5,#+112
        B.N      ??DisplayOne_7290_1
//  258     else if(c == 'L')         dis = _DISP_7290_L;
??DisplayOne_7290_12:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+76
        BNE.N    ??DisplayOne_7290_13
        MOVS     R5,#+28
        B.N      ??DisplayOne_7290_1
//  259     else if(c == 'n')         dis = _DISP_7290_n;
??DisplayOne_7290_13:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+110
        BNE.N    ??DisplayOne_7290_14
        MOVS     R5,#+42
        B.N      ??DisplayOne_7290_1
//  260     else if(c == 'o')         dis = _DISP_7290_o;
??DisplayOne_7290_14:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+111
        BNE.N    ??DisplayOne_7290_15
        MOVS     R5,#+58
        B.N      ??DisplayOne_7290_1
//  261     else if(c == 'p')         dis = _DISP_7290_p;
??DisplayOne_7290_15:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+112
        BNE.N    ??DisplayOne_7290_16
        MOVS     R5,#+206
        B.N      ??DisplayOne_7290_1
//  262     else if(c == 'q')         dis = _DISP_7290_q;
??DisplayOne_7290_16:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+113
        BNE.N    ??DisplayOne_7290_1
        MOVS     R5,#+230
//  263   
//  264     StartI2C_7290();
??DisplayOne_7290_1:
        BL       StartI2C_7290
//  265     WriteByteI2C_7290(SLVADDR_7290);
        MOVS     R0,#+112
        BL       WriteByteI2C_7290
//  266     WackI2C_7290();
        BL       WackI2C_7290
//  267 
//  268     WriteByteI2C_7290(SUB_DP_RAM_7290 + pos);
        ADDS     R0,R4,#+16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       WriteByteI2C_7290
//  269     WackI2C_7290();
        BL       WackI2C_7290
//  270 
//  271     WriteByteI2C_7290(dis);
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       WriteByteI2C_7290
//  272     WackI2C_7290();
        BL       WackI2C_7290
//  273 
//  274     StopI2C_7290();
        BL       StopI2C_7290
//  275     LongDelay_7290();
        BL       LongDelay_7290
//  276 }
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x400ff114

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x400ff104

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x400ff108

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0x400ff110

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x4004d008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x4004d00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     DigTab_7290
//  277 /******************************************************************************
//  278 * ��������: DisplayValue_7290
//  279 * ��������: ��ʾһ������(���е�0λ,������ߵ�һλ��ʾ��������,�޶�Ϊһ��ASCII
//  280 *           �ַ�;��3λΪ��ֵ,��Χ-99~999).
//  281 * ��ڲ���: name  ��������(һ��ASCII�ַ�)
//  282 *           value ������ֵ(-99~999)
//  283 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  284 void DisplayValue_7290(unsigned char name,int value)
//  285 {
DisplayValue_7290:
        PUSH     {R4,LR}
        MOVS     R4,R1
//  286     int uvalue;
//  287   
//  288     DisplayOne_7290(0, name);
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       DisplayOne_7290
//  289     if(value < 0)
        CMP      R4,#+0
        BPL.N    ??DisplayValue_7290_0
//  290     {   /* ��ʾ���� */
//  291         uvalue = -value;
        RSBS     R4,R4,#+0
//  292         DisplayOne_7290(1, '-');
        MOVS     R1,#+45
        MOVS     R0,#+1
        BL       DisplayOne_7290
//  293         DisplayOne_7290(2, '0'+uvalue/10);
        MOVS     R0,#+10
        SDIV     R0,R4,R0
        ADDS     R1,R0,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+2
        BL       DisplayOne_7290
//  294         DisplayOne_7290(3, '0'+uvalue%10);
        MOVS     R0,#+10
        SDIV     R1,R4,R0
        MLS      R0,R0,R1,R4
        ADDS     R1,R0,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+3
        BL       DisplayOne_7290
        B.N      ??DisplayValue_7290_1
//  295     }
//  296     else
//  297     {   /* ��ʾ���� */
//  298         DisplayOne_7290(1, '0'+value/100);
??DisplayValue_7290_0:
        MOVS     R0,#+100
        SDIV     R0,R4,R0
        ADDS     R1,R0,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+1
        BL       DisplayOne_7290
//  299         DisplayOne_7290(2, '0'+(value/10)%10);
        MOVS     R0,#+10
        SDIV     R0,R4,R0
        MOVS     R1,#+10
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R1,R0,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+2
        BL       DisplayOne_7290
//  300         DisplayOne_7290(3, '0'+value%10);
        MOVS     R0,#+10
        SDIV     R1,R4,R0
        MLS      R0,R0,R1,R4
        ADDS     R1,R0,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+3
        BL       DisplayOne_7290
//  301     }
//  302 }
??DisplayValue_7290_1:
        POP      {R4,PC}          ;; return
//  303 /******************************************************************************
//  304 * ��������: ClearOne_7290
//  305 * ��������: ���ĳһλ����ܵ���ʾ.
//  306 * ��ڲ���: pos ��ʾҪ�����һλ�����(�����Ϊ��0λ)
//  307 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  308 void ClearOne_7290(unsigned char pos) 
//  309 {
ClearOne_7290:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  310     StartI2C_7290();
        BL       StartI2C_7290
//  311     WriteByteI2C_7290(SLVADDR_7290);
        MOVS     R0,#+112
        BL       WriteByteI2C_7290
//  312     WackI2C_7290();
        BL       WackI2C_7290
//  313 
//  314     WriteByteI2C_7290(SUB_DP_RAM_7290 + pos);
        ADDS     R0,R4,#+16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       WriteByteI2C_7290
//  315     WackI2C_7290();
        BL       WackI2C_7290
//  316 
//  317     WriteByteI2C_7290(0);
        MOVS     R0,#+0
        BL       WriteByteI2C_7290
//  318     WackI2C_7290();
        BL       WackI2C_7290
//  319 
//  320     StopI2C_7290();
        BL       StopI2C_7290
//  321     LongDelay_7290();
        BL       LongDelay_7290
//  322 }
        POP      {R4,PC}          ;; return
//  323 /*!
//  324 **Name: KeyConvert
//  325 **Description: ��ֵת��
//  326 **Notes: 
//  327 !
//  328 unsigned char KeyConvert(unsigned char kkey)
//  329 {
//  330   unsigned char keyvalue;
//  331     
//  332   switch ( kkey )
//  333   {
//  334     case  17 :
//  335       keyvalue = 1;
//  336       break;
//  337     case  25 :
//  338       keyvalue = 2;
//  339       break;      
//  340     case  9  :
//  341       keyvalue = 3;
//  342       break;
//  343     case  18 :
//  344       keyvalue = 4;
//  345       break; 
//  346     case  26 :
//  347       keyvalue = 5;
//  348       break;
//  349     case  10 :
//  350       keyvalue = 6;
//  351       break;      
//  352     case  19 :
//  353       keyvalue = 7;
//  354       break;
//  355     case  27 :
//  356       keyvalue = 8;
//  357       break;  
//  358     case  11 :
//  359       keyvalue = 9;
//  360       break;
//  361     case  20 :
//  362       keyvalue = 10;      //N
//  363       break;      
//  364     case  28 :
//  365       keyvalue = 0;
//  366       break;
//  367     case  12 :
//  368       keyvalue = 11;      //Y
//  369       break;   
//  370   default:
//  371     break;
//  372   }
//  373   
//  374   return keyvalue;
//  375 }
//  376 */
//  377 /******************************************************************************
//  378 * ��������: Readkey_7290
//  379 * ��������: ��ȡ����ֵ.
//  380 * ���ز���: ������ֵ
//  381 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  382 unsigned char Readkey_7290(void)
//  383 {
Readkey_7290:
        PUSH     {R4,LR}
//  384     unsigned char key;
//  385 
//  386     StartI2C_7290();
        BL       StartI2C_7290
//  387     WriteByteI2C_7290(SLVADDR_7290);    /* д�ӻ���ַ       */
        MOVS     R0,#+112
        BL       WriteByteI2C_7290
//  388     WackI2C_7290();
        BL       WackI2C_7290
//  389 
//  390     WriteByteI2C_7290(SUB_KEY_7290);    /* д��ȡ��������ַ */
        MOVS     R0,#+1
        BL       WriteByteI2C_7290
//  391     WackI2C_7290();
        BL       WackI2C_7290
//  392 
//  393     StartI2C_7290();
        BL       StartI2C_7290
//  394     WriteByteI2C_7290(SLVADDR_7290+0x01);
        MOVS     R0,#+113
        BL       WriteByteI2C_7290
//  395     WackI2C_7290();
        BL       WackI2C_7290
//  396 
//  397     key = ReadByteI2C_7290();
        BL       ReadByteI2C_7290
        MOVS     R4,R0
//  398 
//  399     StopI2C_7290();
        BL       StopI2C_7290
//  400     LongDelay_7290();
        BL       LongDelay_7290
//  401 
//  402     return key;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
//  403 }
//  404 
//  405 /*!
//  406 **Name: KeyConvert
//  407 **Description: ��ֵת��
//  408 **Notes: 
//  409 !*/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  410 unsigned char GetKeyValue(void)
//  411 {
GetKeyValue:
        PUSH     {R7,LR}
//  412   unsigned char key;
//  413   key = Readkey_7290();
        BL       Readkey_7290
//  414   switch(key)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??GetKeyValue_0
        CMP      R0,#+2
        BEQ.N    ??GetKeyValue_1
        CMP      R0,#+3
        BEQ.N    ??GetKeyValue_2
        CMP      R0,#+4
        BEQ.N    ??GetKeyValue_3
        CMP      R0,#+9
        BEQ.N    ??GetKeyValue_4
        CMP      R0,#+10
        BEQ.N    ??GetKeyValue_5
        CMP      R0,#+11
        BEQ.N    ??GetKeyValue_6
        CMP      R0,#+12
        BEQ.N    ??GetKeyValue_7
        CMP      R0,#+17
        BEQ.N    ??GetKeyValue_8
        CMP      R0,#+18
        BEQ.N    ??GetKeyValue_9
        CMP      R0,#+19
        BEQ.N    ??GetKeyValue_10
        CMP      R0,#+20
        BEQ.N    ??GetKeyValue_11
        B.N      ??GetKeyValue_12
//  415   {
//  416   case 0x11:
//  417     return 1;
??GetKeyValue_8:
        MOVS     R0,#+1
        B.N      ??GetKeyValue_13
//  418   case 0x09:
//  419     return 2;
??GetKeyValue_4:
        MOVS     R0,#+2
        B.N      ??GetKeyValue_13
//  420   case 0x01:
//  421     return 3;
??GetKeyValue_0:
        MOVS     R0,#+3
        B.N      ??GetKeyValue_13
//  422   case 0x12:
//  423     return 4;
??GetKeyValue_9:
        MOVS     R0,#+4
        B.N      ??GetKeyValue_13
//  424   case 0x0A:
//  425     return 5;
??GetKeyValue_5:
        MOVS     R0,#+5
        B.N      ??GetKeyValue_13
//  426   case 0x02:
//  427     return 6;
??GetKeyValue_1:
        MOVS     R0,#+6
        B.N      ??GetKeyValue_13
//  428   case 0x13:
//  429     return 7;
??GetKeyValue_10:
        MOVS     R0,#+7
        B.N      ??GetKeyValue_13
//  430   case 0x0B:
//  431     return 8;
??GetKeyValue_6:
        MOVS     R0,#+8
        B.N      ??GetKeyValue_13
//  432   case 0x03:
//  433     return 9;
??GetKeyValue_2:
        MOVS     R0,#+9
        B.N      ??GetKeyValue_13
//  434   case 0x0C:
//  435     return 0;
??GetKeyValue_7:
        MOVS     R0,#+0
        B.N      ??GetKeyValue_13
//  436   case 0x14:
//  437     return 'N';
??GetKeyValue_11:
        MOVS     R0,#+78
        B.N      ??GetKeyValue_13
//  438   case 0x04:
//  439     return 'Y';
??GetKeyValue_3:
        MOVS     R0,#+89
        B.N      ??GetKeyValue_13
//  440   default:
//  441     return 'E';   //��ʾerror
??GetKeyValue_12:
        MOVS     R0,#+69
??GetKeyValue_13:
        POP      {R1,PC}          ;; return
//  442   }
//  443 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  444 /******************************************************************************
//  445 * ��������: SetParam_7290
//  446 * ��������: ����7290���в����趨.
//  447 * ��ڲ���: name   ��������(һ��ASCII�ַ�)
//  448 *           value  �����ĳ�ʼֵ(0~9999)
//  449 * ���ز���: �趨���(0-9999)
//  450 ******************************************************************************
//  451 void SetParam_7290( unsigned char name[], 
//  452                     unsigned int  value,
//  453                     unsigned int  row,
//  454                     int16u_t* setparam )
//  455 {
//  456     unsigned char key, dat[4] = {0}, dis[5] = {0};
//  457     unsigned int  pos = 0, flash = 0;
//  458     int16u_t cnt1 = 0, cnt2 = 0;
//  459     
//  460     if(value < 1000) dat[0] = 0;
//  461     else dat[0] = value / 1000;
//  462     dat[1] = value / 100 % 10;
//  463     dat[2] = value / 10 % 10;
//  464     dat[3] = value % 10;
//  465 
//  466     dis[0] = dat[0] + 0x30;
//  467     dis[1] = dat[1] + 0x30;
//  468     dis[2] = dat[2] + 0x30;
//  469     dis[3] = dat[3] + 0x30;
//  470     dis[4] = '\0';
//  471     
//  472     
//  473     * ������ʾ *
//  474     OLED_P8x16Str(0, row, name); 
//  475     OLED_P8x16Str(82, row, dis);
//  476     
//  477     do
//  478     {        
//  479 
//  480       * �ȴ���������,��˸�ȴ� *
//  481          while(!TEST_KEY_7290()) 
//  482         {
//  483           cnt1++;
//  484           if(cnt1 == 100 && flash == 0)
//  485           {
//  486             cnt2 ++;
//  487             cnt1 = 0;
//  488             if(cnt2 == 10000)
//  489             {
//  490               OLED_P8x16_Clr_One(82+8*pos, row);
//  491               cnt1 = 0; cnt2 = 0;
//  492               flash = 1;
//  493             }
//  494           }
//  495 
//  496           if(cnt1 == 100 && flash ==1)
//  497           {
//  498             cnt2 ++;
//  499             cnt1 = 0;
//  500             if(cnt2 == 10000)
//  501             {
//  502               OLED_P8x16Str(82, row, dis);
//  503               cnt1 = 0; cnt2 = 0;
//  504               flash = 0;
//  505             }
//  506           }
//  507         }
//  508         
//  509         * ������ȡ *
//  510         key = Readkey_7290();
//  511         
//  512         key = KeyConvert(key);
//  513        
//  514         * �޸Ĳ�����������ʾ *
//  515         if(key < 10)
//  516         {     
//  517             dat[pos] = key;
//  518             dis[pos] = dat[pos] + 0x30;
//  519             OLED_P8x16Str(82, row, dis);
//  520             if(++pos == 4) pos = 0;
//  521         }
//  522     }
//  523     while(key != 11);            * ȷ�ϼ���Ӧ�ļ�ֵΪ11 *
//  524     OLED_P8x16Str(82, row, dis);
//  525     
//  526     * �����趨��� *
//  527     *setparam = dat[0] * 1000 + dat[1] * 100 + dat[2] * 10 + dat[3];
//  528            
//  529     //Delay_ms(500);
//  530 }
//  531 ******************************************************************************
//  532 * ��������: SetFloatParam_7290
//  533 * ��������: ����7290���и�������趨.
//  534 * ��ڲ���: name   ��������(һ��ASCII�ַ�)
//  535 *           value  �����ĳ�ʼֵ(00.00��ʽ)
//  536             row    ���������OLED��ʾ����(0~7)
//  537 * ���ز���: �趨���(0-9999)
//  538 ******************************************************************************
//  539 char SetFloatParam_7290( unsigned char name[], 
//  540                          float  tempvalue,
//  541                          unsigned int  row,
//  542                          float* setparam )
//  543 {
//  544     unsigned char key, dat[5] = {0}, dis[6] = {0};
//  545     unsigned int  pos = 0, flash = 0;
//  546     int16u_t cnt1 = 0, cnt2 = 0;
//  547     int16u_t value = 0;
//  548     
//  549     value = (int16u_t)(tempvalue * 100);
//  550 
//  551     if(value < 1000) dat[0] = 0;
//  552     else dat[0] = value / 1000;
//  553     dat[1] = value / 100 % 10;
//  554     dat[3] = value / 10 % 10;
//  555     dat[4] = value % 10;
//  556 
//  557     dis[0] = dat[0] + 0x30;
//  558     dis[1] = dat[1] + 0x30;
//  559     dis[2] = '.';
//  560     dis[3] = dat[3] + 0x30;
//  561     dis[4] = dat[4] + 0x30;
//  562     dis[5] = '\0';
//  563     
//  564     
//  565     * ������ʾ *
//  566     OLED_P8x16Str(0, row, name); 
//  567     OLED_P8x16Str(82, row, dis);
//  568     
//  569     do
//  570     {        
//  571         * �ȴ��������� *
//  572         while(!TEST_KEY_7290()) 
//  573         {
//  574           cnt1++;
//  575           if(cnt1 == 100 && flash == 0)
//  576           {
//  577             cnt2 ++;
//  578             cnt1 = 0;
//  579             if(cnt2 == 10000)
//  580             {
//  581               OLED_P8x16_Clr_One(82+8*pos, row);
//  582               cnt1 = 0; cnt2 = 0;
//  583               flash = 1;
//  584             }
//  585           }
//  586 
//  587           if(cnt1 == 100 && flash ==1)
//  588           {
//  589             cnt2 ++;
//  590             cnt1 = 0;
//  591             if(cnt2 == 10000)
//  592             {
//  593               OLED_P8x16Str(82, row, dis);
//  594               cnt1 = 0; cnt2 = 0;
//  595               flash = 0;
//  596             }
//  597           }
//  598         }
//  599 
//  600         * ������ȡ *
//  601         key = Readkey_7290();
//  602         
//  603         if(key == 20)
//  604           return 1;
//  605         
//  606         key = KeyConvert(key);
//  607        
//  608         * �޸Ĳ�����������ʾ *
//  609         if(key < 10)
//  610         {
//  611             dat[pos] = key;
//  612             dis[pos] = dat[pos] + 0x30;
//  613             OLED_P8x16Str(82, row, dis);
//  614             if(++pos == 5) pos = 0;
//  615             if(pos == 2) pos = 3;
//  616         }
//  617     }
//  618     while(key != 11);            * ȷ�ϼ���Ӧ�ļ�ֵΪ11 *
//  619     OLED_P8x16Str(82, row, dis);
//  620     
//  621     * �����趨��� *
//  622     *setparam = ((float)dat[0]) * 10 + ((float)dat[1])  + ((float)dat[3]) / 10 + ((float)dat[4]) / 100;
//  623     return 0;
//  624     //Delay_ms(500);
//  625 }
//  626 */
// 
//    12 bytes in section .rodata
// 1 602 bytes in section .text
// 
// 1 602 bytes of CODE  memory
//    12 bytes of CONST memory
//
//Errors: none
//Warnings: none
