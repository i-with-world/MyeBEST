#include "AllHeaders.h"

/*******************************************************************************
* ��������CCD_Init(void)
* ��  ������ɶ�CCD�й����ŵĳ�ʼ��
********************************************************************************/
void CCD_Init(void)
{
  //CCD port init
  GPIO_SetPinMod(PORTE, 24,0);                               // ������Ӧ���ŵĹ��ܺ�,ADC0_SE17 ��CCD�ɼ�
  GPIO_SetPinMod(PORTE, 25,0);                               // ������Ӧ���ŵĹ��ܺ�,ADC0_SE18 ��CCD�ɼ�

  GPIO_SetPinMod(PORTE,6,1);                             
  GPIO_SetPinDir(PORTE,6,1);                               // ����PTE6��Ϊ�����SI�ź�
  GPIO_SetPinMod(PORTE,17,1);
  GPIO_SetPinDir(PORTE,17,1);                                // ����PTE17��Ϊ�����CLK�ź�
  
  GPIO_SetPinMod(PORTD,1,1);                             
  GPIO_SetPinDir(PORTD,1,1);                               // ����PTD1��Ϊ�����SI�ź�
  GPIO_SetPinMod(PORTD,3,1);
  GPIO_SetPinDir(PORTD,3,1);                                // ����PTD3��Ϊ�����CLK�ź�
  //CCD ADC module init
  ADC_ClockCtrl(ADC0);
  //ADC_SetCFG1(ADC0, 1, 0, 1);                        // ADC ��������8λ��ʱ��Ƶ��48MHZ/2������ʱ�ӣ�/2
  ADC_SetCFG1(ADC0, 0, 0, 0);                        // ADC ��������8λ��ʱ��Ƶ��48MHZ������ʱ�ӣ�
  ADC_SetCFG2(ADC0, 0, 0, 3);                        //�ڶ�������ѡ��ADC A��B
  ADC_SetSC(ADC0, 1, 0, 0);                          // Ӳ��ƽ���˲���������Ϊ 8����ѯ��ʽ 8MHZ������ 6��ʱ���������һ��ת��
}

/*******************************************************************************
* �������ƣ�Servo_Init(void)
* ��    �������ö������ PWM ģ��                                         
*******************************************************************************
void Servo_Init(void)                           //��ɶ�PWM0�ĳ�ʼ�������ڿ���ת����
{ 
  GPIO_SetPinMod(PORTA, 13, 3);                       // ������Ӧ���ŵĹ��ܺ�,FTM1_CH1
  FTM_initPWM(FTM1, 1, 4);                           // ���� PWM ʱ�Ӻͷ�Ƶ��
  FTM_enablePWMCh(FTM1, 1, 0, 14999, 0);             // PWM  Ƶ�� 200K Hz
  FTM_setPWMDty(FTM1, 1, dutyMid);                         // ���� PWM ռ�ձ�
  
  
}
*/
/*******************************************************************************
* �������ƣ�Motor_Init
* ��    �������õ������ PWM ģ��                                         
*******************************************************************************/
void Motor_Init(void) 
{ 
  FTM_initPWM(FTM0, 1, 5);
  
  GPIO_SetPinMod(PORTD, 6, 4);                       // ������Ӧ���ŵĹ��ܺ�,FTM0_CH6
  GPIO_SetPinMod(PORTC, 3, 4);                       // ������Ӧ���ŵĹ��ܺ�,FTM0_CH2
  GPIO_SetPinMod(PORTD, 4, 4);                       // ������Ӧ���ŵĹ��ܺ�,FTM0_CH4
  GPIO_SetPinMod(PORTC, 1, 4);                       // ������Ӧ���ŵĹ��ܺ�,FTM0_CH0
  
  FTM_enablePWMCh(FTM0, 0, 0, 500, 0);               // PWM  Ƶ�� 600-->10KHZ
  FTM_enablePWMCh(FTM0, 2, 0, 500, 0);
  FTM_enablePWMCh(FTM0, 4, 0, 500, 0);               // PWM  Ƶ�� 600-->10KHZ
  FTM_enablePWMCh(FTM0, 6, 0, 500, 0);
  
  FTM_setPWMDty(FTM0, 0, 0);                         // ��ʼ�� PWM ռ�ձ�
  FTM_setPWMDty(FTM0, 2, 0);
  FTM_setPWMDty(FTM0, 4, 0);                         // ��ʼ�� PWM ռ�ձ�
  FTM_setPWMDty(FTM0, 6, 0);
}

