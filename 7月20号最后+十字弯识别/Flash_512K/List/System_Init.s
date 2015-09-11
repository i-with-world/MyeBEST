///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      22/Jul/2015  10:59:27 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\System_Ini /
//                    t\System_Init.c                                         /
//    Command line =  C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\System_Ini /
//                    t\System_Init.c -D IAR -lCN                             /
//                    C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Flash_512K /
//                    \List\ -lB C:\Users\dong\Desktop\7��20�����+ʮ����ʶ�� /
//                    \Flash_512K\List\ -o C:\Users\dong\Desktop\7��20�����+ /
//                    ʮ����ʶ��\Flash_512K\Obj\ --no_cse --no_unroll         /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
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
//                    \List\System_Init.s                                     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME System_Init

        #define SHT_PROGBITS 0x1

        EXTERN ADC_ClockCtrl
        EXTERN ADC_SetCFG1
        EXTERN ADC_SetCFG2
        EXTERN ADC_SetSC
        EXTERN EnableInt_Kinetis
        EXTERN FTM_enablePWMCh
        EXTERN FTM_enableQUAD
        EXTERN FTM_initPWM
        EXTERN FTM_initQUAD
        EXTERN FTM_setPWMDty
        EXTERN GPIO_SetPinDir
        EXTERN GPIO_SetPinDriveStrgth
        EXTERN GPIO_SetPinMod
        EXTERN I2C_Driver_Init
        EXTERN Init_7290
        EXTERN MMA8451Q_init
        EXTERN OLED_Clear
        EXTERN OLED_Init
        EXTERN OLED_Refresh_Gram
        EXTERN SetIntPri_Kinetis
        EXTERN SetScaleRange
        EXTERN delay_ms

        PUBLIC Buzzer_Init
        PUBLIC CCD_Init
        PUBLIC Motor_Init
        PUBLIC QUAT_Init
        PUBLIC Switch_Init
        PUBLIC System_Init
        PUBLIC UART_Init
        PUBLIC User_Init

// C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\System_Init\System_Init.c
//    1 #include "AllHeaders.h"
//    2 
//    3 /*******************************************************************************
//    4 * ��������CCD_Init(void)
//    5 * ��  ������ɶ�CCD�й����ŵĳ�ʼ��
//    6 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    7 void CCD_Init(void)
//    8 {
CCD_Init:
        PUSH     {R7,LR}
//    9   //CCD port init
//   10   GPIO_SetPinMod(PORTE, 24,0);                               // ������Ӧ���ŵĹ��ܺ�,ADC0_SE17 ��CCD�ɼ�
        MOVS     R2,#+0
        MOVS     R1,#+24
        LDR.N    R0,??DataTable4  ;; 0x400ff100
        BL       GPIO_SetPinMod
//   11   GPIO_SetPinMod(PORTE, 25,0);                               // ������Ӧ���ŵĹ��ܺ�,ADC0_SE18 ��CCD�ɼ�
        MOVS     R2,#+0
        MOVS     R1,#+25
        LDR.N    R0,??DataTable4  ;; 0x400ff100
        BL       GPIO_SetPinMod
//   12 
//   13   GPIO_SetPinMod(PORTE,6,1);                             
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.N    R0,??DataTable4  ;; 0x400ff100
        BL       GPIO_SetPinMod
//   14   GPIO_SetPinDir(PORTE,6,1);                               // ����PTE6��Ϊ�����SI�ź�
        MOVS     R2,#+1
        MOVS     R1,#+6
        LDR.N    R0,??DataTable4  ;; 0x400ff100
        BL       GPIO_SetPinDir
//   15   GPIO_SetPinMod(PORTE,17,1);
        MOVS     R2,#+1
        MOVS     R1,#+17
        LDR.N    R0,??DataTable4  ;; 0x400ff100
        BL       GPIO_SetPinMod
//   16   GPIO_SetPinDir(PORTE,17,1);                                // ����PTE17��Ϊ�����CLK�ź�
        MOVS     R2,#+1
        MOVS     R1,#+17
        LDR.N    R0,??DataTable4  ;; 0x400ff100
        BL       GPIO_SetPinDir
//   17   
//   18   GPIO_SetPinMod(PORTD,1,1);                             
        MOVS     R2,#+1
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_1  ;; 0x400ff0c0
        BL       GPIO_SetPinMod
//   19   GPIO_SetPinDir(PORTD,1,1);                               // ����PTD1��Ϊ�����SI�ź�
        MOVS     R2,#+1
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_1  ;; 0x400ff0c0
        BL       GPIO_SetPinDir
