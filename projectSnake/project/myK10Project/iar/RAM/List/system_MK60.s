///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/Oct/2015  14:59:53
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\gitProject\MyeBEST\projectSnake\lib\CPU\system_MK60.c
//    Command line =  
//        E:\gitProject\MyeBEST\projectSnake\lib\CPU\system_MK60.c -D LPLD_K60
//        -D USE_K60DZ10 -lCN
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\RAM\List\
//        -lB
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\RAM\List\
//        -o
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\RAM\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config "D:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\app\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\CPU\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\config\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\common\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\LPLD\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\LPLD\HW\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\FatFs\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\FatFs\option\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\USB\common\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\USB\driver\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\USB\descriptor\
//        -I
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\..\..\..\lib\USB\class\
//        -Ol -I "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\" -D ARM_MATH_CM4
//    List file    =  
//        E:\gitProject\MyeBEST\projectSnake\project\myK10Project\iar\RAM\List\system_MK60.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_PLL_Setup
        EXTERN LPLD_UART_Init
        EXTERN __aeabi_memcpy4
        EXTERN common_relocate
        EXTERN g_bus_clock
        EXTERN g_core_clock
        EXTERN g_flash_clock
        EXTERN g_flexbus_clock

        PUBLIC DefaultISR
        PUBLIC HardFault_Handler
        PUBLIC SystemCoreClock
        PUBLIC SystemCoreClockUpdate
        PUBLIC SystemInit

// E:\gitProject\MyeBEST\projectSnake\lib\CPU\system_MK60.c
//    1 /**
//    2  * @file system_MK60.c
//    3  * @version 1.2.1[By LPLD]
//    4  * @date 2013-06-18
//    5  * @brief MK60系列单片机系统配置文件
//    6  *
//    7  * 更改建议:禁止修改
//    8  *
//    9  * 该代码提供系统配置函数以及一个储存系统主频的全局变量。
//   10  * 配置函数主要负责建立系统各模块的时钟。
//   11  * 代码还实现常见的系统中断函数。
//   12  *
//   13  * 版权所有:北京拉普兰德电子技术有限公司
//   14  * http://www.lpld.cn
//   15  * mail:support@lpld.cn
//   16  *
//   17  * @par
//   18  * 本代码由拉普兰德[LPLD]开发并维护，并向所有使用者开放源代码。
//   19  * 开发者可以随意修使用或改源代码。但本段及以上注释应予以保留。
//   20  * 不得更改或删除原版权所有者姓名，二次开发者可以加注二次版权所有者。
//   21  * 但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
//   22  * 拉普兰德不负责由于使用本代码所带来的任何事故、法律责任或相关不良影响。
//   23  * 拉普兰德无义务解释、说明本代码的具体原理、功能、实现方法。
//   24  * 除非拉普兰德[LPLD]授权，开发者不得将本代码用于商业产品。
//   25  */
//   26 
//   27 #include <stdint.h>
//   28 #include "common.h"
//   29 
//   30 #define DISABLE_WDOG    1
//   31 
//   32 /*----------------------------------------------------------------------------
//   33   定义时钟相关值
//   34  *----------------------------------------------------------------------------*/
//   35 #define CPU_XTAL32k_CLK_HZ              32768u          //外部32k时钟晶振频率，单位Hz    
//   36 #define CPU_INT_SLOW_CLK_HZ             32768u          //慢速内部振荡器的值，单位Hz
//   37 #define CPU_INT_FAST_CLK_HZ             4000000u        //快速内部振荡器的值，单位Hz
//   38 #define DEFAULT_SYSTEM_CLOCK            100000000u      //默认系统主频，单位Hz
//   39 
//   40 static void flash_identify (void);
//   41 static void cpu_identify (void);
//   42 static void Diagnostic_Reset_Source(void);
//   43 /**
//   44  * @brief 系统主频（单位Hz）
//   45  */

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   46 uint32_t SystemCoreClock = DEFAULT_SYSTEM_CLOCK;
SystemCoreClock:
        DATA
        DC32 100000000
