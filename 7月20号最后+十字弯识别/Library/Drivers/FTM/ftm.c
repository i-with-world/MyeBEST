/*****************************************************************
* �ļ����ƣ�ftm.c
* ��    ��: FTM(�๦�ܶ�ʱ��ģ��,����PWM��������벶׽������Ƚϡ�
            ��ʱ�жϡ�����Ӽ����������������������)�����ļ�ֻ��
            PWM������������������(�ο����Ľ�PWM��ʼ������)
* ��    �ߣ������
* �ر���л���ͳ�ʦ��(����http://blog.chinaaet.com/jihceng0622)
* ʱ    �䣺2012��5��21��
*****************************************************************/

#include "ftm.h"


/**********************************************************************************
* �������ƣ�FTM_initPWM
* ��ڲ�����ftm    FTMģ��
                    FTM0
                    FTM1
                    FTM2
            clks  FTMʱ��Դѡ��
                    00 No clock selected (This in effect disables the FTM counter.)
                    01 System clock(��Bus Clock)
                    10 Fixed frequency clock
                    11 External clock
            div   ʱ�ӷ�Ƶ��
                    000 Divide by 1
                    001 Divide by 2
                    010 Divide by 4
                    011 Divide by 8
                    100 Divide by 16
                    101 Divide by 32
                    110 Divide by 64
                    111 Divide by 128                 
* ��    ����PWM������ʼ��
**********************************************************************************/
void FTM_initPWM(FTM_MemMapPtr ftm, int8u_t clks, int8u_t div)
{
  if(ftm == FTM0)
  {
    SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;                       // ʹ��FTM0ʱ�� 
  }
  else if(ftm == FTM1)
  {
    SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;                       // ʹ��FTM1ʱ�� 
  }
  else if(ftm == FTM2)
  {
    SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                       // ʹ��FTM2ʱ�� 
  }
  FTM_MODE_REG(ftm) |= FTM_MODE_WPDIS_MASK;                 // ����д����
  FTM_SC_REG(ftm) &= ~FTM_SC_CLKS_MASK;                     // ��CLK[1:0]��Ϊ0:0 
  FTM_SC_REG(ftm) &= ~FTM_SC_PS_MASK;                       // ��PS[2:0]��Ϊ0:0:0
  FTM_QDCTRL_REG(ftm) &= ~FTM_QDCTRL_QUADEN_MASK;           // ��ֹ��������ģʽ
  FTM_OUTINIT_REG(ftm) = 0;                                 // ��ͨ����ʼ��ʱ�����Ϊ"0" 
  FTM_OUTMASK_REG(ftm) = 0x0FF;                             // ��������ͨ��
  
  FTM_SC_REG(ftm) = FTM_SC_CLKS(clks) + FTM_SC_PS(div);     // ��ֹ�жϣ�����������ʼ����Դclks����Ƶ��div
}

/**********************************************************************************
* �������ƣ�FTM_enablePWMCh
* ��ڲ�����ftm     FTMģ��
                     FTM0
                     FTM1
                     FTM2
            channel PWMͨ����
            st      ������������ʼֵ
            end     ��������ֵֹ(���� = end-st+1)
            dty     ����(ռ�ձ� = wid/(end+1-st))
* ��    ��������PWMͨ������,PWM��ʼ����
**********************************************************************************/
void FTM_enablePWMCh(FTM_MemMapPtr ftm, int8u_t channel, int16u_t st, int16u_t end, int16u_t dty)
{
  FTM_CnSC_REG(ftm,channel) &= ~FTM_CnSC_ELSA_MASK;       // ELSA=0��ELSB=1������룬�ȸߺ��
  FTM_CnSC_REG(ftm,channel) |= FTM_CnSC_ELSB_MASK;  
  FTM_CnSC_REG(ftm,channel) |= FTM_CnSC_MSB_MASK;         // MSB=1��ģʽѡ����ض���
  
  FTM_OUTMASK_REG(ftm) &= ~((int32u_t)(1)<<channel);      // �����ǰͨ������
  FTM_CNTIN_REG(ftm) = st;                                // ���ü�����ʼֵ
  FTM_MOD_REG(ftm) = end;                                 // ���ü�����ֵֹ
  FTM_CnV_REG(ftm,channel) = dty;                         // ���õ�ƽ��תֵ
  FTM_CNT_REG(ftm) = 0;                                   // ���������

  FTM_MODE_REG(ftm) &= ~FTM_MODE_FTMEN_MASK;              //FTMʹ��
}

/**********************************************************************************
* �������ƣ�FTM_setPWMDty
* ��ڲ�����ftm     FTMģ��
                     FTM0
                     FTM1
                     FTM2
            channel PWMͨ����
            dty     ����(ռ�ձ� = (wid+1)/(end+1-st))
* ��    ��������PWMռ�ձ�
**********************************************************************************/
void FTM_setPWMDty(FTM_MemMapPtr ftm, int8u_t channel, int16u_t dty)
{
  FTM_CnV_REG(ftm,channel) = dty;                         // ���õ�ƽ��תֵ  
}

/**********************************************************************************
* �������ƣ�FTM_initQUAD
* ��ڲ�����ftm    FTMģ��
                     FTM0
                     FTM1
                     FTM2
            mod    ��������ģʽ
                    0 Phase A and phase B encoding mode.
                    1 Count and direction encoding mode.
            st     ������������ʼֵ
            end    ��������ֵֹ
* ��    �����������빦������
**********************************************************************************/
void FTM_initQUAD(FTM_MemMapPtr ftm,int8u_t mod, int16s_t st, int16u_t end)
{
  if(ftm == FTM1)
  {
    SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;                     // ʹ��FTM1ʱ�� 
  }
  else if(ftm == FTM2)
  {
    SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                     // ʹ��FTM2ʱ�� 
  }
  FTM_MODE_REG(ftm) |= FTM_MODE_WPDIS_MASK;               // ����д����
  
  if(mod == 1)
  {
    FTM_QDCTRL_REG(ftm) |= FTM_QDCTRL_QUADMODE_MASK;      // AB��ͬʱ����ģʽ
  }
  else
  {
    FTM_QDCTRL_REG(ftm) &= ~FTM_QDCTRL_QUADMODE_MASK;     // ����ͷ�������ģʽ
  }
  FTM_CNTIN_REG(ftm) = st;                                // ���ü�����ʼֵ
  FTM_MOD_REG(ftm) = end;                                 // ���ü�����ֵֹ
  FTM_QDCTRL_REG(ftm) |= FTM_QDCTRL_QUADEN_MASK;          // ����FTM��������ģʽ
  FTM_CNT_REG(ftm) = 0;                                   // ���������
}

/*******************************************************************************
* �������ƣ�FTM_enableQUAD
* ��ڲ�����ftm     FTMģ��
                     FTM0
                     FTM1
                     FTM2
* ��    �����������뿪ʼ����
*******************************************************************************/
void FTM_enableQUAD(FTM_MemMapPtr ftm)
{
  FTM_MODE_REG(ftm) |= FTM_MODE_FTMEN_MASK;              // FTM2EN=1	
}

/*******************************************************************************
* �������ƣ�FTM_setPWMDty
* ��ڲ�����ftm    FTMģ��
                     FTM0
                     FTM1
                     FTM2
            val    ����ֵ
* ��    ������ȡ����ֵ������������Ĵ���
*******************************************************************************/
void FTM_readQUADValue(FTM_MemMapPtr ftm, int16s_t * val)
{
  *val = FTM_CNT_REG(ftm);                                 // ��ȡ����ֵ
  FTM_CNT_REG(ftm)=0;                                    // �����Ĵ�������
}