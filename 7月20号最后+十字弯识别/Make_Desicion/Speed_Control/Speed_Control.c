#include "AllHeaders.h"

/**************************ȫ�ֱ���**************************/
int16s_t ObjectSpeed;	        /*Ŀ���ٶ�*/
int16s_t NormalSpeed;

int16s_t His_ObjectSpeed=0,Last_His_ObjectSpeed=0;/*Ŀ���ٶ���ʷֵ*/
int16s_t NowSpeed;                /*��ǰ�ٶ�*/
int8u_t  ClosedLoop;              /*����ջ����Ʊ�־,=1��ʾ�ջ�ģʽ*/
int16u_t OpenStop;                /*��ɲ���Ʊ���*/
int16u_t Cnt_OpenStop;          

/**************************�ڲ�����**************************/
static int16s_t SpeedErr;
static int16s_t His_SpeedErr;
static int16s_t His2_SpeedErr;
/****************************************************************/
int8u_t GoCreazy_cnt;                 //��תѭ������
int8u_t GoCreazyStop_flag;             //��תͣ����־λ
int8u_t  Right_Angle_Flag;             //ֱ�Ǽ���־

/*------������Speed_PI����-------*/
int16s_t PI_SpeedNew=0;                     //Speed_PI���������������ٶ�ֵ
int16s_t PI_SpeedOld=0;                     //Speed_PI�����������һ��������ٶ�ֵ
int32s_t PI_SpeedKeep;                    //Speed_PI�������ٶ�ƫ�����ֵ
int32s_t PI_SpeedErr;                     //�ٶ�ƫ��
int32s_t His_PI_SpeedErr = 0;             //�ٶ�ƫ����ʷֵ
/*-----������Speed_PI_OUT����----*/
int16s_t PI_Out;               

int16s_t Turn_Speednew=0,Turn_Speedold=0,Turn_SpeedOut;

/********************************************************/
int32s_t nP, nI, nD;



/************************************************************************************************ 
* Speed_PID
* λ��ʽ�ٶ�PID����
************************************************************************************************/
static void Speed_PID(int16s_t nowSpeed)
{
  int16s_t  nowcarspeed;
  int32s_t  nValue1, nValue2;
 
  nowcarspeed = nowSpeed;  //���㵱ǰ�ٶ�
  //ObjectSpeed=0;
  PI_SpeedErr = ObjectSpeed - nowcarspeed;      //���ٶ�ƫ��������ٶ�΢��
  nValue1 = ObjectSpeed - nowcarspeed;          //���ٶ�ƫ����ڼ����ٶ�PI�ı�������
  nValue2 = ObjectSpeed - nowcarspeed;          //���ٶ�ƫ����ڼ����ٶ�PI�Ļ��ֲ���
		
  if(nValue1 > 700)  nValue1 = 700;        //���ڱ������ֵ��ٶ�ƫ���޷�
  if(nValue1 < -700) nValue1  = -700;
  if(nValue2 > 600)  nValue2 = 600;        //���ڻ��ֲ��ֵ��ٶ�ƫ���޷�
  if(nValue2 < -600) nValue2  = -600;
 
  nP = nValue1 * (MOTOR_SPEED_P);          //�����
 
  nI = nValue2 * (MOTOR_SPEED_I);          //�����
 
  nD = (int32s_t)(MOTOR_SPEED_D*(PI_SpeedErr - His_PI_SpeedErr));//��΢��
  PI_SpeedKeep += nI;
  PI_SpeedOld = PI_SpeedNew;

  PI_SpeedNew = (int16s_t)((nP + nD + (PI_SpeedKeep / 8)) / 100L);
 
  if(PI_SpeedNew > PID_SPEED_LIMIT)        //�ٶȻ�������޷�
    PI_SpeedNew = PID_SPEED_LIMIT;
  if(PI_SpeedNew <-PID_SPEED_LIMIT)
    PI_SpeedNew = -PID_SPEED_LIMIT;

  His_PI_SpeedErr = PI_SpeedErr;

  if(PI_SpeedKeep > 50000)
  {
    PI_SpeedKeep = 50000;
  }
  if(PI_SpeedKeep < -50000)
  {
    PI_SpeedKeep = -50000;
  }
}