//   47 
//   48 /**
//   49  * 初始化系统
//   50  *
//   51  * @param  none
//   52  * @return none
//   53  *
//   54  * @brief  初始化MCU硬件系统，包括开放IO时钟、初始化主频、初始化调试串口，
//   55  *         打印调试信息。SystemInit由MCU启动文件调用。
//   56  *         
//   57  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   58 void SystemInit (void) {
SystemInit:
        PUSH     {LR}
        SUB      SP,SP,#+44
//   59   UART_InitTypeDef term_port_structure;
//   60   //使能全部IO时钟
//   61   SIM->SCGC5 |= (SIM_SCGC5_PORTA_MASK
//   62               | SIM_SCGC5_PORTB_MASK
//   63               | SIM_SCGC5_PORTC_MASK
//   64               | SIM_SCGC5_PORTD_MASK
//   65               | SIM_SCGC5_PORTE_MASK );
        LDR.N    R0,??DataTable1  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.N    R1,??DataTable1  ;; 0x40048038
        STR      R0,[R1, #+0]
//   66 #if (DISABLE_WDOG)
//   67   //禁用看门狗模块
//   68   /* WDOG_UNLOCK: WDOGUNLOCK=0xC520 */
//   69   WDOG->UNLOCK = (uint16_t)0xC520u;     /* Key 1 */
        MOVW     R0,#+50464
        LDR.N    R1,??DataTable1_1  ;; 0x4005200e
        STRH     R0,[R1, #+0]
//   70   /* WDOG_UNLOCK : WDOGUNLOCK=0xD928 */
//   71   WDOG->UNLOCK  = (uint16_t)0xD928u;    /* Key 2 */
        MOVW     R0,#+55592
        LDR.N    R1,??DataTable1_1  ;; 0x4005200e
        STRH     R0,[R1, #+0]
//   72   /* WDOG_STCTRLH: ??=0,DISTESTWDOG=0,BYTESEL=0,TESTSEL=0,TESTWDOG=0,??=0,STNDBYEN=1,WAITEN=1,STOPEN=1,DBGEN=0,ALLOWUPDATE=1,WINEN=0,IRQRSTEN=0,CLKSRC=1,WDOGEN=0 */
//   73   WDOG->STCTRLH = (uint16_t)0x01D2u;
        MOV      R0,#+466
        LDR.N    R1,??DataTable1_2  ;; 0x40052000
        STRH     R0,[R1, #+0]
//   74 #endif /* (DISABLE_WDOG) */
//   75   
//   76   //将中断向量表、需在RAM中运行的函数等数据拷贝到RAM中
//   77   common_relocate();
        BL       common_relocate
//   78   
//   79   //初始化各部分时钟：系统内核主频、总线时钟、FlexBus时钟、Flash时钟
//   80   LPLD_PLL_Setup(CORE_CLK_MHZ);
        MOVS     R0,#+96
        BL       LPLD_PLL_Setup
//   81   
//   82   //更新内核主频
//   83   SystemCoreClockUpdate();
        BL       SystemCoreClockUpdate
//   84   
//   85   //获取各部分时钟
//   86   g_core_clock = SystemCoreClock;
        LDR.N    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_4
        STR      R0,[R1, #+0]
//   87   g_bus_clock = g_core_clock / ((uint32_t)((SIM->CLKDIV1 & SIM_CLKDIV1_OUTDIV2_MASK) >> SIM_CLKDIV1_OUTDIV2_SHIFT)+ 1u);
        LDR.N    R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_5  ;; 0x40048044
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+24,#+4
        ADDS     R1,R1,#+1
        UDIV     R0,R0,R1
        LDR.N    R1,??DataTable1_6
        STR      R0,[R1, #+0]
//   88   g_flexbus_clock =  g_core_clock / ((uint32_t)((SIM->CLKDIV1 & SIM_CLKDIV1_OUTDIV3_MASK) >> SIM_CLKDIV1_OUTDIV3_SHIFT)+ 1u);
        LDR.N    R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_5  ;; 0x40048044
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+20,#+4
        ADDS     R1,R1,#+1
        UDIV     R0,R0,R1
        LDR.N    R1,??DataTable1_7
        STR      R0,[R1, #+0]
//   89   g_flash_clock =  g_core_clock / ((uint32_t)((SIM->CLKDIV1 & SIM_CLKDIV1_OUTDIV4_MASK) >> SIM_CLKDIV1_OUTDIV4_SHIFT)+ 1u);
        LDR.N    R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_5  ;; 0x40048044
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+16,#+4
        ADDS     R1,R1,#+1
        UDIV     R0,R0,R1
        LDR.N    R1,??DataTable1_8
        STR      R0,[R1, #+0]
//   90   
//   91   //初始化用于打印调试信息的串口模块
//   92   //TERM_PORT为UART通道，在k60_card.h中定义
//   93   //TERMINAL_BAUD为UART波特率，在k60_card.h中定义
//   94   term_port_structure.UART_Uartx = TERM_PORT;
        LDR.N    R0,??DataTable1_9  ;; 0x4006a000
        STR      R0,[SP, #+12]
//   95   term_port_structure.UART_BaudRate = TERMINAL_BAUD;
        MOVS     R0,#+115200
        STR      R0,[SP, #+16]
//   96   LPLD_UART_Init(term_port_structure);
        ADD      R1,SP,#+12
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//   97   
//   98   //打印系统调试信息
//   99 #ifdef DEBUG_PRINT     
//  100   printf("\r\n");   
//  101   printf("*********** 基于拉普兰德K60底层库 http://www.lpld.cn ***********\r\n");
//  102   printf("OSKinetis固件库版本:%s\tmail:support@lpld.cn\r\n", OSKinetis_Version);
//  103   printf("系统内核时钟:%dMHz\t总线时钟:%dMHz\r\n", g_core_clock/1000000u, g_bus_clock/1000000u);
//  104   printf("FlexBus时钟:%dMHz\tFlash时钟:%dMHz\r\n", g_flexbus_clock/1000000u, g_flash_clock/1000000u);
//  105   printf("系统启动完毕，若要禁用调试输出请定义PRINT_ON_OFF为1(k60_card.h)\r\n");
//  106   cpu_identify();
//  107   Diagnostic_Reset_Source();
//  108   printf("********************************************************************\r\n");
//  109 #endif
//  110   
//  111 }
        ADD      SP,SP,#+44
        POP      {PC}             ;; return
//  112 
//  113 /**
//  114  * 更新SystemCoreClock
//  115  *
//  116  * @param  none
//  117  * @return none
//  118  *
//  119  * @brief  更新全局变量SystemCoreClock的值，以便获取最新的系统内核频率。
//  120  *         
//  121  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  122 void SystemCoreClockUpdate (void) {
//  123   uint32_t temp;
//  124 #if (defined(CPU_MK60DZ10))
//  125   #if OSC_CIRCUIT_TPYE == CANNED_OSC_CIRCUIT
//  126   temp =  CANNED_OSC_CLK_HZ *((uint32_t)(MCG->C6 & MCG_C6_VDIV_MASK) + 24u );
//  127   temp = (uint32_t)(temp/((uint32_t)(MCG->C5 & MCG_C5_PRDIV_MASK) +1u ));
//  128   #elif OSC_CIRCUIT_TPYE == CRYSTAL_OSC_CIRCUIT
//  129   temp =  CRYSTAL_OSC_CLK_HZ *((uint32_t)(MCG->C6 & MCG_C6_VDIV_MASK) + 24u );
SystemCoreClockUpdate:
        LDR.N    R0,??DataTable1_10  ;; 0x40064005
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ANDS     R0,R0,#0x1F
        ADDS     R0,R0,#+24
        LDR.N    R1,??DataTable1_11  ;; 0xf42400
        MULS     R0,R1,R0
//  130   temp = (uint32_t)(temp/((uint32_t)(MCG->C5 & MCG_C5_PRDIV_MASK) +1u ));
        LDR.N    R1,??DataTable1_12  ;; 0x40064004
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ANDS     R1,R1,#0x1F
        ADDS     R1,R1,#+1
        UDIV     R0,R0,R1
//  131   #endif
//  132 #elif (defined(CPU_MK60D10))
//  133   #if OSC_CIRCUIT_TPYE == CANNED_OSC_CIRCUIT
//  134   temp =  CANNED_OSC_CLK_HZ *((uint32_t)(MCG->C6 & MCG_C6_VDIV0_MASK) + 24u );
//  135   temp = (uint32_t)(temp/((uint32_t)(MCG->C5 & MCG_C5_PRDIV0_MASK) +1u ));
//  136   temp = temp;
//  137   #elif OSC_CIRCUIT_TPYE == CRYSTAL_OSC_CIRCUIT
//  138   temp =  CRYSTAL_OSC_CLK_HZ *((uint32_t)(MCG->C6 & MCG_C6_VDIV0_MASK) + 24u );
//  139   temp = (uint32_t)(temp/((uint32_t)(MCG->C5 & MCG_C5_PRDIV0_MASK) +1u ));
//  140   temp = temp;
//  141   #endif
//  142 #elif (defined(CPU_MK60F12) || defined(CPU_MK60F15))
//  143   #if OSC_CIRCUIT_TPYE == CANNED_OSC_CIRCUIT
//  144   temp =  CANNED_OSC_CLK_HZ /((uint32_t)(MCG->C5 & MCG_C5_PRDIV0_MASK) + 1u );
//  145   temp = (uint32_t)(temp*((uint32_t)(MCG->C6 & MCG_C6_VDIV0_MASK) +16u ));
//  146   temp = temp/2;
//  147   #elif OSC_CIRCUIT_TPYE == CRYSTAL_OSC_CIRCUIT
//  148   temp =  CRYSTAL_OSC_CLK_HZ /((uint32_t)(MCG->C5 & MCG_C5_PRDIV0_MASK) + 1u );
//  149   temp = (uint32_t)(temp*((uint32_t)(MCG->C6 & MCG_C6_VDIV0_MASK) +16u ));
//  150   temp = temp/2;
//  151   #endif
//  152 #endif
//  153   SystemCoreClock = temp;
        LDR.N    R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  154 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x4005200e

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x40052000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     SystemCoreClock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     g_core_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     g_bus_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     g_flexbus_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     g_flash_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     0x40064005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     0xf42400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     0x40064004
//  155 
//  156 /**
//  157  * 硬件错误中断函数
//  158  *
//  159  * @param  none
//  160  * @return none
//  161  *
//  162  * @brief  触发此中断的原因一般为：模块使用未初始化、错误的寻址空间等。
//  163  *         
//  164  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  165 void HardFault_Handler(void)
//  166 {
//  167 #ifdef DEBUG_PRINT 
//  168    printf("\r\n****内核发生硬件错误*****\r\n");
//  169 #endif
//  170    return;
HardFault_Handler:
        BX       LR               ;; return
//  171 }
//  172 
//  173 /**
//  174  * 默认中断函数
//  175  *
//  176  * @param  none
//  177  * @return none
//  178  *
//  179  * @brief  未定义中断处理函数的中断源会进入此函数，并打印中断向量号。
//  180  *         
//  181  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  182 void DefaultISR(void)
//  183 {
//  184    #define VECTORNUM                     (*(volatile uint8_t*)(0xE000ED04)) 
//  185 #ifdef DEBUG_PRINT 
//  186    printf("\r\n****进入未定义中断,Interrupt Number %d*****\r\n",VECTORNUM-16);
//  187 #endif
//  188    return;
DefaultISR:
        BX       LR               ;; return
//  189 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  190 
//  191 /**
//  192  * 初始化操作系统的滴答定时器(OS Tick)
//  193  *
//  194  * @param  none
//  195  * @return none
//  196  *
//  197  * @brief  该函数仅在uC/OS等系统中调用，切必须在OSStart()和处理器初始化后调用
//  198  *         
//  199  */
//  200 #if UCOS_II > 0u
//  201 void SystemTickInit (void)
//  202 {
//  203   uint32  cpu_clk_freq;
//  204   uint32  cnts;
//  205 
//  206   cpu_clk_freq = g_core_clock;  //获取SysTick时钟
//  207 
//  208 #if (OS_VERSION >= 30000u)
//  209   cnts  = cpu_clk_freq / (uint32)OSCfg_TickRate_Hz;    
//  210 #else
//  211   cnts  = cpu_clk_freq / (uint32)OS_TICKS_PER_SEC;        
//  212 #endif
//  213 
//  214   OS_CPU_SysTickInit(cnts);     //初始化uCOS滴答定时器SysTick
//  215 }
//  216 #endif
//  217 
//  218 /**
//  219  * Kinetis CPU Identify
//  220  *
//  221  * @param  none
//  222  * @return none
//  223  *
//  224  * @brief 输出Kinetis以下信息
//  225  * - Kinetis family
//  226  * - package
//  227  * - die revision
//  228  * - P-flash size
//  229  * - Ram size
//  230  */
//  231 static void cpu_identify (void)
//  232 {
//  233     /* 判断Kinetis 单片机的型号 */
//  234     switch((SIM->SDID & SIM_SDID_FAMID(0x7))>>SIM_SDID_FAMID_SHIFT) 
//  235     {
//  236 #ifdef DEBUG_PRINT 
//  237     	case 0x0:printf("\nK10-");break;
//  238     	case 0x1:printf("\nK20-");break;
//  239     	case 0x2:printf("\nK30-");break;
//  240     	case 0x3:printf("\nK40-");break;
//  241     	case 0x4:printf("\nK60-");break;
//  242     	case 0x5:printf("\nK70-");break;
//  243     	case 0x6:printf("\nK50-");break;
//  244     	case 0x7:printf("\nK53-");break;
//  245 	default:printf("\n不能识别单片机型号-");break; 
//  246 #else 	
//  247         default:break; 
//  248 #endif
//  249     }
//  250 
//  251      /* 判断Kinetis 单片机的封装 */
//  252     switch((SIM->SDID & SIM_SDID_PINID(0xF))>>SIM_SDID_PINID_SHIFT) 
//  253     {
//  254 #ifdef DEBUG_PRINT
//  255     	case 0x2:printf("32pin-");break;
//  256     	case 0x4:printf("48pin-");break;
//  257     	case 0x5:printf("64pin-");break;
//  258     	case 0x6:printf("80pin-");break;
//  259     	case 0x7:printf("81pin-");break;
//  260     	case 0x8:printf("100pin-");break;
//  261     	case 0x9:printf("104pin-");break;
//  262     	case 0xA:printf("144pin-");break;
//  263     	case 0xC:printf("196pin-");break;
//  264     	case 0xE:printf("256pin-");break;
//  265 	default:printf("不能识别单片机封装-.");break;
//  266 #else 	
//  267         default:break; 
//  268 #endif  	
//  269     }                
//  270 
//  271 #ifdef DEBUG_PRINT
//  272     printf("Silicon rev 1.%d\n",(SIM->SDID & SIM_SDID_REVID(0xF))>>SIM_SDID_REVID_SHIFT);
//  273 #endif  
//  274     /* 判断Kinetis 单片机的P-flash size */
//  275     switch((SIM->FCFG1 & SIM_FCFG1_PFSIZE(0xF))>>SIM_FCFG1_PFSIZE_SHIFT)
//  276     {
//  277 #ifdef DEBUG_PRINT
//  278   #if (defined(CPU_MK60DZ10) || defined(CPU_MK60D10)) 
//  279     	case 0x7:printf("128 kBytes of P-flash	");break;
//  280     	case 0x9:printf("256 kBytes of P-flash	");break;
//  281         case 0xB:printf("512 kBytes of P-flash	");break;
//  282     	case 0xF:printf("512 kBytes of P-flash	");break;
//  283 	default:printf("不能识别单片机 P-flash size\n");break;
//  284   #elif (defined(CPU_MK60F12) || defined(CPU_MK60F15)) 
//  285         case 0xB:printf("512 kBytes of P-flash	");break;
//  286     	case 0xD:printf("1024 kBytes of P-flash	");break;
//  287     	case 0xF:printf("1024 kBytes of P-flash	");break;
//  288 	default:printf("不能识别单片机 P-flash size\n");break;
//  289   #endif
//  290 #else 	
//  291         default:break; 
//  292 #endif
//  293     }
//  294 
//  295 #if (defined(CPU_MK60DZ10) || defined(CPU_MK60D10))
//  296     /* 判断是否只有 P-flash  或者 P-flash 和 FlexNVM */
//  297     if (SIM->FCFG2 & SIM_FCFG2_PFLSH_MASK) 
//  298   #ifdef DEBUG_PRINT
//  299       printf("P-flash only\n");
//  300   #else 
//  301       asm("nop");
//  302   #endif
//  303     else
//  304       /* 如果单片机有FlexNVM、判断Kinetis 单片机的FlexNVM size */
//  305       switch((SIM->FCFG1 & SIM_FCFG1_NVMSIZE(0xF))>>SIM_FCFG1_NVMSIZE_SHIFT)
//  306       {
//  307   #ifdef DEBUG_PRINT
//  308 
//  309       	case 0x0:printf("0 kBytes of FlexNVM\n");break;
//  310     	case 0x7:printf("128 kBytes of FlexNVM\n");break;
//  311         case 0x9:printf("256 kBytes of FlexNVM\n");break;
//  312     	case 0xF:printf("256 kBytes of FlexNVM\n");break;
//  313 	default:printf("不能识别单片机 FlexNVM size\n");break;
//  314   #else 	
//  315         default:break; 
//  316   #endif
//  317       }
//  318 #endif
//  319     
//  320     /* 判断Kinetis 单片机的RAM size */
//  321     switch((SIM->SOPT1 & SIM_SOPT1_RAMSIZE(0xF))>>SIM_SOPT1_RAMSIZE_SHIFT)
//  322     {
//  323 #ifdef DEBUG_PRINT
//  324   #if (defined(CPU_MK60DZ10) || defined(CPU_MK60D10))
//  325     	case 0x5:printf("32 kBytes of RAM\n");break;
//  326     	case 0x7:printf("64 kBytes of RAM\n");break;
//  327     	case 0x8:printf("96 kBytes of RAM\n");break;
//  328     	case 0x9:printf("128 kBytes of RAM\n");break;
//  329 	default:printf("不能识别单片机 RAM size\n");break; 
//  330   #elif (defined(CPU_MK60F12) || defined(CPU_MK60F15))
//  331         case 0x9:printf("128 kBytes of RAM\n");break;
//  332 	default:printf("不能识别单片机 RAM size\n");break;
//  333   #endif
//  334 #else 	
//  335         default:break; 
//  336 #endif
//  337     }
//  338     flash_identify(); 
//  339 }
//  340 
//  341 /**
//  342  * Kinetis flash Identify
//  343  *
//  344  * @param  none
//  345  * @return none
//  346  *
//  347  * @brief 输出Kinetis以下信息
//  348  * - flash parameter revision
//  349  * - flash version ID
//  350  */
//  351 static void flash_identify (void)
//  352 {
//  353   uint8 info[8];
//  354 #if (defined(CPU_MK60DZ10) || defined(CPU_MK60D10)) 
//  355     FTFL->FCCOB0 = 0x03;
//  356     FTFL->FCCOB1 = 0x00;
//  357     FTFL->FCCOB2 = 0x00;
//  358     FTFL->FCCOB3 = 0x00;
//  359     FTFL->FCCOB8 = 0x01;
//  360     FTFL->FSTAT = FTFL_FSTAT_CCIF_MASK;
//  361     while(!(FTFL->FSTAT & FTFL_FSTAT_CCIF_MASK));
//  362     info[0] = FTFL->FCCOB4; info[4] = FTFL->FCCOB8;
//  363     info[1] = FTFL->FCCOB5; info[5] = FTFL->FCCOB9;
//  364     info[2] = FTFL->FCCOB6; info[6] = FTFL->FCCOBA;
//  365     info[3] = FTFL->FCCOB7; info[7] = FTFL->FCCOBB;
//  366 #ifdef DEBUG_PRINT  
//  367     printf("Flash parameter version %d.%d.%d.%d\n",info[0],info[1],info[2],info[3]);
//  368     printf("Flash version ID %d.%d.%d.%d\n",info[4],info[5],info[6],info[7]); 
//  369 #endif  
//  370     FTFL->FSTAT = 0xFF;
//  371 #elif (defined(CPU_MK60F12) || defined(CPU_MK60F15))
//  372     FTFE->FCCOB0 = 0x03;
//  373     FTFE->FCCOB1 = 0x00;
//  374     FTFE->FCCOB2 = 0x00;
//  375     FTFE->FCCOB3 = 0x08;
//  376     FTFE->FCCOB4 = 0x01;   
//  377     FTFE->FSTAT = FTFE_FSTAT_CCIF_MASK;
//  378     while(!(FTFE->FSTAT & FTFE_FSTAT_CCIF_MASK));
//  379     info[0] = FTFE->FCCOB4; info[4] = FTFE->FCCOB8;
//  380     info[1] = FTFE->FCCOB5; info[5] = FTFE->FCCOB9;
//  381     info[2] = FTFE->FCCOB6; info[6] = FTFE->FCCOBA;
//  382     info[3] = FTFE->FCCOB7; info[7] = FTFE->FCCOBB;
//  383 #ifdef DEBUG_PRINT    
//  384     printf("Flash parameter version %d.%d.%d.%d\n",info[0],info[1],info[2],info[3]);
//  385     printf("Flash version ID %d.%d.%d.%d\n",info[4],info[5],info[6],info[7]);  
//  386 #endif   
//  387     FTFE->FSTAT = 0x7F;
//  388 #endif
//  389 }
//  390 
//  391 /**
//  392  * Diagnostic_Reset_Source
//  393  *
//  394  * @param  none
//  395  * @return none
//  396  *
//  397  * @brief 输出Kinetis复位信息
//  398  */
//  399 void Diagnostic_Reset_Source(void)
//  400 {
//  401 #ifdef DEBUG_PRINT 
//  402 #if (defined(CPU_MK60DZ10)) 
//  403   /* 判断上一次复位的原因*/
//  404   if (MC->SRSH & MC_SRSH_SW_MASK)
//  405           printf("Software Reset\n");
//  406   if (MC->SRSH & MC_SRSH_LOCKUP_MASK)
//  407           printf("Core Lockup Event Reset\n");
//  408   if (MC->SRSH & MC_SRSH_JTAG_MASK)
//  409           printf("JTAG Reset\n");
//  410   if (MC->SRSL & MC_SRSL_POR_MASK)
//  411           printf("Power-on Reset\n");
//  412   if (MC->SRSL & MC_SRSL_PIN_MASK)
//  413           printf("External Pin Reset\n");
//  414   if (MC->SRSL & MC_SRSL_COP_MASK)
//  415           printf("Watchdog(COP) Reset\n");
//  416   if (MC->SRSL & MC_SRSL_LOC_MASK)
//  417           printf("Loss of Clock Reset\n");
//  418   if (MC->SRSL & MC_SRSL_LVD_MASK)
//  419           printf("Low-voltage Detect Reset\n");
//  420   if (MC->SRSL & MC_SRSL_WAKEUP_MASK)
//  421           printf("LLWU Reset\n");
//  422 #elif (defined(CPU_MK60F12) || defined(CPU_MK60F15) || defined(CPU_MK60D10))
//  423   
//  424   if (RCM->SRS1 & RCM_SRS1_SACKERR_MASK)
//  425           printf("Stop Mode Acknowledge Error Reset\n");
//  426   if (RCM->SRS1 & RCM_SRS1_EZPT_MASK)
//  427           printf("EzPort Reset\n");
//  428   if (RCM->SRS1 & RCM_SRS1_MDM_AP_MASK)
//  429           printf("MDM-AP Reset\n");
//  430   if (RCM->SRS1 & RCM_SRS1_SW_MASK)
//  431           printf("Software Reset\n");
//  432   if (RCM->SRS1 & RCM_SRS1_LOCKUP_MASK)
//  433           printf("Core Lockup Event Reset\n");
//  434   if (RCM->SRS1 & RCM_SRS1_JTAG_MASK)
//  435           printf("JTAG Reset\n");
//  436   if (RCM->SRS0 & RCM_SRS0_POR_MASK)
//  437           printf("Power-on Reset\n");
//  438   if (RCM->SRS0 & RCM_SRS0_PIN_MASK)
//  439           printf("External Pin Reset\n");
//  440   if (RCM->SRS0 & RCM_SRS0_WDOG_MASK)
//  441           printf("Watchdog(COP) Reset\n");
//  442   if (RCM->SRS0 & RCM_SRS0_LOC_MASK)
//  443           printf("Loss of Clock Reset\n");
//  444   if (RCM->SRS0 & RCM_SRS0_LVD_MASK)
//  445           printf("Low-voltage Detect Reset\n");
//  446   if (RCM->SRS0 & RCM_SRS0_WAKEUP_MASK)
//  447   {
//  448     printf("[outSRS]Wakeup bit set from low power mode exit\n");
//  449     printf("[outSRS]SMC_PMPROT = %#02X ", (SMC->PMPROT))  ;
//  450     printf("[outSRS]SMC_PMCTRL = %#02X ", (SMC->PMCTRL))  ;
//  451     printf("[outSRS]SMC_VLLSCTRL = %#02X ", (SMC->VLLSCTRL))  ;
//  452     printf("[outSRS]SMC_PMSTAT = %#02X \r\n", (SMC->PMSTAT))  ;
//  453 
//  454     if ((SMC->PMCTRL & SMC_PMCTRL_STOPM_MASK)== 3)
//  455       printf("[outSRS] LLS exit \n") ;
//  456     if (((SMC->PMCTRL & SMC_PMCTRL_STOPM_MASK)== 4) && ((SMC->VLLSCTRL & SMC_VLLSCTRL_VLLSM_MASK)== 1))
//  457       printf("[outSRS] VLLS1 exit \n") ;
//  458     if (((SMC->PMCTRL & SMC_PMCTRL_STOPM_MASK)== 4) && ((SMC->VLLSCTRL & SMC_VLLSCTRL_VLLSM_MASK)== 2))
//  459       printf("[outSRS] VLLS2 exit \n") ;
//  460     if (((SMC->PMCTRL & SMC_PMCTRL_STOPM_MASK)== 4) && ((SMC->VLLSCTRL & SMC_VLLSCTRL_VLLSM_MASK)== 3))
//  461       printf("[outSRS] VLLS3 exit \n") ; 
//  462   }
//  463 #endif
//  464 #endif
//  465 }
//  466 
// 
//   4 bytes in section .data
// 254 bytes in section .text
// 
// 254 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: 3
