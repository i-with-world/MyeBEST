/******************************************************************************

* SD_driver.c

* sd���ĵײ������ļ�   

* ��һ���ߣ�  �ͳ�   (���Ľ�����ͷ)
  �������������Ľ� (����������ͷ)
* �汾��V1.15 (��V1.13��v1.14�������,��ʹ��˫����ʱ��V1.10֮��İ汾�����)
* �汾����ʱ�䣺2012��1��30��
  
* ����оƬ��MK10N512VMD100
  ����ƽ̨��CodeWarrior 10.1

* (!!!����Ӳ��ƽ̨������޸�!!!)                
 
******************************************************************************/

#include "./SD_System.h"
                                  
#ifdef EN_SD                  
 
byte_sd sd_initover = 0; /* SD����ʼ��������־ */

byte_sd sd_yes=0;  //�ж��Ƿ���SD��(û��Ϊ0����Ϊ1)
byte_sd flag_sdhc; //sdhc����־,=1��Ч         /************By Sword************/ 
byte_sd flag_test_sd; //����ʹ��               /************By Sword************/ 
byte_sd flag_err_sd;  //SD�����־             /************By Sword************/ 
byte_sd Flag_SDRdy;    //SD��������־(=1��SD������)

/*�ڲ�����*/
static byte_sd resp_sd[4];                     /************By Sword************/ 

/**************************�ڲ���������**************************/
#if DELAY_WaitRead_SD != 0
/**********************************************************
* function:SD_Delay_ReadByte
* description:��ȡ1Byte����֮�����ʱ,��ʱʱ����SD_driver.h
*             �ж��塣
**********************************************************/
static void SD_Delay_ReadByte(void)
{
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");

#if DELAY_WaitRead_SD > 1
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 2
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 3
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 4
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 5
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif	

#if DELAY_WaitRead_SD > 6
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 7
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 8
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 9
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif
	
#if DELAY_WaitRead_SD > 10
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
#endif	
}
#endif
/**********************************************************
* function:SD_WriteByte
* description:д��1Byte���ݣ���ѯ��ʽ��
**********************************************************/
static void SD_WriteByte(byte_sd jc_data) 
{	
	SPI1_SR |= SPI_SR_EOQF_MASK;
	SPI1_MCR &= (~SPI_MCR_HALT_MASK) & (~SPI_MCR_MDIS_MASK);   /* ����RUNNING״̬ */
	
	SPI1_PUSHR = SPI_PUSHR_CTAS(0) | SPI_PUSHR_EOQ_MASK | SPI_PUSHR_CTCNT_MASK | jc_data;
	                                                           /* д�����ݲ���ռ����Ĵ��� */ 
	                                                           /* ��λEOQ��ʾ�������Ƕ��������һ��,��ʹ�ܷ��� */
	
	while((SPI1_SR & SPI_SR_TCF_MASK) == 0);	
	SPI1_SR |= SPI_SR_TCF_MASK;
	
	SPI1_MCR |= SPI_MCR_CLR_TXF_MASK | SPI_MCR_CLR_RXF_MASK;   /* ��ն���(������Ҫ) */
}
/**********************************************************
* function:SD_ReadByte
* description:����1Byte���ݣ���ѯ��ʽ��
**********************************************************/
static byte_sd SD_ReadByte(byte_sd jc_data)
{	
	byte_sd dat;
	
	SPI1_SR |= SPI_SR_EOQF_MASK;
	SPI1_MCR &= (~SPI_MCR_HALT_MASK) & (~SPI_MCR_MDIS_MASK);   /* ����RUNNING״̬ */
		
	SPI1_PUSHR = SPI_PUSHR_CTAS(0) | SPI_PUSHR_EOQ_MASK |SPI_PUSHR_CTCNT_MASK | jc_data;
		
	while((SPI1_SR & SPI_SR_TCF_MASK) == 0);
	SPI1_SR |= SPI_SR_TCF_MASK;
	
#if DELAY_WaitRead_SD != 0	
	SD_Delay_ReadByte();
#endif	
		
	dat = (byte_sd)SPI1_POPR;
	
	SPI1_MCR |= SPI_MCR_CLR_TXF_MASK | SPI_MCR_CLR_RXF_MASK;
	
	return dat;
}