//   20   GPIO_SetPinMod(PORTD,3,1);
        MOVS     R2,#+1
        MOVS     R1,#+3
        LDR.N    R0,??DataTable4_1  ;; 0x400ff0c0
        BL       GPIO_SetPinMod
//   21   GPIO_SetPinDir(PORTD,3,1);                                // ����PTD3��Ϊ�����CLK�ź�
        MOVS     R2,#+1
        MOVS     R1,#+3
        LDR.N    R0,??DataTable4_1  ;; 0x400ff0c0
        BL       GPIO_SetPinDir
//   22   //CCD ADC module init
//   23   ADC_ClockCtrl(ADC0);
        LDR.N    R0,??DataTable4_2  ;; 0x4003b000
        BL       ADC_ClockCtrl
//   24   //ADC_SetCFG1(ADC0, 1, 0, 1);                        // ADC ��������8λ��ʱ��Ƶ��48MHZ/2������ʱ�ӣ�/2
//   25   ADC_SetCFG1(ADC0, 0, 0, 0);                        // ADC ��������8λ��ʱ��Ƶ��48MHZ������ʱ�ӣ�
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_2  ;; 0x4003b000
        BL       ADC_SetCFG1
//   26   ADC_SetCFG2(ADC0, 0, 0, 3);                        //�ڶ�������ѡ��ADC A��B
        MOVS     R3,#+3
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_2  ;; 0x4003b000
        BL       ADC_SetCFG2
//   27   ADC_SetSC(ADC0, 1, 0, 0);                          // Ӳ��ƽ���˲���������Ϊ 8����ѯ��ʽ 8MHZ������ 6��ʱ���������һ��ת��
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_2  ;; 0x4003b000
        BL       ADC_SetSC
//   28 }
        POP      {R0,PC}          ;; return
//   29 
//   30 /*******************************************************************************
//   31 * �������ƣ�Servo_Init(void)
//   32 * ��    �������ö������ PWM ģ��                                         
//   33 *******************************************************************************
//   34 void Servo_Init(void)                           //��ɶ�PWM0�ĳ�ʼ�������ڿ���ת����
//   35 { 
//   36   GPIO_SetPinMod(PORTA, 13, 3);                       // ������Ӧ���ŵĹ��ܺ�,FTM1_CH1
//   37   FTM_initPWM(FTM1, 1, 4);                           // ���� PWM ʱ�Ӻͷ�Ƶ��
//   38   FTM_enablePWMCh(FTM1, 1, 0, 14999, 0);             // PWM  Ƶ�� 200K Hz
//   39   FTM_setPWMDty(FTM1, 1, dutyMid);                         // ���� PWM ռ�ձ�
//   40   
//   41   
//   42 }
//   43 */
//   44 /*******************************************************************************
//   45 * �������ƣ�Motor_Init
//   46 * ��    �������õ������ PWM ģ��                                         
//   47 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   48 void Motor_Init(void) 
//   49 { 
Motor_Init:
        PUSH     {R7,LR}
//   50   FTM_initPWM(FTM0, 1, 5);
        MOVS     R2,#+5
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_3  ;; 0x40038000
        BL       FTM_initPWM
//   51   
//   52   GPIO_SetPinMod(PORTD, 6, 4);                       // ������Ӧ���ŵĹ��ܺ�,FTM0_CH6
        MOVS     R2,#+4
        MOVS     R1,#+6
        LDR.N    R0,??DataTable4_1  ;; 0x400ff0c0
        BL       GPIO_SetPinMod
//   53   GPIO_SetPinMod(PORTC, 3, 4);                       // ������Ӧ���ŵĹ��ܺ�,FTM0_CH2
        MOVS     R2,#+4
        MOVS     R1,#+3
        LDR.N    R0,??DataTable4_4  ;; 0x400ff080
        BL       GPIO_SetPinMod
//   54   GPIO_SetPinMod(PORTD, 4, 4);                       // ������Ӧ���ŵĹ��ܺ�,FTM0_CH4
        MOVS     R2,#+4
        MOVS     R1,#+4
        LDR.N    R0,??DataTable4_1  ;; 0x400ff0c0
        BL       GPIO_SetPinMod
//   55   GPIO_SetPinMod(PORTC, 1, 4);                       // ������Ӧ���ŵĹ��ܺ�,FTM0_CH0
        MOVS     R2,#+4
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_4  ;; 0x400ff080
        BL       GPIO_SetPinMod
//   56   
//   57   FTM_enablePWMCh(FTM0, 0, 0, 500, 0);               // PWM  Ƶ�� 600-->10KHZ
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOV      R3,#+500
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_3  ;; 0x40038000
        BL       FTM_enablePWMCh
