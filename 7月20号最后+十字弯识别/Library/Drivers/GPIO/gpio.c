/*******************************************************************************
* �ļ����ƣ�gpio.c
* ��    ��: GPIO���������򣨲ο��ͳ�ʦ����������
* ��    �ߣ������
* �ر���л���ͳ�ʦ��(����http://blog.chinaaet.com/jihceng0622)
* ʱ    �䣺2012��5��17��
*******************************************************************************/

#include "gpio.h"


static PORT_MemMapPtr GPIO_GetPortMapPtr(GPIO_MemMapPtr gpio);

/*******************************************************************************
* �������ƣ�GPIO_SetPinMod
* ��ڲ�����gpio   GPIO��
            pin    gpio�ڵ����ź�
            mux    �����ŵĹ��ܺ�
* ��    ��������GPIO�е� pin �����ŵĹ��ܺ�
*******************************************************************************/
void GPIO_SetPinMod(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t mux)
{
  PORT_MemMapPtr port;
  int32u_t       readReg = 0;
  
  port = GPIO_GetPortMapPtr(gpio);
  readReg = PORT_PCR_REG(port,pin);
  readReg &= ~PORT_PCR_MUX_MASK;
  readReg |= PORT_PCR_MUX(mux);
  PORT_PCR_REG(port,pin) = readReg;
}

/*******************************************************************************
* �������ƣ�GPIO_ConfigPinInt
* ��ڲ�����gpio   GPIO��ָ��
            pin    gpio�ڵ����ź�
            irqc   �����ŵ��ж�����
                    0000 Interrupt/DMA Request disabled.
                    0001 DMA Request on rising edge.
                    0010 DMA Request on falling edge.
                    0011 DMA Request on either edge.
                    0100 Reserved.
                    1000 Interrupt when logic zero
                    1001 Interrupt on rising edge.
                    1010 Interrupt on falling edge.
                    1011 Interrupt on either edge.
                    1100 Interrupt when logic one.
                    Others Reserved.
* ��    ��������GPIO�е� pin �����ŵ��ж�����
*******************************************************************************/
void GPIO_ConfigPinInt(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t irqc)
{
  PORT_MemMapPtr port;
  int32u_t       readReg = 0;
  
  port = GPIO_GetPortMapPtr(gpio);
  readReg = PORT_PCR_REG(port,pin);
  readReg &= ~PORT_PCR_IRQC_MASK;
  readReg |= PORT_PCR_IRQC(irqc); 
  PORT_PCR_REG(port,pin) = readReg; 
}

/*******************************************************************************
* �������ƣ�GPIO_SetPinDriveStrgth
* ��ڲ�����gpio   GPIO��ָ��
            pin    gpio�ڵ����ź�
            mux    �����ŵĹ��ܺ�
                    0: ����������
                    1��ǿ��������
* ��    ��������GPIO�е� pin �����ŵ���������
*******************************************************************************/
void GPIO_SetPinDriveStrgth(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t dse)
{
  PORT_MemMapPtr port;
  
  port = GPIO_GetPortMapPtr(gpio);
  if(dse == 1)
  {
    PORT_PCR_REG(port,pin) |= PORT_PCR_DSE_MASK;
  }
  else
  {
    PORT_PCR_REG(port,pin) &= ~PORT_PCR_DSE_MASK;
  }
}

/*******************************************************************************
* �������ƣ�GPIO_SetPinOpenDrain
* ��ڲ�����gpio   GPIO��ָ��
            pin    gpio�ڵ����ź�
            ode    �����ŵĹ��ܺ�
                    0: ��ֹ��©���
                    1��ʹ�ܿ�©���
* ��    ��������GPIO�е� pin �����ŵĿ�©ģʽ
*******************************************************************************/
void GPIO_SetPinOpenDrain(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t ode)
{
  PORT_MemMapPtr port;
  
  port = GPIO_GetPortMapPtr(gpio);
  if(ode == 1)
  {
    PORT_PCR_REG(port,pin) |= PORT_PCR_ODE_MASK;
  }
  else
  {
    PORT_PCR_REG(port,pin) &= ~PORT_PCR_ODE_MASK;
  }
}

/*******************************************************************************
* �������ƣ�GPIO_SetPinPassiveFilter
* ��ڲ�����gpio   GPIO��ָ��
            pin    gpio�ڵ����ź�
            ode    �����ŵĹ��ܺ�
                    0: ��ֹ��ͨ�˲�
                    1��ʹ�ܵ�ͨ�˲���10MHZ~30MHZ�������ź�Ƶ�ʸ���2MHZʱӦ��ֹ�ù���
* ��    ��������GPIO�е� pin �����ŵ��˲�ģʽ
*******************************************************************************/
void GPIO_SetPinPassiveFilter(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t pfe)
{
  PORT_MemMapPtr port;
  
  port = GPIO_GetPortMapPtr(gpio);
  if(pfe == 1)
  {
    PORT_PCR_REG(port,pin) |= PORT_PCR_PFE_MASK;
  }
  else
  {
    PORT_PCR_REG(port,pin) &= ~PORT_PCR_PFE_MASK;
  }
}

