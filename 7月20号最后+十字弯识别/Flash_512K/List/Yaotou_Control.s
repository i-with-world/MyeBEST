///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      19/Jul/2014  21:45:41 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\�ӳ���\Yaoto /
//                    u_Control\Yaotou_Control.c                              /
//    Command line =  E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\�ӳ���\Yaoto /
//                    u_Control\Yaotou_Control.c -D IAR -lCN                  /
//                    E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\Flash_512K\L /
//                    ist\ -lB E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\Fla /
//                    sh_512K\List\ -o E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_1 /
//                    7.48\Flash_512K\Obj\ --no_cse --no_unroll --no_inline   /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "D:\Program Files (x86)\iar\arm\INC\c\DLib_Config_Norma /
//                    l.h" -I E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\Libr /
//                    ary\CPU\ -I E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\ /
//                    Library\Drivers\ADC\ -I E:\ѧϰ\�ھŽ����ܳ�\ʡ������\1 /
//                    40719_17.48\Library\Drivers\FTM\ -I                     /
//                    E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\Library\Driv /
//                    ers\GPIO\ -I E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48 /
//                    \Library\Drivers\PIT\ -I E:\ѧϰ\�ھŽ����ܳ�\ʡ������\ /
//                    140719_17.48\MyFunction\ -I                             /
//                    E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\SD_System\   /
//                    -I E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\�ӳ���\OL /
//                    ED\ -I E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\�ӳ�� /
//                    �\ -I E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\�ӳ��� /
//                    \Sample_AD\ -I E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17. /
//                    48\�ӳ���\Judge_Way\ -I E:\ѧϰ\�ھŽ����ܳ�\ʡ������\1 /
//                    40719_17.48\�ӳ���\Moter_Control\ -I                    /
//                    E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\�ӳ���\Syste /
//                    m_Init\ -I E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\� /
//                    ӳ���\Turn_Control\ -I E:\ѧϰ\�ھŽ����ܳ�\ʡ������\14 /
//                    0719_17.48\�ӳ���\Yaotou_Control\ -I                    /
//                    E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\�ӳ���\bomak /
//                    aiguan\ -Ol                                             /
//    List file    =  E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\Flash_512K\L /
//                    ist\Yaotou_Control.s                                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Yaotou_Control

        #define SHT_PROGBITS 0x1

        EXTERN Black_Position_GuDing
        EXTERN Black_Position_YaoTou
        EXTERN Dwan
        EXTERN End_Servo_Temp
        EXTERN FTM_setPWMDty
        EXTERN GPIO_SetPinStat
        EXTERN PoDao_Flag
        EXTERN PoDao_Longth
        EXTERN RenZi_Queren_flag
        EXTERN RenZi_Queren_flag2
        EXTERN ShiZiWanBiaoZhi
        EXTERN ShiZiXiaoDou_Flag
        EXTERN ShiZi_Longth
        EXTERN Turn_Servo_Temp
        EXTERN YaoTou_CanShu
        EXTERN ZhuanTou_Flag_Right
        EXTERN ZhuanTou_QueRen_Flag
        EXTERN ZhuanTou_QueRen_Flag2
        EXTERN ZhuanTou_QueRen_Longth
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2d
        EXTERN __aeabi_i2f

        PUBLIC Desired_HuiZheng_Times
        PUBLIC End_Limit
        PUBLIC Measured_HuiZheng_Times
        PUBLIC QuanBai_LeiJi
        PUBLIC QuanBai_Longth_YaoTou
        PUBLIC Servo_Act
        PUBLIC TuBian_Longth
        PUBLIC Turn_BuChang
        PUBLIC Turn_D_Calculate_Enable
        PUBLIC Turn_KD
        PUBLIC Turn_KP_1
        PUBLIC Turn_KP_2
        PUBLIC Turn_KP_3
        PUBLIC Turn_Kp_In
        PUBLIC Turn_Kp_Out
        PUBLIC Turn_Servo_Temp_D
        PUBLIC Turn_Servo_Temp_P
        PUBLIC Turn_xishu
        PUBLIC YaoTou_Angle
        PUBLIC YaoTou_Angle_Last
        PUBLIC YaoTou_Calculate
        PUBLIC YaoTou_PID_Calculate
        PUBLIC YaoTou_PID_CanShu_Init
        PUBLIC wandaoxianshi

// E:\ѧϰ\�ھŽ����ܳ�\ʡ������\140719_17.48\�ӳ���\Yaotou_Control\Yaotou_Control.c
//    1 #include "All_HeaderFiles.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    3 float YaoTou_Angle = 0.0;
YaoTou_Angle:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 float YaoTou_Angle_Last = 0.0;
YaoTou_Angle_Last:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    5 float Turn_Kp_In = 0.5;
Turn_Kp_In:
        DATA
        DC32 3F000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    6 float Turn_Kp_Out = 0.6;
Turn_Kp_Out:
        DATA
        DC32 3F19999AH

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 float Turn_BuChang = 0.0;
Turn_BuChang:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 int Turn_Servo_Temp_P = 0;
Turn_Servo_Temp_P:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 int Turn_Servo_Temp_D = 0; 
Turn_Servo_Temp_D:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 int Turn_D_Calculate_Enable = 0;
Turn_D_Calculate_Enable:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 int Desired_HuiZheng_Times = 0;
Desired_HuiZheng_Times:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 int Measured_HuiZheng_Times = 0;
Measured_HuiZheng_Times:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 word TuBian_Longth=0;
TuBian_Longth:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 int QuanBai_Longth_YaoTou;
QuanBai_Longth_YaoTou:
        DS8 4
//   15 //int shizi1,shizi2;

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   16 byte QuanBai_LeiJi=0;
QuanBai_LeiJi:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   17 byte wandaoxianshi;
wandaoxianshi:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   18 int End_Limit=350;
End_Limit:
        DATA
        DC32 350
//   19 //word Ren_Judge=0;
//   20 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   21 float Turn_KP_1 =0.5;//0.32;//0.40;//0.55;//0.5;//0.5;//0.40                    //����
Turn_KP_1:
        DATA
        DC32 3F000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   22 float Turn_KP_2 =0.73;//0.43;//0.8;// 0.73;//0.73;//0.53
Turn_KP_2:
        DATA
        DC32 3F3AE148H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   23 float Turn_KP_3 =0.9;//1.0;//0.9;//0.8
Turn_KP_3:
        DATA
        DC32 3F666666H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   24 float Turn_KD =0.35;
Turn_KD:
        DATA
        DC32 3EB33333H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 float Turn_xishu=0;
