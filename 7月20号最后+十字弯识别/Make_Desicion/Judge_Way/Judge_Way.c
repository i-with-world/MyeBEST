#include "AllHeaders.h"
#include "../math_car.h"

int32s_t BlackTip_Len=0;            //ֱ��ǰ���ߵ�ֱ�Ǿ���
int8u_t Black_Tip_Flag=0;    //ֱ��ǰ������־
int32s_t TipAfter_Len = 0;
int32s_t Judge_RightAngle_Len = 0;                   //�ж�ֱ�ǵľ���
int8u_t RightAngle_Flag = 0;                        //ֱ�����־
int8u_t ResureTip_Flag = 0;
int8u_t Finish_RightAngle_Flag = 0;                  //ͨ��ֱ�����־ 
//int32s_t Acr_RightAngle_Len = 10000;                 //��ʼ��⶯��ֱ�Ǿ���

int8u_t Main_L_array[EAGEARRLEN] = {0};      //��CCD����ؼ�¼����
int8u_t Main_R_array[EAGEARRLEN] = {0};      //��CCD�ұ��ؼ�¼����
int8u_t Assi_L_array[EAGEARRLEN] = {0};      //����CCD����ؼ�¼����
int8u_t Assi_R_array[EAGEARRLEN] = {0};      //����CCD�ұ��ؼ�¼����
int8u_t Main_Edge_Counter = 0;       //��CCD���ؼ���
int8u_t Assi_Edge_Counter = 0;       //����CCD���ؼ���
int8u_t ResureTip_Add_Flag = 0;      //����ȷ���ӱ�־λ
int8u_t ResureTip_Add_Flag_His = 0;   //����ȷ������ʷ��־λ

int8u_t Frist_Scan_Flag = 0;         //�����ж������״�д����־
int8u_t Valid_M_R[EAGEARRLEN] = {0};             //��Ч�Ա�־����
int8u_t Valid_M_L[EAGEARRLEN] = {0};             //��Ч�Ա�־����
int8u_t Valid_A_R[EAGEARRLEN] = {0};             //��Ч�Ա�־����
int8u_t Valid_A_L[EAGEARRLEN] = {0};             //��Ч�Ա�־����


void Measure_Length()
{
  int16s_t AveSpeed;
  
  AveSpeed = R_MotorSpeed + L_MotorSpeed;
  //Judge_RightAngle_Len += AveSpeed;
  
  if(WholeBlack_Flag==1)                        //�����������
  {
    BlackTip_Len+=AveSpeed;
    
    if(BlackTip_Len > BLACKTPLEN)
    {
      BlackTip_Len = 0;
      Black_Tip_Flag = 1;
      
      if(Black_Tip_Flag == 1)
      {
        TipAfter_Len = 0;
        Double_Edge_Flag = 0;
        Double_Edge_Num = 0;
        ResureTip_Flag = 0;
        Black_Tid_Bend_Flag = 0;
        Single_Edge_Num = 0;
      }
    }
  }
  else
  {
    BlackTip_Len = 0;
    
  }
  
  if(Black_Tip_Flag == 1)                     //����ֱ��ǰ����������������
  {
    TipAfter_Len+=AveSpeed;
    if(TipAfter_Len >9000)
    {
      Double_Edge_Flag = 1;
    }  
    if((TipAfter_Len > 10000)&&(Double_Edge_Num > Double_Edge_Limit))
    { 
      Double_Edge_Flag = 0;
      ResureTip_Flag = 1;
      Black_Tid_Bend_Flag = 1;
    }
    
    if(TipAfter_Len > 20000)
    {
      Double_Edge_Num = 0;
      Double_Edge_Flag = 0;
      TipAfter_Len = 0;
      Black_Tip_Flag = 0;
      ResureTip_Flag = 0;
      Black_Tid_Bend_Flag = 0;
      Single_Edge_Num = 0;
    }
  }
}

/******************************************************************************
��������JudgeValid
���ã�  �ж����������½��ص���Ч��
��ڲ�����const int8u_t* edgeArr:��������
          int8u_t* Valid:��Чֵ����
���ڲ�������
******************************************************************************/
void JudgeValid(const int8u_t* edgeArr,int8u_t* Valid)
{
  int8u_t i;
  if(abs_int16s(edgeArr[0]-edgeArr[EAGEARRLEN - 1])>VALIDLIMIT                //�ж�����ǰ�����ز�ֵ
      ||abs_int16s(edgeArr[1]-edgeArr[0])>VALIDLIMIT)
    Valid[0] = 0;
  else
    Valid[0] = 1;
  for(i=1;i<(EAGEARRLEN - 1);i++)
  {
    if(abs_int16s(edgeArr[i]-edgeArr[i-1])>VALIDLIMIT
       ||abs_int16s(edgeArr[i+1]-edgeArr[i])>VALIDLIMIT)
      Valid[i] = 0;
    else
    Valid[i] = 1;
  }
  if(abs_int16s(edgeArr[EAGEARRLEN - 1]-edgeArr[EAGEARRLEN - 2])>VALIDLIMIT
     ||abs_int16s(edgeArr[1]-edgeArr[EAGEARRLEN - 1])>VALIDLIMIT)
    Valid[EAGEARRLEN - 1] = 0;
  else
    Valid[EAGEARRLEN - 1] = 1;     
}



/******************************************************************************
��������Judge_MainCCD
���ã�  ��CCD����ץȡ����
��ڲ�����Catch_Edge�ṹ�庬����CCD���ز���
���ڲ�������
******************************************************************************/

void Judge_MainCCD(CCD_GROUP*Catch_Edge)        
{
      Main_R_array[Main_Edge_Counter] = Catch_Edge->Black_TO_White[0];           //ץȡ������
      Main_L_array[Main_Edge_Counter] = Catch_Edge->White_TO_Black[0];           //ץȡ�½���
      Main_Edge_Counter++;
      
/*********************�ж��ص���Ч��*******************************************/
      
      if(Main_Edge_Counter >= EAGEARRLEN)                                       //ѭ������
      {
        Main_Edge_Counter = 0;
        Frist_Scan_Flag = 1;                                            //��һ�����������־
      }
      if(Frist_Scan_Flag == 1)
      {
        JudgeValid(Main_L_array,Valid_M_L);
        JudgeValid(Main_R_array,Valid_M_R);
      }
}

/******************************************************************************
��������Judge_AssiCCD
���ã�  ����CCD����ץȡ����
��ڲ�����Catch_Edge�ṹ�庬����CCD���ز���
���ڲ�������
******************************************************************************/
void Judge_AssiCCD(CCD_GROUP*Catch_Edge)
{
      Assi_R_array[Main_Edge_Counter] = Catch_Edge->Black_TO_White[0];
      Assi_L_array[Main_Edge_Counter] = Catch_Edge->White_TO_Black[0];
      Assi_Edge_Counter++;
      if(Assi_Edge_Counter >= EAGEARRLEN)
      {
        Assi_Edge_Counter = 0;
        Frist_Scan_Flag = 1;
      }
      if(Frist_Scan_Flag == 1)
      {
        JudgeValid(Assi_L_array,Valid_A_L);
        JudgeValid(Assi_R_array,Valid_A_R);
      }
}