/*
�������ƣ�close_SD
�������ܣ��ر�SD��(�ر��������ߵ�ͬʱ����sd���ñ�־����sd_yes)
�� д �ߣ�Sword
*/
void CloseSD(void)
{
  sd_yes = 0;
  OFF_SD_CS;
  SIM_SCGC6 &= ~SIM_SCGC6_SPI1_MASK;              /* �ر�SPI1ʱ�� */
}
/*
�������ܣ�SetSD_Low
�������ƣ��趨����Ϊ����(ԼΪ230kHz)
�� д �ߣ�Sword
*/
void SetSD_Low(void)
{
	SPI1_CTAR0 &= (~SPI_CTAR_DBR_MASK) & (~SPI_CTAR_BR_MASK) & (~SPI_CTAR_PBR_MASK);
	SPI1_CTAR0 |= SPI_CTAR_BR(7) | SPI_CTAR_PBR(1);
	/* DBR = 0, BR = 128, PBR = 3 ; f = f(bus)/PBR * [(1+DBR)/BR] */
}
/*
�������ܣ�SetSD_High
�������ƣ��趨����Ϊ����(ԼΪ15MHz)
�� д �ߣ�Sword
*/
void SetSD_High(void)
{
	SPI1_CTAR0 &= (~SPI_CTAR_DBR_MASK) & (~SPI_CTAR_BR_MASK) & (~SPI_CTAR_PBR_MASK);
  SPI1_CTAR0 |= SPI_CTAR_BR(0) | SPI_CTAR_PBR(1);
	/* DBR = 0, BR = 2, PBR = 3 ; f = f(bus)/PBR * [(1+DBR)/BR] */
}
/*
�������ƣ�SD_driver_Init
�������ܣ�SD����Ӳ����ʼ��
�� д �ߣ�Sword
*/
void SD_driver_Init(void)
{ 
	SIM_SCGC6 |= SIM_SCGC6_SPI1_MASK;              /* ʹ��SPI1ʱ�� */
	
	PORTE_PCR0 = PORT_PCR_MUX(2) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
	PORTE_PCR1 = PORT_PCR_MUX(2) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
	PORTE_PCR2 = PORT_PCR_MUX(2) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
	PORTE_PCR3 = PORT_PCR_MUX(2) | PORT_PCR_PE_MASK;
	                                               /* ��PE0-PE3��ΪSPI����,PTE0-2ʹ����������,PTE3Ϊ�������� */
	PORTE_PCR5 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
	GPIOE_PDDR |= (1<<5);                          /* ��PE5��Ϊ��ͨIO,����CS */
	OFF_SD_CS;
	
	SPI1_MCR |= SPI_MCR_MSTR_MASK | SPI_MCR_PCSIS(0x1F);                 
	                                               /* ����ΪSPI����,CS����Ч״̬Ϊ�ߵ�ƽ */
	
	SPI1_RSER |= SPI_RSER_TCF_RE_MASK | SPI_RSER_EOQF_RE_MASK;
	
	SPI1_CTAR0 = SPI_CTAR_FMSZ(7);                 
	                                               /* ����һ֡����8bit */
}
/**********************************************************
* function:Wait_SDRdy
* description:�ȴ�SD������(����SD��д������ʱSD������æ״̬)
* Input:�ȴ�ʱ��
**********************************************************/
void Wait_SDRdy(dword_sd Limit)
{
  dword_sd retry=0;
  while(Flag_SDRdy==0 && (++retry)<Limit) 
  {
    C_WDOG();
    if(SD_ReadByte(0xff)!=0)
    {
      Flag_SDRdy=1;
      break;
    }
  }
}
/*********************************************************/
//function:jc_sd_cmd
//description:��SD����������
//input: 48���ֽڣ�ǰ8λΪCMDָ�����32λΪ��ַ������
//       ���8λΪCRCУ�飨��ģʽ��SPIģʽ����Ч��
/***********************************************************/
byte_sd jc_sd_cmd(byte_sd cmd,dword_sd arg,byte_sd crc)
{
  byte_sd r1,i;
  word_sd retry=0;
 
  if(Flag_SDRdy == 0)
  {
    Wait_SDRdy(SD_LONG_Wait);
    OFF_SD_CS;
  }
 
  SD_WriteByte(0xff);
  ON_SD_CS;
  SD_WriteByte(0xff);
  SD_WriteByte(cmd|0x40);
  if(flag_sdhc==0)      /************By Sword************/  
    arg=arg << 9;  //���ڷ�sdhc��sd��,����ַ�����ֽ�Ϊ��λ��
//����sdhc��sd1.0������   
  SD_WriteByte((byte_sd)((arg>>24)&0x0000FF)); //����32λ��ַ
  SD_WriteByte((byte_sd)((arg>>16)&0x0000FF));
  SD_WriteByte((byte_sd)((arg>>8)&0x0000FF));
  SD_WriteByte((byte_sd)(arg&0x0000FF));
  SD_WriteByte(crc); 
  do
  {
  	r1=SD_ReadByte(0xff);
    retry++;
    C_WDOG(); //�忪�Ź� 
    if(retry==250) 
    {
      retry=0;
      break;
    }
       
  }while(r1==0xff);
  if(cmd==8||cmd==58)   /************By Sword************/  
    for(i=0;i<4;i++) resp_sd[i]=SD_ReadByte(0xff);   
//��ȡsdhc���������Ϣ 
  OFF_SD_CS;
  SD_WriteByte(0xff);
  return(r1);
}
/*********************************************************/
//function: sd_init
//description:sd����ʼ������
/***********************************************************/
byte_sd sd_init(void)
{
  byte_sd i=0,r1=0;
  word_sd retry=0;
  for(i=0;i<10;i++)
    SD_WriteByte(0xFF);//�ȴ�74��ʱ�����ڣ�sd������ѹ��������ֵ
  
  flag_sdhc=1; //��Ĭ��Ϊsdhc��
  
  do
   {
      //����CMD0����SD������IDLE״̬
      r1 = jc_sd_cmd(0,0,0x95);
      retry++;
      C_WDOG(); //�忪�Ź�
   } while ((r1 != 0x01) && (retry < 100));
  if (retry==100) 
   {          //����CMD0����
     flag_err_sd=SDERR_CMD0;
     return 1; 
   }
  retry=0;
 
  //����ȷ����SDHC����SD1.0
  r1=jc_sd_cmd(8,0x1aa,0x87);
  if(r1!=0x01||resp_sd[2]!=1||resp_sd[3]!=170) flag_sdhc=0;
 /************By Sword************/ 
   
  retry=0;
  //����cmd55+acmd41ʹsd��������spiģʽ
  do
   {
      r1=jc_sd_cmd(55,0,0xff);
      if(r1==0x01)
        r1=jc_sd_cmd(41,((dword_sd)flag_sdhc)<<30,0xff);
      retry++;
      C_WDOG(); //�忪�Ź� 
   } while ((r1 != 0x00) && (retry < 100));
  
  if(retry>=100)
   {       //����ACMD41ָ��ʱ����
     flag_err_sd=SDERR_ACMD41; 
     return 1;
   }
   
  if(flag_sdhc) 
   {
     (void)jc_sd_cmd(58,0,0xff);      //����ȷ���Ƿ���sdhc��
     if((resp_sd[0]&0x40)==0) flag_sdhc=0; 
   }
 /************By Sword************/   

  return 0;
}
/*********************************************************/
//function:sd_rdata
//description:��sd����ȡָ����������
/***********************************************************/
byte_sd sd_rdata(byte_sd * data,word_sd len)
{
  byte_sd r1=0;
  word_sd retry=0;
  /************By Sword************/  
 //ԭ��retryΪbyte_sd��  
  ON_SD_CS;
  do
  {
    r1=SD_ReadByte(0xff);
    retry++;
  }while(r1!=0xfe&&retry<500);
  if(retry>=500) return r1;
/************By Sword************/  
 //ԭ��Ϊretry<200��С��200��ʱ��̫��,�ܶ�Ͷ˵Ŀ���������
 //����������������������  
  retry=0;
  while(len--)
  {
  	C_WDOG(); //�忪�Ź� 
    *data=SD_ReadByte(0xff);
    data++;
  }
  SD_WriteByte(0xff);    //�������Ƕ�αָ��
  SD_WriteByte(0xff);
  OFF_SD_CS;
  SD_WriteByte(0xff);
  return 0;
}
/*********************************************************/
//function:sd_readsingleblock
//description:sd����ȡ�������ݣ�һ��Ϊ512�ֽڣ�
//input: data   ������ݵ������׵�ַ
//       sector �����ţ�ע��Ϊ���������ţ�����
/***********************************************************/
byte_sd sd_readsingleblock(byte_sd * data,dword_sd sector)
{
   byte_sd r1=0;
   word_sd retry=0;
   
   if(Flag_SDRdy == 0)
   {
     Wait_SDRdy(SD_LONG_Wait);
     OFF_SD_CS;
   }
   
 /************By Sword************/  
 //ԭ��retryΪbyte_sd��  
   do
   {
    r1=jc_sd_cmd(17,sector,0);
    retry++;
   } while(r1!=0&&retry<200);
   if(retry>=200) return r1;
 /************By Sword************/  
 //BUG����������ԭ����r1==200 ������ 
   retry=0;
   r1=sd_rdata(data,512);
   if(r1!=0) return r1;
   else return 0; 
} 
/*********************************************************/
//function:sd_writesingleblock
//description:sd��д��������
//input:Ԥ��ram����ָ�룬�����ţ�ע��Ϊ���������ţ�
/***********************************************************/
byte_sd sd_writesingleblock(byte_sd *data,dword_sd sector)
{
	byte_sd r1=0;
	dword_sd i=0;
  
  if(Flag_SDRdy == 0)
  {
    Wait_SDRdy(SD_LONG_Wait);
    OFF_SD_CS;
  }
  
  r1=jc_sd_cmd(24,sector,0);
  
  if(r1!=0) return r1;
  ON_SD_CS;
  SD_WriteByte(0xff);//�ȷ����������ݵȴ�sd��׼����
  SD_WriteByte(0xff);
  SD_WriteByte(0xff);
  SD_WriteByte(0xfe);//������ʼ����
  for(i=0;i<512;i++)
  {
    C_WDOG(); //�忪�Ź� 
    SD_WriteByte(*data++);
  } 
    
  SD_WriteByte(0xff);
  SD_WriteByte(0xff);
  r1=SD_ReadByte(0xff);
  if((r1&0x1f)!=0x05) 
  {
    OFF_SD_CS;
    return (r1 | 0);
  }
  else
  { //���������ݺ󲢲��ȴ�SD��д��,��������һ��д����ʱ�ٵȴ�
    Flag_SDRdy=0;
    return 0; 
  }
}

#endif    