/*******************************************************************************
* �������ƣ�GPIO_SetPinPull
* ��ڲ�����gpio   GPIO��ָ��
            pin    gpio�ڵ����ź�
            pe     �����ŵĹ��ܺ�
                    0: ��ֹ�������������蹦��
                    1��ʹ���������������蹦��
            ps     �����ŵĹ��ܺţ��� pe=1 ʱ��Ч
                    0: ʹ���������蹦��
                    1��ʹ���������蹦��
* ��    ��������GPIO�е� pin �����ŵ�������������ģʽ
*******************************************************************************/
void GPIO_SetPinPull(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t pe, int8u_t ps)
{
  PORT_MemMapPtr port;
  
  port = GPIO_GetPortMapPtr(gpio);
  if(pe == 1)
  {
    PORT_PCR_REG(port,pin) |= PORT_PCR_PE_MASK;
    if(ps == 1)
    {
      PORT_PCR_REG(port,pin) |= PORT_PCR_PS_MASK;
    }
    else
    {
      PORT_PCR_REG(port,pin) &= ~PORT_PCR_PS_MASK;
    }
  }
  else
  {
    PORT_PCR_REG(port,pin) &= ~PORT_PCR_PE_MASK;
  }
}

/*******************************************************************************
* �������ƣ�GPIO_SetPortDir
* ��ڲ�����gpio   GPIO��ָ��
            dir    gpio�ڵ��������ģʽ
* ��    ��������GPIO�������ģʽ
*******************************************************************************/
void GPIO_SetPortDir(GPIO_MemMapPtr gpio, int32u_t dir)
{
  GPIO_PDDR_REG(gpio) = GPIO_PDDR_PDD(dir);
}
  
/*******************************************************************************
* �������ƣ�GPIO_SetPinDir
* ��ڲ�����gpio   GPIO��
            pin    gpio�ڵ����ź�
            dir    gpio�ڵ��������ģʽ
                    0������
                    1�����  
* ��    ��������GPIO�е� pin λ���������ģʽ
*******************************************************************************/
void GPIO_SetPinDir(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t dir)
{
  if(dir == 1)                                        // ��������Ϊ�����ʽ
  {
    GPIO_PDDR_REG(gpio) |= 1<<pin;                    // set the GPIO_DDR as output 
  }
  else
  {
    GPIO_PDDR_REG(gpio) &= ~(1<<pin);                 // set the GPIO_DDR as input 
  }
}

/*******************************************************************************
* �������ƣ�GPIO_SetPortStat
* ��ڲ�����gpio   GPIO��ָ��
            state  gpio�ڵ������ƽ
* ��    ��������GPIO�������ƽ
*******************************************************************************/
void GPIO_SetPortStat(GPIO_MemMapPtr gpio, int32u_t state)
{
  GPIO_PDOR_REG(gpio) = state;
}

/*******************************************************************************
* �������ƣ�GPIO_SetPinStat
* ��ڲ�����gpio   GPIO��ָ��
            pin    gpio�ڵ����ź�
            state  gpio�ڵ������ƽ
* ��    ��������GPIO�е� pin λ�ĵ�ƽ
*******************************************************************************/
void GPIO_SetPinStat(GPIO_MemMapPtr gpio, int8u_t pin, int8u_t state)
{
  if(state==1)
  {
    GPIO_PDOR_REG(gpio) |= 1<<pin;                     // set 1 to corresponding pin
  }    
  else 
  {
    GPIO_PDOR_REG(gpio) &= ~(1<<pin);                  // set 0 to corresponding pin
  }
}

/*******************************************************************************
* �������ƣ�GPIO_ReadPortStat
* ��ڲ�����gpio   GPIO��ָ��
            state  gpio�ڵĵ�ƽ
* ��    ������ȡ gpio �ڵ�״̬
*******************************************************************************/
void GPIO_ReadPortStat(GPIO_MemMapPtr gpio, int32u_t * state)
{
  *state = GPIO_PDIR_REG(gpio);            
}

/*******************************************************************************
* �������ƣ�GPIO_TogglePinStat
* ��ڲ�����gpio   GPIO��ָ��
            pin    gpio�ڵ����ź�
* ��    ������תGPIO�е� pin λ�ĵ�ƽ
*******************************************************************************/
void GPIO_TogglePinStat(GPIO_MemMapPtr gpio, int8u_t pin)
{
  GPIO_PTOR_REG(gpio) ^= 1<<pin;                       // toggle the corresponding pin's state
}

/*******************************************************************************
* �������ƣ�GPIO_GetPortMapPtr
* ��ڲ�����gpio   GPIO��ָ��
* ���ز�����p      gpio�ڼĴ���ָ��
* ��    ����ͨ�� GPIO_MemMapPtr ָ����� PORT_MemMapPtr ָ��
*******************************************************************************/
static PORT_MemMapPtr GPIO_GetPortMapPtr(GPIO_MemMapPtr gpio)
{
  PORT_MemMapPtr p;
  switch((int32u_t)gpio)
  {
    case 0x400FF000u:
                      p = PORTA_BASE_PTR;
                      break;
    case 0x400FF040u:
                      p = PORTB_BASE_PTR;
                      break;
    case 0x400FF080u:
                      p = PORTC_BASE_PTR;
                      break;
    case 0x400FF0C0u:
                      p = PORTD_BASE_PTR;
                      break;
    case 0x400FF100u: 
                      p = PORTE_BASE_PTR;
                      break;
    default:
            break;
            
  }
  return p;
}

//===========================================================================
//�������ƣ�GPIO_get
//�������أ�ָ������״̬��0=�͵�ƽ��1=�ߵ�ƽ��
//����˵����port���˿ںš��ɺ궨�塣
//          pin�����źš�0��31��
//���ܸ�Ҫ����ȡָ������״̬��
//===========================================================================
int8u_t GPIO_get(GPIO_MemMapPtr gpio, int8u_t pin)
{
        //PORT_MemMapPtr port;
	int8u_t i; 
	//��GPIO�˿ں�ת���ɶ˿ڼĴ�����ָ��
	//GPIO_MemMapPtr pt = gpio_get_pt_addr(port);
	//�鿴����״̬
	i = BGET(pin, GPIO_PDIR_REG(gpio));
	return i;     //��������״̬��0��1��
}