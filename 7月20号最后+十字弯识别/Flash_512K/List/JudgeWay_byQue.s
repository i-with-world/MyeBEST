///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      22/Jul/2015  10:59:26 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Make_Desic /
//                    ion\Judge_Way\JudgeWay_byQue.c                          /
//    Command line =  C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Make_Desic /
//                    ion\Judge_Way\JudgeWay_byQue.c -D IAR -lCN              /
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
//                    \List\JudgeWay_byQue.s                                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME JudgeWay_byQue

        #define SHT_PROGBITS 0x1

        PUBLIC JudgeWay
        PUBLIC abs_int
        PUBLIC averGyroVal
        PUBLIC gyroArr
        PUBLIC gyroData
        PUBLIC gyroQue
        PUBLIC judgeWayLen
        PUBLIC pathType

// C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Make_Desicion\Judge_Way\JudgeWay_byQue.c
//    1 #include "AllHeaders.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    3 int gyroArr[MAXARR] = {0};
gyroArr:
        DS8 400

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    4 QueByArr gyroQue = {gyroArr, 0, 0, 0, 0};
gyroQue:
        DATA
        DC32 gyroArr, 0, 0, 0, 0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 int pathType = UNKONWN;     //�������ͱ���
pathType:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    6 int judgeWayLen;      //�ж������������ݳ���
judgeWayLen:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 int averGyroVal;      //�����ǲ�ֵƽ��
averGyroVal:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 int gyroData;   //����������
gyroData:
        DS8 4
//    9 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   10 int abs_int(int num)
//   11 {
//   12   if(num < 0)
abs_int:
        CMP      R0,#+0
        BPL.N    ??abs_int_0
//   13     return (-num);
        RSBS     R0,R0,#+0
        B.N      ??abs_int_1
//   14   else
//   15     return num;
??abs_int_0:
??abs_int_1:
        BX       LR               ;; return
