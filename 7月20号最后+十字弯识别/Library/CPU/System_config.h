/************************************************************************************
* �ļ����ƣ�System_config.h
* ��    ��: ϵͳ�������úͺ궨��
* ��    �ߣ������
* ʱ    �䣺2012��5��23��
*************************************************************************************/
#ifndef _System_config_H_
#define _System_config_H_


/*******************�궨��*******************/
#define NUM_SD_PACKET        6000      //дSD�������ݰ���

///////////////////////////////
#define Filter_Method        0         //�˲���ʽѡ�� 0���������˲� �����������˲�

///////////////////////////////
#define CAR_PERIOD           5         //�жϷ���ʱ��Ƭ��ת����

///////////////////////////////
#define MAX_ANGLE	     300       //�����˶�ʱ�����������ڽ�

///////////////////////////////
#define CV_ACCE_Z	     0         //ADͨ�� - ���ٶȴ�����
#define CV_GYRO		     1         //ADͨ�� - ������

#define CV_ACCE_VAL          (AD_Value[CV_ACCE_Z])
#define CV_GYRO_VAL          (AD_Value[CV_GYRO])
                                                                                          
///////////////////////////////
#define CV_ACCE_Z_ZERO       427       //���ٶȴ�������̬ƫ��ֵ
#define CV_ACCE_Z_OFFSET     -3        //���Ĳ���
                                       
///////////////////////////////                                     
#define CV_GYRO_ZERO         364        //�����Ǿ�̬ƫ��ֵ

///////////////////////////////
#if Filter_Method == 0                 //�������˲� 
  #define CAR_AA_P	     8.52      // (error) * P     7.55
  #define CAR_AA_D	     0.21      // (GyroVal) * D   0.18
#else                                  //�����˲�
  #define CV_ACCE_RATIO      5.95      //���ٶȹ�һ��ϵ��
  #define CV_ACCE_RATIO_INT  (int32s_t)(CV_ACCE_RATIO*100)
  #define CAR_GYRO_RATIO     1.46      //��һ��ϵ����������  
  #define CAR_GYRO_RATIO_INT (int32s_t)(CAR_GYRO_RATIO*100)
  #define CAR_ACCE_RATIO     0.30      //�Ƕȷ���ϵ�� 0.45
  #define CAR_ACCE_RATIO_INT (int32s_t)(CAR_ACCE_RATIO*1000)                                
  #define CAR_AA_P	     1.97      // (error) * P     1.77
  #define CAR_AA_D	     1.56      // (GyroVal ) * D  1.13
#endif
    
#define CAR_AA_P_INT		    (int32s_t)(CAR_AA_P*100)
#define CAR_AA_D_INT		    (int32s_t)(CAR_AA_D*100)

#define MOTOR_SPEED_SET_MAX   840      //�Ƕȿ����ٶ�����
#define MOTOR_SPEED_SET_MIN  -840      //�Ƕȿ����ٶ�����
                                       
////////////////////////////////
#define MOTOR_OUT_MAX	   (int16s_t)( 1200)  //�Ƕ�+�ٶ�+ת���޷�
#define MOTOR_OUT_MIN	   (int16s_t)(-1200)  //�Ƕ�+�ٶ�+ת���޷�
#define MOTOR_OUT_DEAD_VAL (int16s_t)(34)     //�˷������̬����   34

////////////////////////////////
#define CAR_MOTION_PERIOD    20		// ���ٿ�������
#define MOTOR_SPEED_P	     1.45       //����   1.78   1.96    1.33
#define MOTOR_SPEED_P_INT    (int32s_t)(MOTOR_SPEED_P * 100)
#define MOTOR_SPEED_I	     1.52 	//����   1.72   2.23    1.36
#define MOTOR_SPEED_I_INT    (int32s_t)(MOTOR_SPEED_I * 100) 
#define MOTOR_SPEED_D	     0.00 	//΢��   2.23
#define MOTOR_SPEED_D_INT    (int32s_t)(MOTOR_SPEED_D * 100)

/***********�ٶȲ�������**********/
#define DEFAULT_SPEED         460       //��ʹ��bomaʱ��Ĭ���ٶ�
#define CRAZY_SPEED           1650      // �����ʱ���ٶ�

/***********ʱ���������**********/
#define START_DELAY (int32u_t)8000      // ������ʱ,��λms
#define START_TIME  (int32u_t)4000      // �������̳���ʱ��,��λms
#define STOP_DELAY  (int32u_t)65000     // ͣ����ʱ,��λms
#define STOP_TIME   (int32u_t)5000      // ͣ�����̳���ʱ��,��λms

/***********ת���������**********/
#define CAR_MAGNETIC_PERIOD   1         // ת���������
#define TURN_OUT_DEAD_VAL     12        // ת������ 
#define TURN_OUT_OFFSET       0         // ת���������

/***********����PID��������**********/
#define KP_DifSpd             28L       //����PID����
#define KI_DifSpd             24L
#define KD_DifSpd             0L
//#define KI_DifSpd 40L

/***********�����ֵ����************/
#define DC_Limit              1200

#endif