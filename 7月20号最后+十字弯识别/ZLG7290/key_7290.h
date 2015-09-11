/******************************************************************************

* key_7290.h

* Zlg7290�ײ�����ͷ�ļ�. ֧�ְ�����ֵ��ȡ, �����������ʾ/���, ������ֵ��ʾ,
* �Լ������趨����.

* ���ļ��еĲ���������Ӳ��ƽ̨���
* ����оƬ : MK10N512VMD100 or MK60N512VMD100
* ����ƽ̨ : CodeWarrior 10.1 or IAR For ARM 6.30
* ����˵�� : SDA - PC10, SCL - PC8, INT - PC6

* ����     : ���Ľ� @ SDU  
* �汾     : Ver 1.01
* ����ʱ�� : 2013 - 04 - 19

******************************************************************************/

#ifndef _KEY_7290_H_
#define _KEY_7290_H_

/******************************************************************************
*                               Ӳ��ƽ̨�������
******************************************************************************/
/* ����Ӳ��ƽ̨��ص�ͷ�ļ� */
#include "KinetisConfig.h" 
#include "AllHeaders.h"

/* ��Ƭ��������Ĵ������� */
#define  PORT_SCL_7290     PTE_BASE_PTR
#define  PORT_SDA_7290     PTE_BASE_PTR
#define  PORT_INT_7290     PTE_BASE_PTR

#define  PCR_SCL_7290      PORTE_PCR2
#define  PCR_SDA_7290      PORTE_PCR3
#define  PCR_INT_7290      PORTE_PCR0

#define  PIN_SCL_7290      (1 << 2)     
#define  PIN_SDA_7290      (1 << 3)
#define  PIN_INT_7290      (1 << 0)

/* ��ʼ���������� */
#define  INIT_SCL_7290()                                                      \
         (PCR_SCL_7290 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK)
#define  INIT_SDA_7290()                                                      \
         (PCR_SDA_7290 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK)
#define  INIT_INT_7290()                                                      \
         (PCR_INT_7290 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK)

/* ���ݲ������� */
#define  SET_SCL_HIGH_7290() (PORT_SCL_7290->PSOR |= PIN_SCL_7290)
#define  SET_SCL_LOW_7290()  (PORT_SCL_7290->PCOR |= PIN_SCL_7290)

#define  SET_SDA_HIGH_7290() (PORT_SDA_7290->PSOR |= PIN_SDA_7290)
#define  SET_SDA_LOW_7290()  (PORT_SDA_7290->PCOR |= PIN_SDA_7290)
#define  READ_SDA_7290()     (PORT_SDA_7290->PDIR & PIN_SDA_7290)

#define  READ_INT_7290()     (PORT_INT_7290->PDIR & PIN_INT_7290)

/* ����������� */
#define  SET_SCL_OUT_7290()  (PORT_SCL_7290->PDDR |= PIN_SCL_7290)
#define  SET_SCL_IN_7290()   (PORT_SCL_7290->PDDR &= ~PIN_SCL_7290)

#define  SET_SDA_OUT_7290()  (PORT_SDA_7290->PDDR |= PIN_SDA_7290)
#define  SET_SDA_IN_7290()   (PORT_SDA_7290->PDDR &= ~PIN_SDA_7290)

#define  SET_INT_IN_7290()   (PORT_INT_7290->PDDR &= ~PIN_INT_7290)

/* ��ʱʱ�䶨��(CPUԽ��, ����ֵԽ��) */
#define  SHORT_DELAY_TIME_7290     90   /* ����ʱʱ�䳣�� */
#define  LONG_DELAY_TIME_7290      900  /* ����ʱʱ�䳣�� */

/*�����ж϶���*/
#define EN_KeyInt()  (PORTE_PCR0 |= PORT_PCR_IRQC(0xA))   /*�������ж� 0x8:�͵�ƽ��0x9�����ء�0xA�½��ء�0xB�ش�����0xC�ߵ�ƽ*/
#define DIS_KeyInt() (PORTE_PCR0 &= ~PORT_PCR_IRQC_MASK)  /*�������ж�*/
#define CLR_UpInt()    (PORTE_ISFR = 0xFFFFFFFF)           /*���������жϵ��жϱ�־*/


/******************************************************************************
*                                   ͨ������
******************************************************************************/
/* ��ַ������� */
#define  SLVADDR_7290          0x70      /* Zlg7290�ӻ���ַ      */
#define  SUB_KEY_7290          0x01      /* ����ֵ�Ĵ����ӵ�ַ   */
#define  SUB_DP_RAM_7290       0x10      /* 7290��ʾ������׵�ַ */
#define  SUB_FLASH_ONOFF_7290  0x0C      /* ��˸�Ĵ����ӵ�ַ     */
#define  SUB_CMDBUF_7290       0x07      /* ����Ĵ�����ַ       */

/* ��������ĸ��ʾ���� */
#define  _DISP_7290__          0x02      /* ����ܶ�ѡ�ź� '-'   */
#define  _DISP_7290_A          0xEE      /* ����ܶ�ѡ�ź� 'A'   */
#define  _DISP_7290_b          0x3E      /* ����ܶ�ѡ�ź� 'b'   */             
#define  _DISP_7290_C          0x9C      /* ����ܶ�ѡ�ź� 'C'   */
#define  _DISP_7290_c          0x1A      /* ����ܶ�ѡ�ź� 'c'   */
#define  _DISP_7290_d          0x7A      /* ����ܶ�ѡ�ź� 'd'   */
#define  _DISP_7290_E          0x9E      /* ����ܶ�ѡ�ź� 'E'   */
#define  _DISP_7290_F          0x8E      /* ����ܶ�ѡ�ź� 'F'   */
#define  _DISP_7290_G          0xBC      /* ����ܶ�ѡ�ź� 'G'   */
#define  _DISP_7290_H          0x6E      /* ����ܶ�ѡ�ź� 'H'   */
#define  _DISP_7290_J          0x70      /* ����ܶ�ѡ�ź� 'J'   */
#define  _DISP_7290_L          0x1C      /* ����ܶ�ѡ�ź� 'L'   */
#define  _DISP_7290_n          0x2A      /* ����ܶ�ѡ�ź� 'n'   */
#define  _DISP_7290_o          0x3A      /* ����ܶ�ѡ�ź� 'o'   */
#define  _DISP_7290_p          0xCE      /* ����ܶ�ѡ�ź� 'p'   */
#define  _DISP_7290_q          0xE6      /* ����ܶ�ѡ�ź� 'q'   */



/******************************************************************************
*                                   ��������
******************************************************************************/
/* ����Ƿ��а�������(��0��ʾ�м�����, =0��ʾû�а�������) */
#define  TEST_KEY_7290() (!READ_INT_7290())  



/******************************************************************************
*                                   ��������
******************************************************************************/                  
/* 7290��ʼ�� */
extern void Init_7290(void);

/* �����������ʾ */
extern void DisplayOne_7290(unsigned char pos,unsigned char c);

/* ������ʾ */
extern void DisplayValue_7290(unsigned char name,int value);

/* �����ʾ */
extern void ClearOne_7290(unsigned char pos);

/* ��ȡ������ֵ */
extern unsigned char Readkey_7290(void);
extern unsigned char GetKeyValue(void);

extern void SetParam_7290( unsigned char name[], 
                           unsigned int  value,
                           unsigned int  row,
                           int16u_t* setparam );
extern char SetFloatParam_7290( unsigned char name[], 
                                float  tempvalue,
                                unsigned int  row,
                                float* setparam);

extern unsigned char KeyConvert(unsigned char kkey);

#endif 
