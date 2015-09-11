///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    05/May/2015  18:16:58 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\2014���ܳ�\���ܳ�����\5��3��ת���\SD_System\SD_dr /
//                    iver.c                                                  /
//    Command line =  E:\2014���ܳ�\���ܳ�����\5��3��ת���\SD_System\SD_dr /
//                    iver.c -D IAR -lCN E:\2014���ܳ�\���ܳ�����\5��3��ת�� /
//                    ���\Flash_512K\List\ -lB E:\2014���ܳ�\���ܳ�����\5��3� /
//                    �ת���\Flash_512K\List\ -o                           /
//                    E:\2014���ܳ�\���ܳ�����\5��3��ת���\Flash_512K\Obj\ /
//                     --no_cse --no_unroll --no_inline --no_code_motion      /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M4 -e --char_is_signed     /
//                    --fpu=None --dlib_config "D:\Program Files              /
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
//                    \SD_driver.s                                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME SD_driver

        #define SHT_PROGBITS 0x1

        PUBLIC CloseSD
        PUBLIC Flag_SDRdy
        PUBLIC SD_driver_Init
        PUBLIC SetSD_High
        PUBLIC SetSD_Low
        PUBLIC Wait_SDRdy
        PUBLIC flag_err_sd
        PUBLIC flag_sdhc
        PUBLIC flag_test_sd
        PUBLIC jc_sd_cmd
        PUBLIC sd_init
        PUBLIC sd_initover
        PUBLIC sd_rdata
        PUBLIC sd_readsingleblock
        PUBLIC sd_writesingleblock
        PUBLIC sd_yes

// E:\2014���ܳ�\���ܳ�����\5��3��ת���\SD_System\SD_driver.c
//    1 /******************************************************************************
//    2 
//    3 * SD_driver.c
//    4 
//    5 * sd���ĵײ������ļ�   
//    6 
//    7 * ��һ���ߣ�  �ͳ�   (���Ľ�����ͷ)
//    8   �������������Ľ� (����������ͷ)
//    9 * �汾��V1.15 (��V1.13��v1.14�������,��ʹ��˫����ʱ��V1.10֮��İ汾�����)
//   10 * �汾����ʱ�䣺2012��1��30��
//   11   
//   12 * ����оƬ��MK10N512VMD100
//   13   ����ƽ̨��CodeWarrior 10.1
//   14 
//   15 * (!!!����Ӳ��ƽ̨������޸�!!!)                
//   16  
//   17 ******************************************************************************/
//   18 
//   19 #include "./SD_System.h"
//   20                                   
//   21 #ifdef EN_SD                  
//   22  

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   23 byte_sd sd_initover = 0; /* SD����ʼ��������־ */
sd_initover:
        DS8 1
//   24 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   25 byte_sd sd_yes=0;  //�ж��Ƿ���SD��(û��Ϊ0����Ϊ1)
sd_yes:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   26 byte_sd flag_sdhc; //sdhc����־,=1��Ч         /************By Sword************/ 
flag_sdhc:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   27 byte_sd flag_test_sd; //����ʹ��               /************By Sword************/ 
flag_test_sd:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   28 byte_sd flag_err_sd;  //SD�����־             /************By Sword************/ 
flag_err_sd:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   29 byte_sd Flag_SDRdy;    //SD��������־(=1��SD������)
Flag_SDRdy:
        DS8 1
//   30 
//   31 /*�ڲ�����*/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32 static byte_sd resp_sd[4];                     /************By Sword************/ 
resp_sd:
        DS8 4
//   33 
//   34 /**************************�ڲ���������**************************/
//   35 #if DELAY_WaitRead_SD != 0
//   36 /**********************************************************
//   37 * function:SD_Delay_ReadByte
//   38 * description:��ȡ1Byte����֮�����ʱ,��ʱʱ����SD_driver.h
//   39 *             �ж��塣
//   40 **********************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   41 static void SD_Delay_ReadByte(void)
//   42 {
//   43 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
SD_Delay_ReadByte:
        nop              
        nop              
        nop              
        nop              
        nop              
//   44 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
        nop              
        nop              
        nop              
        nop              
        nop              
//   45 
//   46 #if DELAY_WaitRead_SD > 1
//   47 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
        nop              
        nop              
        nop              
        nop              
        nop              
//   48 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
        nop              
        nop              
        nop              
        nop              
        nop              
//   49 #endif
//   50 	
//   51 #if DELAY_WaitRead_SD > 2
//   52 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
        nop              
        nop              
        nop              
        nop              
        nop              
//   53 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
        nop              
        nop              
        nop              
        nop              
        nop              
//   54 #endif
//   55 	
//   56 #if DELAY_WaitRead_SD > 3
//   57 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
        nop              
        nop              
        nop              
        nop              
        nop              
//   58 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
        nop              
        nop              
        nop              
        nop              
        nop              
//   59 #endif
//   60 	
//   61 #if DELAY_WaitRead_SD > 4
//   62 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
        nop              
        nop              
        nop              
        nop              
        nop              
