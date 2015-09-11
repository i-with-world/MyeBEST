#ifndef _SPEED_CONTROL_H_
#define _SPEED_CONTROL_H_

/**************�ٶȲ���PID�궨��***********/
#define MOTOR_SPEED_P			  ((int32s_t)1500)      //����100
#define MOTOR_SPEED_I		    ((int32s_t)900) 	   //����60   
#define MOTOR_SPEED_D		    ((int32s_t)0) 	     //΢��


#define PID_SPEED_LIMIT      500  

/***************************�����ⲿ����**********************************/
extern int16s_t ObjectSpeed;	        /*Ŀ���ٶ�*/
extern int16s_t NormalSpeed;
extern int8u_t GoCreazyStop_flag;             //��תͣ����־λ

extern void SpeedControl( int16s_t pulse, int16s_t pulse_2 );
extern void Speed_PI_OUT(void);
extern void Car_Start(void);

extern int8u_t Motor_Count;        //���PID�������
extern void GoCreazy_Protect( int16s_t pulse, int16s_t pulse_2 );

extern int16s_t PI_Out;               
extern int16s_t L_MotorSpeed;            //�����ٶ�
extern int16s_t R_MotorSpeed;            //�ҵ���ٶ�
extern int16s_t PI_SpeedNew;                     //Speed_PI���������������ٶ�ֵ
extern int16s_t NowSpeed;                /*��ǰ�ٶ�*/
extern volatile int16u_t SysTick;                  /*ϵͳʱ���׼(�䵥λ��Platform.h������)*/
extern int8u_t  StartStopFlag ;   //����ͣ����־


#endif    /**_SPEED_CONTROL_H_*/