//   58   FTM_enablePWMCh(FTM0, 2, 0, 500, 0);
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOV      R3,#+500
        MOVS     R2,#+0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable4_3  ;; 0x40038000
        BL       FTM_enablePWMCh
//   59   FTM_enablePWMCh(FTM0, 4, 0, 500, 0);               // PWM  Ƶ�� 600-->10KHZ
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOV      R3,#+500
        MOVS     R2,#+0
        MOVS     R1,#+4
        LDR.N    R0,??DataTable4_3  ;; 0x40038000
        BL       FTM_enablePWMCh
//   60   FTM_enablePWMCh(FTM0, 6, 0, 500, 0);
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOV      R3,#+500
        MOVS     R2,#+0
        MOVS     R1,#+6
        LDR.N    R0,??DataTable4_3  ;; 0x40038000
        BL       FTM_enablePWMCh
//   61   
//   62   FTM_setPWMDty(FTM0, 0, 0);                         // ��ʼ�� PWM ռ�ձ�
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_3  ;; 0x40038000
        BL       FTM_setPWMDty
//   63   FTM_setPWMDty(FTM0, 2, 0);
        MOVS     R2,#+0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable4_3  ;; 0x40038000
        BL       FTM_setPWMDty
//   64   FTM_setPWMDty(FTM0, 4, 0);                         // ��ʼ�� PWM ռ�ձ�
        MOVS     R2,#+0
        MOVS     R1,#+4
        LDR.N    R0,??DataTable4_3  ;; 0x40038000
        BL       FTM_setPWMDty
//   65   FTM_setPWMDty(FTM0, 6, 0);
        MOVS     R2,#+0
        MOVS     R1,#+6
        LDR.N    R0,??DataTable4_3  ;; 0x40038000
        BL       FTM_setPWMDty
//   66 }
        POP      {R0,PC}          ;; return
//   67 
//   68 /*******************************************************************************
//   69 * �������ƣ�Buzzer_Init
//   70 * ��    �������÷�����ģ��                                         
//   71 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   72 void Buzzer_Init(void)
//   73 {
Buzzer_Init:
        PUSH     {R7,LR}
//   74   GPIO_SetPinMod(PORTA, 15, 1);                   // ������Ӧ���ŵĹ��ܺ�
        MOVS     R2,#+1
        MOVS     R1,#+15
        LDR.N    R0,??DataTable4_5  ;; 0x400ff000
        BL       GPIO_SetPinMod
//   75   GPIO_SetPinDir(PORTA, 15, 1);
        MOVS     R2,#+1
        MOVS     R1,#+15
        LDR.N    R0,??DataTable4_5  ;; 0x400ff000
        BL       GPIO_SetPinDir
//   76   GPIO_SetPinDriveStrgth(PORTA, 15, 1);           //����ǿ����ģʽ
        MOVS     R2,#+1
        MOVS     R1,#+15
        LDR.N    R0,??DataTable4_5  ;; 0x400ff000
        BL       GPIO_SetPinDriveStrgth
//   77 }
        POP      {R0,PC}          ;; return
//   78 
//   79 /*******************************************************************************
//   80 * �������ƣ�Switch_Init
//   81 * ��    �������÷�����ģ��                                         
//   82 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   83 void Switch_Init(void)
//   84 {
Switch_Init:
        PUSH     {R7,LR}
//   85   GPIO_SetPinMod(PORTB, 23, 1);                   // ������Ӧ���ŵĹ��ܺ�
        MOVS     R2,#+1
        MOVS     R1,#+23
        LDR.N    R0,??DataTable4_6  ;; 0x400ff040
        BL       GPIO_SetPinMod
//   86   GPIO_SetPinDir(PORTB, 23, 0);                   // ������Ӧ���ŵķ���
        MOVS     R2,#+0
        MOVS     R1,#+23
        LDR.N    R0,??DataTable4_6  ;; 0x400ff040
        BL       GPIO_SetPinDir
//   87   
//   88   GPIO_SetPinMod(PORTB, 22, 1);                   // ������Ӧ���ŵĹ��ܺ�
        MOVS     R2,#+1
        MOVS     R1,#+22
        LDR.N    R0,??DataTable4_6  ;; 0x400ff040
        BL       GPIO_SetPinMod
//   89   GPIO_SetPinDir(PORTB, 22, 0);                   // ������Ӧ���ŵķ���
        MOVS     R2,#+0
        MOVS     R1,#+22
        LDR.N    R0,??DataTable4_6  ;; 0x400ff040
        BL       GPIO_SetPinDir
