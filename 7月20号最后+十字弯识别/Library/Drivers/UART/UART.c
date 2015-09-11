
/*******************************************************************************
�ļ�����UART.c
���������ڴ���ͨ��
ʱ�䣺2014��4��17��
*******************************************************************************/


#include"UART.h"


/*******************************************************************************
��������UART_Selt
��ڲ�����uart_ptr:UART0_BASE_PTR/ UART1_BASE_PTR/ UART2_BASE_PTR/ UART3_BASE_PTR
                    UART4_BASE_PTR/ UART5_BASE_PTR
���ã�ѡ��UARTģ�鼰��Ӧ����
********************************************************************************/
void UART_Selt(UART_MemMapPtr uart_ptr)
{
  /* Enable the clock to the selected UART */    
    if(uart_ptr == UART0_BASE_PTR)
		SIM_SCGC4 |= SIM_SCGC4_UART0_MASK;
    else
    	if (uart_ptr == UART1_BASE_PTR)
			SIM_SCGC4 |= SIM_SCGC4_UART1_MASK;
    	else
    		if (uart_ptr == UART2_BASE_PTR)
    			SIM_SCGC4 |= SIM_SCGC4_UART2_MASK;
    		else
    			if(uart_ptr == UART3_BASE_PTR)
    				SIM_SCGC4 |= SIM_SCGC4_UART3_MASK;
    			else
    				if(uart_ptr == UART4_BASE_PTR)
    					SIM_SCGC1 |= SIM_SCGC1_UART4_MASK;
    				else
    					SIM_SCGC1 |= SIM_SCGC1_UART5_MASK;
}


/*******************************************************************************
��������UART_Set
��ڲ�����uart_ptr:UARTģ��
          baud��������
���ã�����UARTģ��
********************************************************************************/
void UART_Set(UART_MemMapPtr uart_ptr,int bitnum,int baud)
{
  register int16u_t sbr,brfa;
  int sysclk;
  int8u_t temp;

  if((uart_ptr==UART0_BASE_PTR)| (uart_ptr==UART1_BASE_PTR))
    sysclk =CORE_CLK_Kinetis;
  else
    sysclk =CORE_CLK_Kinetis/DIV_BusClk_Kinetis;
    
  UART_C2_REG(uart_ptr) &=~(UART_C2_RE_MASK| UART_C2_TE_MASK);                //��ʼ��֮ǰ�ȹص��������ͽ�����
  //ѡ����λ��
  if(bitnum==8)
  {
    UART_C1_REG(uart_ptr) &= ~UART_C1_M_MASK;
  }
  if(bitnum==9)
  {
    UART_C1_REG(uart_ptr) |= UART_C1_M_MASK;
  }
  //���㲨����
  sbr =(int16u_t)((sysclk*1000000)/(baud*16));
  temp =UART_BDH_REG(uart_ptr) &~(UART_BDH_SBR(0x1F));
  UART_BDH_REG(uart_ptr) =temp | UART_BDH_SBR(((sbr &0x1F00)>>8));
  UART_BDL_REG(uart_ptr)=(int8u_t)(sbr & UART_BDL_SBR_MASK);
  //���ò����ʵ�΢������
  brfa =(((sysclk*32000000)/(baud*16))-(sbr*32));
  temp =UART_C4_REG(uart_ptr) &~(UART_C4_BRFA(0x1F));
  UART_C4_REG(uart_ptr) =temp | UART_C4_BRFA(brfa);
  
  UART_C2_REG(uart_ptr) |= (UART_C2_TE_MASK| UART_C2_RE_MASK );
  
  //(UART_C2_REG(UART0_BASE_PTR)|= UART_C2_TIE_MASK); 

}


/*******************************************************************************
�������ƣ�UART_Sendchar
��ڲ�����uart_ptr��ѡ��UARTģ��
          ch��8λ����
���ã�����һ��8λ����
********************************************************************************/
void UART_Sendchar(UART_MemMapPtr uart_ptr,char ch)
{
  while(!(UART_S1_REG(uart_ptr)&UART_S1_TDRE_MASK));
  UART_D_REG(uart_ptr)=(uint8_t)ch;
  
}


/*******************************************************************************
��������UART_Getchar
��ڲ�����uart_ptr��ѡ��UARTģ��
���ã���ȡһ���ֽ�
*******************************************************************************/
char UART_Getchar(UART_MemMapPtr uart_ptr)
{
  while(!(UART_S1_REG(uart_ptr)&UART_S1_RDRF_MASK));
  return UART_D_REG(uart_ptr);
}


/*******************************************************************************
��������UART_SendArr
��ڲ�����uart_ptr��ѡ��UARTģ��
*ch�������׵�ַ
len�����鳤��
���ã�����һ����������
*******************************************************************************/
void UART_SendArr(UART_MemMapPtr uart_ptr,char *ch,int len)
{
  while(len--)
    UART_Sendchar(uart_ptr,*(ch++));
}

void EN_INTUART0(void)
{
  (UART_C2_REG(UART0_BASE_PTR)|= UART_C2_RIE_MASK); 
  EnableInt_Kinetis(45);
  SetIntPri_Kinetis(45,10);            // �����ж����ȼ�

}