//   16 }
//   17 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   18 static void PushInt(int data, QueByArr* que)
//   19 {
//   20   if(que->size < MAXARR)   //������г���С����󳤶�
PushInt:
        LDR      R2,[R1, #+4]
        CMP      R2,#+100
        BGE.N    ??PushInt_0
//   21   {
//   22     if(que->lastPos < MAXARR-1)    //�����β�������м�
        LDR      R2,[R1, #+16]
        CMP      R2,#+99
        BGE.N    ??PushInt_1
//   23     {
//   24       que->queArr[que->lastPos] = data;
        LDR      R2,[R1, #+16]
        LDR      R3,[R1, #+0]
        STR      R0,[R3, R2, LSL #+2]
//   25       que->lastPos++;
        LDR      R2,[R1, #+16]
        ADDS     R2,R2,#+1
        STR      R2,[R1, #+16]
        B.N      ??PushInt_2
//   26     }
//   27     else if(que->lastPos == MAXARR-1)    //�����β������β��
??PushInt_1:
        LDR      R2,[R1, #+16]
        CMP      R2,#+99
        BNE.N    ??PushInt_2
//   28     {
//   29       que->queArr[que->lastPos] = data;
        LDR      R2,[R1, #+16]
        LDR      R3,[R1, #+0]
        STR      R0,[R3, R2, LSL #+2]
//   30         que->lastPos = 0;
        MOVS     R2,#+0
        STR      R2,[R1, #+16]
//   31     }
//   32     que->size++;
??PushInt_2:
        LDR      R2,[R1, #+4]
        ADDS     R2,R2,#+1
        STR      R2,[R1, #+4]
        B.N      ??PushInt_3
//   33   }
//   34   else
//   35   {
//   36     que->queArr[que->lastPos] = data;
??PushInt_0:
        LDR      R2,[R1, #+16]
        LDR      R3,[R1, #+0]
        STR      R0,[R3, R2, LSL #+2]
//   37     que->lastPos++;
        LDR      R2,[R1, #+16]
        ADDS     R2,R2,#+1
        STR      R2,[R1, #+16]
//   38     que->firstPos++;
        LDR      R2,[R1, #+12]
        ADDS     R2,R2,#+1
        STR      R2,[R1, #+12]
//   39   }
//   40   que->totle += data;
??PushInt_3:
        LDR      R2,[R1, #+8]
        ADDS     R0,R0,R2
        STR      R0,[R1, #+8]
//   41 }
        BX       LR               ;; return
//   42 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   43 static void PopInt(int num, QueByArr* que)
//   44 {
PopInt:
        PUSH     {R4,R5}
//   45   int i;
//   46   
//   47   if(num < que->size)    //�����������С�ڶ��г���
        LDR      R2,[R1, #+4]
        CMP      R0,R2
        BGE.N    ??PopInt_0
//   48   {
//   49     for(i=0;i<num;i++)
        MOVS     R2,#+0
        B.N      ??PopInt_1
//   50     {
//   51       que->totle -= que->queArr[que->firstPos];
//   52       if(que->firstPos < MAXARR-1)
//   53       {
//   54         que->firstPos++;
//   55       }
//   56       else
//   57       {
//   58         que->firstPos = 0;
??PopInt_2:
        MOVS     R3,#+0
        STR      R3,[R1, #+12]
//   59       }
??PopInt_3:
        ADDS     R2,R2,#+1
??PopInt_1:
        CMP      R2,R0
        BGE.N    ??PopInt_4
        LDR      R3,[R1, #+8]
        LDR      R4,[R1, #+12]
        LDR      R5,[R1, #+0]
        LDR      R4,[R5, R4, LSL #+2]
        SUBS     R3,R3,R4
        STR      R3,[R1, #+8]
        LDR      R3,[R1, #+12]
        CMP      R3,#+99
        BGE.N    ??PopInt_2
        LDR      R3,[R1, #+12]
        ADDS     R3,R3,#+1
        STR      R3,[R1, #+12]
        B.N      ??PopInt_3
//   60     }
//   61     que->size -= num;
??PopInt_4:
        LDR      R2,[R1, #+4]
        SUBS     R0,R2,R0
        STR      R0,[R1, #+4]
        B.N      ??PopInt_5
//   62 
//   63   }
//   64   else
//   65   {
//   66     que->firstPos = 0;
??PopInt_0:
        MOVS     R0,#+0
        STR      R0,[R1, #+12]
//   67     que->lastPos = 0;
        MOVS     R0,#+0
        STR      R0,[R1, #+16]
//   68     que->size = 0;
        MOVS     R0,#+0
        STR      R0,[R1, #+4]
//   69     que->totle = 0;
        MOVS     R0,#+0
        STR      R0,[R1, #+8]
//   70   }
//   71 }
??PopInt_5:
        POP      {R4,R5}
        BX       LR               ;; return
//   72  
//   73 static int FrontOf(QueByArr* que)
//   74 {
//   75   return (que->queArr[que->firstPos]);
//   76 }
//   77 
//   78 static int BackOf(QueByArr* que)
//   79 {
//   80   return (que->queArr[que->lastPos - 1]);
//   81 }
//   82 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   83 void JudgeWay(int gyroData)
//   84 {
JudgeWay:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   85   if(pathType == UNKONWN)   //�Ⱦ������г���
        LDR.N    R0,??DataTable0
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??JudgeWay_0
//   86   {
//   87     judgeWayLen = JUDGELEN;
        LDR.N    R0,??DataTable0_1
        MOVS     R1,#+40
        STR      R1,[R0, #+0]
        B.N      ??JudgeWay_1
//   88   }
//   89   else
//   90     judgeWayLen = NORMALLEN;
??JudgeWay_0:
        LDR.N    R0,??DataTable0_1
        MOVS     R1,#+20
        STR      R1,[R0, #+0]
//   91   //�ٽ���ѹ���г����в���
//   92   if(gyroQue.size < judgeWayLen)
??JudgeWay_1:
        LDR.N    R0,??DataTable0_2
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable0_1
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??JudgeWay_2
//   93     PushInt(abs_int(gyroData), &gyroQue);
        MOVS     R0,R4
        BL       abs_int
        LDR.N    R1,??DataTable0_2
        BL       PushInt
        B.N      ??JudgeWay_3
//   94   else
//   95   {
//   96     PopInt(gyroQue.size - judgeWayLen, &gyroQue);
??JudgeWay_2:
        LDR.N    R1,??DataTable0_2
        LDR.N    R0,??DataTable0_2
        LDR      R0,[R0, #+4]
        LDR.N    R2,??DataTable0_1
        LDR      R2,[R2, #+0]
        SUBS     R0,R0,R2
        BL       PopInt
//   97     PushInt(abs_int(gyroData), &gyroQue);
        MOVS     R0,R4
        BL       abs_int
        LDR.N    R1,??DataTable0_2
        BL       PushInt
//   98     PopInt(1, &gyroQue);
        LDR.N    R1,??DataTable0_2
        MOVS     R0,#+1
        BL       PopInt
//   99   }
//  100   averGyroVal = gyroQue.totle / gyroQue.size;
??JudgeWay_3:
        LDR.N    R0,??DataTable0_2
        LDR      R0,[R0, #+8]
        LDR.N    R1,??DataTable0_2
        LDR      R1,[R1, #+4]
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  101   //�ٽ�������ʶ��
//  102   if(pathType == UNKONWN)     //�����������δ֪
        LDR.N    R0,??DataTable0
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??JudgeWay_4
//  103   {
//  104     if(gyroQue.size >= judgeWayLen)   //ֻ�ж��г����㹻���Ż�����������ж�
        LDR.N    R0,??DataTable0_2
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable0_1
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BLT.N    ??JudgeWay_5
//  105     {
//  106       if(averGyroVal > TURNLEFTLIM)
        LDR.N    R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+201
        BLT.N    ??JudgeWay_6
//  107         pathType = LBENDPATH;
        LDR.N    R0,??DataTable0
        MOVS     R1,#+2
        STR      R1,[R0, #+0]
        B.N      ??JudgeWay_5
//  108       else
//  109         pathType = STRGPATH;
??JudgeWay_6:
        LDR.N    R0,??DataTable0
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
        B.N      ??JudgeWay_5
//  110     }
//  111   }
//  112   else if(pathType == STRGPATH)    //�����ֱ����
??JudgeWay_4:
        LDR.N    R0,??DataTable0
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??JudgeWay_7
//  113   {
//  114     if(averGyroVal > TURNLEFTLIM)
        LDR.N    R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+201
        BLT.N    ??JudgeWay_5
//  115       pathType = UNKONWN;
        LDR.N    R0,??DataTable0
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        B.N      ??JudgeWay_5
//  116   }
//  117   else if(pathType == LBENDPATH)    //�������ת�����
??JudgeWay_7:
        LDR.N    R0,??DataTable0
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??JudgeWay_5
//  118   {
//  119     if(averGyroVal < TURNLEFTLIM)
        LDR.N    R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+200
        BGE.N    ??JudgeWay_5
//  120       pathType = UNKONWN;
        LDR.N    R0,??DataTable0
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  121   }
//  122   //���Գ���
//  123 //  if(pathType == STRGPATH)
//  124 //    ONBUZZER();
//  125 //  else
//  126 //    OFFBUZZER();
//  127 }
??JudgeWay_5:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     pathType

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     judgeWayLen

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     gyroQue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     averGyroVal

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
// 416 bytes in section .bss
//  20 bytes in section .data
// 382 bytes in section .text
// 
// 382 bytes of CODE memory
// 436 bytes of DATA memory
//
//Errors: none
//Warnings: 2
