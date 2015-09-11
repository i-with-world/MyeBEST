///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      10/Jan/2013  19:05:36 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\课外资料\飞思卡尔智能车\日常资料\第八届资料\第八届智 /
//                    能车\直立车调试\ARM\ARM学习使用\20130110\V0.0.3\Library /
//                    \Drivers\ADC\adc.c                                      /
//    Command line =  E:\课外资料\飞思卡尔智能车\日常资料\第八届资料\第八届智 /
//                    能车\直立车调试\ARM\ARM学习使用\20130110\V0.0.3\Library /
//                    \Drivers\ADC\adc.c -D IAR -lCN                          /
//                    E:\课外资料\飞思卡尔智能车\日常资料\第八届资料\第八届智 /
//                    能车\直立车调试\ARM\ARM学习使用\20130110\V0.0.3\Debug\L /
//                    ist\ -lB E:\课外资料\飞思卡尔智能车\日常资料\第八届资料 /
//                    \第八届智能车\直立车调试\ARM\ARM学习使用\20130110\V0.0. /
//                    3\Debug\List\ -o E:\课外资料\飞思卡尔智能车\日常资料\第 /
//                    八届资料\第八届智能车\直立车调试\ARM\ARM学习使用\201301 /
//                    10\V0.0.3\Debug\Obj\ --no_cse --no_unroll --no_inline   /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    D:\Tools\IAR6.30\arm\INC\c\DLib_Config_Normal.h -I      /
//                    E:\课外资料\飞思卡尔智能车\日常资料\第八届资料\第八届智 /
//                    能车\直立车调试\ARM\ARM学习使用\20130110\V0.0.3\Library /
//                    \CPU\ -I E:\课外资料\飞思卡尔智能车\日常资料\第八届资料 /
//                    \第八届智能车\直立车调试\ARM\ARM学习使用\20130110\V0.0. /
//                    3\Library\Drivers\ADC\ -I E:\课外资料\飞思卡尔智能车\日 /
//                    常资料\第八届资料\第八届智能车\直立车调试\ARM\ARM学习使 /
//                    用\20130110\V0.0.3\Library\Drivers\FTM\ -I              /
//                    E:\课外资料\飞思卡尔智能车\日常资料\第八届资料\第八届智 /
//                    能车\直立车调试\ARM\ARM学习使用\20130110\V0.0.3\Library /
//                    \Drivers\GPIO\ -I E:\课外资料\飞思卡尔智能车\日常资料\� /
//                    诎私熳柿蟎第八届智能车\直立车调试\ARM\ARM学习使用\20130 /
//                    110\V0.0.3\Library\Drivers\PIT\ -Ol                     /
//    List file    =  E:\课外资料\飞思卡尔智能车\日常资料\第八届资料\第八届智 /
//                    能车\直立车调试\ARM\ARM学习使用\20130110\V0.0.3\Debug\L /
//                    ist\adc.s                                               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME `adc`

        #define SHT_PROGBITS 0x1

        EXTERN EnableInt_Kinetis
        EXTERN SetIntPri_Kinetis

        PUBLIC ADC_ClockCtrl
        PUBLIC ADC_SetCFG1
        PUBLIC ADC_SetCFG2
        PUBLIC ADC_SetSC
        PUBLIC ADC_readResult

// E:\课外资料\飞思卡尔智能车\日常资料\第八届资料\第八届智能车\直立车调试\ARM\ARM学习使用\20130110\V0.0.3\Library\Drivers\ADC\adc.c
//    1 /*******************************************************************************
//    2 * 文件名称：adc.c
//    3 * 描    述: ADC驱动程序,并没有将对应的引脚设为AD功能（参考纪成师兄驱动程序）
//    4 * 作    者：万冰冰
//    5 * 特别鸣谢：纪成师兄(博客http://blog.chinaaet.com/jihceng0622)
//    6 * 时    间：2012年5月19日
//    7 *******************************************************************************/
//    8 
//    9 #include "adc.h"
//   10 
//   11 
//   12 /*******************************************************************************
//   13 * 函数名称：ADC_ClockCtrl
//   14 * 入口参数：adc    AD转换器选择
//   15                     ADC0_BASE_PTR
//   16                     ADC1_BASE_PTR
//   17 * 描    述：设置AD时钟源
//   18 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   19 void ADC_ClockCtrl(ADC_MemMapPtr adc)
//   20 {
//   21   if(adc == ADC0_BASE_PTR)
ADC_ClockCtrl:
        LDR.N    R1,??DataTable1  ;; 0x4003b000
        CMP      R0,R1
        BNE.N    ??ADC_ClockCtrl_0