//   63 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
        nop              
        nop              
        nop              
        nop              
        nop              
//   64 #endif
//   65 	
//   66 #if DELAY_WaitRead_SD > 5
//   67 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
//   68 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
//   69 #endif	
//   70 
//   71 #if DELAY_WaitRead_SD > 6
//   72 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
//   73 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
//   74 #endif
//   75 	
//   76 #if DELAY_WaitRead_SD > 7
//   77 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
//   78 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
//   79 #endif
//   80 	
//   81 #if DELAY_WaitRead_SD > 8
//   82 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
//   83 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
//   84 #endif
//   85 	
//   86 #if DELAY_WaitRead_SD > 9
//   87 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
//   88 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
//   89 #endif
//   90 	
//   91 #if DELAY_WaitRead_SD > 10
//   92 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
//   93 	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
//   94 #endif	
//   95 }
        BX       LR               ;; return
//   96 #endif
//   97 /**********************************************************
//   98 * function:SD_WriteByte
//   99 * description:д��1Byte���ݣ���ѯ��ʽ��
//  100 **********************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  101 static void SD_WriteByte(byte_sd jc_data) 
//  102 {	
//  103 	SPI1_SR |= SPI_SR_EOQF_MASK;
SD_WriteByte:
        LDR.W    R1,??DataTable11  ;; 0x4002d02c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10000000
        LDR.W    R2,??DataTable11  ;; 0x4002d02c
        STR      R1,[R2, #+0]
//  104 	SPI1_MCR &= (~SPI_MCR_HALT_MASK) & (~SPI_MCR_MDIS_MASK);   /* ����RUNNING״̬ */
        LDR.W    R1,??DataTable11_1  ;; 0x4002d000
        LDR      R1,[R1, #+0]
        LDR.W    R2,??DataTable11_2  ;; 0xffffbffe
        ANDS     R1,R2,R1
        LDR.W    R2,??DataTable11_1  ;; 0x4002d000
        STR      R1,[R2, #+0]
//  105 	
//  106 	SPI1_PUSHR = SPI_PUSHR_CTAS(0) | SPI_PUSHR_EOQ_MASK | SPI_PUSHR_CTCNT_MASK | jc_data;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R0,R0,#0xC000000
        LDR.W    R1,??DataTable11_3  ;; 0x4002d034
        STR      R0,[R1, #+0]
//  107 	                                                           /* д�����ݲ���ռ����Ĵ��� */ 
//  108 	                                                           /* ��λEOQ��ʾ�������Ƕ��������һ��,��ʹ�ܷ��� */
//  109 	
//  110 	while((SPI1_SR & SPI_SR_TCF_MASK) == 0);	
??SD_WriteByte_0:
        LDR.W    R0,??DataTable11  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??SD_WriteByte_0
//  111 	SPI1_SR |= SPI_SR_TCF_MASK;
        LDR.W    R0,??DataTable11  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.W    R1,??DataTable11  ;; 0x4002d02c
        STR      R0,[R1, #+0]
//  112 	
//  113 	SPI1_MCR |= SPI_MCR_CLR_TXF_MASK | SPI_MCR_CLR_RXF_MASK;   /* ��ն���(������Ҫ) */
        LDR.W    R0,??DataTable11_1  ;; 0x4002d000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xC00
        LDR.W    R1,??DataTable11_1  ;; 0x4002d000
        STR      R0,[R1, #+0]
//  114 }
        BX       LR               ;; return
//  115 /**********************************************************
//  116 * function:SD_ReadByte
//  117 * description:����1Byte���ݣ���ѯ��ʽ��
//  118 **********************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  119 static byte_sd SD_ReadByte(byte_sd jc_data)
//  120 {	
SD_ReadByte:
        PUSH     {R7,LR}
//  121 	byte_sd dat;
//  122 	
//  123 	SPI1_SR |= SPI_SR_EOQF_MASK;
        LDR.W    R1,??DataTable11  ;; 0x4002d02c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10000000
        LDR.W    R2,??DataTable11  ;; 0x4002d02c
        STR      R1,[R2, #+0]
//  124 	SPI1_MCR &= (~SPI_MCR_HALT_MASK) & (~SPI_MCR_MDIS_MASK);   /* ����RUNNING״̬ */
        LDR.W    R1,??DataTable11_1  ;; 0x4002d000
        LDR      R1,[R1, #+0]
        LDR.W    R2,??DataTable11_2  ;; 0xffffbffe
        ANDS     R1,R2,R1
        LDR.W    R2,??DataTable11_1  ;; 0x4002d000
        STR      R1,[R2, #+0]
//  125 		
//  126 	SPI1_PUSHR = SPI_PUSHR_CTAS(0) | SPI_PUSHR_EOQ_MASK |SPI_PUSHR_CTCNT_MASK | jc_data;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R0,R0,#0xC000000
        LDR.W    R1,??DataTable11_3  ;; 0x4002d034
        STR      R0,[R1, #+0]
//  127 		
//  128 	while((SPI1_SR & SPI_SR_TCF_MASK) == 0);
??SD_ReadByte_0:
        LDR.W    R0,??DataTable11  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??SD_ReadByte_0
//  129 	SPI1_SR |= SPI_SR_TCF_MASK;
        LDR.W    R0,??DataTable11  ;; 0x4002d02c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.W    R1,??DataTable11  ;; 0x4002d02c
        STR      R0,[R1, #+0]
//  130 	
//  131 #if DELAY_WaitRead_SD != 0	
//  132 	SD_Delay_ReadByte();
        BL       SD_Delay_ReadByte
//  133 #endif	
//  134 		
//  135 	dat = (byte_sd)SPI1_POPR;
        LDR.W    R0,??DataTable11_4  ;; 0x4002d038
        LDR      R0,[R0, #+0]
//  136 	
//  137 	SPI1_MCR |= SPI_MCR_CLR_TXF_MASK | SPI_MCR_CLR_RXF_MASK;
        LDR.W    R1,??DataTable11_1  ;; 0x4002d000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xC00
        LDR.W    R2,??DataTable11_1  ;; 0x4002d000
        STR      R1,[R2, #+0]
//  138 	
//  139 	return dat;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return
//  140 }
//  141 
//  142 
//  143 /*
//  144 �������ƣ�close_SD
//  145 �������ܣ��ر�SD��(�ر��������ߵ�ͬʱ����sd���ñ�־����sd_yes)
//  146 �� д �ߣ�Sword
//  147 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  148 void CloseSD(void)
//  149 {
//  150   sd_yes = 0;
CloseSD:
        LDR.W    R0,??DataTable11_5
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  151   OFF_SD_CS;
        LDR.W    R0,??DataTable11_6  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable11_6  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  152   SIM_SCGC6 &= ~SIM_SCGC6_SPI1_MASK;              /* �ر�SPI1ʱ�� */
        LDR.W    R0,??DataTable11_7  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2000
        LDR.W    R1,??DataTable11_7  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  153 }
        BX       LR               ;; return
//  154 /*
//  155 �������ܣ�SetSD_Low
//  156 �������ƣ��趨����Ϊ����(ԼΪ230kHz)
//  157 �� д �ߣ�Sword
//  158 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  159 void SetSD_Low(void)
//  160 {
//  161 	SPI1_CTAR0 &= (~SPI_CTAR_DBR_MASK) & (~SPI_CTAR_BR_MASK) & (~SPI_CTAR_PBR_MASK);
SetSD_Low:
        LDR.W    R0,??DataTable11_8  ;; 0x4002d00c
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable11_9  ;; 0x7ffcfff0
        ANDS     R0,R1,R0
        LDR.W    R1,??DataTable11_8  ;; 0x4002d00c
        STR      R0,[R1, #+0]
//  162 	SPI1_CTAR0 |= SPI_CTAR_BR(7) | SPI_CTAR_PBR(1);
        LDR.W    R0,??DataTable11_8  ;; 0x4002d00c
        LDR      R0,[R0, #+0]
        ORR      R0,R0,#0x10000
        ORRS     R0,R0,#0x7
        LDR.W    R1,??DataTable11_8  ;; 0x4002d00c
        STR      R0,[R1, #+0]
//  163 	/* DBR = 0, BR = 128, PBR = 3 ; f = f(bus)/PBR * [(1+DBR)/BR] */
//  164 }
        BX       LR               ;; return
//  165 /*
//  166 �������ܣ�SetSD_High
//  167 �������ƣ��趨����Ϊ����(ԼΪ15MHz)
//  168 �� д �ߣ�Sword
//  169 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  170 void SetSD_High(void)
//  171 {
//  172 	SPI1_CTAR0 &= (~SPI_CTAR_DBR_MASK) & (~SPI_CTAR_BR_MASK) & (~SPI_CTAR_PBR_MASK);
SetSD_High:
        LDR.W    R0,??DataTable11_8  ;; 0x4002d00c
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable11_9  ;; 0x7ffcfff0
        ANDS     R0,R1,R0
        LDR.W    R1,??DataTable11_8  ;; 0x4002d00c
        STR      R0,[R1, #+0]
//  173   SPI1_CTAR0 |= SPI_CTAR_BR(0) | SPI_CTAR_PBR(1);
        LDR.W    R0,??DataTable11_8  ;; 0x4002d00c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable11_8  ;; 0x4002d00c
        STR      R0,[R1, #+0]
//  174 	/* DBR = 0, BR = 2, PBR = 3 ; f = f(bus)/PBR * [(1+DBR)/BR] */
//  175 }
        BX       LR               ;; return
//  176 /*
//  177 �������ƣ�SD_driver_Init
//  178 �������ܣ�SD����Ӳ����ʼ��
//  179 �� д �ߣ�Sword
//  180 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  181 void SD_driver_Init(void)
//  182 { 
//  183 	SIM_SCGC6 |= SIM_SCGC6_SPI1_MASK;              /* ʹ��SPI1ʱ�� */
SD_driver_Init:
        LDR.W    R0,??DataTable11_7  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000
        LDR.W    R1,??DataTable11_7  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  184 	
//  185 	PORTE_PCR0 = PORT_PCR_MUX(2) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
        LDR.W    R0,??DataTable11_10  ;; 0x4004d000
        MOVW     R1,#+515
        STR      R1,[R0, #+0]
//  186 	PORTE_PCR1 = PORT_PCR_MUX(2) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
        LDR.W    R0,??DataTable11_11  ;; 0x4004d004
        MOVW     R1,#+515
        STR      R1,[R0, #+0]
//  187 	PORTE_PCR2 = PORT_PCR_MUX(2) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
        LDR.W    R0,??DataTable11_12  ;; 0x4004d008
        MOVW     R1,#+515
        STR      R1,[R0, #+0]
//  188 	PORTE_PCR3 = PORT_PCR_MUX(2) | PORT_PCR_PE_MASK;
        LDR.W    R0,??DataTable11_13  ;; 0x4004d00c
        MOVW     R1,#+514
        STR      R1,[R0, #+0]
//  189 	                                               /* ��PE0-PE3��ΪSPI����,PTE0-2ʹ����������,PTE3Ϊ�������� */
//  190 	PORTE_PCR5 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
        LDR.W    R0,??DataTable11_14  ;; 0x4004d014
        MOVW     R1,#+259
        STR      R1,[R0, #+0]
//  191 	GPIOE_PDDR |= (1<<5);                          /* ��PE5��Ϊ��ͨIO,����CS */
        LDR.W    R0,??DataTable11_15  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable11_15  ;; 0x400ff114
        STR      R0,[R1, #+0]
//  192 	OFF_SD_CS;
        LDR.W    R0,??DataTable11_6  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable11_6  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  193 	
//  194 	SPI1_MCR |= SPI_MCR_MSTR_MASK | SPI_MCR_PCSIS(0x1F);                 
        LDR.W    R0,??DataTable11_1  ;; 0x4002d000
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable11_16  ;; 0x801f0000
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable11_1  ;; 0x4002d000
        STR      R0,[R1, #+0]
//  195 	                                               /* ����ΪSPI����,CS����Ч״̬Ϊ�ߵ�ƽ */
//  196 	
//  197 	SPI1_RSER |= SPI_RSER_TCF_RE_MASK | SPI_RSER_EOQF_RE_MASK;
        LDR.W    R0,??DataTable11_17  ;; 0x4002d030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x90000000
        LDR.W    R1,??DataTable11_17  ;; 0x4002d030
        STR      R0,[R1, #+0]
//  198 	
//  199 	SPI1_CTAR0 = SPI_CTAR_FMSZ(7);                 
        LDR.W    R0,??DataTable11_8  ;; 0x4002d00c
        MOVS     R1,#+939524096
        STR      R1,[R0, #+0]
//  200 	                                               /* ����һ֡����8bit */
//  201 }
        BX       LR               ;; return
//  202 /**********************************************************
//  203 * function:Wait_SDRdy
//  204 * description:�ȴ�SD������(����SD��д������ʱSD������æ״̬)
//  205 * Input:�ȴ�ʱ��
//  206 **********************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  207 void Wait_SDRdy(dword_sd Limit)
//  208 {
Wait_SDRdy:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  209   dword_sd retry=0;
        MOVS     R5,#+0
//  210   while(Flag_SDRdy==0 && (++retry)<Limit) 
??Wait_SDRdy_0:
        LDR.W    R0,??DataTable11_18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Wait_SDRdy_1
        ADDS     R5,R5,#+1
        CMP      R5,R4
        BCS.N    ??Wait_SDRdy_1
//  211   {
//  212     C_WDOG();
        CPSID i          
        LDR.W    R0,??DataTable11_19  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable11_19  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable11_20
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Wait_SDRdy_2
        CPSIE i          
//  213     if(SD_ReadByte(0xff)!=0)
??Wait_SDRdy_2:
        MOVS     R0,#+255
        BL       SD_ReadByte
        CMP      R0,#+0
        BEQ.N    ??Wait_SDRdy_0
//  214     {
//  215       Flag_SDRdy=1;
        LDR.W    R0,??DataTable11_18
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  216       break;
//  217     }
//  218   }
//  219 }
??Wait_SDRdy_1:
        POP      {R0,R4,R5,PC}    ;; return
//  220 /*********************************************************/
//  221 //function:jc_sd_cmd
//  222 //description:��SD����������
//  223 //input: 48���ֽڣ�ǰ8λΪCMDָ�����32λΪ��ַ������
//  224 //       ���8λΪCRCУ�飨��ģʽ��SPIģʽ����Ч��
//  225 /***********************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  226 byte_sd jc_sd_cmd(byte_sd cmd,dword_sd arg,byte_sd crc)
//  227 {
jc_sd_cmd:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R7,R2
//  228   byte_sd r1,i;
//  229   word_sd retry=0;
        MOVS     R5,#+0
//  230  
//  231   if(Flag_SDRdy == 0)
        LDR.W    R0,??DataTable11_18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??jc_sd_cmd_0
//  232   {
//  233     Wait_SDRdy(SD_LONG_Wait);
        LDR.W    R0,??DataTable11_21  ;; 0x1e8480
        BL       Wait_SDRdy
//  234     OFF_SD_CS;
        LDR.W    R0,??DataTable11_6  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable11_6  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  235   }
//  236  
//  237   SD_WriteByte(0xff);
??jc_sd_cmd_0:
        MOVS     R0,#+255
        BL       SD_WriteByte
//  238   ON_SD_CS;
        LDR.W    R0,??DataTable11_22  ;; 0x400ff108
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable11_22  ;; 0x400ff108
        STR      R0,[R1, #+0]
//  239   SD_WriteByte(0xff);
        MOVS     R0,#+255
        BL       SD_WriteByte
//  240   SD_WriteByte(cmd|0x40);
        ORRS     R0,R4,#0x40
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SD_WriteByte
//  241   if(flag_sdhc==0)      /************By Sword************/  
        LDR.W    R0,??DataTable11_23
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??jc_sd_cmd_1
//  242     arg=arg << 9;  //���ڷ�sdhc��sd��,����ַ�����ֽ�Ϊ��λ��
        LSLS     R6,R6,#+9
//  243 //����sdhc��sd1.0������   
//  244   SD_WriteByte((byte_sd)((arg>>24)&0x0000FF)); //����32λ��ַ
??jc_sd_cmd_1:
        LSRS     R0,R6,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SD_WriteByte
//  245   SD_WriteByte((byte_sd)((arg>>16)&0x0000FF));
        LSRS     R0,R6,#+16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SD_WriteByte
//  246   SD_WriteByte((byte_sd)((arg>>8)&0x0000FF));
        LSRS     R0,R6,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SD_WriteByte
//  247   SD_WriteByte((byte_sd)(arg&0x0000FF));
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SD_WriteByte
//  248   SD_WriteByte(crc); 
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SD_WriteByte
//  249   do
//  250   {
//  251   	r1=SD_ReadByte(0xff);
??jc_sd_cmd_2:
        MOVS     R0,#+255
        BL       SD_ReadByte
        MOVS     R6,R0
//  252     retry++;
        ADDS     R5,R5,#+1
//  253     C_WDOG(); //�忪�Ź� 
        CPSID i          
        LDR.W    R0,??DataTable11_19  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable11_19  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable11_20
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??jc_sd_cmd_3
        CPSIE i          
//  254     if(retry==250) 
??jc_sd_cmd_3:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+250
        BNE.N    ??jc_sd_cmd_4
//  255     {
//  256       retry=0;
        MOVS     R5,#+0
//  257       break;
        B.N      ??jc_sd_cmd_5
//  258     }
//  259        
//  260   }while(r1==0xff);
??jc_sd_cmd_4:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+255
        BEQ.N    ??jc_sd_cmd_2
//  261   if(cmd==8||cmd==58)   /************By Sword************/  
??jc_sd_cmd_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BEQ.N    ??jc_sd_cmd_6
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+58
        BNE.N    ??jc_sd_cmd_7
//  262     for(i=0;i<4;i++) resp_sd[i]=SD_ReadByte(0xff);   
??jc_sd_cmd_6:
        MOVS     R4,#+0
        B.N      ??jc_sd_cmd_8
??jc_sd_cmd_9:
        MOVS     R0,#+255
        BL       SD_ReadByte
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable11_24
        STRB     R0,[R4, R1]
        ADDS     R4,R4,#+1
??jc_sd_cmd_8:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BCC.N    ??jc_sd_cmd_9
//  263 //��ȡsdhc���������Ϣ 
//  264   OFF_SD_CS;
??jc_sd_cmd_7:
        LDR.N    R0,??DataTable11_6  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable11_6  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  265   SD_WriteByte(0xff);
        MOVS     R0,#+255
        BL       SD_WriteByte
//  266   return(r1);
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
//  267 }
//  268 /*********************************************************/
//  269 //function: sd_init
//  270 //description:sd����ʼ������
//  271 /***********************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  272 byte_sd sd_init(void)
//  273 {
sd_init:
        PUSH     {R3-R5,LR}
//  274   byte_sd i=0,r1=0;
        MOVS     R5,#+0
        MOVS     R0,#+0
//  275   word_sd retry=0;
        MOVS     R4,#+0
//  276   for(i=0;i<10;i++)
        MOVS     R1,#+0
        MOVS     R5,R1
        B.N      ??sd_init_0
//  277     SD_WriteByte(0xFF);//�ȴ�74��ʱ�����ڣ�sd������ѹ��������ֵ
??sd_init_1:
        MOVS     R0,#+255
        BL       SD_WriteByte
        ADDS     R5,R5,#+1
??sd_init_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+10
        BCC.N    ??sd_init_1
//  278   
//  279   flag_sdhc=1; //��Ĭ��Ϊsdhc��
        LDR.N    R0,??DataTable11_23
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  280   
//  281   do
//  282    {
//  283       //����CMD0����SD������IDLE״̬
//  284       r1 = jc_sd_cmd(0,0,0x95);
??sd_init_2:
        MOVS     R2,#+149
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       jc_sd_cmd
//  285       retry++;
        ADDS     R4,R4,#+1
//  286       C_WDOG(); //�忪�Ź�
        CPSID i          
        LDR.N    R1,??DataTable11_19  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.N    R1,??DataTable11_19  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.N    R1,??DataTable11_20
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??sd_init_3
        CPSIE i          
//  287    } while ((r1 != 0x01) && (retry < 100));
??sd_init_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??sd_init_4
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+100
        BCC.N    ??sd_init_2
//  288   if (retry==100) 
??sd_init_4:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+100
        BNE.N    ??sd_init_5
//  289    {          //����CMD0����
//  290      flag_err_sd=SDERR_CMD0;
        LDR.N    R0,??DataTable11_25
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  291      return 1; 
        MOVS     R0,#+1
        B.N      ??sd_init_6
//  292    }
//  293   retry=0;
??sd_init_5:
        MOVS     R4,#+0
//  294  
//  295   //����ȷ����SDHC����SD1.0
//  296   r1=jc_sd_cmd(8,0x1aa,0x87);
        MOVS     R2,#+135
        MOV      R1,#+426
        MOVS     R0,#+8
        BL       jc_sd_cmd
//  297   if(r1!=0x01||resp_sd[2]!=1||resp_sd[3]!=170) flag_sdhc=0;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??sd_init_7
        LDR.N    R0,??DataTable11_24
        LDRB     R0,[R0, #+2]
        CMP      R0,#+1
        BNE.N    ??sd_init_7
        LDR.N    R0,??DataTable11_24
        LDRB     R0,[R0, #+3]
        CMP      R0,#+170
        BEQ.N    ??sd_init_8
??sd_init_7:
        LDR.N    R0,??DataTable11_23
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  298  /************By Sword************/ 
//  299    
//  300   retry=0;
??sd_init_8:
        MOVS     R4,#+0
//  301   //����cmd55+acmd41ʹsd��������spiģʽ
//  302   do
//  303    {
//  304       r1=jc_sd_cmd(55,0,0xff);
??sd_init_9:
        MOVS     R2,#+255
        MOVS     R1,#+0
        MOVS     R0,#+55
        BL       jc_sd_cmd
//  305       if(r1==0x01)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??sd_init_10
//  306         r1=jc_sd_cmd(41,((dword_sd)flag_sdhc)<<30,0xff);
        MOVS     R2,#+255
        LDR.N    R0,??DataTable11_23
        LDRB     R0,[R0, #+0]
        LSLS     R1,R0,#+30
        MOVS     R0,#+41
        BL       jc_sd_cmd
//  307       retry++;
??sd_init_10:
        ADDS     R4,R4,#+1
//  308       C_WDOG(); //�忪�Ź� 
        CPSID i          
        LDR.N    R1,??DataTable11_19  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.N    R1,??DataTable11_19  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.N    R1,??DataTable11_20
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??sd_init_11
        CPSIE i          
//  309    } while ((r1 != 0x00) && (retry < 100));
??sd_init_11:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??sd_init_12
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+100
        BCC.N    ??sd_init_9
//  310   
//  311   if(retry>=100)
??sd_init_12:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+100
        BCC.N    ??sd_init_13
//  312    {       //����ACMD41ָ��ʱ����
//  313      flag_err_sd=SDERR_ACMD41; 
        LDR.N    R0,??DataTable11_25
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  314      return 1;
        MOVS     R0,#+1
        B.N      ??sd_init_6
//  315    }
//  316    
//  317   if(flag_sdhc) 
??sd_init_13:
        LDR.N    R0,??DataTable11_23
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??sd_init_14
//  318    {
//  319      (void)jc_sd_cmd(58,0,0xff);      //����ȷ���Ƿ���sdhc��
        MOVS     R2,#+255
        MOVS     R1,#+0
        MOVS     R0,#+58
        BL       jc_sd_cmd
//  320      if((resp_sd[0]&0x40)==0) flag_sdhc=0; 
        LDR.N    R1,??DataTable11_24
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+25
        BMI.N    ??sd_init_14
        LDR.N    R0,??DataTable11_23
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  321    }
//  322  /************By Sword************/   
//  323 
//  324   return 0;
??sd_init_14:
        MOVS     R0,#+0
??sd_init_6:
        POP      {R1,R4,R5,PC}    ;; return
//  325 }
//  326 /*********************************************************/
//  327 //function:sd_rdata
//  328 //description:��sd����ȡָ����������
//  329 /***********************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  330 byte_sd sd_rdata(byte_sd * data,word_sd len)
//  331 {
sd_rdata:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  332   byte_sd r1=0;
        MOVS     R0,#+0
//  333   word_sd retry=0;
        MOVS     R6,#+0
//  334   /************By Sword************/  
//  335  //ԭ��retryΪbyte_sd��  
//  336   ON_SD_CS;
        LDR.N    R1,??DataTable11_22  ;; 0x400ff108
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x20
        LDR.N    R2,??DataTable11_22  ;; 0x400ff108
        STR      R1,[R2, #+0]
//  337   do
//  338   {
//  339     r1=SD_ReadByte(0xff);
??sd_rdata_0:
        MOVS     R0,#+255
        BL       SD_ReadByte
//  340     retry++;
        ADDS     R6,R6,#+1
//  341   }while(r1!=0xfe&&retry<500);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+254
        BEQ.N    ??sd_rdata_1
        MOV      R1,#+500
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,R1
        BCC.N    ??sd_rdata_0
//  342   if(retry>=500) return r1;
??sd_rdata_1:
        MOV      R1,#+500
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,R1
        BCC.N    ??sd_rdata_2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??sd_rdata_3
//  343 /************By Sword************/  
//  344  //ԭ��Ϊretry<200��С��200��ʱ��̫��,�ܶ�Ͷ˵Ŀ���������
//  345  //����������������������  
//  346   retry=0;
??sd_rdata_2:
        MOVS     R6,#+0
        B.N      ??sd_rdata_4
//  347   while(len--)
//  348   {
//  349   	C_WDOG(); //�忪�Ź� 
??sd_rdata_5:
        CPSID i          
        LDR.N    R0,??DataTable11_19  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable11_19  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable11_20
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??sd_rdata_6
        CPSIE i          
//  350     *data=SD_ReadByte(0xff);
??sd_rdata_6:
        MOVS     R0,#+255
        BL       SD_ReadByte
        STRB     R0,[R4, #+0]
//  351     data++;
        ADDS     R4,R4,#+1
//  352   }
??sd_rdata_4:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??sd_rdata_5
//  353   SD_WriteByte(0xff);    //�������Ƕ�αָ��
        MOVS     R0,#+255
        BL       SD_WriteByte
//  354   SD_WriteByte(0xff);
        MOVS     R0,#+255
        BL       SD_WriteByte
//  355   OFF_SD_CS;
        LDR.N    R0,??DataTable11_6  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable11_6  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  356   SD_WriteByte(0xff);
        MOVS     R0,#+255
        BL       SD_WriteByte
//  357   return 0;
        MOVS     R0,#+0
??sd_rdata_3:
        POP      {R4-R6,PC}       ;; return
//  358 }
//  359 /*********************************************************/
//  360 //function:sd_readsingleblock
//  361 //description:sd����ȡ�������ݣ�һ��Ϊ512�ֽڣ�
//  362 //input: data   ������ݵ������׵�ַ
//  363 //       sector �����ţ�ע��Ϊ���������ţ�����
//  364 /***********************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  365 byte_sd sd_readsingleblock(byte_sd * data,dword_sd sector)
//  366 {
sd_readsingleblock:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  367    byte_sd r1=0;
        MOVS     R0,#+0
//  368    word_sd retry=0;
        MOVS     R6,#+0
//  369    
//  370    if(Flag_SDRdy == 0)
        LDR.N    R1,??DataTable11_18
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??sd_readsingleblock_0
//  371    {
//  372      Wait_SDRdy(SD_LONG_Wait);
        LDR.N    R0,??DataTable11_21  ;; 0x1e8480
        BL       Wait_SDRdy
//  373      OFF_SD_CS;
        LDR.N    R0,??DataTable11_6  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable11_6  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  374    }
//  375    
//  376  /************By Sword************/  
//  377  //ԭ��retryΪbyte_sd��  
//  378    do
//  379    {
//  380     r1=jc_sd_cmd(17,sector,0);
??sd_readsingleblock_0:
        MOVS     R2,#+0
        MOVS     R1,R5
        MOVS     R0,#+17
        BL       jc_sd_cmd
//  381     retry++;
        ADDS     R6,R6,#+1
//  382    } while(r1!=0&&retry<200);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??sd_readsingleblock_1
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+200
        BCC.N    ??sd_readsingleblock_0
//  383    if(retry>=200) return r1;
??sd_readsingleblock_1:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+200
        BCC.N    ??sd_readsingleblock_2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??sd_readsingleblock_3
//  384  /************By Sword************/  
//  385  //BUG����������ԭ����r1==200 ������ 
//  386    retry=0;
??sd_readsingleblock_2:
        MOVS     R6,#+0
//  387    r1=sd_rdata(data,512);
        MOV      R1,#+512
        MOVS     R0,R4
        BL       sd_rdata
//  388    if(r1!=0) return r1;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??sd_readsingleblock_4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??sd_readsingleblock_3
//  389    else return 0; 
??sd_readsingleblock_4:
        MOVS     R0,#+0
??sd_readsingleblock_3:
        POP      {R4-R6,PC}       ;; return
//  390 } 
//  391 /*********************************************************/
//  392 //function:sd_writesingleblock
//  393 //description:sd��д��������
//  394 //input:Ԥ��ram����ָ�룬�����ţ�ע��Ϊ���������ţ�
//  395 /***********************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  396 byte_sd sd_writesingleblock(byte_sd *data,dword_sd sector)
//  397 {
sd_writesingleblock:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  398 	byte_sd r1=0;
        MOVS     R0,#+0
//  399 	dword_sd i=0;
        MOVS     R6,#+0
//  400   
//  401   if(Flag_SDRdy == 0)
        LDR.N    R1,??DataTable11_18
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??sd_writesingleblock_0
//  402   {
//  403     Wait_SDRdy(SD_LONG_Wait);
        LDR.N    R0,??DataTable11_21  ;; 0x1e8480
        BL       Wait_SDRdy
//  404     OFF_SD_CS;
        LDR.N    R0,??DataTable11_6  ;; 0x400ff104
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable11_6  ;; 0x400ff104
        STR      R0,[R1, #+0]
//  405   }
//  406   
//  407   r1=jc_sd_cmd(24,sector,0);
??sd_writesingleblock_0:
        MOVS     R2,#+0
        MOVS     R1,R5
        MOVS     R0,#+24
        BL       jc_sd_cmd
//  408   
//  409   if(r1!=0) return r1;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??sd_writesingleblock_1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??sd_writesingleblock_2
//  410   ON_SD_CS;
??sd_writesingleblock_1:
        LDR.N    R0,??DataTable11_22  ;; 0x400ff108
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable11_22  ;; 0x400ff108
        STR      R0,[R1, #+0]
//  411   SD_WriteByte(0xff);//�ȷ����������ݵȴ�sd��׼����
        MOVS     R0,#+255
        BL       SD_WriteByte
//  412   SD_WriteByte(0xff);
        MOVS     R0,#+255
        BL       SD_WriteByte
//  413   SD_WriteByte(0xff);
        MOVS     R0,#+255
        BL       SD_WriteByte
//  414   SD_WriteByte(0xfe);//������ʼ����
        MOVS     R0,#+254
        BL       SD_WriteByte
//  415   for(i=0;i<512;i++)
        MOVS     R6,#+0
        B.N      ??sd_writesingleblock_3
//  416   {
//  417     C_WDOG(); //�忪�Ź� 
??sd_writesingleblock_4:
        CPSID i          
        LDR.N    R0,??DataTable11_19  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable11_19  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable11_20
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??sd_writesingleblock_5
        CPSIE i          
//  418     SD_WriteByte(*data++);
??sd_writesingleblock_5:
        LDRB     R0,[R4, #+0]
        BL       SD_WriteByte
        ADDS     R4,R4,#+1
//  419   } 
        ADDS     R6,R6,#+1
??sd_writesingleblock_3:
        MOV      R0,#+512
        CMP      R6,R0
        BCC.N    ??sd_writesingleblock_4
//  420     
//  421   SD_WriteByte(0xff);
        MOVS     R0,#+255
        BL       SD_WriteByte
//  422   SD_WriteByte(0xff);
        MOVS     R0,#+255
        BL       SD_WriteByte
//  423   r1=SD_ReadByte(0xff);
        MOVS     R0,#+255
        BL       SD_ReadByte
//  424   if((r1&0x1f)!=0x05) 
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ANDS     R1,R0,#0x1F
        CMP      R1,#+5
        BEQ.N    ??sd_writesingleblock_6
//  425   {
//  426     OFF_SD_CS;
        LDR.N    R1,??DataTable11_6  ;; 0x400ff104
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x20
        LDR.N    R2,??DataTable11_6  ;; 0x400ff104
        STR      R1,[R2, #+0]
//  427     return (r1 | 0);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??sd_writesingleblock_2
//  428   }
//  429   else
//  430   { //���������ݺ󲢲��ȴ�SD��д��,��������һ��д����ʱ�ٵȴ�
//  431     Flag_SDRdy=0;
??sd_writesingleblock_6:
        LDR.N    R0,??DataTable11_18
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  432     return 0; 
        MOVS     R0,#+0
??sd_writesingleblock_2:
        POP      {R4-R6,PC}       ;; return
//  433   }
//  434 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0x4002d02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x4002d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     0xffffbffe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     0x4002d034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     0x4002d038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     sd_yes

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
        DC32     0x400ff104

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_7:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_8:
        DC32     0x4002d00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_9:
        DC32     0x7ffcfff0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_10:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_11:
        DC32     0x4004d004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_12:
        DC32     0x4004d008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_13:
        DC32     0x4004d00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_14:
        DC32     0x4004d014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_15:
        DC32     0x400ff114

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_16:
        DC32     0x801f0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_17:
        DC32     0x4002d030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_18:
        DC32     Flag_SDRdy

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_19:
        DC32     0x4005200c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_20:
        DC32     sd_initover

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_21:
        DC32     0x1e8480

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_22:
        DC32     0x400ff108

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_23:
        DC32     flag_sdhc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_24:
        DC32     resp_sd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_25:
        DC32     flag_err_sd

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  435 
//  436 #endif    
// 
//    10 bytes in section .bss
// 1 702 bytes in section .text
// 
// 1 702 bytes of CODE memory
//    10 bytes of DATA memory
//
//Errors: none
//Warnings: none
