#ifndef _JUDGEWAY_BYQUE_H_
#define _JUDGEWAY_BYQUE_H_
typedef struct myQue
{
  int* queArr;    //��������
  int size;   //���г���
  long totle;    //����ȫ��ֵ�ĺ�
  int firstPos;   //����λ��
  int lastPos;   //��β����һ��λ��
}QueByArr;

#define MAXARR 100      //������󳤶�
//������������
#define UNKONWN 0     //δ�жϳ���������
#define STRGPATH 1    //ֱ��
#define LBENDPATH 2   //��ת��
#define RBENDPATH 3   //��ת��
//������г���
#define NORMALLEN 20
#define JUDGELEN 40

#define TURNLEFTLIM 200     //������תΪ����תΪ��
#define TURNRIGHTLIM -200


extern int pathType;     //�������ͱ���


extern void JudgeWay(int gyroData);


#endif