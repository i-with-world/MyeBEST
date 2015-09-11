/*******************************************************************************
* �ļ����ƣ�pit.c
* ��    ��: PIT(���ڶ�ʱ�ж�)��������
* ��    �ߣ������
* �ر���л���ͳ�ʦ��(����http://blog.chinaaet.com/jihceng0622)
* ʱ    �䣺2012��5��21��
*******************************************************************************/

#include "pit.h"


/*******************************************************************************
* �������ƣ�PIT_setIntTime
* ��ڲ�����timer  PIT��ʱ����ѡ��
                    TIMER0
                    TIMER1
                    TIMER2
                    TIMER3
            time   ��ʱʱ��,��λ us
            pie    �ж�ʹ��ѡ��
            prio   �ж����ȼ�(ȡֵ0-15,ֵԽС���ȼ�Խ��)
* ��    �������ö�ʱ��
*******************************************************************************/
void PIT_setTime(int8u_t timer, int32u_t time, int8u_t pie, int8u_t prio)
{
  SIM_SCGC6 |= SIM_SCGC6_PIT_MASK;               // �� PIT ʱ�� 
  PIT_TCTRL(timer) &= ~PIT_TCTRL_TEN_MASK;       // ֹͣ��ʱ
  PIT_MCR = 0x00;                                // ʹ��PIT����
  PIT_LDVAL(timer) = PIT_LDVAL_TSV(time*BUS_ClK);// ���ö�ʱʱ��
  if(pie == 1)
  {
    EnableInt_Kinetis(68+timer);                 // ������Ӧ���ж�
    SetIntPri_Kinetis(68+timer,prio);            // �����ж����ȼ�
    PIT_TCTRL(timer) |= PIT_TCTRL_TIE_MASK;      // ʹ�ܶ�ʱ�ж�
  }
  else
  {
    PIT_TCTRL(timer) &= ~PIT_TCTRL_TIE_MASK;     // ��ֹ��ʱ�ж�
  }
  PIT_TCTRL(timer) |= PIT_TCTRL_TEN_MASK;        // ��ʼ��ʱ
}

/*******************************************************************************
* �������ƣ�PIT_start
* ��ڲ�����timer  PIT��ʱ����ѡ��
                    TIMER0
                    TIMER1
                    TIMER2
                    TIMER3
* ��    ������ʼ��ʱ
*******************************************************************************/
void PIT_start(int8u_t timer)
{
  PIT_TCTRL(timer) |= PIT_TCTRL_TEN_MASK;        // ��ʼ��ʱ
}

/*******************************************************************************
* �������ƣ�PIT_stop
* ��ڲ�����timer  PIT��ʱ����ѡ��
                    TIMER0
                    TIMER1
                    TIMER2
                    TIMER3
* ��    ����ֹͣ��ʱ
*******************************************************************************/
void PIT_stop(int8u_t timer)
{
  PIT_TCTRL(timer) &= ~PIT_TCTRL_TEN_MASK;      // ֹͣ��ʱ
}
 
/*******************************************************************************
* �������ƣ�PIT_stop
* ��ڲ�����timer  PIT��ʱ����ѡ��
                    TIMER0
                    TIMER1
                    TIMER2
                    TIMER3
* ��    ���������жϱ�־λ
*******************************************************************************/
void PIT_clearIntFlg(int8u_t timer)
{
  PIT_TFLG(timer) = PIT_TFLG_TIF_MASK;         // �����жϱ�־λ
}

/*******************************************************************************
* �������ƣ�PIT_readValue
* ��ڲ�����timer  PIT��ʱ����ѡ��
                    TIMER0
                    TIMER1
                    TIMER2
                    TIMER3
            result ��������ǰ��ֵ
* ��    ������ȡ��������ǰ��ֵ
*******************************************************************************/
void PIT_readValue(int8u_t timer, int32u_t * result)
{
  *result = PIT_CVAL(timer);
}

