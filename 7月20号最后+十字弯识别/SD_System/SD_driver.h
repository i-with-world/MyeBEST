/******************************************************************************

* SD_driver.h

* ������SD��������ص�Ӳ��ƽ̨����
  ����SD���ײ�����������������
  
* ��һ���ߣ�  �ͳ�   (���Ľ�����ͷ)
  �������������Ľ� (����������ͷ)
* �汾��V1.15 (��V1.13��v1.14�������,��ʹ��˫����ʱ��V1.10֮��İ汾�����)
* �汾����ʱ�䣺2012��1��30��
  
* ����оƬ��MK10N512VMD100
  ����ƽ̨��CodeWarrior 10.1

* (!!!����Ӳ��ƽ̨������޸�!!!)

******************************************************************************/

#ifndef _SD_PLATFINTERFACE_H_
#define _SD_PLATFINTERFACE_H_

#ifdef EN_SD

/**************************Ӳ�����ö���**************************/           
/* !!!Ӳ��ƽ̨���ͷ�ļ�!!! */
#include "./KinetisConfig.h"

           

/*���Ź���������*/
#define EN_WDOG_SD    1   /* ����д��ʱ�Ƿ�ˢ��,=1��ʾд��ʱ����ˢ������ */

#ifndef C_WDOG   
  #if EN_WDOG_SD != 0
    #define C_WDOG() DisableInterrupts();WDOG_REFRESH=0xA602;WDOG_REFRESH=0xB480;if(sd_initover) EnableInterrupts();
  #else
    #define C_WDOG() ;
  #endif
#endif


/*�ײ��������*/
#define DELAY_WaitRead_SD  5   /* ��ȡ1Byte����ʱ���е���ʱ(��λ10��nop) */
/* ����ʱʱ��ĳ����Ӵ�����������Ӳ����·�ȶ��Զ���,����K10,����ʹSPIʱ�ӳ���10M,����ҪԼ2us����ʱ */



/*IO��������*/
#define  ON_SD_CS       GPIOE_PCOR |= (1<<5);      /*����CS(ע��0Ϊѡͨ)*/
#define  OFF_SD_CS      GPIOE_PSOR |= (1<<5);      /*�ر�CS(ע��0Ϊѡͨ)*/



/**************************�������Ͷ���**************************/
typedef unsigned char  byte_sd;      /*�����ֽ��ͱ���*/
typedef unsigned short word_sd;      /*�������ͱ���*/
typedef unsigned long  dword_sd;     /*����˫���ͱ���*/



/**************************API��������**************************/
extern void CloseSD(void);
extern void SetSD_Low(void);
extern void SetSD_High(void);
extern void SD_driver_Init(void);
extern void Wait_SDRdy(dword_sd Limit);

/*sd����*/
extern byte_sd  sd_rdata(byte_sd * data,word_sd len);
extern byte_sd jc_sd_cmd(byte_sd cmd,dword_sd arg,byte_sd crc);
extern byte_sd  sd_readsingleblock(byte_sd * data,dword_sd sector);
extern byte_sd  sd_writesingleblock(byte_sd * data, dword_sd sector) ;
extern byte_sd  sd_init(void) ;

#endif

#endif