/*******************************************************************************
* �������ƣ�Buzzer_Init
* ��    �������÷�����ģ��                                         
*******************************************************************************/
void Buzzer_Init(void)
{
  GPIO_SetPinMod(PORTA, 15, 1);                   // ������Ӧ���ŵĹ��ܺ�
  GPIO_SetPinDir(PORTA, 15, 1);
  GPIO_SetPinDriveStrgth(PORTA, 15, 1);           //����ǿ����ģʽ
}

/*******************************************************************************
* �������ƣ�Switch_Init
* ��    �������÷�����ģ��                                         
*******************************************************************************/
void Switch_Init(void)
{
  GPIO_SetPinMod(PORTB, 23, 1);                   // ������Ӧ���ŵĹ��ܺ�
  GPIO_SetPinDir(PORTB, 23, 0);                   // ������Ӧ���ŵķ���
  
  GPIO_SetPinMod(PORTB, 22, 1);                   // ������Ӧ���ŵĹ��ܺ�
  GPIO_SetPinDir(PORTB, 22, 0);                   // ������Ӧ���ŵķ���
  
  GPIO_SetPinMod(PORTB, 21, 1);                   // ������Ӧ���ŵĹ��ܺ�
  GPIO_SetPinDir(PORTB, 21, 0);                   // ������Ӧ���ŵķ���
  
  GPIO_SetPinMod(PORTB, 20, 1);                   // ������Ӧ���ŵĹ��ܺ�
  GPIO_SetPinDir(PORTB, 20, 0);                   // ������Ӧ���ŵķ���
  
  
  GPIO_SetPinMod(PORTC, 15, 1);                   // ������Ӧ���ŵĹ��ܺ�
  GPIO_SetPinDir(PORTC, 15, 0);                   // ������Ӧ���ŵķ���
  
  GPIO_SetPinMod(PORTC, 14, 1);                   // ������Ӧ���ŵĹ��ܺ�
  GPIO_SetPinDir(PORTC, 14, 0);                   // ������Ӧ���ŵķ���
  
  GPIO_SetPinMod(PORTC, 13, 1);                   // ������Ӧ���ŵĹ��ܺ�
  GPIO_SetPinDir(PORTC, 13, 0);                   // ������Ӧ���ŵķ���
  
  GPIO_SetPinMod(PORTC, 12, 1);                   // ������Ӧ���ŵĹ��ܺ�
  GPIO_SetPinDir(PORTC, 12, 0);                   // ������Ӧ���ŵķ���
  

}

/*******************************************************************************
* �������ƣ�UART_Init
* ��    �����û����ӵĳ�ʼ������                                         
*******************************************************************************/
void UART_Init(void)
{
#if BLOOTH_EN
  GPIO_SetPinMod(PORTB,16,3);
  GPIO_SetPinMod(PORTB,17,3);
  
  UART_Selt(UART0_BASE_PTR);
  UART_Set(UART0_BASE_PTR,8,9600);
  EN_INTUART0();   //�������ж�

#endif
}

/*******************************************************************************
* �������ƣ�QUAT_Init
* ��    �����û����ӵĳ�ʼ������                                         
*******************************************************************************/
void QUAT_Init(void)
{
  GPIO_SetPinMod(PORTB,18,6);
  GPIO_SetPinMod(PORTB,19,6);
  GPIO_SetPinMod(PORTA,12,7);
  GPIO_SetPinMod(PORTA,13,7);

  FTM_initQUAD(FTM1, 1, 0, 65535);                   // ������������ģ�����
  FTM_enableQUAD(FTM1);                              // ʹ����������
  
  FTM_initQUAD(FTM2, 1, 0, 65535);                   // ������������ģ�����
  FTM_enableQUAD(FTM2);                              // ʹ����������
}
/*******************************************************************************
* �������ƣ�User_Init
* ��    �����û����ӵĳ�ʼ������                                         
*******************************************************************************/
void User_Init(void)
{
#if OLED_EN
  OLED_Init();
  OLED_Clear();
  OLED_Refresh_Gram();
#endif 
 
#if (FUNC_MUSK==0)
  SD_System_Init();
#endif
#if (FUNC_MUSK==1)
  Init_7290();
  //�����ж��趨
  EnableInt_Kinetis(91);    //��PORTE���ж�
  SetIntPri_Kinetis(91,2);    //�趨�ж����ȼ�
#endif
  //I2C��ʼ��
  I2C_Driver_Init();
  //��ʱ֮���ʼ�����ٶȼƺ�������
  delay_ms(40);
  SetScaleRange();
  MMA8451Q_init();

}

/*******************************************************************************
* ��������: System_Init                          
* ��    �������ø�ģ���ʼ������ 
*******************************************************************************/
void System_Init(void)
{
  CCD_Init();
  Motor_Init();
  Buzzer_Init();
  Switch_Init();
  UART_Init();
  QUAT_Init();
  User_Init();
  
}