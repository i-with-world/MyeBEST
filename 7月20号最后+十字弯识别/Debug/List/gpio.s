///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      10/Jan/2013  19:05:40 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\课外资料\飞思卡尔智能车\日常资料\第八届资料\第八届智 /
//                    能车\直立车调试\ARM\ARM学习使用\20130110\V0.0.3\Library /
//                    \Drivers\GPIO\gpio.c                                    /
//    Command line =  E:\课外资料\飞思卡尔智能车\日常资料\第八届资料\第八届智 /
//                    能车\直立车调试\ARM\ARM学习使用\20130110\V0.0.3\Library /
//                    \Drivers\GPIO\gpio.c -D IAR -lCN                        /
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
//                    ist\gpio.s                                              /
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

// E:\课外资料\飞思卡尔智能车\日常资料\第八届资料\第八届智能车\直立车调试\ARM\ARM学习使用\20130110\V0.0.3\Library\Drivers\GPIO\gpio.c
//    1 /*******************************************************************************
//    2 * 文件名称：gpio.c
//    3 * 描    述: GPIO口驱动程序（参考纪成师兄驱动程序）
//    4 * 作    者：万冰冰
//    5 * 特别鸣谢：纪成师兄(博客http://blog.chinaaet.com/jihceng0622)
//    6 * 时    间：2012年5月17日
//    7 *******************************************************************************/
//    8 
//    9 #include "gpio.h"
//   10 
//   11 
//   12 static PORT_MemMapPtr GPIO_GetPortMapPtr(GPIO_MemMapPtr gpio);
//   13 
//   14 /*******************************************************************************
//   15 * 函数名称：GPIO_SetPinMod
//   16 * 入口参数：gpio   GPIO口
//   17             pin    gpio口的引脚号
//   18             mux    该引脚的功能号
//   19 * 描    述：设置GPIO中第 pin 个引脚的功能号
//   20 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 void GPIO_SetPinMod(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t mux)
//   22 {
GPIO_SetPinMod:
        PUSH     {R4-R6,LR}
        MOVS     R4,R1
        MOVS     R5,R2
//   23   PORT_MemMapPtr port;
//   24   int32u_t       readReg = 0;
        MOVS     R6,#+0
//   25   
//   26   port = GPIO_GetPortMapPtr(gpio);
        BL       GPIO_GetPortMapPtr
//   27   readReg = PORT_PCR_REG(port,pin);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R6,R1
//   28   readReg &= ~PORT_PCR_MUX_MASK;
        BICS     R6,R6,#0x700
//   29   readReg |= PORT_PCR_MUX(mux);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSLS     R1,R5,#+8
        ANDS     R1,R1,#0x700
        ORRS     R6,R1,R6
//   30   PORT_PCR_REG(port,pin) = readReg;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R6,[R0, R4, LSL #+2]
//   31 }
        POP      {R4-R6,PC}       ;; return
//   32 
//   33 /*******************************************************************************
//   34 * 函数名称：GPIO_ConfigPinInt
//   35 * 入口参数：gpio   GPIO口指针
//   36             pin    gpio口的引脚号
//   37             irqc   该引脚的中断类型
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
//   49 * 描    述：设置GPIO中第 pin 个引脚的中断类型
//   50 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   51 void GPIO_ConfigPinInt(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t irqc)
//   52 {
GPIO_ConfigPinInt:
        PUSH     {R4-R6,LR}
        MOVS     R4,R1
        MOVS     R5,R2
//   53   PORT_MemMapPtr port;
//   54   int32u_t       readReg = 0;
        MOVS     R6,#+0
//   55   
//   56   port = GPIO_GetPortMapPtr(gpio);
        BL       GPIO_GetPortMapPtr
//   57   readReg = PORT_PCR_REG(port,pin);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R6,R1
//   58   readReg &= ~PORT_PCR_IRQC_MASK;
        BICS     R6,R6,#0xF0000
//   59   readReg |= PORT_PCR_IRQC(irqc); 
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSLS     R1,R5,#+16
        ANDS     R1,R1,#0xF0000
        ORRS     R6,R1,R6
