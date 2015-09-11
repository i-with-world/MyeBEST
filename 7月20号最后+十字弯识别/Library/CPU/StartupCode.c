/*******************************************************************************
* �ļ����ƣ�StartupCode.c
* ��    ��������Kinetis�Ļ����ײ��������(�жϵ�������CPUģʽ������)��

* ��    �ߣ����Ľ���ԭ���ߣ�
*           ��������޸ģ�
* �ر���л���ͳ�ʦ��(����http://blog.chinaaet.com/jihceng0622)
* ʱ    �䣺2012��5��17��
*******************************************************************************/

#include "KinetisConfig.h"

#pragma section = ".data"                        // ��������
#pragma section = ".data_init"                   // ��ʼ����������
#pragma section = ".bss"                         // �ǳ�ʼ����������
#pragma section = "CodeRelocate"                 // �ض�λ������
#pragma section = "CodeRelocateRam"              // �ض�λRAM��

/* �ⲿ�������� */
extern void main(void);                          // ���� main ����
#if EN_InitHook_Kinetis != 0
  extern void HOOK_BeforeClk_Kinetis(void);
  extern void HOOK_AfterClk_Kinetis(void);
#endif
/* �������� */
#if EN_ResetType_Kinetis != 0
  KEEP_Data_Kinetis int16u_t ResetType_Kinetis;  // ��λ����
#endif


#if EN_CoreClkOut_Kinetis != 0
/******************************************************************************* 
* �������ƣ�OnCoreClk_Out
* ��    ������PTA6�����Ƶ��ΪCoreClockƵ��1/2��ʱ���ź�
*******************************************************************************/
static void OnCoreClk_Out(void)
{
    /* Set the trace clock to the core clock frequency */
    SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;
    /* Enable the TRACE_CLKOUT pin function on PTA6 (alt7 function) */
    PORTA_PCR6 = (PORT_PCR_MUX(7));
}
#endif 

#if EN_FlexClkOut_Kinetis != 0
/******************************************************************************* 
* �������ƣ�OnFlexClk_Out
* ��    ������PTC3�����FlexClock
********************************************************************************/
static void OnFlexClk_Out(void)
{
    /* Enable the clock to the FlexBus module */
    SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
    /* Enable the FB_CLKOUT function on PTC3 (alt5 function) */
    PORTC_PCR3 = (PORT_PCR_MUX(5));
}
#endif

#if EN_ResetType_Kinetis != 0
/*******************************************************************************
* �������ƣ�ReadResetType_Kinetis
* ��    ������ȡ�Ĵ���ReadResetType_Kinetis���ж�ϵͳ�ĸ�λ����
********************************************************************************/
static void ReadResetType_Kinetis(void)
{
    ResetType_Kinetis = MC_SRSH;
    ResetType_Kinetis <<= 8;
    ResetType_Kinetis |= MC_SRSL;
}
#endif

/******************************************************************************** 
* �������ƣ�DisWatchDog_Kinetis
* ��    �������ÿ��Ź�
*******************************************************************************/
static void DisWatchDog_Kinetis(void)
{
    UNLOCK_WatchDog();                              // �������Ź� 
    WDOG_STCTRLH &= ~WDOG_STCTRLH_WDOGEN_MASK;      // ���ÿ��Ź�
}

/******************************************************************************** 
* �������ƣ�SetPLL_Kinetis
* ��    ����ϵͳ�����໷�趨������ɵ���Ҫ����Ϊ���趨CoreClock��BusClock��FlexClock��FlashClock
            (���õľ���Ƶ����KinetisConfig.h������)
*******************************************************************************/
static void SetPLL_Kinetis(void)
{
    int32u_t temp_reg;
    int8u_t  i;
    
    // First move to FBE mode
    // Enable external oscillator, RANGE=2, HGO=1, EREFS=1, LP=0, IRCS=0
    MCG_C2 = MCG_C2_RANGE(1) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;

    // after initialization of oscillator release latched state of oscillator and GPIO
    SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
    LLWU_CS |= LLWU_CS_ACKISO_MASK;
  
    // Select external oscilator and Reference Divider and clear IREFS to start ext osc
    // CLKS=2, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
    MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);

    /* if we aren't using an osc input we don't need to wait for the osc to init */
    // wait for Reference clock Status bit to clear
    while (MCG_S & MCG_S_IREFST_MASK){};
    // Wait for clock status bits to show clock source is ext ref clk
    while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}; 

    /* �趨PLLʱ�� */
#if CORE_CLK_Kinetis  <= 110
    MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis/2 - 1);     // PLLCLK == 2MHz