void SpeedControl( int16s_t pulse, int16s_t pulse_2 )
{
  NowSpeed = (pulse+pulse_2)/2;
  /*���ϵͳ��ǰ���ڱջ�ģʽ,����е���ջ�����*/
//  if(Black_Tip_Flag == 1)
//  {
//    Sum_Speed += NowSpeed;
//  }
//  if(Sum_Speed>300)
//  {
//    Sum_Speed = 0;
//    if(num_rise=1&&num_down=1&&MAIN_CCD.Black_Position)
//      Right_Angle_Flag = 1;
//  }
//  
  SpeedErr = ObjectSpeed - NowSpeed;              /*����ƫ��*/
  Speed_PID(NowSpeed);
  His_SpeedErr = SpeedErr;
  His2_SpeedErr = His_SpeedErr;               /*��¼ƫ����ʷֵ*/

}


/*====================================
������:�SSpeed_PI_OUT()
����  �������ٶ�PI���Ƶ������5ms����һ��
��ע  ����
======================================*/  
void Speed_PI_OUT(void)
{
  int32s_t  nValue;
  nValue = PI_SpeedNew - PI_SpeedOld;
  nValue = nValue * ((Motor_Count + 1) / CAR_MOTOR_PERIOD_LIMIT) + PI_SpeedOld;                          
  PI_Out = (int16s_t)nValue;
  
}

void GoCreazy_Protect( int16s_t pulse, int16s_t pulse_2 )
{
  int16s_t AveSpeed;
  
  AveSpeed = (pulse + pulse_2)/2;
  AveSpeed=pulse;
  if(AveSpeed > 200||AveSpeed < -200)           //��ת����
  {
    GoCreazy_cnt++;
    if(GoCreazy_cnt>5)
    {
      GoCreazyStop_flag=1;
      DisableInterrupts();
      FTM_setPWMDty(FTM0, 0, 0);
      FTM_setPWMDty(FTM0, 2, 0);
      FTM_setPWMDty(FTM0, 4, 0);
      FTM_setPWMDty(FTM0, 6, 0);
      //ONBUZZER();
    }
  }
  else
  {
    GoCreazy_cnt=0;
  }
}


//==========================================
//������  CarStart
//���ã�������������
//==========================================
/**/ 
void Car_Start(void)
{
  if(SysTick > START_DELAY)
  {
    if(SysTick >= START_DELAY + START_TIME)
    {
      StartStopFlag  = 0;
      ObjectSpeed = NormalSpeed;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 18 /19))
    {
      ObjectSpeed = NormalSpeed * 19 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 17 /19))
    {
      ObjectSpeed = NormalSpeed * 18 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 16 /19))
    {
      ObjectSpeed = NormalSpeed * 17 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 15 /19))
    {
      ObjectSpeed = NormalSpeed * 16 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 14 /19))
    {
      ObjectSpeed = NormalSpeed * 15 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 13 /19))
    {
      ObjectSpeed = NormalSpeed * 14 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 12 /19))
    {
      ObjectSpeed = NormalSpeed * 13 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 11 /19))
    {
      ObjectSpeed = NormalSpeed * 12 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 10 /19))
    {
      ObjectSpeed = NormalSpeed * 11 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 9 /19))
    {
      ObjectSpeed = NormalSpeed * 10 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 8 /19))
    {
      ObjectSpeed = NormalSpeed * 9 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 7 /19))
    {
      ObjectSpeed = NormalSpeed * 8 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 6 /19))
    {
      ObjectSpeed = NormalSpeed * 7 / 20;
    }   
    else if(SysTick >= START_DELAY + (START_TIME * 5 /19))
    {
      ObjectSpeed =NormalSpeed * 6 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 4 /19))
    {
      ObjectSpeed = NormalSpeed * 5 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 3 /19))
    {
      ObjectSpeed = NormalSpeed * 4 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 2 /19))
    {
      ObjectSpeed = NormalSpeed * 3 / 20;
    }
    else if(SysTick >= START_DELAY + (START_TIME * 1 /19))
    {
      ObjectSpeed = NormalSpeed * 2 / 20;
    }    
    else
    {
      ObjectSpeed = NormalSpeed / 20; 
    }  
  }
  else
  {
     ObjectSpeed = 0;
  }
}