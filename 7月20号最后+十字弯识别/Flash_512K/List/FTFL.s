///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    05/May/2015  18:16:52 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\2014���ܳ�\���ܳ�����\5��3��ת���\Library\Drivers /
//                    \FTFL\FTFL.c                                            /
//    Command line =  E:\2014���ܳ�\���ܳ�����\5��3��ת���\Library\Drivers /
//                    \FTFL\FTFL.c -D IAR -lCN E:\2014���ܳ�\���ܳ�����\5��3� /
//                    �ת���\Flash_512K\List\ -lB                          /
//                    E:\2014���ܳ�\���ܳ�����\5��3��ת���\Flash_512K\List /
//                    \ -o E:\2014���ܳ�\���ܳ�����\5��3��ת���\Flash_512K /
//                    \Obj\ --no_cse --no_unroll --no_inline                  /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --char_is_signed --fpu=None          /
//                    --dlib_config "D:\Program Files                         /
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
//                    \FTFL.s                                                 /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME FTFL

        #define SHT_PROGBITS 0x1

        EXTERN malloc

        PUBLIC FTFL_EraseSector
        PUBLIC FTFL_Init
        PUBLIC FTFL_IsCmdLaunched
        PUBLIC FTFL_ReadFlash
        PUBLIC FTFL_WriteLongWord

// E:\2014���ܳ�\���ܳ�����\5��3��ת���\Library\Drivers\FTFL\FTFL.c
//    1 #include "FTFL.h"
//    2 #include "stdlib.h"
//    3 #include "inttypes.h"
//    4 
//    5 /*******************************************************************************
//    6 * �������ƣ�FTFL_Init
//    7 * ��ڲ�����
//    8 * ���ز�����
//    9 * ��    ������ʼ��FTFLģ��
//   10 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   11 void FTFL_Init (void)
//   12 {
//   13   SIM_SCGC6 |= SIM_SCGC6_FTFL_MASK;
FTFL_Init:
        LDR.N    R0,??DataTable3  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable3  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   14 }
        BX       LR               ;; return
//   15 /*******************************************************************************
//   16 * �������ƣ�FTFL_IsCmdLaunched
//   17 * ��ڲ�����
//   18 * ���ز�����
//   19 * ��    ����ִ�в��ж�FTFLָ���Ƿ�ɹ�
//   20 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 uint8_t FTFL_IsCmdLaunched (void)
//   22 {
//   23   uint32_t nWaitCnt = 0; // �ȴ�������
FTFL_IsCmdLaunched:
        MOVS     R0,#+0
//   24   
//   25   if (FTFL_IsAccessErr () || FTFL_IsProtectionViolated ())
        LDR.N    R1,??DataTable3_1  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+26
        BMI.N    ??FTFL_IsCmdLaunched_0
        LDR.N    R1,??DataTable3_1  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+27
        BPL.N    ??FTFL_IsCmdLaunched_1
