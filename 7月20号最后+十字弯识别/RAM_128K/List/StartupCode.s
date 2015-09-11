///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      30/Oct/2014  20:23:28 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Library\C /
//                    PU\StartupCode.c                                        /
//    Command line =  E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Library\C /
//                    PU\StartupCode.c -D IAR -lCN                            /
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
//                    List\StartupCode.s                                      /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME StartupCode

        #define SHT_PROGBITS 0x1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION `.data`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION `.data_init`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION CodeRelocate:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION CodeRelocateRam:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        EXTERN WriteVTOR_Kinetis
        EXTERN __VECTOR_RAM
        EXTERN __VECTOR_TABLE
        EXTERN __aeabi_memcpy4
        EXTERN main

        PUBLIC StartUp_Kinetis

// E:\���»\���ܳ�\��ʮ��\��������\1029���԰�\Library\CPU\StartupCode.c
//    1 /*******************************************************************************
//    2 * �ļ����ƣ�StartupCode.c
//    3 * ��    ��������Kinetis�Ļ����ײ��������(�жϵ�������CPUģʽ������)��
//    4 
//    5 * ��    �ߣ����Ľ���ԭ���ߣ�
//    6 *           ��������޸ģ�
//    7 * �ر���л���ͳ�ʦ��(����http://blog.chinaaet.com/jihceng0622)
//    8 * ʱ    �䣺2012��5��17��
//    9 *******************************************************************************/
//   10 
//   11 #include "KinetisConfig.h"
//   12 
//   13 #pragma section = ".data"                        // ��������
//   14 #pragma section = ".data_init"                   // ��ʼ����������
//   15 #pragma section = ".bss"                         // �ǳ�ʼ����������
//   16 #pragma section = "CodeRelocate"                 // �ض�λ������
//   17 #pragma section = "CodeRelocateRam"              // �ض�λRAM��
//   18 
//   19 /* �ⲿ�������� */
//   20 extern void main(void);                          // ���� main ����
//   21 #if EN_InitHook_Kinetis != 0
//   22   extern void HOOK_BeforeClk_Kinetis(void);
//   23   extern void HOOK_AfterClk_Kinetis(void);
//   24 #endif
//   25 /* �������� */
//   26 #if EN_ResetType_Kinetis != 0
//   27   KEEP_Data_Kinetis int16u_t ResetType_Kinetis;  // ��λ����
//   28 #endif
//   29 
//   30 
//   31 #if EN_CoreClkOut_Kinetis != 0
//   32 /******************************************************************************* 
//   33 * �������ƣ�OnCoreClk_Out
//   34 * ��    ������PTA6�����Ƶ��ΪCoreClockƵ��1/2��ʱ���ź�
//   35 *******************************************************************************/
//   36 static void OnCoreClk_Out(void)
//   37 {
//   38     /* Set the trace clock to the core clock frequency */
//   39     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;
//   40     /* Enable the TRACE_CLKOUT pin function on PTA6 (alt7 function) */
//   41     PORTA_PCR6 = (PORT_PCR_MUX(7));
//   42 }
//   43 #endif 
//   44 
//   45 #if EN_FlexClkOut_Kinetis != 0
//   46 /******************************************************************************* 
//   47 * �������ƣ�OnFlexClk_Out
//   48 * ��    ������PTC3�����FlexClock
//   49 ********************************************************************************/
//   50 static void OnFlexClk_Out(void)
//   51 {
//   52     /* Enable the clock to the FlexBus module */
//   53     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
//   54     /* Enable the FB_CLKOUT function on PTC3 (alt5 function) */
//   55     PORTC_PCR3 = (PORT_PCR_MUX(5));
//   56 }
//   57 #endif
//   58 
//   59 #if EN_ResetType_Kinetis != 0
//   60 /*******************************************************************************
//   61 * �������ƣ�ReadResetType_Kinetis
//   62 * ��    ������ȡ�Ĵ���ReadResetType_Kinetis���ж�ϵͳ�ĸ�λ����
//   63 ********************************************************************************/
//   64 static void ReadResetType_Kinetis(void)
//   65 {
//   66     ResetType_Kinetis = MC_SRSH;
//   67     ResetType_Kinetis <<= 8;
//   68     ResetType_Kinetis |= MC_SRSL;
//   69 }
//   70 #endif
//   71 
//   72 /******************************************************************************** 
//   73 * �������ƣ�DisWatchDog_Kinetis
//   74 * ��    �������ÿ��Ź�
//   75 *******************************************************************************/
//   76 static void DisWatchDog_Kinetis(void)
//   77 {
//   78     UNLOCK_WatchDog();                              // �������Ź� 
//   79     WDOG_STCTRLH &= ~WDOG_STCTRLH_WDOGEN_MASK;      // ���ÿ��Ź�
//   80 }
//   81 
//   82 /******************************************************************************** 
//   83 * �������ƣ�SetPLL_Kinetis
//   84 * ��    ����ϵͳ�����໷�趨������ɵ���Ҫ����Ϊ���趨CoreClock��BusClock��FlexClock��FlashClock
//   85             (���õľ���Ƶ����KinetisConfig.h������)
//   86 *******************************************************************************/
//   87 static void SetPLL_Kinetis(void)
//   88 {
//   89     int32u_t temp_reg;
//   90     int8u_t  i;
//   91     
//   92     // First move to FBE mode
//   93     // Enable external oscillator, RANGE=2, HGO=1, EREFS=1, LP=0, IRCS=0
//   94     MCG_C2 = MCG_C2_RANGE(1) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//   95 
//   96     // after initialization of oscillator release latched state of oscillator and GPIO
//   97     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
//   98     LLWU_CS |= LLWU_CS_ACKISO_MASK;
//   99   
//  100     // Select external oscilator and Reference Divider and clear IREFS to start ext osc
//  101     // CLKS=2, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  102     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
//  103 
//  104     /* if we aren't using an osc input we don't need to wait for the osc to init */
//  105     // wait for Reference clock Status bit to clear
//  106     while (MCG_S & MCG_S_IREFST_MASK){};
//  107     // Wait for clock status bits to show clock source is ext ref clk
//  108     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}; 
//  109 
//  110     /* �趨PLLʱ�� */
//  111 #if CORE_CLK_Kinetis  <= 110
//  112     MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis/2 - 1);     // PLLCLK == 2MHz
//  113 #else
//  114   #if   REF_CLK_Kinetis % 3 == 0
//  115     MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis/3 - 1);     // PLLCLK == 3MHz 
//  116   #elif REF_CLK_Kinetis % 4 == 0
//  117     MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis/4 - 1);     // PLLCLK == 4MHz 
//  118   #elif REF_CLK_Kinetis % 5 == 0
//  119     MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis*2/5 - 1);   // PLLCLK == 2.5MHz 
//  120   #endif
//  121 #endif 
//  122     
//  123     // Ensure MCG_C6 is at the reset default of 0. LOLIE disabled,
//  124     // PLL disabled, clk monitor disabled, PLL VCO divider is clear 
//  125     MCG_C6 = 0x00;
//  126 
//  127     /* �趨��ʱ�ӵķ�Ƶ�� */
//  128     // store present value of FMC_PFAPR
//  129     temp_reg = FMC_PFAPR;
//  130     // set M0PFD through M7PFD to 1 to disable prefetch
//  131     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  132 		 | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  133 		 | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;
//  134     // set clock dividers to desired value  
//  135     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0)       
//  136 	          | SIM_CLKDIV1_OUTDIV2(DIV_BusClk_Kinetis - 1) 
//  137 		  | SIM_CLKDIV1_OUTDIV3(DIV_FlexClk_Kinetis - 1) 
//  138 		  | SIM_CLKDIV1_OUTDIV4(DIV_FlashClk_Kinetis - 1);
//  139     // wait for dividers to change
//  140     for (i = 0 ; i < DIV_FlashClk_Kinetis ; i++) {}
//  141     // re-store original value of FMC_PFAPR
//  142     FMC_PFAPR = temp_reg;   
//  143   
//  144     /* ���ñ�Ƶ��,��Ƶ��ΪVDIV+24 */
//  145 #if CORE_CLK_Kinetis  <= 110
//  146     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis/2 - 24); 
//  147 #else
//  148   #if   REF_CLK_Kinetis % 3 == 0
//  149     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis/3 - 24); 
//  150   #elif REF_CLK_Kinetis % 4 == 0
//  151     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis/4 - 24);
//  152   #elif REF_CLK_Kinetis % 5 == 0
//  153     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis*2/5 - 24); 
//  154   #endif
//  155 #endif
//  156   
//  157     while (!(MCG_S & MCG_S_PLLST_MASK)){};   // wait for PLL status bit to set
//  158     while (!(MCG_S & MCG_S_LOCK_MASK)){};    // Wait for LOCK bit to set
//  159 
//  160     // Now running PBE Mode
//  161     // Transition into PEE by setting CLKS to 0
//  162     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  163     MCG_C1 &= ~MCG_C1_CLKS_MASK;
//  164 
//  165     // Wait for clock status bits to update
//  166     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
//  167 } 
//  168 
//  169 /*******************************************************************************
//  170 * �������ƣ�OnGPIOClk_Kinetis
//  171 * ��    ����ʹ��GPIOʱ�� 
//  172 *******************************************************************************/
//  173 static void OnGPIOClk_Kinetis(void)
//  174 {
//  175     /* ʹ��IO��ʱ�� */
//  176     SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK | SIM_SCGC5_PORTB_MASK
//  177 		 | SIM_SCGC5_PORTC_MASK | SIM_SCGC5_PORTD_MASK
//  178 		 | SIM_SCGC5_PORTE_MASK ;
//  179 }
//  180 
//  181 /******************************************************************************* 
//  182 * �������ƣ�Init_Clock_Kinetis
//  183 * ��    ������ʼ��ϵͳʱ��,����ɵ���Ҫ�����У�����ϵͳʱ�ӡ�ʹ���ⲿ��׼ʱ�ӡ���ϵͳʱ��ͨ��IO�����(��ѡ) 
//  184 *******************************************************************************/
//  185 static void Init_Clock_Kinetis(void)
//  186 {      
//  187     SetPLL_Kinetis();                   // �趨ϵͳʱ�� 
//  188     OSC_CR |= OSC_CR_ERCLKEN_MASK;      // ʹ���ⲿ��׼ʱ��(�ܶ�ģ����Ҫ�õ���ʱ��)
//  189 	
//  190 #if  EN_CoreClkOut_Kinetis != 0
//  191     OnCoreClk_Out();                    // ��PTA6���CoreClock/2
//  192 #endif
//  193 	
//  194 #if EN_FlexClkOut_Kinetis != 0	
//  195     OnFlexClk_Out();                    // ��PTC3���FlexClock 
//  196 #endif
//  197 }
//  198 
//  199 /*******************************************************************************
//  200 * �������ƣ�ClearBss_Kinetis
//  201 * ��    ������"BSS"��������ʼ��Ϊ0
//  202 *******************************************************************************/
//  203 static void ClearBss_Kinetis(void)
//  204 { 
//  205     int32u_t n = 0;  
//  206   
//  207     /* Get the addresses for the .bss section (zero-initialized data) */
//  208     int8u_t* __BSS_START = __section_begin(".bss");
//  209     int8u_t* __BSS_END = __section_end(".bss");
//  210     
//  211     /* Clear the zero-initialized data section */
//  212     n = __BSS_END - __BSS_START;
//  213     while(n--)
//  214       *__BSS_START++ = 0;   
//  215 }
//  216 
//  217 /******************************************************************************* 
//  218 * �������ƣ�RomToRam_Kinetis
//  219 * ��    ����������ROM�е�����ת����RAM��
//  220 *******************************************************************************/
//  221 static void RomToRam_Kinetis(void)
//  222 {
//  223     int32u_t n = 0;
//  224 
//  225     /* Get the addresses for the .data section (initialized data section) */
//  226     int8u_t* __DATA_RAM = __section_begin(".data");
//  227     int8u_t* __DATA_ROM = __section_begin(".data_init");
//  228     int8u_t* __DATA_ROM_END = __section_end(".data_init");
//  229     
//  230     /* Copy initialized data from ROM to RAM */
//  231     n = __DATA_ROM_END - __DATA_ROM;
//  232     while(n--)
//  233       *__DATA_RAM++ = *__DATA_ROM++;
//  234 }
//  235 
//  236 /******************************************************************************* 
//  237 * �������ƣ�CodeRelocate_Kinetis
//  238 * ��    ����������__ramfunc�������Ӻ�����RAM����CodeRelocate��CodeRelocateRam��������������.icf�ļ����ҵ�)
//  239 *******************************************************************************/
//  240 static void CodeRelocate_Kinetis(void)
//  241 {
//  242     int32u_t n = 0;
//  243   
//  244     /* Get addresses for any code sections that need to be copied from ROM to RAM.
//  245      * The IAR tools have a predefined keyword that can be used to mark individual
//  246      * functions for execution from RAM. Add "__ramfunc" before the return type in
//  247      * the function prototype for any routines you need to execute from RAM instead 
//  248      * of ROM. ex: __ramfunc void foo(void);
//  249     */
//  250     int8u_t* __CODE_RELOCATE_RAM = __section_begin("CodeRelocateRam");
//  251     int8u_t* __CODE_RELOCATE = __section_begin("CodeRelocate");
//  252     int8u_t* __CODE_RELOCATE_END = __section_end("CodeRelocate");
//  253     
//  254     /* Copy functions from ROM to RAM */
//  255     n = __CODE_RELOCATE_END - __CODE_RELOCATE;
//  256     while(n--)
//  257       *__CODE_RELOCATE_RAM++ = *__CODE_RELOCATE++;    
//  258 }
//  259 
//  260 /*******************************************************************************
//  261 * �������ƣ�Init_VTOR_Kinetis
//  262 * ��    ������ʼ���ж�������,��ϵͳĬ�ϵ��ж��������Ϊ�Զ��Ե��ж������� 
//  263 *******************************************************************************/
//  264 static void Init_VTOR_Kinetis(void)
//  265 {     
//  266     /* Addresses for VECTOR_TABLE and VECTOR_RAM come from the linker file */  
//  267     extern int32u_t __VECTOR_TABLE[];          // �� *.icf �ļ��ж���
//  268     extern int32u_t __VECTOR_RAM[];            // �� *.icf �ļ��ж���
//  269     
//  270     int32u_t n = 0;
//  271     int32u_t *ptr1 , *ptr2;
//  272     
//  273     n = 120;
//  274     ptr1 = __VECTOR_RAM;
//  275     ptr2 = __VECTOR_TABLE;
//  276     if (__VECTOR_RAM != __VECTOR_TABLE)        // ���ж��������Ƶ� RAM ��
//  277     {
//  278         while(n--)
//  279           *ptr1++ = *ptr2++;
//  280     }
//  281     /* Point the VTOR to the new copy of the vector table */
//  282     WriteVTOR_Kinetis((int32u_t)__VECTOR_RAM);
//  283 }
//  284 
//  285 /*******************************************************************************
//  286 * �������ƣ�StartUp_Kinetis
//  287 * ��    ����Kinetis����������
//  288 *           ��ϵͳ�ϵ�ʱ������ִ�еĵ�һ�δ���,�������ARM������ĳ�ʼ������,����ת���û�����ڳ���
//  289 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  290 void StartUp_Kinetis(void)
//  291 {
StartUp_Kinetis:
        PUSH     {R4,LR}
