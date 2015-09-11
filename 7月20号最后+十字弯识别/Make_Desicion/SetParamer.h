#ifndef _SETPARAMER_H_
#define _SETPARAMER_H_
#include "KinetisConfig.h"

#define VARINUM 7
#define NUMPOS 88
#undef  VECTOR_107                 // 107Ϊ���ж����������еı��
#define VECTOR_107  PORTE_Isr       // PORTE_Isr
extern  void PORTE_Isr(void);       // ��ײ����������������жϷ�����

typedef struct myParams
{
  int8u_t* variName;      //������
  void* variable;       //����ָ��
  void (*ChangeVariable)(struct myParams* parameters, int8u_t keyvale);       //�ص�����ָ��
  void (*Dis_Num)(void* num, int8u_t row, int8u_t mode);     //������ʾ�ص�����
  union{
    int16s_t siData;
    int16u_t uiData;
    float fData;
    int8u_t data[4];
  }DataTemp;      //������ʱ���壬��Ϊ���ǵ��������ͣ�����union
  
}Parameters;


extern void SetVariable(void);





#endif