//   90   
//   91   GPIO_SetPinMod(PORTB, 21, 1);                   // ������Ӧ���ŵĹ��ܺ�
        MOVS     R2,#+1
        MOVS     R1,#+21
        LDR.N    R0,??DataTable4_6  ;; 0x400ff040
        BL       GPIO_SetPinMod
//   92   GPIO_SetPinDir(PORTB, 21, 0);                   // ������Ӧ���ŵķ���
        MOVS     R2,#+0
        MOVS     R1,#+21
        LDR.N    R0,??DataTable4_6  ;; 0x400ff040
        BL       GPIO_SetPinDir
//   93   
//   94   GPIO_SetPinMod(PORTB, 20, 1);                   // ������Ӧ���ŵĹ��ܺ�
        MOVS     R2,#+1
        MOVS     R1,#+20
        LDR.N    R0,??DataTable4_6  ;; 0x400ff040
        BL       GPIO_SetPinMod
//   95   GPIO_SetPinDir(PORTB, 20, 0);                   // ������Ӧ���ŵķ���
        MOVS     R2,#+0
        MOVS     R1,#+20
        LDR.N    R0,??DataTable4_6  ;; 0x400ff040
        BL       GPIO_SetPinDir
//   96   
//   97   
//   98   GPIO_SetPinMod(PORTC, 15, 1);                   // ������Ӧ���ŵĹ��ܺ�
        MOVS     R2,#+1
        MOVS     R1,#+15
        LDR.N    R0,??DataTable4_4  ;; 0x400ff080
        BL       GPIO_SetPinMod
//   99   GPIO_SetPinDir(PORTC, 15, 0);                   // ������Ӧ���ŵķ���
        MOVS     R2,#+0
        MOVS     R1,#+15
        LDR.N    R0,??DataTable4_4  ;; 0x400ff080
        BL       GPIO_SetPinDir
//  100   
//  101   GPIO_SetPinMod(PORTC, 14, 1);                   // ������Ӧ���ŵĹ��ܺ�
        MOVS     R2,#+1
        MOVS     R1,#+14
        LDR.N    R0,??DataTable4_4  ;; 0x400ff080
        BL       GPIO_SetPinMod
//  102   GPIO_SetPinDir(PORTC, 14, 0);                   // ������Ӧ���ŵķ���
        MOVS     R2,#+0
        MOVS     R1,#+14
        LDR.N    R0,??DataTable4_4  ;; 0x400ff080
        BL       GPIO_SetPinDir
//  103   
//  104   GPIO_SetPinMod(PORTC, 13, 1);                   // ������Ӧ���ŵĹ��ܺ�
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.N    R0,??DataTable4_4  ;; 0x400ff080
        BL       GPIO_SetPinMod
//  105   GPIO_SetPinDir(PORTC, 13, 0);                   // ������Ӧ���ŵķ���
        MOVS     R2,#+0
        MOVS     R1,#+13
        LDR.N    R0,??DataTable4_4  ;; 0x400ff080
        BL       GPIO_SetPinDir
//  106   
//  107   GPIO_SetPinMod(PORTC, 12, 1);                   // ������Ӧ���ŵĹ��ܺ�
        MOVS     R2,#+1
        MOVS     R1,#+12
        LDR.N    R0,??DataTable4_4  ;; 0x400ff080
        BL       GPIO_SetPinMod
//  108   GPIO_SetPinDir(PORTC, 12, 0);                   // ������Ӧ���ŵķ���
        MOVS     R2,#+0
        MOVS     R1,#+12
        LDR.N    R0,??DataTable4_4  ;; 0x400ff080
        BL       GPIO_SetPinDir
//  109   
//  110 
//  111 }
        POP      {R0,PC}          ;; return
//  112 
//  113 /*******************************************************************************
//  114 * �������ƣ�UART_Init
//  115 * ��    �����û����ӵĳ�ʼ������                                         
//  116 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  117 void UART_Init(void)
//  118 {
//  119 #if BLOOTH_EN
//  120   GPIO_SetPinMod(PORTB,16,3);
//  121   GPIO_SetPinMod(PORTB,17,3);
//  122   
//  123   UART_Selt(UART0_BASE_PTR);
//  124   UART_Set(UART0_BASE_PTR,8,9600);
//  125   EN_INTUART0();   //�������ж�
//  126 
//  127 #endif
//  128 }
UART_Init:
        BX       LR               ;; return
