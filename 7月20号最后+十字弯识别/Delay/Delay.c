#include "AllHeaders.h"

//----------------------------------------------------------------------
//�� �� ��:��ʱ���� delay(), DelayMs()                                                     
//��    ��:��ʱ����                                                              
//��    ��:��                                                                                       
//----------------------------------------------------------------------
 void Integration_delay()
{
  unsigned int i;
  for(i=0;i<2;i++)
  {
    asm("nop");
  }

}
void delay()
{
  unsigned int i;
  for(i=0;i<2;i++)
  {
    asm("nop");
  }
}

/******************************
��������Delay_us()
����  �����ڼ򵥵���ʱ
��ע  ��
******************************/
void Delay_us(unsigned int t) 
{
 while(t--);   
}

void delay_ms(unsigned int delay_time) 
{
  unsigned int i,delay_temp;
  for(i=0;i<delay_time;i++) 
  {
    for(delay_temp=0;delay_temp<10000;delay_temp++);  
  }
}

void Delay1(int16u_t Delay1)
{
   int16u_t i;
   for(i=0;i<Delay1;i++)
   {
   }
}

