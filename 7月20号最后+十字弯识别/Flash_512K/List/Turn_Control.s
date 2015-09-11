///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      19/Jul/2014  21:11:11 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  E:\学习\第九届智能车\省赛程序\140719_17.48\子程序\Turn_ /
//                    Control\Turn_Control.c                                  /
//    Command line =  E:\学习\第九届智能车\省赛程序\140719_17.48\子程序\Turn_ /
//                    Control\Turn_Control.c -D IAR -lCN                      /
//                    E:\学习\第九届智能车\省赛程序\140719_17.48\Flash_512K\L /
//                    ist\ -lB E:\学习\第九届智能车\省赛程序\140719_17.48\Fla /
//                    sh_512K\List\ -o E:\学习\第九届智能车\省赛程序\140719_1 /
//                    7.48\Flash_512K\Obj\ --no_cse --no_unroll --no_inline   /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "D:\Program Files (x86)\iar\arm\INC\c\DLib_Config_Norma /
//                    l.h" -I E:\学习\第九届智能车\省赛程序\140719_17.48\Libr /
//                    ary\CPU\ -I E:\学习\第九届智能车\省赛程序\140719_17.48\ /
//                    Library\Drivers\ADC\ -I E:\学习\第九届智能车\省赛程序\1 /
//                    40719_17.48\Library\Drivers\FTM\ -I                     /
//                    E:\学习\第九届智能车\省赛程序\140719_17.48\Library\Driv /
//                    ers\GPIO\ -I E:\学习\第九届智能车\省赛程序\140719_17.48 /
//                    \Library\Drivers\PIT\ -I E:\学习\第九届智能车\省赛程序\ /
//                    140719_17.48\MyFunction\ -I                             /
//                    E:\学习\第九届智能车\省赛程序\140719_17.48\SD_System\   /
//                    -I E:\学习\第九届智能车\省赛程序\140719_17.48\子程序\OL /
//                    ED\ -I E:\学习\第九届智能车\省赛程序\140719_17.48\子程� /
//                    騖 -I E:\学习\第九届智能车\省赛程序\140719_17.48\子程序 /
//                    \Sample_AD\ -I E:\学习\第九届智能车\省赛程序\140719_17. /
//                    48\子程序\Judge_Way\ -I E:\学习\第九届智能车\省赛程序\1 /
//                    40719_17.48\子程序\Moter_Control\ -I                    /
//                    E:\学习\第九届智能车\省赛程序\140719_17.48\子程序\Syste /
//                    m_Init\ -I E:\学习\第九届智能车\省赛程序\140719_17.48\� /
//                    映绦騖Turn_Control\ -I E:\学习\第九届智能车\省赛程序\14 /
//                    0719_17.48\子程序\Yaotou_Control\ -I                    /
//                    E:\学习\第九届智能车\省赛程序\140719_17.48\子程序\bomak /
//                    aiguan\ -Ol                                             /
//    List file    =  E:\学习\第九届智能车\省赛程序\140719_17.48\Flash_512K\L /
//                    ist\Turn_Control.s                                      /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Turn_Control

        #define SHT_PROGBITS 0x1



        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// E:\学习\第九届智能车\省赛程序\140719_17.48\子程序\Turn_Control\Turn_Control.c
//    1 #include "All_HeaderFiles.h"
//    2 
//    3 /*-----隶属于Turn_Speed_PID函数-----*/
//    4 //int16s_t Turn_Angle;                               //转向速度
//    5 
//    6 
//    7 //int Black_Position_Last=0;
//    8 //int Servo_Temp_P = 0;
//    9 //int Servo_Temp_D = 0;
//   10 //int Turn_KD_time=0;
//   11 
//   12 
//   13 
//   14 /*---隶属于Turn_Speed_PID_Out函数--*/
//   15 //int16s_t Turn_AngleOut;                            //转向输出值，用于平缓输出
//   16 
//   17 /*
//   18 void Turn_Angle_PID(void)
//   19 {
//   20 if(((Black_Position_Last-Black_Position<20)&&(Black_Position_Last-Black_Position>-20))||((Black_Position_Last>-10)&&(Black_Position_Last<10)))
//   21  {
//   22   Servo_Temp_P = Black_Position *Turn_KP;  //计算比例部分转向角度
//   23   Turn_KD_time++;                            
//   24   if(Turn_KD_time==2) 
//   25   {
//   26       Servo_Temp_D =int((Black_Position -Black_Position_Last)*(Turn_KD));    //计算微分部分转向角度
//   27       Turn_KD_time=0;      
//   28   }
//   29   
//   30   Black_Position_Last=Black_Position;
//   31  }
//   32  
//   33  
//   34   if( Servo_Temp_D>200) 
//   35   {
//   36      Servo_Temp_D= 200;                                               //转向微分限幅
//   37   }
//   38   if( Servo_Temp_D<-200) 
//   39   {
//   40      Servo_Temp_D=-200;   
//   41   }
//   42 
//   43   
//   44 
//   45   Turn_Angle = (Servo_Temp_P+ Servo_Temp_D);
//   46   if( Turn_Angle>700) 
//   47   {
//   48      Turn_Angle= 700;                                               //转向微分限幅
//   49   }
//   50   if( Turn_Angle<-700) 
//   51   {
//   52      Turn_Angle=-700;
//   53   }
//   54   
//   55  
//   56   
//   57   if(Turn_Angle>0) 
//   58   {
//   59      Turn_Angle=Turn_Angle+Turn_Angle/5;
//   60   } 
//   61    
//   62   //Pwm_cnt_num=PWMCNT4<<8+PWMCNT5;
//   63                                            
//   64   PWMDTY45= -Turn_Angle+Turn_Mid;                                                       //转向角度输出
//   65 }
//   66 
//   67 */
// 
//
// 
//
//
//Errors: none
//Warnings: none