Turn_xishu:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   26 void YaoTou_PID_CanShu_Init(void)//ҡͷ���PID������ʼ��
//   27 {
//   28   YaoTou_CanShu.P_Gain=YaoTou_KP;//4.5  7.0   4.0   4.5    4.5
YaoTou_PID_CanShu_Init:
        LDR.W    R0,??DataTable3
        LDR.W    R1,??DataTable3_1  ;; 0x40966666
        STR      R1,[R0, #+0]
//   29   YaoTou_CanShu.I_Gain=YaoTou_KI; //3.0 4.5   4.0   2.5     4
        LDR.W    R0,??DataTable3
        LDR.W    R1,??DataTable3_2  ;; 0x3fe66666
        STR      R1,[R0, #+4]
//   30   YaoTou_CanShu.D_Gain=YaoTou_KD;                // 0.1      10
        LDR.W    R0,??DataTable3
        LDR.W    R1,??DataTable3_3  ;; 0x40accccd
        STR      R1,[R0, #+8]
//   31   YaoTou_CanShu.Error_Pre=0;
        LDR.W    R0,??DataTable3
        MOVS     R1,#+0
        STR      R1,[R0, #+20]
//   32   YaoTou_CanShu.Error_Last=0;
        LDR.W    R0,??DataTable3
        MOVS     R1,#+0
        STR      R1,[R0, #+16]
//   33   YaoTou_CanShu.Error_Now=0;
        LDR.W    R0,??DataTable3
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
//   34   YaoTou_CanShu.P_Value=0.0;
        LDR.W    R0,??DataTable3
        MOVS     R1,#+0
        STR      R1,[R0, #+24]
//   35   YaoTou_CanShu.I_Value=0.0;
        LDR.W    R0,??DataTable3
        MOVS     R1,#+0
        STR      R1,[R0, #+28]
//   36   YaoTou_CanShu.D_Value=0.0;
        LDR.W    R0,??DataTable3
        MOVS     R1,#+0
        STR      R1,[R0, #+32]
//   37   YaoTou_CanShu.DesiredValue=0;
        LDR.W    R0,??DataTable3
        MOVS     R1,#+0
        STR      R1,[R0, #+36]
//   38   YaoTou_CanShu.MeasuredValue=0;
        LDR.W    R0,??DataTable3
        MOVS     R1,#+0
        STR      R1,[R0, #+40]
//   39   YaoTou_CanShu.Value_temp=0.0;
        LDR.W    R0,??DataTable3
        MOVS     R1,#+0
        STR      R1,[R0, #+44]
//   40 }
        BX       LR               ;; return
//   41 
//   42 
//   43 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   44 void YaoTou_Calculate(void)  //��������к���ҡͷ���PID���㣬���붨ʱ����,����ҡͷ�������PID  
//   45 {  //(ccd_value_YaoTou_Change_num<=64)&&
YaoTou_Calculate:
        PUSH     {R7,LR}
//   46 // if((((Black_Position_Last_YaoTou-Black_Position_YaoTou<20)&&(Black_Position_Last_YaoTou-Black_Position_YaoTou>-20))||((Turn_Servo_Temp>-200)&&(Turn_Servo_Temp<200))))
//   47  { 
//   48    
//   49    
//   50   
//   51    YaoTou_CanShu.MeasuredValue=Black_Position_YaoTou;//�õ���ǰ����λ��
        LDR.W    R0,??DataTable3
        LDR.W    R1,??DataTable3_4
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+40]
//   52   // if(FangDiuXian_Flag==0)
//   53    //if(Ren_Judge==0) 
//   54    //{
//   55       YaoTou_PID_Calculate(&YaoTou_CanShu);
        LDR.W    R0,??DataTable3
        BL       YaoTou_PID_Calculate
//   56    //}
//   57     /*���ִ������
//   58    if(black_num_YaoTou==0&&Ren_Judge==0) 
//   59    {
//   60       QuanBai_LeiJi++;
//   61       if(QuanBai_LeiJi>=2) 
//   62       {
//   63           QuanBai_LeiJi=0;
//   64           Ren_Judge=2000;
//   65           if(Black_Position_YaoTou<0)   YaoTou_CanShu.Value_temp=1000;
//   66           else    YaoTou_CanShu.Value_temp=-1000;
//   67       }
//   68       
//   69    }
//   70    */
//   71    YaoTou_CanShu.P_Gain=YaoTou_KP;//4.5  7.0   4.0   4.5    4.5
        LDR.W    R0,??DataTable3
        LDR.W    R1,??DataTable3_1  ;; 0x40966666
        STR      R1,[R0, #+0]
//   72    YaoTou_CanShu.I_Gain=YaoTou_KI; //3.0 4.5   4.0   2.5     4
        LDR.W    R0,??DataTable3
        LDR.W    R1,??DataTable3_2  ;; 0x3fe66666
        STR      R1,[R0, #+4]
//   73    YaoTou_CanShu.D_Gain=YaoTou_KD;                // 0.1      10
        LDR.W    R0,??DataTable3
        LDR.W    R1,??DataTable3_3  ;; 0x40accccd
        STR      R1,[R0, #+8]
//   74     
//   75  } 
//   76 
//   77 
//   78 }
        POP      {R0,PC}          ;; return
//   79 
//   80 
//   81 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   82 void Servo_Act(void) 
//   83 {     
Servo_Act:
        PUSH     {R4,LR}
//   84   
//   85  
//   86 // if(black_num_GuDing==127) 
//   87 // {
//   88 //   Black_Position_GuDing=Black_Position_Last_GuDing;
//   89 // }
//   90 // 
//   91 //  if(black_num_YaoTou==0) 
//   92 // {
//   93 //   if(YaoTou_CanShu.Value_temp>=400&&YaoTou_CanShu.Value_temp<=-400)
//   94 //   YaoTou_CanShu.Value_temp=0;
//   95 // }
//   96   
//   97      if(YaoTou_CanShu.Value_temp >=900)
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+44]
        LDR.W    R1,??DataTable3_5  ;; 0x44610000
        BL       __aeabi_cfrcmple
        BHI.N    ??Servo_Act_0
//   98 	YaoTou_CanShu.DesiredValue =-3; //-3;
        LDR.W    R0,??DataTable3
        MVNS     R1,#+2
        STR      R1,[R0, #+36]
        B.N      ??Servo_Act_1
//   99         else
//  100 	 if(YaoTou_CanShu.Value_temp >= 700)
??Servo_Act_0:
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+44]
        LDR.W    R1,??DataTable3_6  ;; 0x442f0000
        BL       __aeabi_cfrcmple
        BHI.N    ??Servo_Act_2
//  101 	  YaoTou_CanShu.DesiredValue =-2; //-2;
        LDR.W    R0,??DataTable3
        MVNS     R1,#+1
        STR      R1,[R0, #+36]
        B.N      ??Servo_Act_1
//  102 	    else 
//  103                if(YaoTou_CanShu.Value_temp >= 500)
??Servo_Act_2:
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+44]
        LDR.W    R1,??DataTable3_7  ;; 0x43fa0000
        BL       __aeabi_cfrcmple
        BHI.N    ??Servo_Act_3
//  104 		YaoTou_CanShu.DesiredValue =-1; 
        LDR.W    R0,??DataTable3
        MOVS     R1,#-1
        STR      R1,[R0, #+36]
        B.N      ??Servo_Act_1
//  105 		else
//  106 		  if(YaoTou_CanShu.Value_temp <= -900)
??Servo_Act_3:
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+44]
        LDR.W    R1,??DataTable3_8  ;; 0xc460ffff
        BL       __aeabi_cfcmple
        BCS.N    ??Servo_Act_4
//  107 		  YaoTou_CanShu.DesiredValue =3; //3;
        LDR.W    R0,??DataTable3
        MOVS     R1,#+3
        STR      R1,[R0, #+36]
        B.N      ??Servo_Act_1
//  108 		    else
//  109 		     if(YaoTou_CanShu.Value_temp <= -700)
??Servo_Act_4:
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+44]
        LDR.W    R1,??DataTable3_9  ;; 0xc42effff
        BL       __aeabi_cfcmple
        BCS.N    ??Servo_Act_5
//  110 			YaoTou_CanShu.DesiredValue =2;//2;
        LDR.W    R0,??DataTable3
        MOVS     R1,#+2
        STR      R1,[R0, #+36]
        B.N      ??Servo_Act_1
//  111 			  else 
//  112 			   if(YaoTou_CanShu.Value_temp <= -500)
??Servo_Act_5:
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+44]
        LDR.W    R1,??DataTable3_10  ;; 0xc3f9ffff
        BL       __aeabi_cfcmple
        BCS.N    ??Servo_Act_6
//  113 			      YaoTou_CanShu.DesiredValue =1; 		
        LDR.W    R0,??DataTable3
        MOVS     R1,#+1
        STR      R1,[R0, #+36]
        B.N      ??Servo_Act_1
//  114 				else
//  115 			         YaoTou_CanShu.DesiredValue = 0;	
??Servo_Act_6:
        LDR.W    R0,??DataTable3
        MOVS     R1,#+0
        STR      R1,[R0, #+36]
//  116 	/*****************************************************************
//  117 		���¼���ת����ת��
//  118 		*****************************************************************/					
//  119 		
//  120 	  
//  121     
//  122         YaoTou_Angle = YaoTou_CanShu.Value_temp;//�õ�ҡͷת��
??Servo_Act_1:
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+44]
        LDR.W    R1,??DataTable3_11
        STR      R0,[R1, #+0]
//  123 		
//  124 		
//  125 				
//  126 			if(YaoTou_Angle <=400 && YaoTou_Angle >= -400)
        LDR.W    R0,??DataTable3_11
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_12  ;; 0x43c80001
        BL       __aeabi_cfcmple
        BCS.N    ??Servo_Act_7
        LDR.W    R0,??DataTable3_11
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_13  ;; 0xc3c80000
        BL       __aeabi_cfrcmple
        BHI.N    ??Servo_Act_7
//  127 			{
//  128 				Turn_Servo_Temp_P = (int)(YaoTou_Angle*Turn_KP_1);//���������Ƕ��������			
        LDR.W    R0,??DataTable3_11
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_14
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2iz
        LDR.W    R1,??DataTable3_15
        STR      R0,[R1, #+0]
        B.N      ??Servo_Act_8
//  129 			}
//  130 			else
//  131 			{
//  132 				if(YaoTou_Angle<800&&YaoTou_Angle > 400)  //�սǽϴ�ʱ�������ϵ���ϴ󣬵�ҲҪ���ֽ���
??Servo_Act_7:
        LDR.W    R0,??DataTable3_11
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_16  ;; 0x44480000
        BL       __aeabi_cfcmple
        BCS.N    ??Servo_Act_9
        LDR.W    R0,??DataTable3_11
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_12  ;; 0x43c80001
        BL       __aeabi_cfrcmple
        BHI.N    ??Servo_Act_9
//  133 				{
//  134 					Turn_Servo_Temp_P = (int)(YaoTou_Angle * Turn_KP_2 - 400*(Turn_KP_2-Turn_KP_1));//���������Ƕ��������	
        LDR.W    R0,??DataTable3_11
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_17
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.W    R0,??DataTable3_14
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_17
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable3_18  ;; 0x43c80000
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        LDR.W    R1,??DataTable3_15
        STR      R0,[R1, #+0]
        B.N      ??Servo_Act_8
//  135 				}
//  136 				else
//  137 					if(YaoTou_Angle>-800&&YaoTou_Angle < -400)
??Servo_Act_9:
        LDR.W    R0,??DataTable3_11
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_19  ;; 0xc447ffff
        BL       __aeabi_cfrcmple
        BHI.N    ??Servo_Act_10
        LDR.W    R0,??DataTable3_11
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_13  ;; 0xc3c80000
        BL       __aeabi_cfcmple
        BCS.N    ??Servo_Act_10
//  138 					{
//  139 						Turn_Servo_Temp_P = (int)(YaoTou_Angle * Turn_KP_2 + 400*(Turn_KP_2-Turn_KP_1));//���������Ƕ��������	
        LDR.W    R0,??DataTable3_11
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_17
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.W    R0,??DataTable3_17
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_14
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable3_18  ;; 0x43c80000
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        LDR.W    R1,??DataTable3_15
        STR      R0,[R1, #+0]
        B.N      ??Servo_Act_8
//  140 					} 
//  141 					else
//  142 					      if(YaoTou_Angle>800)
??Servo_Act_10:
        LDR.W    R0,??DataTable3_11
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_20  ;; 0x44480001
        BL       __aeabi_cfrcmple
        BHI.N    ??Servo_Act_11
//  143 					      {
//  144 					         Turn_Servo_Temp_P = (int)((YaoTou_Angle-800) * Turn_KP_3+400*Turn_KP_2+400*Turn_KP_1);//���������Ƕ��������
        LDR.W    R0,??DataTable3_11
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_21  ;; 0xc4480000
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable3_22
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.W    R0,??DataTable3_17
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_18  ;; 0x43c80000
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR.W    R0,??DataTable3_14
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_18  ;; 0x43c80000
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        LDR.W    R1,??DataTable3_15
        STR      R0,[R1, #+0]
        B.N      ??Servo_Act_8
//  145 					      } 
//  146 					      else     //  YaoTou_Angle<-600
//  147 					      {
//  148 					         Turn_Servo_Temp_P = (int)((YaoTou_Angle+800) * Turn_KP_3-400*Turn_KP_2-400*Turn_KP_1);//���������Ƕ��������
??Servo_Act_11:
        LDR.W    R0,??DataTable3_11
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_16  ;; 0x44480000
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable3_22
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.W    R0,??DataTable3_17
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_18  ;; 0x43c80000
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR.W    R0,??DataTable3_14
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_18  ;; 0x43c80000
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        BL       __aeabi_f2iz
        LDR.W    R1,??DataTable3_15
        STR      R0,[R1, #+0]
//  149 					      }
//  150 			}
//  151 	
//  152 
//  153 //
//  154 //		//if(++Turn_D_Calculate_Enable >= 4) //ÿ20ms����һ��΢�ּ���
//  155 //  	//{
//  156 //		//Turn_D_Calculate_Enable = 0;
//  157 			Turn_Servo_Temp_D = (int)((YaoTou_Angle - YaoTou_Angle_Last)*Turn_KD);
??Servo_Act_8:
        LDR.W    R0,??DataTable3_11
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_23
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable3_24
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2iz
        LDR.W    R1,??DataTable3_25
        STR      R0,[R1, #+0]
//  158 			YaoTou_Angle_Last = YaoTou_Angle;	
        LDR.W    R0,??DataTable3_23
        LDR.W    R1,??DataTable3_11
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  159 //	  //}
//  160 //	
//  161 	
//  162 	                                          
//  163        //Turn_Servo_Temp=-*Black_Position_GuDing;
//  164 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////                       
//  165 //     if(black_num_GuDing<10)
//  166 //       Turn_Servo_Temp = 0;
//  167 //     else
//  168 //     { if(ShiZiXiaoDou_Flag==0) 
//  169 //	    {
//  170 //	    
//  171 //	    
//  172 //	    
//  173 //		    	Turn_Servo_Temp =  Turn_Servo_Temp_P + Turn_Servo_Temp_D; //��Ƕ�����ѵõ���Pֵ��Dֵ���
//  174 //			    
//  175 //		        Turn_Servo_Temp -= Black_Position_YaoTou * 18;
//  176 //	      }
//  177 //			 
//  178 //			 else 
//  179 //			 {
//  180 //			    Turn_Servo_Temp =(int) (0.7* Turn_Servo_Temp_P + 0.7*Turn_Servo_Temp_D); //��Ƕ�����ѵõ���Pֵ��Dֵ���
//  181 //
//  182 //		  	 	Turn_Servo_Temp -=(int) (0.7*Black_Position_YaoTou * 13);
//  183 //			         
//  184 //	    	         }
//  185 //     }
//  186      
//  187 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
//  188      
//  189 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////     
//  190 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
//  191 
//  192 
//  193 if(ShiZiWanBiaoZhi==1)//תͷ��⵽ȫ�׾��볤��һ�����ȣ�����ʮ�������
        LDR.W    R0,??DataTable3_26
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Servo_Act_12
//  194 		{	    
//  195 		    YaoTou_CanShu.Value_temp = 0; //����ʮ�����Ժ�תͷ�����м�ֵ
        LDR.W    R0,??DataTable3
        MOVS     R1,#+0
        STR      R1,[R0, #+44]
//  196 		    //ON_BUZZER();   
//  197 		    /******��ͷ��⵽ȫ��һ��ʱ�䣬��ͷȫ����ǰһֱ���ն�ͷ��*************************/
//  198 		    if(QuanBai_Longth_YaoTou>=10) 
        LDR.W    R0,??DataTable3_27
        LDR      R0,[R0, #+0]
        CMP      R0,#+10
        BLT.N    ??Servo_Act_13
//  199 		    {
//  200 		        ShiZi_Longth=0;
        LDR.W    R0,??DataTable3_28
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  201 		        ShiZiWanBiaoZhi=0;
        LDR.W    R0,??DataTable3_26
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  202                         //ShiZiWanBiaoZhi1=0;
//  203                         //ShiZiWanBiaoZhi2=0;
//  204 		        ShiZiXiaoDou_Flag=1;   
        LDR.W    R0,??DataTable3_29
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  205                         QuanBai_Longth_YaoTou=0;
        LDR.W    R0,??DataTable3_27
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  206 		    }
//  207 		   
//  208 		    /******ʮ���������ʻ�ܾ������ƣ�100Ϊ����תһȦ�����ڴ˳�����Ϊ�Ѿ��߹�ʮ��*******/
//  209 		    if(ShiZi_Longth>=4000)   
??Servo_Act_13:
        LDR.W    R0,??DataTable3_28
        LDR      R0,[R0, #+0]
        CMP      R0,#+4000
        BLT.N    ??Servo_Act_14
//  210 		    {
//  211 		        ShiZi_Longth=0;
        LDR.W    R0,??DataTable3_28
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  212 		        ShiZiWanBiaoZhi=0;
        LDR.W    R0,??DataTable3_26
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  213 		    }
//  214 		   
//  215 		    /******����ȫ���Ժ��ն�ͷ��******************************************************/
//  216 		    if(ShiZiWanBiaoZhi==1)  //�����ټ�һ���жϣ���ֹʮ�ֱ�־�����Turn_Servo_Temp�����ϼ������ֵ������
??Servo_Act_14:
        LDR.W    R0,??DataTable3_26
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Servo_Act_15
//  217 		       // Turn_Servo_Temp = -42*Black_Position_GuDing;//���ڶ�ͷ���ǰ��մ���������
//  218 		        Turn_Servo_Temp = -40*Black_Position_GuDing;//���ڶ�ͷ���ǰ��մ���������
        LDR.W    R0,??DataTable3_30
        LDR      R0,[R0, #+0]
        MVNS     R1,#+39
        MULS     R0,R1,R0
        LDR.W    R1,??DataTable3_31
        STR      R0,[R1, #+0]
//  219 		        YaoTou_CanShu.Value_temp = 0;
??Servo_Act_15:
        LDR.W    R0,??DataTable3
        MOVS     R1,#+0
        STR      R1,[R0, #+44]
        B.N      ??Servo_Act_16
//  220 		}
//  221 		/***********************************************************
//  222     �����ܵ�(��ʮ�ֽ��洦)�������
//  223     ***********************************************************/ 
//  224 		else
//  225 	  {  
//  226 	  
//  227 	    if(ShiZiXiaoDou_Flag==0) 
??Servo_Act_12:
        LDR.W    R0,??DataTable3_29
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.W    ??Servo_Act_17
//  228 	    {
//  229 	    
//  230 	        //Turn_Servo_Temp = YaoTou_CanShu.Value_temp;
//  231 	    
//  232 		    	Turn_Servo_Temp = (int)(( Turn_Servo_Temp_P + Turn_Servo_Temp_D))+(int)(Turn_xishu*( Turn_Servo_Temp_P + Turn_Servo_Temp_D)); //��Ƕ�����ѵõ���Pֵ��Dֵ���
        LDR.W    R0,??DataTable3_15
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_25
        LDR      R1,[R1, #+0]
        ADDS     R4,R1,R0
        LDR.W    R0,??DataTable3_15
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_25
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable3_32
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2iz
        ADDS     R0,R0,R4
        LDR.W    R1,??DataTable3_31
        STR      R0,[R1, #+0]
//  233 			    
//  234 			//	Turn_Servo_Temp -= YaoTou_CanShu.DesiredValue * 30; //������ΪĿ��ֵ�ĸı䣬��ɵ�Pֵ�Ĳ�ֵ
//  235 	
//  236 		  	 	Turn_Servo_Temp -= Black_Position_YaoTou * 20;//+Black_Position_GuDing *20 ;
        LDR.W    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_4
        LDR      R1,[R1, #+0]
        MOVS     R2,#+20
        MLS      R0,R2,R1,R0
        LDR.W    R1,??DataTable3_31
        STR      R0,[R1, #+0]
//  237 		      //if(Turn_Servo_Temp>0)Turn_Servo_Temp=(int)(Turn_Servo_Temp*1.15);
//  238 		      
//  239     	   if(RenZi_Queren_flag==0&&RenZi_Queren_flag2==0)
        LDR.W    R0,??DataTable3_33
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable3_34
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??Servo_Act_18
//  240     		 {  if(Dwan%2==0)
        LDR.W    R0,??DataTable3_35
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BNE.N    ??Servo_Act_19
//  241     		        //Turn_Servo_Temp-=(int)(Black_Position_GuDing*5);
//  242                  {  
//  243                    Turn_Servo_Temp-=Black_Position_GuDing*7;
        LDR.W    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_30
        LDR      R1,[R1, #+0]
        MOVS     R2,#+7
        MLS      R0,R2,R1,R0
        LDR.W    R1,??DataTable3_31
        STR      R0,[R1, #+0]
        B.N      ??Servo_Act_20
//  244 //                    Car_Speed   =  107    ;         //����
//  245 //                    Min_Speed  =  82   ;         //�������
//  246 //                    Max_Speed =   120 ;        //�����ٶ�
//  247                  }
//  248     		  /*	 	if((Black_Position_GuDing-Black_Position_Last_GuDing)<200&&(Black_Position_GuDing-Black_Position_Last_GuDing)>-200)
//  249     		 	       Turn_Servo_Temp-=2*(Black_Position_GuDing-Black_Position_Last_GuDing);
//  250     		 	 	  else if((Black_Position_GuDing-Black_Position_Last_GuDing)>200)
//  251     		 	  	        Turn_Servo_Temp-=200;
//  252     			         else
//  253     		              Turn_Servo_Temp-=-200;*/ 
//  254                      //else
//  255                        //Turn_Servo_Temp-=Black_Position_GuDing*2;
//  256                     else
//  257                     { 
//  258                       Turn_Servo_Temp += (int)(0.1*( Turn_Servo_Temp_P + Turn_Servo_Temp_D));
??Servo_Act_19:
        LDR.W    R0,??DataTable3_31
        LDR      R4,[R0, #+0]
        LDR.W    R0,??DataTable3_15
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_25
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        BL       __aeabi_i2d
        LDR.W    R2,??DataTable3_36  ;; 0x9999999a
        LDR.W    R3,??DataTable3_37  ;; 0x3fb99999
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        ADDS     R0,R0,R4
        LDR.W    R1,??DataTable3_31
        STR      R0,[R1, #+0]
        B.N      ??Servo_Act_20
//  259 //                      Car_Speed   =  95    ;         //����
//  260 //                      Min_Speed  =  75   ;         //�������
//  261 //                      Max_Speed =   105 ;        //�����ٶ�
//  262                     }
//  263      }
//  264            else
//  265            {  if(RenZi_Queren_flag==1)
??Servo_Act_18:
        LDR.W    R0,??DataTable3_33
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Servo_Act_21
//  266               { 
//  267                 //if(Turn_Servo_Temp_P>0)
//  268                   Turn_Servo_Temp=-600;
        LDR.W    R0,??DataTable3_31
        LDR.W    R1,??DataTable3_38  ;; 0xfffffda8
        STR      R1,[R0, #+0]
//  269                 //else
//  270                  //  Turn_Servo_Temp=(int)(( Turn_Servo_Temp_P + Turn_Servo_Temp_D))-500;
//  271                    
//  272                 ON_BUZZER();
        MOVS     R2,#+1
        MOVS     R1,#+17
        LDR.W    R0,??DataTable3_39  ;; 0x400ff000
        BL       GPIO_SetPinStat
//  273               }    
//  274                if(RenZi_Queren_flag2==1)
??Servo_Act_21:
        LDR.W    R0,??DataTable3_34
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Servo_Act_20
//  275                {
//  276                 // if(Turn_Servo_Temp_P<0)
//  277                   Turn_Servo_Temp=650;
        LDR.W    R0,??DataTable3_31
        MOVW     R1,#+650
        STR      R1,[R0, #+0]
//  278                // else
//  279                //    Turn_Servo_Temp=(int)(( Turn_Servo_Temp_P + Turn_Servo_Temp_D))+500;
//  280                  ON_BUZZER();
        MOVS     R2,#+1
        MOVS     R1,#+17
        LDR.W    R0,??DataTable3_39  ;; 0x400ff000
        BL       GPIO_SetPinStat
        B.N      ??Servo_Act_20
//  281                }
//  282            }
//  283     		 //if(black_num_Ce>30&&black_num_Ce<80) 
//  284     		// Turn_Servo_Temp+=4*Black_Position_Ce;
//  285 //    	   if((ZhiDao_Flag_Last==1&&ZhiDao_Flag==0))
//  286 //           {  
//  287 //              Turn_Servo_Temp -=Black_Position_GuDing *20 ;
//  288 //           }
//  289 //    		   
//  290 //           else
//  291 //           {
//  292 //              //if(ZhiDao_Flag==0&&(YaoTou_Angle >=400 && YaoTou_Angle <= -400))
//  293 //                
//  294 //              //  Turn_Servo_Temp -=Black_Position_GuDing *20 ;
//  295 //              if( (Black_Position_GuDing>=23|| Black_Position_GuDing<=-23)&&ZhiDao_Flag==0)
//  296 //                Turn_Servo_Temp -=Black_Position_GuDing *20 ;
//  297 //           }   
//  298 			        
//  299             }
//  300 			 
//  301 			 else 
//  302 			 { YaoTou_CanShu.Value_temp = 0;
??Servo_Act_17:
        LDR.N    R0,??DataTable3
        MOVS     R1,#+0
        STR      R1,[R0, #+44]
//  303 			    //Turn_Servo_Temp =(int)( 0.7* Turn_Servo_Temp_P + 0.7*Turn_Servo_Temp_D); //��Ƕ�����ѵõ���Pֵ��Dֵ���
//  304                             //Turn_Servo_Temp = -40*Black_Position_GuDing;
//  305 		  	 Turn_Servo_Temp -=( int)(Black_Position_GuDing * 20);
        LDR.W    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_30
        LDR      R1,[R1, #+0]
        MOVS     R2,#+20
        MLS      R0,R2,R1,R0
        LDR.N    R1,??DataTable3_31
        STR      R0,[R1, #+0]
//  306 			    if(Turn_Servo_Temp>300||Turn_Servo_Temp<-300) 
        LDR.N    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+300
        CMP      R0,#+600
        BLS.N    ??Servo_Act_20
//  307                                 Turn_Servo_Temp=Turn_Servo_Temp/5;
        LDR.N    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        MOVS     R1,#+5
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable3_31
        STR      R0,[R1, #+0]
//  308 	    	        }
//  309             
//  310             if(ZhuanTou_QueRen_Flag==1&&ZhuanTou_Flag_Right==1)
??Servo_Act_20:
        LDR.N    R0,??DataTable3_40
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Servo_Act_22
        LDR.N    R0,??DataTable3_41
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Servo_Act_22
//  311               if(ZhuanTou_QueRen_Longth<=1000)
        LDR.N    R0,??DataTable3_42
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BHI.N    ??Servo_Act_23
//  312               { 
//  313               Turn_Servo_Temp=300;
        LDR.N    R0,??DataTable3_31
        MOV      R1,#+300
        STR      R1,[R0, #+0]
        B.N      ??Servo_Act_22
//  314               //YaoTou_CanShu.Value_temp=-600;
//  315               }
//  316              else 
//  317                //if(ZhuanTou_QueRen_Longth<=1000)
//  318                //{  Turn_Servo_Temp=0;
//  319                //YaoTou_CanShu.Value_temp=-600;
//  320               //}
//  321               // else 
//  322                  if(ZhuanTou_QueRen_Longth<=2000)
??Servo_Act_23:
        LDR.N    R0,??DataTable3_42
        LDR      R0,[R0, #+0]
        CMP      R0,#+2000
        BHI.N    ??Servo_Act_22
//  323                     Turn_Servo_Temp=-300;
        LDR.N    R0,??DataTable3_31
        LDR.N    R1,??DataTable3_43  ;; 0xfffffed4
        STR      R1,[R0, #+0]
//  324                   //else
//  325                   //  Turn_Servo_Temp=0;
//  326              if(ZhuanTou_QueRen_Flag2==1&&ZhuanTou_Flag_Right==2)
??Servo_Act_22:
        LDR.N    R0,??DataTable3_44
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Servo_Act_24
        LDR.N    R0,??DataTable3_41
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??Servo_Act_24
//  327               if(ZhuanTou_QueRen_Longth<=1000)
        LDR.N    R0,??DataTable3_42
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BHI.N    ??Servo_Act_25
//  328               { 
//  329               Turn_Servo_Temp=-300;
        LDR.N    R0,??DataTable3_31
        LDR.N    R1,??DataTable3_43  ;; 0xfffffed4
        STR      R1,[R0, #+0]
        B.N      ??Servo_Act_24
//  330               //YaoTou_CanShu.Value_temp=-600;
//  331               }
//  332              else 
//  333               // if(ZhuanTou_QueRen_Longth<=1000)
//  334               // {  Turn_Servo_Temp=0;
//  335                //YaoTou_CanShu.Value_temp=-600;
//  336               // }
//  337               // else 
//  338                  if(ZhuanTou_QueRen_Longth<=2000)
??Servo_Act_25:
        LDR.N    R0,??DataTable3_42
        LDR      R0,[R0, #+0]
        CMP      R0,#+2000
        BHI.N    ??Servo_Act_24
//  339                     Turn_Servo_Temp=300;
        LDR.N    R0,??DataTable3_31
        MOV      R1,#+300
        STR      R1,[R0, #+0]
//  340                  // else
//  341                  //   Turn_Servo_Temp=0;   
//  342                 
//  343                 
//  344          if(PoDao_Flag==1)  
??Servo_Act_24:
        LDR.N    R0,??DataTable3_45
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Servo_Act_16
//  345          { YaoTou_CanShu.Value_temp=0; 
        LDR.N    R0,??DataTable3
        MOVS     R1,#+0
        STR      R1,[R0, #+44]
//  346            Turn_Servo_Temp=0;
        LDR.N    R0,??DataTable3_31
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  347            if(PoDao_Longth>=8000)
        LDR.N    R0,??DataTable3_46
        LDR      R0,[R0, #+0]
        CMP      R0,#+8000
        BCC.N    ??Servo_Act_26
//  348              PoDao_Flag=2;
        LDR.N    R0,??DataTable3_45
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  349             PoDao_Longth=0;
??Servo_Act_26:
        LDR.N    R0,??DataTable3_46
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  350             OFF_BUZZER();
        MOVS     R2,#+0
        MOVS     R1,#+17
        LDR.N    R0,??DataTable3_39  ;; 0x400ff000
        BL       GPIO_SetPinStat
//  351            
//  352          }
//  353 	  }
//  354 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////     
//  355 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////     
//  356      
//  357      
//  358      //Turn_Servo_Temp=2*Turn_Servo_Temp;
//  359       //Turn_Servo_Temp = -40*Black_Position_GuDing;
//  360       //End_Servo_Temp=(int)(Turn_Servo_Temp*End_KP1);
//  361 //      if( End_Servo_Temp>=80)
//  362 //          End_Servo_Temp=80;
//  363 //      else
//  364 //      if( End_Servo_Temp<=-80)
//  365 //          End_Servo_Temp=-80;
//  366 //      else
//  367 //         End_Servo_Temp=0;
//  368       
//  369       
//  370       if(Turn_Servo_Temp >650)    //�������ж�������޷�
??Servo_Act_16:
        LDR.N    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        MOVW     R1,#+651
        CMP      R0,R1
        BLT.N    ??Servo_Act_27
//  371       Turn_Servo_Temp =650;
        LDR.N    R0,??DataTable3_31
        MOVW     R1,#+650
        STR      R1,[R0, #+0]
//  372       if(Turn_Servo_Temp < -650)
??Servo_Act_27:
        LDR.N    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_47  ;; 0xfffffd76
        CMP      R0,R1
        BGE.N    ??Servo_Act_28
//  373       Turn_Servo_Temp = -650;
        LDR.N    R0,??DataTable3_31
        LDR.N    R1,??DataTable3_47  ;; 0xfffffd76
        STR      R1,[R0, #+0]
//  374 
//  375     
//  376 
//  377     if(YaoTou_CanShu.Value_temp > 1200)
??Servo_Act_28:
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+44]
        LDR.N    R1,??DataTable3_48  ;; 0x44960001
        BL       __aeabi_cfrcmple
        BHI.N    ??Servo_Act_29
//  378     	YaoTou_CanShu.Value_temp = 1200;
        LDR.N    R0,??DataTable3
        LDR.N    R1,??DataTable3_49  ;; 0x44960000
        STR      R1,[R0, #+44]
//  379     if(YaoTou_CanShu.Value_temp < -1200)
??Servo_Act_29:
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+44]
        LDR.N    R1,??DataTable3_50  ;; 0xc4960000
        BL       __aeabi_cfcmple
        BCS.N    ??Servo_Act_30
//  380     	YaoTou_CanShu.Value_temp = -1200;
        LDR.N    R0,??DataTable3
        LDR.N    R1,??DataTable3_50  ;; 0xc4960000
        STR      R1,[R0, #+44]
//  381     
//  382     
//  383  
//  384     if(Turn_Servo_Temp<250&&Turn_Servo_Temp>-250)
??Servo_Act_30:
        LDR.N    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+249
        CMP      R0,#+498
        BHI.N    ??Servo_Act_31
//  385     {  End_Servo_Temp=0;}//(int)(-Turn_Servo_Temp*End_KP1);	}
        LDR.N    R0,??DataTable3_51
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        B.N      ??Servo_Act_32
//  386 		 
//  387            else
//  388              if(Turn_Servo_Temp>250)
??Servo_Act_31:
        LDR.N    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        CMP      R0,#+251
        BLT.N    ??Servo_Act_33
//  389                      End_Servo_Temp=(int)(-(Turn_Servo_Temp-250)*End_KP1);//(int)(-450*End_KP1-(Turn_Servo_Temp-450)*End_KP2);
        LDR.N    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+250
        RSBS     R0,R0,#+0
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable3_52  ;; 0x3fe00000
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        LDR.N    R1,??DataTable3_51
        STR      R0,[R1, #+0]
        B.N      ??Servo_Act_32
//  390 		else
//  391                   
//  392                   if(Turn_Servo_Temp<-250)
??Servo_Act_33:
        LDR.N    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        CMN      R0,#+250
        BGE.N    ??Servo_Act_32
//  393                      End_Servo_Temp=(int)((Turn_Servo_Temp+250)*End_KP1);
        LDR.N    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+250
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable3_52  ;; 0x3fe00000
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        LDR.N    R1,??DataTable3_51
        STR      R0,[R1, #+0]
//  394        
//  395        
//  396 //   if(End_Servo_Temp<0) 
//  397 //     End_Servo_Temp=(int)(End_Servo_Temp*1.2);    //˦β�ҹմ��
//  398     
//  399     if(End_Servo_Temp >End_Limit)
??Servo_Act_32:
        LDR.N    R0,??DataTable3_53
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_51
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??Servo_Act_34
//  400         End_Servo_Temp=End_Limit;
        LDR.N    R0,??DataTable3_51
        LDR.N    R1,??DataTable3_53
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  401     if(End_Servo_Temp < -End_Limit)
??Servo_Act_34:
        LDR.N    R0,??DataTable3_51
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_53
        LDR      R1,[R1, #+0]
        CMN      R0,R1
        BGE.N    ??Servo_Act_35
//  402         End_Servo_Temp = -End_Limit;
        LDR.N    R0,??DataTable3_51
        LDR.N    R1,??DataTable3_53
        LDR      R1,[R1, #+0]
        RSBS     R1,R1,#+0
        STR      R1,[R0, #+0]
//  403       
//  404     
//  405       //YaoTouPWMDTY_(Yaotou_Mid);//ҡͷPWM���	
//  406       //ZhuanXiangPWMDTY_(Turn_Mid);//ת��PWM��� 
//  407       //EndPWMDTY_(End_Mid);
//  408        YaoTouPWMDTY_(Yaotou_Mid-(int)(YaoTou_CanShu.Value_temp));//ҡͷPWM���	       
??Servo_Act_35:
        MOVW     R4,#+2500
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+44]
        BL       __aeabi_f2iz
        SUBS     R2,R4,R0
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,#+2
        LDR.N    R0,??DataTable3_54  ;; 0x40038000
        BL       FTM_setPWMDty
//  409        ZhuanXiangPWMDTY_(Turn_Mid + (int)Turn_Servo_Temp);//ת��PWM���        
        LDR.N    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        ADDS     R2,R0,#+2000
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,#+4
        LDR.N    R0,??DataTable3_54  ;; 0x40038000
        BL       FTM_setPWMDty
//  410        EndPWMDTY_(End_Mid-(int)End_Servo_Temp);
        MOVW     R0,#+2200
        LDR.N    R1,??DataTable3_51
        LDR      R1,[R1, #+0]
        SUBS     R2,R0,R1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,#+0
        LDR.N    R0,??DataTable3_54  ;; 0x40038000
        BL       FTM_setPWMDty
//  411 }
        POP      {R4,PC}          ;; return
//  412 
//  413 //void Servo_Act(void) 
//  414 //{
//  415 // 
//  416 //		/*****************************************************************
//  417 //		���¼���ҡͷ�Ļ���
//  418 //		*****************************************************************/
//  419 //		/*Desired_HuiZheng_Times = QuanBai_Longth / 10;//ȫ�׻���
//  420 //		if(Measured_HuiZheng_Times < Desired_HuiZheng_Times) 
//  421 //		{	
//  422 //		 	  YaoTou_CanShu.Value_temp = 0;
//  423 //		}   */
//  424 //			
//  425 //		/*	Measured_HuiZheng_Times ++;
//  426 //			if(Desired_HuiZheng_Times >= 9)
//  427 //			{	
//  428 //				YaoTou_CanShu.Value_temp = 0;
//  429 //			}
//  430 //			else if(Desired_HuiZheng_Times >= 6)
//  431 //			{	
//  432 //			    YaoTou_CanShu.Value_temp = YaoTou_CanShu.Value_temp*0.7;	
//  433 //			} 
//  434 //		}
//  435 //		else //�Ѿ�������������Ŀ�����������ֻ�п�������ΪĿ�������������0
//  436 //			if(Measured_HuiZheng_Times > Desired_HuiZheng_Times) 
//  437 //			{
//  438 //				Measured_HuiZheng_Times = 0;	
//  439 //			}
//  440 //			*/
//  441 //			
//  442 //
//  443 //			
//  444 //			
//  445 //		/*****************************************************************
//  446 //		���¼���ҡͷ���߷���
//  447 //		******************************************************************/		
//  448 // 	  if(YaoTou_CanShu.Value_temp >=900)
//  449 //			YaoTou_CanShu.DesiredValue =-3; //-3;
//  450 //		else
//  451 //			if(YaoTou_CanShu.Value_temp >= 700)
//  452 //				YaoTou_CanShu.DesiredValue =-2; //-2;
//  453 //			else if(YaoTou_CanShu.Value_temp >= 500)
//  454 //				YaoTou_CanShu.DesiredValue =-1; 
//  455 //			else
//  456 //				if(YaoTou_CanShu.Value_temp <= -900)
//  457 //					YaoTou_CanShu.DesiredValue =3; //3;
//  458 //				else
//  459 //					if(YaoTou_CanShu.Value_temp <= -700)
//  460 //						YaoTou_CanShu.DesiredValue =2;//2;
//  461 //					else 
//  462 //					  if(YaoTou_CanShu.Value_temp <= -500)
//  463 //				     YaoTou_CanShu.DesiredValue =1; 		
//  464 //					  else
//  465 //					   YaoTou_CanShu.DesiredValue = 0;		
//  466 //		/*****************************************************************
//  467 //		���¼���ת����ת��
//  468 //		*****************************************************************/					
//  469 //		
//  470 //	  
//  471 //    
//  472 //        YaoTou_Angle = YaoTou_CanShu.Value_temp;//�õ�ҡͷת��
//  473 //		
//  474 //		
//  475 //				
//  476 //			if(YaoTou_Angle <=400 && YaoTou_Angle >= -400)
//  477 //			{
//  478 //				Turn_Servo_Temp_P = (int)(YaoTou_Angle*Turn_KP_1);//���������Ƕ��������			
//  479 //			}
//  480 //			else
//  481 //			{
//  482 //				if(YaoTou_Angle<800&&YaoTou_Angle > 400)  //�սǽϴ�ʱ�������ϵ���ϴ󣬵�ҲҪ���ֽ���
//  483 //				{
//  484 //					Turn_Servo_Temp_P = (int)(YaoTou_Angle * Turn_KP_2 - 400*(Turn_KP_2-Turn_KP_1));//���������Ƕ��������	
//  485 //				}
//  486 //				else
//  487 //					if(YaoTou_Angle>-800&&YaoTou_Angle < -400)
//  488 //					{
//  489 //						Turn_Servo_Temp_P = (int)(YaoTou_Angle * Turn_KP_2 + 400*(Turn_KP_2-Turn_KP_1));//���������Ƕ��������	
//  490 //					} 
//  491 //					else
//  492 //					      if(YaoTou_Angle>800)
//  493 //					      {
//  494 //					         Turn_Servo_Temp_P = (int)((YaoTou_Angle-800) * Turn_KP_3+400*Turn_KP_2+400*Turn_KP_1);//���������Ƕ��������
//  495 //					      } 
//  496 //					      else     //  YaoTou_Angle<-600
//  497 //					      {
//  498 //					         Turn_Servo_Temp_P = (int)((YaoTou_Angle+800) * Turn_KP_3-400*Turn_KP_2-400*Turn_KP_1);//���������Ƕ��������
//  499 //					      }
//  500 //			}
//  501 //	
//  502 //
//  503 //
//  504 //		//if(++Turn_D_Calculate_Enable >= 4) //ÿ20ms����һ��΢�ּ���
//  505 //  	//{
//  506 //		//Turn_D_Calculate_Enable = 0;
//  507 //			Turn_Servo_Temp_D = (int)((YaoTou_Angle - YaoTou_Angle_Last)*Turn_KD);
//  508 //			YaoTou_Angle_Last = YaoTou_Angle;	
//  509 //	  //}
//  510 //	
//  511 //	
//  512 //	
//  513 //	
//  514 //	   /*****************************ʮ������***************************************
//  515 //		if(After_QuanBai_Timer<QuanBai_Timer_Set-3&&After_QuanBai_Timer!=0)//ȫ�׼���û�б��ٴ�ˢ��ΪQuanBai_Timer_Set��˵���Ѿ�����ȫ��
//  516 //		{
//  517 //			if(YaoTou_Angle <= 160 && YaoTou_Angle >= -160)
//  518 //			{	
//  519 //				if(Desired_HuiZheng_Times <= 6 )//�����������ȫ�ף����ܲ���ȫ��	
//  520 //				{	
//  521 //					Turn_Servo_Temp =  Turn_Servo_Temp_P+ Turn_Servo_Temp_D; //��Ƕ�����ѵõ���Pֵ��Dֵ���
//  522 //				//	Turn_Servo_Temp -= YaoTou_CanShu.DesiredValue * 20; //������ΪĿ��ֵ�ĸı䣬��ɵ�Pֵ�Ĳ�ֵ
//  523 //					Turn_Servo_Temp -= Black_Position_YaoTou * 10;
//  524 //				}
//  525 //				else   //���������ڿ϶���ȫ��
//  526 //				{
//  527 //					Turn_Servo_Temp = 30*Black_Position_GuDing;	
//  528 //				}
//  529 //			}
//  530 //			else
//  531 //			{
//  532 //				if(Desired_HuiZheng_Times <= 6 )//�����������ȫ�ף����ܲ���ȫ��	
//  533 //				{	
//  534 //					Turn_Servo_Temp =  (int)(Turn_Servo_Temp_P*0.9+ Turn_Servo_Temp_D*0.9); //��Ƕ�����ѵõ���Pֵ��Dֵ���
//  535 //			//		Turn_Servo_Temp -= YaoTou_CanShu.DesiredValue * 20; //������ΪĿ��ֵ�ĸı䣬��ɵ�Pֵ�Ĳ�ֵ
//  536 //					Turn_Servo_Temp -= Black_Position_YaoTou * 10;
//  537 //				}
//  538 //				else   //���������ڿ϶���ȫ��
//  539 //				{
//  540 //					Turn_Servo_Temp = 30*Black_Position_GuDing;	
//  541 //				}
//  542 //			}
//  543 //		}
//  544 //		else// ����ת�Ǽ���*/
//  545 //		/*{ 
//  546 //			if(QuanBai_Longth ==0)//�����������ȫ�ף����ܲ���ȫ��	
//  547 //			{	
//  548 //				Turn_Servo_Temp =  Turn_Servo_Temp_P + Turn_Servo_Temp_D; //��Ƕ�����ѵõ���Pֵ��Dֵ���
//  549 //			
//  550 //			//	Turn_Servo_Temp -= YaoTou_CanShu.DesiredValue * 30; //������ΪĿ��ֵ�ĸı䣬��ɵ�Pֵ�Ĳ�ֵ
//  551 //	
//  552 //			 	Turn_Servo_Temp -= Black_Position_YaoTou * 20;
//  553 //			}
//  554 //			else   //���������ڿ϶���ȫ�� 
//  555 //			{
//  556 //				Turn_Servo_Temp = 30*Black_Position_GuDing;	     //ҡͷֻҪȫ�ף����չ̶���
//  557 //			}	
//  558 //		}      */
//  559 //    /***********************************************************
//  560 //    ʮ�ֽ��洦���߳���
//  561 //    ***********************************************************/
//  562 //		
//  563 //		if(ShiZiWanBiaoZhi==1)//תͷ��⵽ȫ�׾��볤��һ�����ȣ�����ʮ�������
//  564 //		{	    
//  565 //		    YaoTou_CanShu.Value_temp = 0; //����ʮ�����Ժ�תͷ�����м�ֵ
//  566 //		    
//  567 //		    /******��ͷ��⵽ȫ��һ��ʱ�䣬��ͷȫ����ǰһֱ���ն�ͷ��*************************/
//  568 //		    if(QuanBai_Longth_GuDing>=10) 
//  569 //		    {
//  570 //		        ShiZi_Longth=0;
//  571 //		        ShiZiWanBiaoZhi=0;
//  572 //		        ShiZiXiaoDou_Flag=1;    
//  573 //		    }
//  574 //		   
//  575 //		    /******ʮ���������ʻ�ܾ������ƣ�100Ϊ����תһȦ�����ڴ˳�����Ϊ�Ѿ��߹�ʮ��*******/
//  576 //		    if(ShiZi_Longth>=1500)   
//  577 //		    {
//  578 //		        ShiZi_Longth=0;
//  579 //		        ShiZiWanBiaoZhi=0;
//  580 //		    }
//  581 //		   
//  582 //		    /******����ȫ���Ժ��ն�ͷ��******************************************************/
//  583 //		    if(ShiZiWanBiaoZhi==1)  //�����ټ�һ���жϣ���ֹʮ�ֱ�־�����Turn_Servo_Temp�����ϼ������ֵ������
//  584 //		       // Turn_Servo_Temp = -42*Black_Position_GuDing;//���ڶ�ͷ���ǰ��մ���������
//  585 //		        Turn_Servo_Temp = -40*Black_Position_GuDing;//���ڶ�ͷ���ǰ��մ���������
//  586 //		   
//  587 //		}
//  588 //		/***********************************************************
//  589 //    �����ܵ�(��ʮ�ֽ��洦)�������
//  590 //    ***********************************************************/ 
//  591 //		else
//  592 //	  {  
//  593 //	  
//  594 //	    if(ShiZiXiaoDou_Flag==0) 
//  595 //	    {
//  596 //	    
//  597 //	    
//  598 //	    
//  599 //		    	Turn_Servo_Temp =  Turn_Servo_Temp_P + Turn_Servo_Temp_D; //��Ƕ�����ѵõ���Pֵ��Dֵ���
//  600 //			    
//  601 //			//	Turn_Servo_Temp -= YaoTou_CanShu.DesiredValue * 30; //������ΪĿ��ֵ�ĸı䣬��ɵ�Pֵ�Ĳ�ֵ
//  602 //	
//  603 //		  	 	Turn_Servo_Temp -= Black_Position_YaoTou * 18;
//  604 //		      if(Turn_Servo_Temp>0)Turn_Servo_Temp=(int)(Turn_Servo_Temp*1.05);
//  605 //		      
//  606 //    	   if(RenZi_Queren_flag==0)
//  607 //    		   {
//  608 //    		    
//  609 //    		    	Turn_Servo_Temp-=Black_Position_GuDing*5;
//  610 //    		  /*	 	if((Black_Position_GuDing-Black_Position_Last_GuDing)<200&&(Black_Position_GuDing-Black_Position_Last_GuDing)>-200)
//  611 //    		 	       Turn_Servo_Temp-=2*(Black_Position_GuDing-Black_Position_Last_GuDing);
//  612 //    		 	 	  else if((Black_Position_GuDing-Black_Position_Last_GuDing)>200)
//  613 //    		 	  	        Turn_Servo_Temp-=200;
//  614 //    			         else
//  615 //    		              Turn_Servo_Temp-=-200;*/ 
//  616 //    		   }
//  617 //    		 //if(black_num_Ce>30&&black_num_Ce<80) 
//  618 //    		// Turn_Servo_Temp+=4*Black_Position_Ce;
//  619 //    		   
//  620 //    		   
//  621 //    		   
//  622 //			        
//  623 //			 }
//  624 //			 
//  625 //			 else 
//  626 //			 {
//  627 //			    Turn_Servo_Temp = (int)(0.7* Turn_Servo_Temp_P + 0.7*Turn_Servo_Temp_D); //��Ƕ�����ѵõ���Pֵ��Dֵ���
//  628 //
//  629 //		  	 	Turn_Servo_Temp -= (int)(0.7*Black_Position_YaoTou * 13);
//  630 //			         
//  631 //	    	}
//  632 //	  }
//  633 //	  
//  634 //	  
//  635 //	
//  636 //	/***************************************************
//  637 //	���¶Զ���޷�
//  638 //	***************************************************/
//  639 //  
//  640 //    
//  641 //    
//  642 //   /* if(D_Wan_flag==1)                                          //D���޷���С����ֹ������
//  643 //    {
//  644 //      //if(Turn_Servo_Temp>0)Turn_Servo_Temp=(int)(Turn_Servo_Temp*0.65);
//  645 //      //if(Turn_Servo_Temp<0)Turn_Servo_Temp=(int)(Turn_Servo_Temp*0.70);
//  646 //      if(Turn_Servo_Temp >900)    //�������ж�������޷�
//  647 //      Turn_Servo_Temp =900;
//  648 //      if(Turn_Servo_Temp < -900)
//  649 //      Turn_Servo_Temp = -900;
//  650 //    
//  651 //    } 
//  652 //    else */
//  653 //    {
//  654 //      //if(Turn_Servo_Temp>0)Turn_Servo_Temp=(int)(Turn_Servo_Temp);
//  655 //      if(Turn_Servo_Temp >900)    //�������ж�������޷�
//  656 //      Turn_Servo_Temp =900;
//  657 //      if(Turn_Servo_Temp < -900)
//  658 //      Turn_Servo_Temp = -900;
//  659 //
//  660 //    }
//  661 //
//  662 //    if(YaoTou_CanShu.Value_temp > 1400)
//  663 //    	YaoTou_CanShu.Value_temp = 1400;
//  664 //    if(YaoTou_CanShu.Value_temp < -1400)
//  665 //    	YaoTou_CanShu.Value_temp = -1400;
//  666 //    
//  667 //    
//  668 // 
//  669 //    if(Turn_Servo_Temp<450&&Turn_Servo_Temp>-450)
//  670 //         End_Servo_Temp=(int)(-Turn_Servo_Temp*End_KP1);	
//  671 //		else if(Turn_Servo_Temp>450)
//  672 //                  End_Servo_Temp=(int)(-450*End_KP1-(Turn_Servo_Temp-450)*End_KP2);
//  673 //		else if(Turn_Servo_Temp<-450) 
//  674 //                  End_Servo_Temp=(int)(450*End_KP1-(Turn_Servo_Temp+450)*End_KP2);
//  675 //    //if(End_Servo_Temp<0) 
//  676 //     End_Servo_Temp=(int)(End_Servo_Temp*1.4);    //˦β�ҹմ��
//  677 //    
//  678 //    if(End_Servo_Temp >230)
//  679 //        End_Servo_Temp=230;
//  680 //    if(End_Servo_Temp < - 230)
//  681 //        End_Servo_Temp = -230;
//  682 //   
//  683 //   
//  684 //   	//Turn_Servo_Temp = Turn_Servo_Temp/4;
//  685 //   
//  686 //    //if(enable_oled==1&&enable_turn_debug==0) 
//  687 //   // {
//  688 //      
//  689 //      YaoTouPWMDTY_(Yaotou_Mid);//ҡͷPWM���	
//  690 //      ZhuanXiangPWMDTY_(Turn_Mid);//ת��PWM��� 
//  691 //      EndPWMDTY_(End_Mid);
//  692 //  //  } 
//  693 //  //  else 
//  694 ////    {      
//  695 ////       YaoTouPWMDTY_(Yaotou_Mid-(int)(YaoTou_CanShu.Value_temp));//ҡͷPWM���	
//  696 ////       ZhuanXiangPWMDTY_(Turn_Mid + (int)Turn_Servo_Temp);//ת��PWM��� 
//  697 ////       EndPWMDTY_(End_Mid-(int)End_Servo_Temp);
//  698 ////    }
//  699 //} 
//  700 //
//  701 //
//  702 //

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  703 void YaoTou_PID_Calculate(CanShu_PID *pt_CanShu) 
//  704 {
YaoTou_PID_Calculate:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  705    pt_CanShu->Error_Now=pt_CanShu->DesiredValue-pt_CanShu->MeasuredValue;
        LDR      R0,[R4, #+36]
        LDR      R1,[R4, #+40]
        SUBS     R0,R0,R1
        STR      R0,[R4, #+12]
//  706    pt_CanShu->P_Value=(pt_CanShu->P_Gain*(pt_CanShu->Error_Now-pt_CanShu->Error_Last));
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+16]
        SUBS     R0,R0,R1
        BL       __aeabi_i2f
        LDR      R1,[R4, #+0]
        BL       __aeabi_fmul
        STR      R0,[R4, #+24]
//  707    pt_CanShu->I_Value=(pt_CanShu->I_Gain*(pt_CanShu->Error_Now));
        LDR      R0,[R4, #+12]
        BL       __aeabi_i2f
        LDR      R1,[R4, #+4]
        BL       __aeabi_fmul
        STR      R0,[R4, #+28]
//  708    pt_CanShu->D_Value=(pt_CanShu->D_Gain*(pt_CanShu->Error_Now-2*pt_CanShu->Error_Last+pt_CanShu->Error_Pre));
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+16]
        SUBS     R0,R0,R1, LSL #+1
        LDR      R1,[R4, #+20]
        ADDS     R0,R1,R0
        BL       __aeabi_i2f
        LDR      R1,[R4, #+8]
        BL       __aeabi_fmul
        STR      R0,[R4, #+32]
//  709    /////////�޷�/////////////////////////
//  710    if(pt_CanShu->P_Value>=2000)
        LDR      R0,[R4, #+24]
        LDR.N    R1,??DataTable3_55  ;; 0x44fa0000
        BL       __aeabi_cfrcmple
        BHI.N    ??YaoTou_PID_Calculate_0
//  711       pt_CanShu->P_Value=2000;
        LDR.N    R0,??DataTable3_55  ;; 0x44fa0000
        STR      R0,[R4, #+24]
        B.N      ??YaoTou_PID_Calculate_1
//  712    else
//  713       if(pt_CanShu->P_Value<=-2000)
??YaoTou_PID_Calculate_0:
        LDR      R0,[R4, #+24]
        LDR.N    R1,??DataTable3_56  ;; 0xc4f9ffff
        BL       __aeabi_cfcmple
        BCS.N    ??YaoTou_PID_Calculate_1
//  714          pt_CanShu->P_Value=-2000;
        LDR.N    R0,??DataTable3_57  ;; 0xc4fa0000
        STR      R0,[R4, #+24]
//  715    if(pt_CanShu->I_Value>=1000)
??YaoTou_PID_Calculate_1:
        LDR      R0,[R4, #+28]
        LDR.N    R1,??DataTable3_58  ;; 0x447a0000
        BL       __aeabi_cfrcmple
        BHI.N    ??YaoTou_PID_Calculate_2
//  716       pt_CanShu->I_Value=1000;
        LDR.N    R0,??DataTable3_58  ;; 0x447a0000
        STR      R0,[R4, #+28]
        B.N      ??YaoTou_PID_Calculate_3
//  717    else
//  718       if(pt_CanShu->I_Value<=-1000)
??YaoTou_PID_Calculate_2:
        LDR      R0,[R4, #+28]
        LDR.N    R1,??DataTable3_59  ;; 0xc479ffff
        BL       __aeabi_cfcmple
        BCS.N    ??YaoTou_PID_Calculate_3
//  719          pt_CanShu->I_Value=-1000;
        LDR.N    R0,??DataTable3_60  ;; 0xc47a0000
        STR      R0,[R4, #+28]
//  720    if(pt_CanShu->D_Value>=2000)
??YaoTou_PID_Calculate_3:
        LDR      R0,[R4, #+32]
        LDR.N    R1,??DataTable3_55  ;; 0x44fa0000
        BL       __aeabi_cfrcmple
        BHI.N    ??YaoTou_PID_Calculate_4
//  721       pt_CanShu->D_Value=2000;
        LDR.N    R0,??DataTable3_55  ;; 0x44fa0000
        STR      R0,[R4, #+32]
        B.N      ??YaoTou_PID_Calculate_5
//  722    else
//  723       if(pt_CanShu->D_Value<=-2000)
??YaoTou_PID_Calculate_4:
        LDR      R0,[R4, #+32]
        LDR.N    R1,??DataTable3_56  ;; 0xc4f9ffff
        BL       __aeabi_cfcmple
        BCS.N    ??YaoTou_PID_Calculate_5
//  724          pt_CanShu->D_Value=-2000;
        LDR.N    R0,??DataTable3_57  ;; 0xc4fa0000
        STR      R0,[R4, #+32]
//  725  
//  726  
//  727  
//  728    pt_CanShu->Error_Pre=pt_CanShu->Error_Last;
??YaoTou_PID_Calculate_5:
        LDR      R0,[R4, #+16]
        STR      R0,[R4, #+20]
//  729    pt_CanShu->Error_Last=pt_CanShu->Error_Now;
        LDR      R0,[R4, #+12]
        STR      R0,[R4, #+16]
//  730    pt_CanShu->Value_temp+=pt_CanShu->P_Value+pt_CanShu->I_Value+pt_CanShu->D_Value; //����������ʽ��������Ҫ�ۼӣ���
        LDR      R1,[R4, #+24]
        LDR      R0,[R4, #+28]
        BL       __aeabi_fadd
        LDR      R1,[R4, #+32]
        BL       __aeabi_fadd
        LDR      R1,[R4, #+44]
        BL       __aeabi_fadd
        STR      R0,[R4, #+44]
//  731  
//  732 }
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     YaoTou_CanShu

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x40966666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x3fe66666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x40accccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     Black_Position_YaoTou

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x44610000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x442f0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0x43fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0xc460ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     0xc42effff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     0xc3f9ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     YaoTou_Angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     0x43c80001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     0xc3c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     Turn_KP_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     Turn_Servo_Temp_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     0x44480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     Turn_KP_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     0x43c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     0xc447ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_20:
        DC32     0x44480001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_21:
        DC32     0xc4480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_22:
        DC32     Turn_KP_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_23:
        DC32     YaoTou_Angle_Last

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_24:
        DC32     Turn_KD

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_25:
        DC32     Turn_Servo_Temp_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_26:
        DC32     ShiZiWanBiaoZhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_27:
        DC32     QuanBai_Longth_YaoTou

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_28:
        DC32     ShiZi_Longth

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_29:
        DC32     ShiZiXiaoDou_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_30:
        DC32     Black_Position_GuDing

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_31:
        DC32     Turn_Servo_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_32:
        DC32     Turn_xishu

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_33:
        DC32     RenZi_Queren_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_34:
        DC32     RenZi_Queren_flag2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_35:
        DC32     Dwan

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_36:
        DC32     0x9999999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_37:
        DC32     0x3fb99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_38:
        DC32     0xfffffda8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_39:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_40:
        DC32     ZhuanTou_QueRen_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_41:
        DC32     ZhuanTou_Flag_Right

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_42:
        DC32     ZhuanTou_QueRen_Longth

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_43:
        DC32     0xfffffed4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_44:
        DC32     ZhuanTou_QueRen_Flag2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_45:
        DC32     PoDao_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_46:
        DC32     PoDao_Longth

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_47:
        DC32     0xfffffd76

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_48:
        DC32     0x44960001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_49:
        DC32     0x44960000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_50:
        DC32     0xc4960000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_51:
        DC32     End_Servo_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_52:
        DC32     0x3fe00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_53:
        DC32     End_Limit

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_54:
        DC32     0x40038000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_55:
        DC32     0x44fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_56:
        DC32     0xc4f9ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_57:
        DC32     0xc4fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_58:
        DC32     0x447a0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_59:
        DC32     0xc479ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_60:
        DC32     0xc47a0000

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  733 
// 
//    46 bytes in section .bss
//    28 bytes in section .data
// 2 126 bytes in section .text
// 
// 2 126 bytes of CODE memory
//    74 bytes of DATA memory
//
//Errors: none
//Warnings: none