//  129 
//  130 /*******************************************************************************
//  131 * �������ƣ�QUAT_Init
//  132 * ��    �����û����ӵĳ�ʼ������                                         
//  133 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  134 void QUAT_Init(void)
//  135 {
QUAT_Init:
        PUSH     {R7,LR}
//  136   GPIO_SetPinMod(PORTB,18,6);
        MOVS     R2,#+6
        MOVS     R1,#+18
        LDR.N    R0,??DataTable4_6  ;; 0x400ff040
        BL       GPIO_SetPinMod
//  137   GPIO_SetPinMod(PORTB,19,6);
        MOVS     R2,#+6
        MOVS     R1,#+19
        LDR.N    R0,??DataTable4_6  ;; 0x400ff040
        BL       GPIO_SetPinMod
//  138   GPIO_SetPinMod(PORTA,12,7);
        MOVS     R2,#+7
        MOVS     R1,#+12
        LDR.N    R0,??DataTable4_5  ;; 0x400ff000
        BL       GPIO_SetPinMod
//  139   GPIO_SetPinMod(PORTA,13,7);
        MOVS     R2,#+7
        MOVS     R1,#+13
        LDR.N    R0,??DataTable4_5  ;; 0x400ff000
        BL       GPIO_SetPinMod
//  140 
//  141   FTM_initQUAD(FTM1, 1, 0, 65535);                   // ������������ģ�����
        MOVW     R3,#+65535
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_7  ;; 0x40039000
        BL       FTM_initQUAD
//  142   FTM_enableQUAD(FTM1);                              // ʹ����������
        LDR.N    R0,??DataTable4_7  ;; 0x40039000
        BL       FTM_enableQUAD
//  143   
//  144   FTM_initQUAD(FTM2, 1, 0, 65535);                   // ������������ģ�����
        MOVW     R3,#+65535
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_8  ;; 0x400b8000
        BL       FTM_initQUAD
//  145   FTM_enableQUAD(FTM2);                              // ʹ����������
        LDR.N    R0,??DataTable4_8  ;; 0x400b8000
        BL       FTM_enableQUAD
//  146 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x400ff0c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x4003b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40038000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0x40039000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     0x400b8000
//  147 /*******************************************************************************
//  148 * �������ƣ�User_Init
//  149 * ��    �����û����ӵĳ�ʼ������                                         
//  150 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  151 void User_Init(void)
//  152 {
User_Init:
        PUSH     {R7,LR}
//  153 #if OLED_EN
//  154   OLED_Init();
        BL       OLED_Init
//  155   OLED_Clear();
        BL       OLED_Clear
//  156   OLED_Refresh_Gram();
        BL       OLED_Refresh_Gram
//  157 #endif 
//  158  
//  159 #if (FUNC_MUSK==0)
//  160   SD_System_Init();
//  161 #endif
//  162 #if (FUNC_MUSK==1)
//  163   Init_7290();
        BL       Init_7290
//  164   //�����ж��趨
//  165   EnableInt_Kinetis(91);    //��PORTE���ж�
        MOVS     R0,#+91
        BL       EnableInt_Kinetis
//  166   SetIntPri_Kinetis(91,2);    //�趨�ж����ȼ�
        MOVS     R1,#+2
        MOVS     R0,#+91
        BL       SetIntPri_Kinetis
//  167 #endif
//  168   //I2C��ʼ��
//  169   I2C_Driver_Init();
        BL       I2C_Driver_Init
//  170   //��ʱ֮���ʼ�����ٶȼƺ�������
//  171   delay_ms(40);
        MOVS     R0,#+40
        BL       delay_ms
//  172   SetScaleRange();
        BL       SetScaleRange
//  173   MMA8451Q_init();
        BL       MMA8451Q_init
//  174 
//  175 }
        POP      {R0,PC}          ;; return
//  176 
//  177 /*******************************************************************************
//  178 * ��������: System_Init                          
//  179 * ��    �������ø�ģ���ʼ������ 
//  180 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  181 void System_Init(void)
//  182 {
System_Init:
        PUSH     {R7,LR}
//  183   CCD_Init();
        BL       CCD_Init
//  184   Motor_Init();
        BL       Motor_Init
//  185   Buzzer_Init();
        BL       Buzzer_Init
//  186   Switch_Init();
        BL       Switch_Init
//  187   UART_Init();
        BL       UART_Init
//  188   QUAT_Init();
        BL       QUAT_Init
//  189   User_Init();
        BL       User_Init
//  190   
//  191 }
        POP      {R0,PC}          ;; return

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
// 716 bytes in section .text
// 
// 716 bytes of CODE memory
//
//Errors: none
//Warnings: none