//  292     DisableInterrupts();                  // ���ж�    
        CPSID i          
//  293     DisWatchDog_Kinetis();                // ���ÿ��Ź�  
        LDR.N    R0,??StartUp_Kinetis_0  ;; 0x40052000
        MOVW     R1,#+50464
        STRH     R1,[R0, #+14]
        MOVW     R1,#+55592
        STRH     R1,[R0, #+14]
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+65534
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
//  294     OnGPIOClk_Kinetis();                  // ����GPIOʱ�� 
        LDR.N    R0,??StartUp_Kinetis_0+0x4  ;; 0x40048034
//  295     
//  296 #if EN_InitHook_Kinetis != 0      
//  297     HOOK_BeforeClk_Kinetis();             // ִ���û�����ĳ�ʼ���ӿ� 
//  298 #endif
//  299 	
//  300     Init_Clock_Kinetis();                 // ��ʼ��ϵͳʱ�� 
        MOVS     R2,#+28
        LDR      R1,[R0, #+4]
        ORR      R1,R1,#0x3E00
        STR      R1,[R0, #+4]
        LDR.N    R1,??StartUp_Kinetis_0+0x8  ;; 0x40064000
        STRB     R2,[R1, #+1]
        LDR      R2,[R0, #+0]
        ORR      R2,R2,#0x10000000
        STR      R2,[R0, #+0]
        LDR.N    R2,??StartUp_Kinetis_0+0xC  ;; 0x4007c008
        LDRB     R3,[R2, #+0]
        ORR      R3,R3,#0x80
        STRB     R3,[R2, #+0]
        MOVS     R2,#+152
        STRB     R2,[R1, #+0]
??StartUp_Kinetis_1:
        LDRB     R2,[R1, #+6]
        LSLS     R2,R2,#+27
        BMI.N    ??StartUp_Kinetis_1
??StartUp_Kinetis_2:
        LDRB     R2,[R1, #+6]
        UBFX     R2,R2,#+2,#+2
        CMP      R2,#+2
        BNE.N    ??StartUp_Kinetis_2
        MOVS     R2,#+7
        STRB     R2,[R1, #+4]
        MOVS     R2,#+0
        STRB     R2,[R1, #+5]
        LDR.N    R2,??StartUp_Kinetis_0+0x10  ;; 0x4001f000
        LDR      R3,[R2, #+0]
        LDR      R4,[R2, #+0]
        ORR      R4,R4,#0xFF0000
        STR      R4,[R2, #+0]
        LDR.N    R4,??StartUp_Kinetis_0+0x14  ;; 0x1130000
        STR      R4,[R0, #+16]
        STR      R3,[R2, #+0]
        MOVS     R0,#+88
        STRB     R0,[R1, #+5]
??StartUp_Kinetis_3:
        LDRB     R0,[R1, #+6]
        LSLS     R0,R0,#+26
        BPL.N    ??StartUp_Kinetis_3
??StartUp_Kinetis_4:
        LDRB     R0,[R1, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??StartUp_Kinetis_4
        LDRB     R0,[R1, #+0]
        AND      R0,R0,#0x3F
        STRB     R0,[R1, #+0]
??StartUp_Kinetis_5:
        LDRB     R0,[R1, #+6]
        UBFX     R0,R0,#+2,#+2
        CMP      R0,#+3
        BNE.N    ??StartUp_Kinetis_5
        LDR.N    R0,??StartUp_Kinetis_0+0x18  ;; 0x40065000
//  301 	
//  302 #if EN_InitHook_Kinetis != 0
//  303     HOOK_AfterClk_Kinetis();              // ִ���û�����ĳ�ʼ���ӿ� 
//  304 #endif	
//  305   
//  306 #if EN_ResetType_Kinetis != 0  
//  307     ReadResetType_Kinetis();              // ��ȡ��λ���� 
//  308 #endif	
//  309   
//  310     RomToRam_Kinetis();                   // ������ROM�е�����ת�Ƶ�RAM��
        LDR.N    R2,??StartUp_Kinetis_0+0x1C
        LDRB     R1,[R0, #+0]
        ORR      R1,R1,#0x80
        STRB     R1,[R0, #+0]
        LDR.N    R1,??StartUp_Kinetis_0+0x20
        LDR.N    R0,??StartUp_Kinetis_0+0x24
        SUBS     R2,R2,R1
        BEQ.N    ??StartUp_Kinetis_6
??StartUp_Kinetis_7:
        LDRB     R3,[R1], #+1
        SUBS     R2,R2,#+1
        STRB     R3,[R0], #+1
        BNE.N    ??StartUp_Kinetis_7
//  311     CodeRelocate_Kinetis();               // ������__ramfunc�������Ӻ�����RAM��
??StartUp_Kinetis_6:
        LDR.N    R1,??StartUp_Kinetis_0+0x28
        LDR.N    R2,??StartUp_Kinetis_0+0x2C
        LDR.N    R0,??StartUp_Kinetis_0+0x30
        SUBS     R2,R2,R1
        BEQ.N    ??StartUp_Kinetis_8
??StartUp_Kinetis_9:
        LDRB     R3,[R1], #+1
        SUBS     R2,R2,#+1
        STRB     R3,[R0], #+1
        BNE.N    ??StartUp_Kinetis_9
//  312     ClearBss_Kinetis();                   // ����BSS���� 
??StartUp_Kinetis_8:
        LDR.N    R0,??StartUp_Kinetis_0+0x34
        LDR.N    R1,??StartUp_Kinetis_0+0x38
        SUBS     R1,R1,R0
        BEQ.N    ??StartUp_Kinetis_10
??StartUp_Kinetis_11:
        SUBS     R1,R1,#+1
        MOVS     R2,#+0
        STRB     R2,[R0], #+1
        CMP      R1,#+0
        BNE.N    ??StartUp_Kinetis_11
//  313     Init_VTOR_Kinetis();                  // ��ʼ���ж�������     
??StartUp_Kinetis_10:
        LDR.N    R1,??StartUp_Kinetis_0+0x3C
        LDR.N    R4,??StartUp_Kinetis_0+0x40
        CMP      R4,R1
        BEQ.N    ??StartUp_Kinetis_12
        MOV      R2,#+480
        MOV      R0,R4
        BL       __aeabi_memcpy4
??StartUp_Kinetis_12:
        MOV      R0,R4
        BL       WriteVTOR_Kinetis
//  314 		
//  315     main();                               // ��ת��main���� 
        BL       main
//  316     while(1);                             // ���򲻻�ִ�е�����
??StartUp_Kinetis_13:
        B.N      ??StartUp_Kinetis_13
        Nop      
        DATA
??StartUp_Kinetis_0:
        DC32     0x40052000
        DC32     0x40048034
        DC32     0x40064000
        DC32     0x4007c008
        DC32     0x4001f000
        DC32     0x1130000
        DC32     0x40065000
        DC32     SFE(`.data_init`)
        DC32     SFB(`.data_init`)
        DC32     SFB(`.data`)
        DC32     SFB(CodeRelocate)
        DC32     SFE(CodeRelocate)
        DC32     SFB(CodeRelocateRam)
        DC32     SFB(`.bss`)
        DC32     SFE(`.bss`)
        DC32     __VECTOR_TABLE
        DC32     __VECTOR_RAM
//  317 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.data_init`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION CodeRelocate:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION CodeRelocateRam:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

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