//   22   {
//   23     SIM_SCGC6 |= SIM_SCGC6_ADC0_MASK;              // 打开 ADC0 时钟 
        LDR.N    R0,??DataTable1_1  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.N    R1,??DataTable1_1  ;; 0x4004803c
        STR      R0,[R1, #+0]
        B.N      ??ADC_ClockCtrl_1
//   24   }
//   25   else if(adc == ADC1_BASE_PTR)
??ADC_ClockCtrl_0:
        LDR.N    R1,??DataTable1_2  ;; 0x400bb000
        CMP      R0,R1
        BNE.N    ??ADC_ClockCtrl_1
//   26   {
//   27     SIM_SCGC3 |= SIM_SCGC3_ADC1_MASK;              // 打开 ADC1 时钟
        LDR.N    R0,??DataTable1_3  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.N    R1,??DataTable1_3  ;; 0x40048030
        STR      R0,[R1, #+0]
//   28   }  
//   29 }
??ADC_ClockCtrl_1:
        BX       LR               ;; return
//   30 
//   31 /*******************************************************************************
//   32 * 函数名称：ADC_SetCFG1
//   33 * 入口参数：adc    AD转换器选择
//   34                     ADC0_BASE_PTR
//   35                     ADC1_BASE_PTR
//   36             adiv   分频系数
//   37                     00 The divide ratio is 1 and the clock rate is input clock.
//   38                     01 The divide ratio is 2 and the clock rate is (input clock)/2.
//   39                     10 The divide ratio is 4 and the clock rate is (input clock)/4.
//   40                     11 The divide ratio is 8 and the clock rate is (input clock)/8.
//   41             bits   AD采样精度
//   42                     00 When DIFF=0: It is single-ended  8-bit conversion; when DIFF=1, it is differential 9-bit conversionwith 2's complement output.
//   43                     01 When DIFF=0: It is single-ended 12-bit conversion; when DIFF=1, it is differential 13-bit conversionwith 2's complement output.
//   44                     10 When DIFF=0: It is single-ended 10-bit conversion; when DIFF=1, it is differential 11-bit conversionwith 2's complement output.
//   45                     11 When DIFF=0: It is single-ended 16-bit conversion; when DIFF=1, it is differential 16-bit conversionwith 2's complement output
//   46             adiclk AD时钟源选择
//   47                     00 Bus clock.
//   48                     01 Bus clock divided by 2.
//   49                     10 Alternate clock (ALTCLK).
//   50                     11 Asynchronous clock (ADACK)
//   51 * 描    述：设置AD寄存器 ADCx_CFG1
//   52 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   53 void ADC_SetCFG1(ADC_MemMapPtr adc, int8u_t adiv, int8u_t bits, int8u_t adiclk)
//   54 {   
ADC_SetCFG1:
        PUSH     {R4}
//   55   ADC_CFG1_REG(adc) |= ADC_CFG1_ADIV(adiv)            // 配置分频系数
//   56                        + ADC_CFG1_ADLSMP_MASK         // 长采样时间模式
//   57                        + ADC_CFG1_MODE(bits)          // 采样精度
//   58                        + ADC_CFG1_ADICLK(adiclk);     // ADC时钟源选择
        LDR      R4,[R0, #+8]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+5
        ANDS     R1,R1,#0x60
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+2
        ANDS     R2,R2,#0xC
        ADDS     R1,R2,R1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ANDS     R2,R3,#0x3
        ADDS     R1,R2,R1
        ADDS     R1,R1,#+16
        ORRS     R1,R1,R4
        STR      R1,[R0, #+8]
//   59 }
        POP      {R4}
        BX       LR               ;; return
//   60 
//   61 /*******************************************************************************
//   62 * 函数名称：ADC_SetCFG2
//   63 * 入口参数：adc    AD转换器选择
//   64                     ADC0_BASE_PTR
//   65                     ADC1_BASE_PTR
//   66             muxsel ADC Mux select
//   67                     0:ADxxa channels are selected.
//   68                     1:ADxxb channels are selected.
//   69             adhsc  High speed configuration
//   70                     0:Normal conversion sequence selected.
//   71                     1:High speed conversion sequence selected (2 additional ADCK cycles to total conversion time).
//   72             adlsts AD采样时间选择
//   73                     00 Default longest sample time (20 extra ADCK cycles; 24 ADCK cycles total).
//   74                     01 12 extra ADCK cycles; 16 ADCK cycles total sample time.
//   75                     10 6 extra ADCK cycles; 10 ADCK cycles total sample time.
//   76                     11 2 extra ADCK cycles; 6 ADCK cycles total sample time.
//   77 * 描    述：设置AD寄存器 ADCx_CFG2
//   78 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   79 void ADC_SetCFG2(ADC_MemMapPtr adc, int8u_t muxsel, int8u_t adhsc, int8u_t adlsts)
//   80 {
//   81   if(muxsel == 1)
ADC_SetCFG2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BNE.N    ??ADC_SetCFG2_0
//   82   {
//   83     ADC_CFG2_REG(adc) |= ADC_CFG2_MUXSEL_MASK;     // 选择 ADCxxb
        LDR      R1,[R0, #+12]
        ORRS     R1,R1,#0x10
        STR      R1,[R0, #+12]
        B.N      ??ADC_SetCFG2_1
//   84   }
//   85   else
//   86   {
//   87     ADC_CFG2_REG(adc) &= ~ADC_CFG2_MUXSEL_MASK;    // 选择 ADCxxa
??ADC_SetCFG2_0:
        LDR      R1,[R0, #+12]
        BICS     R1,R1,#0x10
        STR      R1,[R0, #+12]
//   88   }
//   89   ADC_CFG2_REG(adc) &= ~ADC_CFG2_ADACKEN_MASK;     // Asynchronous clock output disabled
??ADC_SetCFG2_1:
        LDR      R1,[R0, #+12]
        BICS     R1,R1,#0x8
        STR      R1,[R0, #+12]
//   90   if(adhsc == 1)
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BNE.N    ??ADC_SetCFG2_2
//   91   {
//   92     ADC_CFG2_REG(adc) |= ADC_CFG2_ADHSC_MASK;      // 高速转换队列选择
        LDR      R1,[R0, #+12]
        ORRS     R1,R1,#0x4
        STR      R1,[R0, #+12]
        B.N      ??ADC_SetCFG2_3
//   93   }
//   94   else
//   95   {
//   96     ADC_CFG2_REG(adc) &= ~ADC_CFG2_ADHSC_MASK;     // 正常转换队列选择
??ADC_SetCFG2_2:
        LDR      R1,[R0, #+12]
        BICS     R1,R1,#0x4
        STR      R1,[R0, #+12]
//   97   }
//   98   ADC_CFG2_REG(adc) |= ADC_CFG2_ADLSTS(adlsts);    // AD采样时间选择
??ADC_SetCFG2_3:
        LDR      R1,[R0, #+12]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ANDS     R2,R3,#0x3
        ORRS     R1,R2,R1
        STR      R1,[R0, #+12]
//   99 }
        BX       LR               ;; return
//  100 
//  101 /*******************************************************************************
//  102 * 函数名称：ADC_SetSC
//  103 * 入口参数：adc     AD转换器选择
//  104                      ADC0_BASE_PTR
//  105                      ADC1_BASE_PTR
//  106             avgs    硬件滤波采样次数选择
//  107                      00 4 samples averaged.
//  108                      01 8 samples averaged.
//  109                      10 16 samples averaged.
//  110                      11 32 samples averaged.
//  111             aien    AD采样结果读取方式
//  112                      0:查询方式
//  113                      1:中断方式
//  114             prio    中断优先级，只在 aien=1 是有效
//  115 * 描    述：设置AD寄存器 ADCx_SCn
//  116 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  117 void ADC_SetSC(ADC_MemMapPtr adc, int8u_t avgs, int8u_t aien, int8u_t prio)
//  118 {
ADC_SetSC:
        PUSH     {R4,LR}
        MOVS     R4,R3
//  119   ADC_SC2_REG(adc) = 0;   // set default status:Software triger(a convertion is initated following a write to 
        MOVS     R3,#+0
        STR      R3,[R0, #+32]
//  120                           // SC1A)compare function disabled, DMA is disabled, default voltage reference pin(external pins VREFH and VREFL).
//  121   ADC_SC3_REG(adc) |= ADC_SC3_ADCO_MASK            // 连续转换模式
//  122                       + ADC_SC3_AVGE_MASK          // 硬件滤波使能
//  123                       + ADC_SC3_AVGS(avgs);        // 设置连续采样次数             
        LDR      R3,[R0, #+36]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ANDS     R1,R1,#0x3
        ADDS     R1,R1,#+12
        ORRS     R1,R1,R3
        STR      R1,[R0, #+36]
//  124   if(aien == 1)
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BNE.N    ??ADC_SetSC_0
//  125   {
//  126     ADC_SC1_REG(adc,0)  |= ADC_SC1_AIEN_MASK;      // 置位中断使能寄存器
        LDR      R1,[R0, #+0]
        ORRS     R1,R1,#0x40
        STR      R1,[R0, #+0]
//  127     if(adc == ADC0_BASE_PTR)
        LDR.N    R1,??DataTable1  ;; 0x4003b000
        CMP      R0,R1
        BNE.N    ??ADC_SetSC_1
//  128     {
//  129       EnableInt_Kinetis(57);
        MOVS     R0,#+57
        BL       EnableInt_Kinetis
//  130       SetIntPri_Kinetis(57,prio);                  // 设置中断优先级
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,R4
        MOVS     R0,#+57
        BL       SetIntPri_Kinetis
        B.N      ??ADC_SetSC_2
//  131     }
//  132     else if(adc == ADC1_BASE_PTR)
??ADC_SetSC_1:
        LDR.N    R1,??DataTable1_2  ;; 0x400bb000
        CMP      R0,R1
        BNE.N    ??ADC_SetSC_2
//  133     {
//  134       EnableInt_Kinetis(58);
        MOVS     R0,#+58
        BL       EnableInt_Kinetis
//  135       SetIntPri_Kinetis(58,prio);                  // 设置中断优先级
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,R4
        MOVS     R0,#+58
        BL       SetIntPri_Kinetis
        B.N      ??ADC_SetSC_2
//  136     }
//  137   }
//  138   else
//  139   {
//  140     ADC_SC1_REG(adc,0)  &= ~ADC_SC1_AIEN_MASK;     // 查询方式
??ADC_SetSC_0:
        LDR      R1,[R0, #+0]
        BICS     R1,R1,#0x40
        STR      R1,[R0, #+0]
//  141   }
//  142 }
??ADC_SetSC_2:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x4003b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x400bb000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x40048030
//  143 
//  144 /*******************************************************************************
//  145 * 函数名称：ADC_readResult
//  146 * 入口参数：adc     AD转换器选择
//  147                      ADC0_BASE_PTR
//  148                      ADC1_BASE_PTR
//  149             channel AD采样通道号
//  150                      00000 When DIFF=0, DADP0 is selected as input; when DIFF=1, DAD0 is selected as input.
//  151                      00001 When DIFF=0, DADP1 is selected as input; when DIFF=1, DAD1 is selected as input.
//  152                      00010 When DIFF=0, DADP2 is selected as input; when DIFF=1, DAD2 is selected as input.
//  153                      00011 When DIFF=0, DADP3 is selected as input; when DIFF=1, DAD3 is selected as input.
//  154                      00100 When DIFF=0, AD4 is selected as input; when DIFF=1, it is reserved.
//  155                      00101 When DIFF=0, AD5 is selected as input; when DIFF=1, it is reserved.
//  156                      00110 When DIFF=0, AD6 is selected as input; when DIFF=1, it is reserved.
//  157                      00111 When DIFF=0, AD7 is selected as input; when DIFF=1, it is reserved.
//  158                      01000 When DIFF=0, AD8 is selected as input; when DIFF=1, it is reserved.
//  159                      01001 When DIFF=0, AD9 is selected as input; when DIFF=1, it is reserved.
//  160                      01010 When DIFF=0, AD10 is selected as input; when DIFF=1, it is reserved.
//  161                      01011 When DIFF=0, AD11 is selected as input; when DIFF=1, it is reserved.
//  162                      01100 When DIFF=0, AD12 is selected as input; when DIFF=1, it is reserved.
//  163                      01101 When DIFF=0, AD13 is selected as input; when DIFF=1, it is reserved.
//  164                      01110 When DIFF=0, AD14 is selected as input; when DIFF=1, it is reserved.
//  165                      01111 When DIFF=0, AD15 is selected as input; when DIFF=1, it is reserved.
//  166                      10000 When DIFF=0, AD16 is selected as input; when DIFF=1, it is reserved.
//  167                      10001 When DIFF=0, AD17 is selected as input; when DIFF=1, it is reserved.
//  168                      10010 When DIFF=0, AD18 is selected as input; when DIFF=1, it is reserved.
//  169                      10011 When DIFF=0, AD19 is selected as input; when DIFF=1, it is reserved.
//  170                      10100 When DIFF=0, AD20 is selected as input; when DIFF=1, it is reserved.
//  171                      10101 When DIFF=0, AD21 is selected as input; when DIFF=1, it is reserved.
//  172                      10110 When DIFF=0, AD22 is selected as input; when DIFF=1, it is reserved.
//  173                      10111 When DIFF=0, AD23 is selected as input; when DIFF=1, it is reserved.
//  174                      11000 Reserved.
//  175                      11001 Reserved.
//  176                      11010 When DIFF=0, Temp sensor (single-ended) is selected as input; when DIFF=1, Temp sensor(differential) is selected as input.
//  177                      11011 When DIFF=0, Bandgap (single-ended) is selected as input; when DIFF=1, Bandgap(differential) is selected as input.
//  178                      11100 Reserved.
//  179                      11101 When DIFF=0, VREFSH is selected as input; when DIFF=1, -VREFSH (differential) is selected asinput. 
//  180                      11110 When DIFF=0, VREFSL is selected as input; when DIFF=1, it is reserved. Voltage referenceselected is determined by the REFSEL bits in the SC2 register.
//  181                      11111 Module disabled.
//  182             result  AD采样结果
//  183 * 描    述：读取AD转换结果，通过配置AD通道可开始AD采样
//  184 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  185 void ADC_readResult(ADC_MemMapPtr adc,int8u_t channel, int16u_t * result)
//  186 {
ADC_readResult:
        PUSH     {R4}
//  187   int32u_t readReg = 0;
        MOVS     R3,#+0
//  188   
//  189   readReg = ADC_SC1_REG(adc,0);
        LDR      R4,[R0, #+0]
        MOVS     R3,R4
//  190   readReg &= ~ADC_SC1_ADCH_MASK;
        LSRS     R3,R3,#+5
        LSLS     R3,R3,#+5
//  191   readReg |= ADC_SC1_ADCH(channel);
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ANDS     R1,R1,#0x1F
        ORRS     R3,R1,R3
//  192   ADC_SC1_REG(adc,0) = readReg;                      // 设置 ADC 采样通道
        STR      R3,[R0, #+0]
//  193   
//  194   while(!(ADC_SC1_REG(adc,0)&ADC_SC1_COCO_MASK));    // 等待 ADC 转换结束
??ADC_readResult_0:
        LDR      R1,[R0, #+0]
        LSLS     R1,R1,#+24
        BPL.N    ??ADC_readResult_0
//  195   *result = ADC_R_REG(adc,0);                        // 读取 ADC 结果寄存器，COCO 自动清零
        LDR      R0,[R0, #+16]
        STRH     R0,[R2, #+0]
//  196 }
        POP      {R4}
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
// 296 bytes in section .text
// 
// 296 bytes of CODE memory
//
//Errors: none
//Warnings: none