#else
  #if   REF_CLK_Kinetis % 3 == 0
    MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis/3 - 1);     // PLLCLK == 3MHz 
  #elif REF_CLK_Kinetis % 4 == 0
    MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis/4 - 1);     // PLLCLK == 4MHz 
  #elif REF_CLK_Kinetis % 5 == 0
    MCG_C5 = MCG_C5_PRDIV(REF_CLK_Kinetis*2/5 - 1);   // PLLCLK == 2.5MHz 
  #endif
#endif 
    
    // Ensure MCG_C6 is at the reset default of 0. LOLIE disabled,
    // PLL disabled, clk monitor disabled, PLL VCO divider is clear 
    MCG_C6 = 0x00;

    /* �趨��ʱ�ӵķ�Ƶ�� */
    // store present value of FMC_PFAPR
    temp_reg = FMC_PFAPR;
    // set M0PFD through M7PFD to 1 to disable prefetch
    FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
		 | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
		 | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;
    // set clock dividers to desired value  
    SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0)       
	          | SIM_CLKDIV1_OUTDIV2(DIV_BusClk_Kinetis - 1) 
		  | SIM_CLKDIV1_OUTDIV3(DIV_FlexClk_Kinetis - 1) 
		  | SIM_CLKDIV1_OUTDIV4(DIV_FlashClk_Kinetis - 1);
    // wait for dividers to change
    for (i = 0 ; i < DIV_FlashClk_Kinetis ; i++) {}
    // re-store original value of FMC_PFAPR
    FMC_PFAPR = temp_reg;   
  
    /* ���ñ�Ƶ��,��Ƶ��ΪVDIV+24 */
#if CORE_CLK_Kinetis  <= 110
    MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis/2 - 24); 
#else
  #if   REF_CLK_Kinetis % 3 == 0
    MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis/3 - 24); 
  #elif REF_CLK_Kinetis % 4 == 0
    MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis/4 - 24);
  #elif REF_CLK_Kinetis % 5 == 0
    MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(CORE_CLK_Kinetis*2/5 - 24); 
  #endif
#endif
  
    while (!(MCG_S & MCG_S_PLLST_MASK)){};   // wait for PLL status bit to set
    while (!(MCG_S & MCG_S_LOCK_MASK)){};    // Wait for LOCK bit to set

    // Now running PBE Mode
    // Transition into PEE by setting CLKS to 0
    // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
    MCG_C1 &= ~MCG_C1_CLKS_MASK;

    // Wait for clock status bits to update
    while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
} 

/*******************************************************************************
* �������ƣ�OnGPIOClk_Kinetis
* ��    ����ʹ��GPIOʱ�� 
*******************************************************************************/
static void OnGPIOClk_Kinetis(void)
{
    /* ʹ��IO��ʱ�� */
    SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK | SIM_SCGC5_PORTB_MASK
		 | SIM_SCGC5_PORTC_MASK | SIM_SCGC5_PORTD_MASK
		 | SIM_SCGC5_PORTE_MASK ;
}

/******************************************************************************* 
* �������ƣ�Init_Clock_Kinetis
* ��    ������ʼ��ϵͳʱ��,����ɵ���Ҫ�����У�����ϵͳʱ�ӡ�ʹ���ⲿ��׼ʱ�ӡ���ϵͳʱ��ͨ��IO�����(��ѡ) 
*******************************************************************************/
static void Init_Clock_Kinetis(void)
{      
    SetPLL_Kinetis();                   // �趨ϵͳʱ�� 
    OSC_CR |= OSC_CR_ERCLKEN_MASK;      // ʹ���ⲿ��׼ʱ��(�ܶ�ģ����Ҫ�õ���ʱ��)
	
#if  EN_CoreClkOut_Kinetis != 0
    OnCoreClk_Out();                    // ��PTA6���CoreClock/2
#endif
	
#if EN_FlexClkOut_Kinetis != 0	
    OnFlexClk_Out();                    // ��PTC3���FlexClock 
#endif
}

/*******************************************************************************
* �������ƣ�ClearBss_Kinetis
* ��    ������"BSS"��������ʼ��Ϊ0
*******************************************************************************/
static void ClearBss_Kinetis(void)
{ 
    int32u_t n = 0;  
  
    /* Get the addresses for the .bss section (zero-initialized data) */
    int8u_t* __BSS_START = __section_begin(".bss");
    int8u_t* __BSS_END = __section_end(".bss");
    
    /* Clear the zero-initialized data section */
    n = __BSS_END - __BSS_START;
    while(n--)
      *__BSS_START++ = 0;   
}

