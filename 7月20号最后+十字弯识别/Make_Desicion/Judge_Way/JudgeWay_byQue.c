#include "AllHeaders.h"

int gyroArr[MAXARR] = {0};
QueByArr gyroQue = {gyroArr, 0, 0, 0, 0};
int pathType = UNKONWN;     //�������ͱ���
int judgeWayLen;      //�ж������������ݳ���
int averGyroVal;      //�����ǲ�ֵƽ��
int gyroData;   //����������

int abs_int(int num)
{
  if(num < 0)
    return (-num);
  else
    return num;
}

static void PushInt(int data, QueByArr* que)
{
  if(que->size < MAXARR)   //������г���С����󳤶�
  {
    if(que->lastPos < MAXARR-1)    //�����β�������м�
    {
      que->queArr[que->lastPos] = data;
      que->lastPos++;
    }
    else if(que->lastPos == MAXARR-1)    //�����β������β��
    {
      que->queArr[que->lastPos] = data;
        que->lastPos = 0;
    }
    que->size++;
  }
  else
  {
    que->queArr[que->lastPos] = data;
    que->lastPos++;
    que->firstPos++;
  }
  que->totle += data;
}

static void PopInt(int num, QueByArr* que)
{
  int i;
  
  if(num < que->size)    //�����������С�ڶ��г���
  {
    for(i=0;i<num;i++)
    {
      que->totle -= que->queArr[que->firstPos];
      if(que->firstPos < MAXARR-1)
      {
        que->firstPos++;
      }
      else
      {
        que->firstPos = 0;
      }
    }
    que->size -= num;

  }
  else
  {
    que->firstPos = 0;
    que->lastPos = 0;
    que->size = 0;
    que->totle = 0;
  }
}
 
static int FrontOf(QueByArr* que)
{
  return (que->queArr[que->firstPos]);
}

static int BackOf(QueByArr* que)
{
  return (que->queArr[que->lastPos - 1]);
}

void JudgeWay(int gyroData)
{
  if(pathType == UNKONWN)   //�Ⱦ������г���
  {
    judgeWayLen = JUDGELEN;
  }
  else
    judgeWayLen = NORMALLEN;
  //�ٽ���ѹ���г����в���
  if(gyroQue.size < judgeWayLen)
    PushInt(abs_int(gyroData), &gyroQue);
  else
  {
    PopInt(gyroQue.size - judgeWayLen, &gyroQue);
    PushInt(abs_int(gyroData), &gyroQue);
    PopInt(1, &gyroQue);
  }
  averGyroVal = gyroQue.totle / gyroQue.size;
  //�ٽ�������ʶ��
  if(pathType == UNKONWN)     //�����������δ֪
  {
    if(gyroQue.size >= judgeWayLen)   //ֻ�ж��г����㹻���Ż�����������ж�
    {
      if(averGyroVal > TURNLEFTLIM)
        pathType = LBENDPATH;
      else
        pathType = STRGPATH;
    }
  }
  else if(pathType == STRGPATH)    //�����ֱ����
  {
    if(averGyroVal > TURNLEFTLIM)
      pathType = UNKONWN;
  }
  else if(pathType == LBENDPATH)    //�������ת�����
  {
    if(averGyroVal < TURNLEFTLIM)
      pathType = UNKONWN;
  }
  //���Գ���
//  if(pathType == STRGPATH)
//    ONBUZZER();
//  else
//    OFFBUZZER();
}
