///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      22/Jul/2015  10:59:29 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Peripheral /
//                    _Oparation\MMA8451Q.c                                   /
//    Command line =  C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Peripheral /
//                    _Oparation\MMA8451Q.c -D IAR -lCN                       /
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
//                    \List\MMA8451Q.s                                        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME MMA8451Q

        #define SHT_PROGBITS 0x1

        EXTERN Delay_I2C
        EXTERN Single_Read
        EXTERN Single_Write

        PUBLIC Acc_X
        PUBLIC Acc_Y
        PUBLIC Acc_Z
        PUBLIC MMA8451Q_init
        PUBLIC Read_MMA8451Q

// C:\Users\dong\Desktop\7��20�����+ʮ����ʶ��\Peripheral_Oparation\MMA8451Q.c
//    1 #include "AllHeaders.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    3 int8s_t Acc_X,Acc_Y,Acc_Z;
Acc_X:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
Acc_Y:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
Acc_Z:
        DS8 1
//    4 
//    5 //��ʼ��MMA8451QΪָ��ģʽ

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    6 void MMA8451Q_init()
//    7 {	
MMA8451Q_init:
        PUSH     {R7,LR}
//    8   Single_Write(MMA845x_IIC_ADDRESS, CTRL_REG1, ASLP_RATE_20MS+DATA_RATE_5MS);
        MOVS     R2,#+16
        MOVS     R1,#+42
        MOVS     R0,#+28
        BL       Single_Write
//    9   Delay_I2C();
        BL       Delay_I2C
//   10   Single_Write(MMA845x_IIC_ADDRESS, XYZ_DATA_CFG_REG, FULL_SCALE_2G); //2G
        MOVS     R2,#+0
        MOVS     R1,#+14
        MOVS     R0,#+28
        BL       Single_Write
//   11   Delay_I2C();
        BL       Delay_I2C
//   12   Single_Write(MMA845x_IIC_ADDRESS, CTRL_REG1, ACTIVE_MASK);          //����״̬
        MOVS     R2,#+1
        MOVS     R1,#+42
        MOVS     R0,#+28
        BL       Single_Write
//   13   Delay_I2C();
        BL       Delay_I2C
//   14 }
        POP      {R0,PC}          ;; return
//   15 
//   16 //�����ٶȼ�XYZ������

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   17 void Read_MMA8451Q(void)
//   18 {
Read_MMA8451Q:
        PUSH     {R7,LR}
//   19   int8u_t Acc_temp;
//   20   
//   21   Acc_temp = Single_Read(MMA845x_IIC_ADDRESS,OUT_Y_MSB_REG);
        MOVS     R1,#+3
        MOVS     R0,#+28
        BL       Single_Read
//   22   Acc_X = Acc_temp;
        LDR.N    R1,??DataTable0
        STRB     R0,[R1, #+0]
//   23   
//   24    //�������¼����Խ�ʡʱ�䣬���ĸ����ĸ�
//   25   /*Acc_temp = Single_Read(MMA845x_IIC_ADDRESS,OUT_Y_MSB_REG);
//   26   Acc_Y = Acc_temp;
//   27   
//   28   Acc_temp = Single_Read(MMA845x_IIC_ADDRESS,OUT_Z_MSB_REG);
//   29   Acc_Z = Acc_temp;
//   30   */
//   31 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     Acc_X

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
//  3 bytes in section .bss
// 66 bytes in section .text
// 
// 66 bytes of CODE memory
//  3 bytes of DATA memory
//
//Errors: none
//Warnings: none
