#include "AllHeaders.h"

PID_Param ServePID={0,0,0,0,0,0,Serve_P,Serve_D,Serve_D_R,Serve_I,0.0};

int16s_t g_Gyro_X2[GYRO_NUM]={0};
int16s_t g_GyroX2 = 0;
int8u_t g_Gyro_Cnt2=0;
int16s_t Diff_Err_Last;
float Diff_I_Value_Keep;

//�����ñ���
float Diff_P =6.5,Diff_I = 0.01,Diff_D = 0.05;
//�����ñ���

void MovingAverageFilter2(int16s_t gyroval)
{
  int8u_t i;
  
  g_GyroX2 = 0;
  g_Gyro_X2[g_Gyro_Cnt2++]=gyroval;
  
  if(g_Gyro_Cnt2>=GYRO_NUM)g_Gyro_Cnt2=0;
   
  for(i=0;i<GYRO_NUM;i++)
    g_GyroX2+=g_Gyro_X2[i];
  g_GyroX2/=GYRO_NUM;
  
}

//===============================================================
//��������PID_Calculate
//���ã�����ʽPD����
//===============================================================
void PID_Calculate(PID_Param* p_pidParam)
{
  float P_Value,D_Value,I_Value,D_Value_Revise;
  float PID_temp;
  
  //MovingAverageFilter2(Gyro_Y);
  
  p_pidParam->Error_Now = p_pidParam->MeasuredValue;
  //p_pidParam->Error_Now = 0;
  P_Value = p_pidParam->P_Gain * (p_pidParam->Error_Now - p_pidParam->Error_Last);
  I_Value = p_pidParam->I_Gain * (p_pidParam->Error_Now);
  //D_Value_Revise= p_pidParam->D_Gain_Revise * g_GyroX2;
  D_Value= p_pidParam->D_Gain * (p_pidParam->Error_Now - 2*p_pidParam->Error_Last + p_pidParam->Error_Thelast);
  
  //��PID�����޷�
   if(P_Value>=2000)
     P_Value=2000;
   else
      if(P_Value<=-2000)
        P_Value=-2000;
   
   if(D_Value>=2000)
     D_Value=2000;
   else
      if(D_Value<=-2000)
        D_Value=-2000;
   
   if(I_Value>=2000)
     I_Value=2000;
   else
      if(I_Value<=-2000)
        I_Value=-2000;
   
   p_pidParam->Error_Thelast = p_pidParam->Error_Last;
   p_pidParam->Error_Last = p_pidParam->Error_Now;
   PID_temp = P_Value + D_Value + I_Value;
   //PID_temp = P_Value+D_Value_Revise;
   
   p_pidParam->valueOutput += PID_temp;
}
//============================================================
//��������Serve_Act
//���ã��������
//============================================================
int16s_t Turn_Exchange()
{
  float turn_Pwm;
  //Read_ITG3200D_Y();
  PID_Calculate(&ServePID);    //PD����ƫ��
  
  turn_Pwm = BLACK_POSITION_RATIO * ServePID.valueOutput;
  if(turn_Pwm > 300)
    turn_Pwm = 300;
  if(turn_Pwm < -300)
    turn_Pwm = -300;
  
  return((int16s_t)turn_Pwm);
}

//============================================================
//������������ʵ�ʲ��ټ���
//���ã���������ʵ�ʲ���
//============================================================
int16s_t SpeedDiff_PID(int16s_t pulse1,int16s_t pulse2)
{
  int16s_t Diff_Pulse;                                 //���ֲ���
  int16s_t Err_Diff;                                  //ʵ�ʲ�����Ŀ��������
  float P_Value,D_Value,I_Value;
  float turn_Pwm;
  
  Diff_Pulse = pulse1 - pulse2;                      //�������ֲ���
  Err_Diff = Diff_Pulse -  Turn_Exchange();           //ʵ�������Ŀ��������
  P_Value = Diff_P*Err_Diff;
  D_Value = Diff_D*(Err_Diff - Diff_Err_Last);
  I_Value = Diff_I*Err_Diff;
  Diff_I_Value_Keep += I_Value;
  Diff_Err_Last = Err_Diff;
  if(Diff_I_Value_Keep > 200)
    Diff_I_Value_Keep = 200;
  
  turn_Pwm = P_Value + D_Value + Diff_I_Value_Keep;            //PID����
  return((int16s_t)turn_Pwm);
}