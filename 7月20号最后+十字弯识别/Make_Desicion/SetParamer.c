#include "AllHeaders.h"
#include "stdio.h"

int8u_t variPointer = 0;
volatile int8u_t keyPrs_flag = 0;
int8u_t keyValue;   //��ֵ
int16u_t aaa;

static void Input_float(struct myParams* parameters, int8u_t keyvalue);      //���븡�����ص�����
static void Input_IntPov(struct myParams* parameters, int8u_t keyvalue);     //�����������ص�����
static void Dis_Int(void* num, int8u_t row, int8u_t mode);
static void Dis_Float(void* fnum, int8u_t row, int8u_t mode);

Parameters myParam[VARINUM]={
  //{"MOTOR_SPEED_P", &MOTOR_SPEED_P, Input_IntPov, Dis_Int, 0},
  //{"MOTOR_SPEED_I", &MOTOR_SPEED_I, Input_IntPov, Dis_Int, 0},
  //{"MIDANGLE", &MIDANGLE, Input_IntPov, Dis_Int, 30},
  {"NormalSpeed", &NormalSpeed, Input_IntPov, Dis_Int, 0},
  //{"Serve_D_R", &ServePID.D_Gain_Revise, Input_float, Dis_Float, 0}
  {"Serve_P", &ServePID.P_Gain, Input_float, Dis_Float, 0},
  {"Serve_D", &ServePID.D_Gain, Input_float, Dis_Float, 0},
  {"Serve_I", &ServePID.I_Gain, Input_float, Dis_Float, 0},
  {"Diff_P", &Diff_P, Input_float, Dis_Float, 0},
  {"Diff_I", &Diff_I, Input_float, Dis_Float, 0},
  {"Diff_D", &Diff_D, Input_float, Dis_Float, 0}
  //{"Track_Slope", &Track_Slope, Input_int, Dis_int, 0}
  //{"UP_KD", &UP_KD, Input_float, Dis_Float, 0}

};

static void Dis_Inital_Data(void)
{
  int i;
  
  for(i=0;i<VARINUM;i++)
  {
    Dis_String(0, i*8, myParam[i].variName, 1);
    myParam[i].Dis_Num(myParam[i].variable, i, 1);
  }
  OLED_Refresh_Gram();
}

void SetVariable(void)
{
  Dis_Inital_Data();      //��ʾ��ʼֵ
  EN_KeyInt();        //�������ж�
  while(1)
  {
    if(variPointer>=VARINUM)
    {
      DIS_KeyInt();
      //
      OLED_Clear();
      OLED_Refresh_Gram();
      //��ʱ���ж��趨
      PIT_setTime(0,1000,1,3);        //��ʱ1ms�жϣ��õ�ʵʱʱ�Ӷ�ʱ�жϡ���ʱ������жϵ��жϵĻ��������������ж� 

      return;
    }
    
    if(keyPrs_flag!=0)
    {
      keyPrs_flag = 0;    //��ֻ֤����һ��
      
      myParam[variPointer].ChangeVariable(&myParam[variPointer], keyValue);      
    }
  }
}

void PORTE_Isr(void)
{
  CLR_UpInt();    //���жϱ�־

  keyPrs_flag = 1;    //�������±�־λ
  keyValue = GetKeyValue();
}

static void Dis_Int(void* num, int8u_t row, int8u_t mode)
{
  char valueBuff[12] = {'\0'};
  int16u_t num_musk = *(int16u_t*)num;

  OLED_Clear_Num(row);
  sprintf(valueBuff, "%d",num_musk);
  Dis_String(NUMPOS, row*8, valueBuff,mode);     //����ɫ��ʾ����
  OLED_Refresh_Row(row);
}

static void Dis_Float(void* fnum, int8u_t row, int8u_t mode)
{
  char valueBuff[12] = {'\0'};
  float num_musk = *(float*)fnum;
  
  OLED_Clear_Num(row);
  sprintf(valueBuff, "%.3f",num_musk);      //��ʾ3λС��
  Dis_String(NUMPOS, row*8, valueBuff,mode);     //����ɫ��ʾ����
  OLED_Refresh_Row(row);
}

static void Input_IntPov(struct myParams* parameters, int8u_t keyvalue)     //����һ��������
{
  static int8u_t numChanged = 0;
  
  if(keyvalue =='E')      //�����E��ֱ�ӷ���
    return;
  if(keyvalue =='Y')
  {
    if(numChanged == 0)   //���ֱ�Ӱ���Y������ת��һ����
    {
      variPointer++;
      return;
    }
    else
    {
      *((int16u_t*)parameters->variable) = parameters->DataTemp.uiData;
      //������ɺ���ʾ����
      Dis_Int(&parameters->DataTemp.uiData, variPointer, 1);//��ɫ��ʾ����

      variPointer++;
      numChanged = 0;
      return;
    }
  }
  else if(keyvalue =='N')     //����N����һλ
  {
    parameters->DataTemp.uiData/=10;
    Dis_Int(&parameters->DataTemp.uiData, variPointer, 0);//��ɫ��ʾ����
  }
  else      //���������
  {
    numChanged = 1;
    parameters->DataTemp.uiData = parameters->DataTemp.uiData*10+ keyvalue;
    Dis_Int(&parameters->DataTemp.uiData, variPointer, 0);//��ɫ��ʾ����
  }
  
}

static float charToFloat(char* fbuff)
{
  float numfloat = 0.0;
  
  sscanf(fbuff, "%f", &numfloat);
  return numfloat;
}

static void Input_float(struct myParams* parameters, int8u_t keyvalue)
{
  int8u_t i;
  static int8u_t numChanged = 0;
  static int8u_t pointVef = 0;
  static int8u_t numPos = 0;    //����ָ��
  static char valueBuff[12] = {'\0'};
  
  if(keyvalue =='E')      //�����E��ֱ�ӷ���
    return;
  if(keyvalue =='Y')
  {
    if(numChanged == 0)   //���ֱ�Ӱ���Y������ת��һ����
    {
      variPointer++;
      return;
    }
    else
    {
      if(0 == pointVef)    //��һ����Y����С����
      {
        pointVef++;
        valueBuff[numPos] = '.';
        Dis_String(NUMPOS, variPointer*8, valueBuff,0);     //��ɫ��ʾ����
        OLED_Refresh_Row(variPointer);
        numPos++;
      }
      else if(1 == pointVef)    //�ڶ�����Y���ǽ�����־
      {
        parameters->DataTemp.fData = charToFloat(valueBuff);
        *((float*)parameters->variable) = parameters->DataTemp.fData;
        //������ɺ���ʾ����
        Dis_Float(&parameters->DataTemp.fData, variPointer, 1);//��ɫ��ʾ����

        variPointer++;
        numChanged = 0;     //��������֮������
        pointVef = 0;
        numPos = 0;
        for(i=0;i<12;i++)
        {
          valueBuff[i] = '\0';
        }
        return;
      }
    }
  }
  else if(keyvalue =='N')     //����N����һλ
  {
    numPos--;
    valueBuff[numPos] = '\0';
    OLED_Clear_Num(variPointer);
    Dis_String(NUMPOS, variPointer*8, valueBuff,0);     //��ɫ��ʾ����
    OLED_Refresh_Row(variPointer);
  }
  else      //���������
  {
    numChanged = 1;
    valueBuff[numPos] = '0' + keyvalue;
    numPos++;
    Dis_String(NUMPOS, variPointer*8, valueBuff,0);     //��ɫ��ʾ����
    OLED_Refresh_Row(variPointer);
  }
}