//   60   PORT_PCR_REG(port,pin) = readReg; 
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R6,[R0, R4, LSL #+2]
//   61 }
        POP      {R4-R6,PC}       ;; return
//   62 
//   63 /*******************************************************************************
//   64 * 函数名称：GPIO_SetPinDriveStrgth
//   65 * 入口参数：gpio   GPIO口指针
//   66             pin    gpio口的引脚号
//   67             mux    该引脚的功能号
//   68                     0: 弱驱动能力
//   69                     1：强驱动能力
//   70 * 描    述：设置GPIO中第 pin 个引脚的驱动能力
//   71 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   72 void GPIO_SetPinDriveStrgth(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t dse)
//   73 {
GPIO_SetPinDriveStrgth:
        PUSH     {R3-R5,LR}
        MOVS     R4,R1
        MOVS     R5,R2
//   74   PORT_MemMapPtr port;
//   75   
//   76   port = GPIO_GetPortMapPtr(gpio);
        BL       GPIO_GetPortMapPtr
//   77   if(dse == 1)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??GPIO_SetPinDriveStrgth_0
//   78   {
//   79     PORT_PCR_REG(port,pin) |= PORT_PCR_DSE_MASK;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R0, R4, LSL #+2]
        ORRS     R1,R1,#0x40
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R1,[R0, R4, LSL #+2]
        B.N      ??GPIO_SetPinDriveStrgth_1
//   80   }
//   81   else
//   82   {
//   83     PORT_PCR_REG(port,pin) &= ~PORT_PCR_DSE_MASK;
??GPIO_SetPinDriveStrgth_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R0, R4, LSL #+2]
        BICS     R1,R1,#0x40
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R1,[R0, R4, LSL #+2]
//   84   }
//   85 }
??GPIO_SetPinDriveStrgth_1:
        POP      {R0,R4,R5,PC}    ;; return
//   86 
//   87 /*******************************************************************************
//   88 * 函数名称：GPIO_SetPinOpenDrain
//   89 * 入口参数：gpio   GPIO口指针
//   90             pin    gpio口的引脚号
//   91             ode    该引脚的功能号
//   92                     0: 禁止开漏输出
//   93                     1：使能开漏输出
//   94 * 描    述：设置GPIO中第 pin 个引脚的开漏模式
//   95 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   96 void GPIO_SetPinOpenDrain(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t ode)
//   97 {
GPIO_SetPinOpenDrain:
        PUSH     {R3-R5,LR}
        MOVS     R4,R1
        MOVS     R5,R2
//   98   PORT_MemMapPtr port;
//   99   
//  100   port = GPIO_GetPortMapPtr(gpio);
        BL       GPIO_GetPortMapPtr
//  101   if(ode == 1)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??GPIO_SetPinOpenDrain_0
//  102   {
//  103     PORT_PCR_REG(port,pin) |= PORT_PCR_ODE_MASK;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R0, R4, LSL #+2]
        ORRS     R1,R1,#0x20
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R1,[R0, R4, LSL #+2]
        B.N      ??GPIO_SetPinOpenDrain_1
//  104   }
//  105   else
//  106   {
//  107     PORT_PCR_REG(port,pin) &= ~PORT_PCR_ODE_MASK;
??GPIO_SetPinOpenDrain_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R0, R4, LSL #+2]
        BICS     R1,R1,#0x20
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R1,[R0, R4, LSL #+2]
//  108   }
//  109 }
??GPIO_SetPinOpenDrain_1:
        POP      {R0,R4,R5,PC}    ;; return
//  110 
//  111 /*******************************************************************************
//  112 * 函数名称：GPIO_SetPinPassiveFilter
//  113 * 入口参数：gpio   GPIO口指针
//  114             pin    gpio口的引脚号
//  115             ode    该引脚的功能号
//  116                     0: 禁止低通滤波
//  117                     1：使能低通滤波（10MHZ~30MHZ带宽），信号频率高于2MHZ时应禁止该功能
//  118 * 描    述：设置GPIO中第 pin 个引脚的滤波模式
//  119 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  120 void GPIO_SetPinPassiveFilter(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t pfe)
//  121 {
GPIO_SetPinPassiveFilter:
        PUSH     {R3-R5,LR}
        MOVS     R4,R1
        MOVS     R5,R2
//  122   PORT_MemMapPtr port;
//  123   
//  124   port = GPIO_GetPortMapPtr(gpio);
        BL       GPIO_GetPortMapPtr
//  125   if(pfe == 1)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??GPIO_SetPinPassiveFilter_0
//  126   {
//  127     PORT_PCR_REG(port,pin) |= PORT_PCR_PFE_MASK;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R0, R4, LSL #+2]
        ORRS     R1,R1,#0x10
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R1,[R0, R4, LSL #+2]
        B.N      ??GPIO_SetPinPassiveFilter_1
//  128   }
//  129   else
//  130   {
//  131     PORT_PCR_REG(port,pin) &= ~PORT_PCR_PFE_MASK;
??GPIO_SetPinPassiveFilter_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R0, R4, LSL #+2]
        BICS     R1,R1,#0x10
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R1,[R0, R4, LSL #+2]
//  132   }
//  133 }
??GPIO_SetPinPassiveFilter_1:
        POP      {R0,R4,R5,PC}    ;; return
//  134 
//  135 /*******************************************************************************
//  136 * 函数名称：GPIO_SetPinPull
//  137 * 入口参数：gpio   GPIO口指针
//  138             pin    gpio口的引脚号
//  139             pe     该引脚的功能号
//  140                     0: 禁止上拉和下拉电阻功能
//  141                     1：使能上拉和下拉电阻功能
//  142             ps     该引脚的功能号，在 pe=1 时有效
//  143                     0: 使能下拉电阻功能
//  144                     1：使能上拉电阻功能
//  145 * 描    述：设置GPIO中第 pin 个引脚的上拉下拉电阻模式
//  146 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  147 void GPIO_SetPinPull(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t pe, int8u_t ps)
//  148 {
GPIO_SetPinPull:
        PUSH     {R4-R6,LR}
        MOVS     R4,R1
        MOVS     R5,R2
        MOVS     R6,R3
//  149   PORT_MemMapPtr port;
//  150   
//  151   port = GPIO_GetPortMapPtr(gpio);
        BL       GPIO_GetPortMapPtr
//  152   if(pe == 1)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??GPIO_SetPinPull_0
//  153   {
//  154     PORT_PCR_REG(port,pin) |= PORT_PCR_PE_MASK;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R0, R4, LSL #+2]
        ORRS     R1,R1,#0x2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R1,[R0, R4, LSL #+2]
//  155     if(ps == 1)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??GPIO_SetPinPull_1
//  156     {
//  157       PORT_PCR_REG(port,pin) |= PORT_PCR_PS_MASK;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R0, R4, LSL #+2]
        ORRS     R1,R1,#0x1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R1,[R0, R4, LSL #+2]
        B.N      ??GPIO_SetPinPull_2
//  158     }
//  159     else
//  160     {
//  161       PORT_PCR_REG(port,pin) &= ~PORT_PCR_PS_MASK;
??GPIO_SetPinPull_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R0, R4, LSL #+2]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R1,[R0, R4, LSL #+2]
        B.N      ??GPIO_SetPinPull_2
//  162     }
//  163   }
//  164   else
//  165   {
//  166     PORT_PCR_REG(port,pin) &= ~PORT_PCR_PE_MASK;
??GPIO_SetPinPull_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R0, R4, LSL #+2]
        BICS     R1,R1,#0x2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R1,[R0, R4, LSL #+2]
//  167   }
//  168 }
??GPIO_SetPinPull_2:
        POP      {R4-R6,PC}       ;; return
//  169 
//  170 /*******************************************************************************
//  171 * 函数名称：GPIO_SetPortDir
//  172 * 入口参数：gpio   GPIO口指针
//  173             dir    gpio口的输入输出模式
//  174 * 描    述：设置GPIO输入输出模式
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
//  182 * 函数名称：GPIO_SetPinDir
//  183 * 入口参数：gpio   GPIO口
//  184             pin    gpio口的引脚号
//  185             dir    gpio口的输入输出模式
//  186                     0：输入
//  187                     1：输出  
//  188 * 描    述：设置GPIO中第 pin 位的输入输出模式
//  189 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  190 void GPIO_SetPinDir(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t dir)
//  191 {
//  192   if(dir == 1)                                        // 定义引脚为输出方式
GPIO_SetPinDir:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BNE.N    ??GPIO_SetPinDir_0
//  193   {
//  194     GPIO_PDDR_REG(gpio) |= 1<<pin;                    // set the GPIO_DDR as output 
        LDR      R2,[R0, #+20]
        MOVS     R3,#+1
        LSLS     R1,R3,R1
        ORRS     R1,R1,R2
        STR      R1,[R0, #+20]
        B.N      ??GPIO_SetPinDir_1
//  195   }
//  196   else
//  197   {
//  198     GPIO_PDDR_REG(gpio) &= ~(1<<pin);                 // set the GPIO_DDR as input 
??GPIO_SetPinDir_0:
        LDR      R2,[R0, #+20]
        MOVS     R3,#+1
        LSLS     R1,R3,R1
        BICS     R1,R2,R1
        STR      R1,[R0, #+20]
//  199   }
//  200 }
??GPIO_SetPinDir_1:
        BX       LR               ;; return
//  201 
//  202 /*******************************************************************************
//  203 * 函数名称：GPIO_SetPortStat
//  204 * 入口参数：gpio   GPIO口指针
//  205             state  gpio口的输出电平
//  206 * 描    述：设置GPIO的输出电平
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
//  214 * 函数名称：GPIO_SetPinStat
//  215 * 入口参数：gpio   GPIO口指针
//  216             pin    gpio口的引脚号
//  217             state  gpio口的输出电平
//  218 * 描    述：设置GPIO中第 pin 位的电平
//  219 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  220 void GPIO_SetPinStat(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t state)
//  221 {
//  222   if(state==1)
GPIO_SetPinStat:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BNE.N    ??GPIO_SetPinStat_0
//  223   {
//  224     GPIO_PDOR_REG(gpio) |= 1<<pin;                     // set 1 to corresponding pin
        LDR      R2,[R0, #+0]
        MOVS     R3,#+1
        LSLS     R1,R3,R1
        ORRS     R1,R1,R2
        STR      R1,[R0, #+0]
        B.N      ??GPIO_SetPinStat_1
//  225   }    
//  226   else 
//  227   {
//  228     GPIO_PDOR_REG(gpio) &= ~(1<<pin);                  // set 0 to corresponding pin
??GPIO_SetPinStat_0:
        LDR      R2,[R0, #+0]
        MOVS     R3,#+1
        LSLS     R1,R3,R1
        BICS     R1,R2,R1
        STR      R1,[R0, #+0]
//  229   }
//  230 }
??GPIO_SetPinStat_1:
        BX       LR               ;; return
//  231 
//  232 /*******************************************************************************
//  233 * 函数名称：GPIO_ReadPortStat
//  234 * 入口参数：gpio   GPIO口指针
//  235             state  gpio口的电平
//  236 * 描    述：读取 gpio 口的状态
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
//  244 * 函数名称：GPIO_TogglePinStat
//  245 * 入口参数：gpio   GPIO口指针
//  246             pin    gpio口的引脚号
//  247 * 描    述：反转GPIO中第 pin 位的电平
//  248 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  249 void GPIO_TogglePinStat(GPIO_MemMapPtr gpio, int8u_t pin)
//  250 {
//  251   GPIO_PTOR_REG(gpio) ^= 1<<pin;                       // toggle the corresponding pin's state
GPIO_TogglePinStat:
        LDR      R2,[R0, #+12]
        MOVS     R3,#+1
        LSLS     R1,R3,R1
        EORS     R1,R1,R2
        STR      R1,[R0, #+12]
//  252 }
        BX       LR               ;; return
//  253 
//  254 /*******************************************************************************
//  255 * 函数名称：GPIO_GetPortMapPtr
//  256 * 入口参数：gpio   GPIO口指针
//  257 * 返回参数：p      gpio口寄存器指针
//  258 * 描    述：通过 GPIO_MemMapPtr 指针查找 PORT_MemMapPtr 指针
//  259 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  260 static PORT_MemMapPtr GPIO_GetPortMapPtr(GPIO_MemMapPtr gpio)
//  261 {
//  262   PORT_MemMapPtr p;
//  263   switch((int32u_t)gpio)
GPIO_GetPortMapPtr:
        LDR.N    R2,??DataTable0  ;; 0x400ff000
        SUBS     R0,R0,R2
        BEQ.N    ??GPIO_GetPortMapPtr_0
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_GetPortMapPtr_1
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_GetPortMapPtr_2
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_GetPortMapPtr_3
        SUBS     R0,R0,#+64
        BEQ.N    ??GPIO_GetPortMapPtr_4
        B.N      ??GPIO_GetPortMapPtr_5
//  264   {
//  265     case 0x400FF000u:
//  266                       p = PORTA_BASE_PTR;
??GPIO_GetPortMapPtr_0:
        LDR.N    R1,??DataTable0_1  ;; 0x40049000
//  267                       break;
        B.N      ??GPIO_GetPortMapPtr_6
//  268     case 0x400FF040u:
//  269                       p = PORTB_BASE_PTR;
??GPIO_GetPortMapPtr_1:
        LDR.N    R1,??DataTable0_2  ;; 0x4004a000
//  270                       break;
        B.N      ??GPIO_GetPortMapPtr_6
//  271     case 0x400FF080u:
//  272                       p = PORTC_BASE_PTR;
??GPIO_GetPortMapPtr_2:
        LDR.N    R1,??DataTable0_3  ;; 0x4004b000
//  273                       break;
        B.N      ??GPIO_GetPortMapPtr_6
//  274     case 0x400FF0C0u:
//  275                       p = PORTD_BASE_PTR;
??GPIO_GetPortMapPtr_3:
        LDR.N    R1,??DataTable0_4  ;; 0x4004c000
//  276                       break;
        B.N      ??GPIO_GetPortMapPtr_6
//  277     case 0x400FF100u: 
//  278                       p = PORTE_BASE_PTR;
??GPIO_GetPortMapPtr_4:
        LDR.N    R1,??DataTable0_5  ;; 0x4004d000
//  279                       break;
        B.N      ??GPIO_GetPortMapPtr_6
//  280     default:
//  281             break;
//  282             
//  283   }
//  284   return p;
??GPIO_GetPortMapPtr_5:
??GPIO_GetPortMapPtr_6:
        MOVS     R0,R1
        BX       LR               ;; return
//  285 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0x40049000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     0x4004b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     0x4004c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     0x4004d000
//  286 
//  287 //===========================================================================
//  288 //函数名称：GPIO_get
//  289 //函数返回：指定引脚状态。0=低电平，1=高电平。
//  290 //参数说明：port：端口号。由宏定义。
//  291 //          pin：引脚号。0～31。
//  292 //功能概要：获取指定引脚状态。
//  293 //===========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  294 int8u_t GPIO_get(GPIO_MemMapPtr gpio, int8u_t pin)
//  295 {
//  296         //PORT_MemMapPtr port;
//  297 	int8u_t i; 
//  298 	//将GPIO端口号转换成端口寄存器组指针
//  299 	//GPIO_MemMapPtr pt = gpio_get_pt_addr(port);
//  300 	//查看引脚状态
//  301 	i = BGET(pin, GPIO_PDIR_REG(gpio));
GPIO_get:
        LDR      R0,[R0, #+16]
        LSRS     R0,R0,R1
        ANDS     R0,R0,#0x1
//  302 	return i;     //返回引脚状态（0或1）
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
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
// 518 bytes in section .text
// 
// 518 bytes of CODE memory
//
//Errors: none
//Warnings: none
