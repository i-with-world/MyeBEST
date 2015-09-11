
#include "AllHeaders.h"
/***************************************�����ñ���******************************/
int timeRef;        //ʱ���׼��1Ms
int8u_t TimePeriod_cnt;   //ʱ��Ƭ����
volatile int16u_t SysTick;   /*ϵͳʱ���׼(�䵥λ��Platform.h������)*/

int8u_t Motor_Count;   //�������
int8u_t CcdGet_Allow;
int8u_t  StartStopFlag = 1;   //����ͣ����־

int SDerite_cnt=0;      //д����
int16u_t Forward_Dty;
int16s_t L_MotorSpeed;            //�����ٶ�
int16s_t R_MotorSpeed;            //�ҵ���ٶ�
int16s_t L_MotorSpeed_temp;            //�����ٶ�
int16s_t R_MotorSpeed_temp;            //�ҵ���ٶ�


void Car_Start(void);
/*************************************��������ʱ����****************************/

void main(void) 
{
  DisableInterrupts();                               //����һ��ʼ��Ҫ�ر������жϣ���ֹ��Ƭ����ʼ�������б�ĳ���жϴ��
  /***************************���ó�ʼ������*******************************/
  delay_ms(100);
  System_Init();
  Deal_Switch();
  
  EnableInterrupts();                               //�����жϣ��õ�ʵʱʱ�Ӷ�ʱ�жϡ���ʱ������жϵ��жϵĻ��������������ж�
#if (FUNC_MUSK==1)
  SetVariable();      //���������ð�������
#else
  PIT_setTime(0,1000,1,3);
  NormalSpeed = 70;
#endif
   
  ONBUZZER();
  delay_ms(50);
  OFFBUZZER();
  /*************************************���Դ�����*****************************/
  //JudgeWay(1);
  /*************************************���Դ���������*****************************/
  for(;;)
  {
  /*************************************���Դ�����*****************************/
  
  /*************************************���Դ���������*****************************/

    Car_Start();
    if(timeRef>=10)           //10Msִ��һ��
    {
      timeRef=0;
      
      Peripheral_Oparation();         //ִ��Ӳ������������дSD���Լ�дҺ��
    }
    if(CcdGet_Allow==1)    //�൱�ڵ�1ʱ��Ƭ
    {
      TSL1401_GetASSILine(&ASSI_CCD);       //�õ�������Ϣ
      TSL1401_GetLine(&MAIN_CCD);       //�õ�������Ϣ
      
      CcdGet_Allow = 0;      //�ɼ�����������λ���ȴ���һ�βɼ�
    }
    
  }
}

void PIT0_Isr(void)
{
  PIT_clearIntFlg(TIMER0);
  timeRef++;          //ϵͳʱ���׼+1
  SysTick++;          //ϵͳʱ���׼+1
  
  if(SysTick>10000)
    SysTick = 10000;
  TimePeriod_cnt++;       //ʱ��Ƭ��������
  
  if(TimePeriod_cnt>=TIME_PERIOD_NUM)         /*��0ʱ��Ƭ �õ�����Ƕ�0.6-0.7ms(�ɼ���������)*/
  {
    
    TimePeriod_cnt=0;
    
    Read_ITG3200D();      //�������ǲ���
    Read_MMA8451Q();      //�����ٶȼƲ���
    
    Balance_Get();
    //GoCreazy_Angle();         //�Ƕȱ���
  }
  else if(TimePeriod_cnt==1)                /*��1ʱ��Ƭ ���� <1us*/
  {

    FTM_readQUADValue(FTM1,&R_MotorSpeed);//����
    FTM_readQUADValue(FTM2,&L_MotorSpeed);//����
    Measure_Length();                             //�ⳤ��ֱ�Ǽ�⴦��

    GoCreazy_Protect(L_MotorSpeed,R_MotorSpeed);        //��屣��
    CcdGet_Allow = 1;   //�ڴ�ʱ��Ƭ����CCD�ɼ�ͼ��

   }
  else if(TimePeriod_cnt==2)              /*��2ʱ��Ƭ �ٶȿ���1.1-5us*/
  {
    Motor_Count++;
    if(Motor_Count>=CAR_MOTOR_PERIOD_LIMIT)         //ÿ100msִ��һ���ٶȾ���
    {
      Motor_Count=0;
      
      L_MotorSpeed_temp = L_MotorSpeed;
      R_MotorSpeed_temp = R_MotorSpeed;
      
      SpeedControl(L_MotorSpeed_temp,R_MotorSpeed_temp);
    }
    Speed_PI_OUT();             //�ٶȷֲ��������ֹ����
    
    Read_ITG3200D_Y();                  //����ʶ����������Y��
    JudgeWay(Gyro_Y);     //����ʶ��
    
  }
  else if(TimePeriod_cnt==3)              /*��3ʱ��Ƭ ����ͼ��180~240us*/
  {
    Deal_Black(&ASSI_CCD);
    Deal_Black(&MAIN_CCD);
  }
  else if(TimePeriod_cnt==4)              /*��4ʱ��Ƭ �Ƕȿ��ƣ������PWM Լ10us*/
  {
    
    CarAngleControl();
  }
  
}



    