/******************************************************************************* 
* �������ƣ�RomToRam_Kinetis
* ��    ����������ROM�е�����ת����RAM��
*******************************************************************************/
static void RomToRam_Kinetis(void)
{
    int32u_t n = 0;

    /* Get the addresses for the .data section (initialized data section) */
    int8u_t* __DATA_RAM = __section_begin(".data");
    int8u_t* __DATA_ROM = __section_begin(".data_init");
    int8u_t* __DATA_ROM_END = __section_end(".data_init");
    
    /* Copy initialized data from ROM to RAM */
    n = __DATA_ROM_END - __DATA_ROM;
    while(n--)
      *__DATA_RAM++ = *__DATA_ROM++;
}

/******************************************************************************* 
* �������ƣ�CodeRelocate_Kinetis
* ��    ����������__ramfunc�������Ӻ�����RAM����CodeRelocate��CodeRelocateRam��������������.icf�ļ����ҵ�)
*******************************************************************************/
static void CodeRelocate_Kinetis(void)
{
    int32u_t n = 0;
  
    /* Get addresses for any code sections that need to be copied from ROM to RAM.
     * The IAR tools have a predefined keyword that can be used to mark individual
     * functions for execution from RAM. Add "__ramfunc" before the return type in
     * the function prototype for any routines you need to execute from RAM instead 
     * of ROM. ex: __ramfunc void foo(void);
    */
    int8u_t* __CODE_RELOCATE_RAM = __section_begin("CodeRelocateRam");
    int8u_t* __CODE_RELOCATE = __section_begin("CodeRelocate");
    int8u_t* __CODE_RELOCATE_END = __section_end("CodeRelocate");
    
    /* Copy functions from ROM to RAM */
    n = __CODE_RELOCATE_END - __CODE_RELOCATE;
    while(n--)
      *__CODE_RELOCATE_RAM++ = *__CODE_RELOCATE++;    
}

/*******************************************************************************
* �������ƣ�Init_VTOR_Kinetis
* ��    ������ʼ���ж�������,��ϵͳĬ�ϵ��ж��������Ϊ�Զ��Ե��ж������� 
*******************************************************************************/
static void Init_VTOR_Kinetis(void)
{     
    /* Addresses for VECTOR_TABLE and VECTOR_RAM come from the linker file */  
    extern int32u_t __VECTOR_TABLE[];          // �� *.icf �ļ��ж���
    extern int32u_t __VECTOR_RAM[];            // �� *.icf �ļ��ж���
    
    int32u_t n = 0;
    int32u_t *ptr1 , *ptr2;
    
    n = 120;
    ptr1 = __VECTOR_RAM;
    ptr2 = __VECTOR_TABLE;
    if (__VECTOR_RAM != __VECTOR_TABLE)        // ���ж��������Ƶ� RAM ��
    {
        while(n--)
          *ptr1++ = *ptr2++;
    }
    /* Point the VTOR to the new copy of the vector table */
    WriteVTOR_Kinetis((int32u_t)__VECTOR_RAM);
}

/*******************************************************************************
* �������ƣ�StartUp_Kinetis
* ��    ����Kinetis����������
*           ��ϵͳ�ϵ�ʱ������ִ�еĵ�һ�δ���,�������ARM������ĳ�ʼ������,����ת���û�����ڳ���
*******************************************************************************/
void StartUp_Kinetis(void)
{
    DisableInterrupts();                  // ���ж�    
    DisWatchDog_Kinetis();                // ���ÿ��Ź�  
    OnGPIOClk_Kinetis();                  // ����GPIOʱ�� 
    
#if EN_InitHook_Kinetis != 0      
    HOOK_BeforeClk_Kinetis();             // ִ���û�����ĳ�ʼ���ӿ� 
#endif
	
    Init_Clock_Kinetis();                 // ��ʼ��ϵͳʱ�� 
	
#if EN_InitHook_Kinetis != 0
    HOOK_AfterClk_Kinetis();              // ִ���û�����ĳ�ʼ���ӿ� 
#endif	
  
#if EN_ResetType_Kinetis != 0  
    ReadResetType_Kinetis();              // ��ȡ��λ���� 
#endif	
  
    RomToRam_Kinetis();                   // ������ROM�е�����ת�Ƶ�RAM��
    CodeRelocate_Kinetis();               // ������__ramfunc�������Ӻ�����RAM��
    ClearBss_Kinetis();                   // ����BSS���� 
    Init_VTOR_Kinetis();                  // ��ʼ���ж�������     
		
    main();                               // ��ת��main���� 
    while(1);                             // ���򲻻�ִ�е�����
}