//   26   {
//   27     // ����ѷ�������ԽȨ�򱣻�������ʣ����������Ĵ����־������FTFL�����޷�ִ��
//   28     FTFL_ClearErrBits ();
??FTFL_IsCmdLaunched_0:
        LDR.N    R1,??DataTable3_1  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        ORRS     R1,R1,#0x30
        LDR.N    R2,??DataTable3_1  ;; 0x40020000
        STRB     R1,[R2, #+0]
//   29   }
//   30   
//   31   // ���CCIFλ�����������ִ��
//   32   FTFL_FSTAT = FTFL_FSTAT_CCIF_MASK;
??FTFL_IsCmdLaunched_1:
        LDR.N    R1,??DataTable3_1  ;; 0x40020000
        MOVS     R2,#+128
        STRB     R2,[R1, #+0]
//   33   // �ȴ�FTFL�������
//   34   while (((nWaitCnt++) <= 100000) && (!FTFL_IsCmdFinish ()));
??FTFL_IsCmdLaunched_2:
        MOVS     R1,R0
        ADDS     R0,R1,#+1
        LDR.N    R2,??DataTable3_2  ;; 0x186a1
        CMP      R1,R2
        BCS.N    ??FTFL_IsCmdLaunched_3
        LDR.N    R1,??DataTable3_1  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+7
        CMP      R1,#+0
        BEQ.N    ??FTFL_IsCmdLaunched_2
//   35   
//   36   // ������
//   37   if (nWaitCnt > 100000)
??FTFL_IsCmdLaunched_3:
        LDR.N    R1,??DataTable3_2  ;; 0x186a1
        CMP      R0,R1
        BCC.N    ??FTFL_IsCmdLaunched_4
//   38   {
//   39     // ����ʱ���򷵻ش���
//   40     return FTFL_CODE_ERR;
        MOVS     R0,#+240
        B.N      ??FTFL_IsCmdLaunched_5
//   41   }
//   42   
//   43   if (FTFL_IsAccessErr () || FTFL_IsProtectionViolated ())
??FTFL_IsCmdLaunched_4:
        LDR.N    R0,??DataTable3_1  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R0,R0,#+26
        BMI.N    ??FTFL_IsCmdLaunched_6
        LDR.N    R0,??DataTable3_1  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R0,R0,#+27
        BPL.N    ??FTFL_IsCmdLaunched_7
//   44   {
//   45     // �����������ԽȨ�򱣻�������ʣ����ش���
//   46     return FTFL_CODE_ERR;
??FTFL_IsCmdLaunched_6:
        MOVS     R0,#+240
        B.N      ??FTFL_IsCmdLaunched_5
//   47   }
//   48   // ������ȷ��ɣ�������ʾ��
//   49   return FTFL_CODE_SUCCESS;
??FTFL_IsCmdLaunched_7:
        MOVS     R0,#+241
??FTFL_IsCmdLaunched_5:
        BX       LR               ;; return
//   50 }
//   51 /*******************************************************************************
//   52 * �������ƣ�FTFL_EraseSector
//   53 * ��ڲ�����uint16_t iSectorNo ��������
//   54 * ���ز�����FTFL_CODE_ERR������ʧ�ܣ�FTFL_CODE_SUCCESS�������ɹ�
//   55 * ��    ������������flash����
//   56 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   57 uint8_t FTFL_EraseSector (uint16_t iSectorNo)
//   58 {
FTFL_EraseSector:
        PUSH     {R7,LR}
//   59   union{
//   60     uint32_t addrs_word;
//   61     uint8_t addrs_byte[4];
//   62   }union_addrs; // �����壬���ڵ�ַ����
//   63   
//   64   // ��κϷ��Լ���
//   65   if (iSectorNo < 2)
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+2
        BCS.N    ??FTFL_EraseSector_0
//   66   {
//   67     /* flash��0��sectorΪ�ж������Լ������Ĵ洢λ�ã����ɸ���
//   68     ��Ϊȷ����ȫ���ӵ�������ʼд��K10DN512��512K flash��ÿ��2K
//   69     ������256����                                             */
//   70     return FTFL_CODE_ERR;
        MOVS     R0,#+240
        B.N      ??FTFL_EraseSector_1
//   71   }
//   72   
//   73   // ������ƫ�Ƶ�ַ
//   74   union_addrs.addrs_word = (((uint32_t)iSectorNo) << 11);
??FTFL_EraseSector_0:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSLS     R0,R0,#+11
        STR      R0,[SP, #+0]
//   75   
//   76   // װ��ָ��
//   77   FTFL_FCCOB0 = FTFL_CMD_EFS;  // ��������ָ��
        LDR.N    R0,??DataTable3_3  ;; 0x40020007
        MOVS     R1,#+9
        STRB     R1,[R0, #+0]
//   78   FTFL_FCCOB1 = union_addrs.addrs_byte[2]; // ������ַ
        LDRB     R0,[SP, #+2]
        LDR.N    R1,??DataTable3_4  ;; 0x40020006
        STRB     R0,[R1, #+0]
//   79   FTFL_FCCOB2 = union_addrs.addrs_byte[1];
        LDRB     R0,[SP, #+1]
        LDR.N    R1,??DataTable3_5  ;; 0x40020005
        STRB     R0,[R1, #+0]
//   80   FTFL_FCCOB3 = union_addrs.addrs_byte[0];
        LDR.N    R0,??DataTable3_6  ;; 0x40020004
        LDRB     R1,[SP, #+0]
        STRB     R1,[R0, #+0]
//   81   
//   82   if (FTFL_CODE_ERR == FTFL_IsCmdLaunched ())
        BL       FTFL_IsCmdLaunched
        CMP      R0,#+240
        BNE.N    ??FTFL_EraseSector_2
//   83   {
//   84     // ��ָ��ִ��ʧ�ܣ����ش�����
//   85     return FTFL_CODE_ERR;
        MOVS     R0,#+240
        B.N      ??FTFL_EraseSector_1
//   86   }
//   87   // �����ɹ���������ʾ��
//   88   return FTFL_CODE_SUCCESS;
??FTFL_EraseSector_2:
        MOVS     R0,#+241
??FTFL_EraseSector_1:
        POP      {R1,PC}          ;; return
//   89 }
//   90 /*******************************************************************************
//   91 * �������ƣ�FTFL_WriteLongWord
//   92 * ��ڲ�����uint16_t iSectorNo �������ţ�
//   93             uint16_t iOffset��ƫ�Ƶ�ַ��
//   94             uint8_t iByte[4]��д������ֽ�
//   95 * ���ز�����FTFL_CODE_ERR������ʧ�ܣ�FTFL_CODE_SUCCESS�������ɹ�
//   96 * ��    ����д�����flash�ĸ��ֽ�
//   97 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   98 uint8_t FTFL_WriteLongWord (uint16_t iSectorNo, uint16_t iOffset, uint8_t iByte[4])
//   99 {
FTFL_WriteLongWord:
        PUSH     {R7,LR}
//  100   union{
//  101     uint32_t addrs_word;
//  102     uint8_t addrs_byte[4];
//  103   }union_addrs; // �����壬���ڵ�ַ����
//  104   
//  105   // ��κϷ��Լ���
//  106   if (iSectorNo < 2)
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+2
        BCS.N    ??FTFL_WriteLongWord_0
//  107   {
//  108     /* flash��0��sectorΪ�ж������Լ������Ĵ洢λ�ã����ɸ���
//  109     ��Ϊȷ����ȫ���ӵ�������ʼд��K10DN512��512K flash��ÿ��2K
//  110     ������256����                                             */
//  111     return FTFL_CODE_ERR;
        MOVS     R0,#+240
        B.N      ??FTFL_WriteLongWord_1
//  112   }
//  113   
//  114   // ������ƫ�Ƶ�ַ
//  115   union_addrs.addrs_word = (((uint32_t)iSectorNo) << 11) + iOffset;
??FTFL_WriteLongWord_0:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSLS     R0,R0,#+11
        UXTAH    R0,R0,R1
        STR      R0,[SP, #+0]
//  116   
//  117   // װ��ָ��
//  118   FTFL_FCCOB0 = FTFL_CMD_PGM4;  // ��������ָ��
        LDR.N    R0,??DataTable3_3  ;; 0x40020007
        MOVS     R1,#+6
        STRB     R1,[R0, #+0]
//  119   FTFL_FCCOB1 = union_addrs.addrs_byte[2];   // ������ַ
        LDRB     R0,[SP, #+2]
        LDR.N    R1,??DataTable3_4  ;; 0x40020006
        STRB     R0,[R1, #+0]
//  120   FTFL_FCCOB2 = union_addrs.addrs_byte[1];
        LDRB     R0,[SP, #+1]
        LDR.N    R1,??DataTable3_5  ;; 0x40020005
        STRB     R0,[R1, #+0]
//  121   FTFL_FCCOB3 = union_addrs.addrs_byte[0];
        LDR.N    R0,??DataTable3_6  ;; 0x40020004
        LDRB     R1,[SP, #+0]
        STRB     R1,[R0, #+0]
//  122   // װ������            
//  123   FTFL_FCCOB4 = iByte[3];
        LDRB     R0,[R2, #+3]
        LDR.N    R1,??DataTable3_7  ;; 0x4002000b
        STRB     R0,[R1, #+0]
//  124   FTFL_FCCOB5 = iByte[2];
        LDRB     R0,[R2, #+2]
        LDR.N    R1,??DataTable3_8  ;; 0x4002000a
        STRB     R0,[R1, #+0]
//  125   FTFL_FCCOB6 = iByte[1];
        LDRB     R0,[R2, #+1]
        LDR.N    R1,??DataTable3_9  ;; 0x40020009
        STRB     R0,[R1, #+0]
//  126   FTFL_FCCOB7 = iByte[0];
        LDR.N    R0,??DataTable3_10  ;; 0x40020008
        LDRB     R1,[R2, #+0]
        STRB     R1,[R0, #+0]
//  127   
//  128   if (FTFL_CODE_ERR == FTFL_IsCmdLaunched ())
        BL       FTFL_IsCmdLaunched
        CMP      R0,#+240
        BNE.N    ??FTFL_WriteLongWord_2
//  129   {
//  130     // ��ָ��ִ��ʧ�ܣ����ش�����
//  131     return FTFL_CODE_ERR;
        MOVS     R0,#+240
        B.N      ??FTFL_WriteLongWord_1
//  132   }
//  133   // �����ɹ���������ʾ��
//  134   return FTFL_CODE_SUCCESS;
??FTFL_WriteLongWord_2:
        MOVS     R0,#+241
??FTFL_WriteLongWord_1:
        POP      {R1,PC}          ;; return
//  135 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x40020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x186a1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x40020007

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x40020006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x40020005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x40020004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0x4002000b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0x4002000a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     0x40020009

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     0x40020008
//  136 /*******************************************************************************
//  137 * �������ƣ�FTFL_ReadFlash
//  138 * ��ڲ�����uint16_t iSectorNo �������ţ�uint16_t iOffset��ƫ�Ƶ�ַ��uint16_t nByteCnt���������ݵĸ���
//  139 * ���ز�����NULL������ʧ�ܣ�uint8_t* addrsBkp���������׵�ַ
//  140 * ��    ����д�����flash�ĸ��ֽ�
//  141 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  142 uint8_t * FTFL_ReadFlash (uint16_t iSectorNo, uint16_t iOffset, uint16_t nByteCnt)
//  143 {
FTFL_ReadFlash:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  144   uint32_t addrs = 0; // flash��ַ
        MOVS     R7,#+0
//  145   
//  146   uint8_t* recBuffer = (uint8_t*) malloc (nByteCnt * sizeof (uint8_t)); // ������ܻ���
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,R6
        BL       malloc
        MOVS     R1,R0
//  147   uint8_t* addrsBkp = NULL; // �����׵�ַ����
        MOVS     R0,#+0
//  148   if (NULL == recBuffer)
        CMP      R1,#+0
        BNE.N    ??FTFL_ReadFlash_0
//  149   {
//  150     // ������ʧ�ܣ���˵���ڴ���Ѻľ������ش���
//  151     return (uint8_t*)NULL;
        MOVS     R0,#+0
        B.N      ??FTFL_ReadFlash_1
//  152   }
//  153   addrsBkp = recBuffer; // ���滺���ַ
??FTFL_ReadFlash_0:
        MOVS     R0,R1
//  154   // ����Ŀ���ַ
//  155   addrs = (((uint32_t)iSectorNo) << 11) + iOffset;
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSLS     R2,R4,#+11
        UXTAH    R7,R2,R5
        B.N      ??FTFL_ReadFlash_2
//  156   // ��ȡnByteCnt�ֽڵ�ַ
//  157   while (nByteCnt--)
//  158   {
//  159     *recBuffer++ = *((uint8_t*)addrs++); // -1����Ϊ��addrs��ʼ��addrs + n - 1
??FTFL_ReadFlash_3:
        LDRB     R2,[R7, #+0]
        STRB     R2,[R1, #+0]
        ADDS     R7,R7,#+1
        ADDS     R1,R1,#+1
//  160   }
??FTFL_ReadFlash_2:
        MOVS     R2,R6
        SUBS     R6,R2,#+1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BNE.N    ??FTFL_ReadFlash_3
//  161   // ���ػ�������ַ
//  162   return addrsBkp;
??FTFL_ReadFlash_1:
        POP      {R1,R4-R7,PC}    ;; return
//  163 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  164 
// 
// 376 bytes in section .text
// 
// 376 bytes of CODE memory
//
//Errors: none
//Warnings: none
