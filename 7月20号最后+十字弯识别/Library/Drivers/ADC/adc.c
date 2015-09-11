/*******************************************************************************
* �ļ����ƣ�adc.c
* ��    ��: ADC��������,��û�н���Ӧ��������ΪAD���ܣ��ο��ͳ�ʦ����������
* ��    �ߣ������
* �ر���л���ͳ�ʦ��(����http://blog.chinaaet.com/jihceng0622)
* ʱ    �䣺2012��5��19��
*******************************************************************************/

#include "adc.h"


/*******************************************************************************
* �������ƣ�ADC_ClockCtrl
* ��ڲ�����adc    ADת����ѡ��
                    ADC0_BASE_PTR
                    ADC1_BASE_PTR
* ��    ��������ADʱ��Դ
*******************************************************************************/
void ADC_ClockCtrl(ADC_MemMapPtr adc)
{
  if(adc == ADC0_BASE_PTR)
  {
    SIM_SCGC6 |= SIM_SCGC6_ADC0_MASK;              // �� ADC0 ʱ�� 
  }
  else if(adc == ADC1_BASE_PTR)
  {
    SIM_SCGC3 |= SIM_SCGC3_ADC1_MASK;              // �� ADC1 ʱ��
  }  
}

/*******************************************************************************
* �������ƣ�ADC_SetCFG1
* ��ڲ�����adc    ADת����ѡ��
                    ADC0_BASE_PTR
                    ADC1_BASE_PTR
            adiv   ��Ƶϵ��
                    00 The divide ratio is 1 and the clock rate is input clock.
                    01 The divide ratio is 2 and the clock rate is (input clock)/2.
                    10 The divide ratio is 4 and the clock rate is (input clock)/4.
                    11 The divide ratio is 8 and the clock rate is (input clock)/8.
            bits   AD��������
                    00 When DIFF=0: It is single-ended  8-bit conversion; when DIFF=1, it is differential 9-bit conversionwith 2's complement output.
                    01 When DIFF=0: It is single-ended 12-bit conversion; when DIFF=1, it is differential 13-bit conversionwith 2's complement output.
                    10 When DIFF=0: It is single-ended 10-bit conversion; when DIFF=1, it is differential 11-bit conversionwith 2's complement output.
                    11 When DIFF=0: It is single-ended 16-bit conversion; when DIFF=1, it is differential 16-bit conversionwith 2's complement output
            adiclk ADʱ��Դѡ��
                    00 Bus clock.
                    01 Bus clock divided by 2.
                    10 Alternate clock (ALTCLK).
                    11 Asynchronous clock (ADACK)
* ��    ��������AD�Ĵ��� ADCx_CFG1
*******************************************************************************/
void ADC_SetCFG1(ADC_MemMapPtr adc, int8u_t adiv, int8u_t bits, int8u_t adiclk)
{   
  ADC_CFG1_REG(adc) |= ADC_CFG1_ADIV(adiv)            // ���÷�Ƶϵ��
                       + ADC_CFG1_ADLSMP_MASK         // ������ʱ��ģʽ
                       + ADC_CFG1_MODE(bits)          // ��������
                       + ADC_CFG1_ADICLK(adiclk);     // ADCʱ��Դѡ��
}

/*******************************************************************************
* �������ƣ�ADC_SetCFG2
* ��ڲ�����adc    ADת����ѡ��
                    ADC0_BASE_PTR
                    ADC1_BASE_PTR
            muxsel ADC Mux select
                    0:ADxxa channels are selected.
                    1:ADxxb channels are selected.
            adhsc  High speed configuration
                    0:Normal conversion sequence selected.
                    1:High speed conversion sequence selected (2 additional ADCK cycles to total conversion time).
            adlsts AD����ʱ��ѡ��
                    00 Default longest sample time (20 extra ADCK cycles; 24 ADCK cycles total).
                    01 12 extra ADCK cycles; 16 ADCK cycles total sample time.
                    10 6 extra ADCK cycles; 10 ADCK cycles total sample time.
                    11 2 extra ADCK cycles; 6 ADCK cycles total sample time.
* ��    ��������AD�Ĵ��� ADCx_CFG2
*******************************************************************************/
void ADC_SetCFG2(ADC_MemMapPtr adc, int8u_t muxsel, int8u_t adhsc, int8u_t adlsts)
{
  if(muxsel == 1)
  {
    ADC_CFG2_REG(adc) |= ADC_CFG2_MUXSEL_MASK;     // ѡ�� ADCxxb
  }
  else
  {
    ADC_CFG2_REG(adc) &= ~ADC_CFG2_MUXSEL_MASK;    // ѡ�� ADCxxa
  }
  ADC_CFG2_REG(adc) &= ~ADC_CFG2_ADACKEN_MASK;     // Asynchronous clock output disabled
  if(adhsc == 1)
  {
    ADC_CFG2_REG(adc) |= ADC_CFG2_ADHSC_MASK;      // ����ת������ѡ��
  }
  else
  {
    ADC_CFG2_REG(adc) &= ~ADC_CFG2_ADHSC_MASK;     // ����ת������ѡ��
  }
  ADC_CFG2_REG(adc) |= ADC_CFG2_ADLSTS(adlsts);    // AD����ʱ��ѡ��
}

/*******************************************************************************
* �������ƣ�ADC_SetSC
* ��ڲ�����adc     ADת����ѡ��
                     ADC0_BASE_PTR
                     ADC1_BASE_PTR
            avgs    Ӳ���˲���������ѡ��
                     00 4 samples averaged.
                     01 8 samples averaged.
                     10 16 samples averaged.
                     11 32 samples averaged.
            aien    AD���������ȡ��ʽ
                     0:��ѯ��ʽ
                     1:�жϷ�ʽ
            prio    �ж����ȼ���ֻ�� aien=1 ����Ч
* ��    ��������AD�Ĵ��� ADCx_SCn
*******************************************************************************/
void ADC_SetSC(ADC_MemMapPtr adc, int8u_t avgs, int8u_t aien, int8u_t prio)
{
  ADC_SC2_REG(adc) = 0;   // set default status:Software triger(a convertion is initated following a write to 
                          // SC1A)compare function disabled, DMA is disabled, default voltage reference pin(external pins VREFH and VREFL).
  ADC_SC3_REG(adc) |= ADC_SC3_ADCO_MASK            // ����ת��ģʽ
                      + ADC_SC3_AVGE_MASK          // Ӳ���˲�ʹ��
                      + ADC_SC3_AVGS(avgs);        // ����������������             
  if(aien == 1)
  {
    ADC_SC1_REG(adc,0)  |= ADC_SC1_AIEN_MASK;      // ��λ�ж�ʹ�ܼĴ���
    if(adc == ADC0_BASE_PTR)
    {
      EnableInt_Kinetis(57);
      SetIntPri_Kinetis(57,prio);                  // �����ж����ȼ�
    }
    else if(adc == ADC1_BASE_PTR)
    {
      EnableInt_Kinetis(58);
      SetIntPri_Kinetis(58,prio);                  // �����ж����ȼ�
    }
  }
  else
  {
    ADC_SC1_REG(adc,0)  &= ~ADC_SC1_AIEN_MASK;     // ��ѯ��ʽ
  }
}

/*******************************************************************************
* �������ƣ�ADC_readResult
* ��ڲ�����adc     ADת����ѡ��
                     ADC0_BASE_PTR
                     ADC1_BASE_PTR
            channel AD����ͨ����
                     00000 When DIFF=0, DADP0 is selected as input; when DIFF=1, DAD0 is selected as input.
                     00001 When DIFF=0, DADP1 is selected as input; when DIFF=1, DAD1 is selected as input.
                     00010 When DIFF=0, DADP2 is selected as input; when DIFF=1, DAD2 is selected as input.
                     00011 When DIFF=0, DADP3 is selected as input; when DIFF=1, DAD3 is selected as input.
                     00100 When DIFF=0, AD4 is selected as input; when DIFF=1, it is reserved.
                     00101 When DIFF=0, AD5 is selected as input; when DIFF=1, it is reserved.
                     00110 When DIFF=0, AD6 is selected as input; when DIFF=1, it is reserved.
                     00111 When DIFF=0, AD7 is selected as input; when DIFF=1, it is reserved.
                     01000 When DIFF=0, AD8 is selected as input; when DIFF=1, it is reserved.
                     01001 When DIFF=0, AD9 is selected as input; when DIFF=1, it is reserved.
                     01010 When DIFF=0, AD10 is selected as input; when DIFF=1, it is reserved.
                     01011 When DIFF=0, AD11 is selected as input; when DIFF=1, it is reserved.
                     01100 When DIFF=0, AD12 is selected as input; when DIFF=1, it is reserved.
                     01101 When DIFF=0, AD13 is selected as input; when DIFF=1, it is reserved.
                     01110 When DIFF=0, AD14 is selected as input; when DIFF=1, it is reserved.
                     01111 When DIFF=0, AD15 is selected as input; when DIFF=1, it is reserved.
                     10000 When DIFF=0, AD16 is selected as input; when DIFF=1, it is reserved.
                     10001 When DIFF=0, AD17 is selected as input; when DIFF=1, it is reserved.
                     10010 When DIFF=0, AD18 is selected as input; when DIFF=1, it is reserved.
                     10011 When DIFF=0, AD19 is selected as input; when DIFF=1, it is reserved.
                     10100 When DIFF=0, AD20 is selected as input; when DIFF=1, it is reserved.
                     10101 When DIFF=0, AD21 is selected as input; when DIFF=1, it is reserved.
                     10110 When DIFF=0, AD22 is selected as input; when DIFF=1, it is reserved.
                     10111 When DIFF=0, AD23 is selected as input; when DIFF=1, it is reserved.
                     11000 Reserved.
                     11001 Reserved.
                     11010 When DIFF=0, Temp sensor (single-ended) is selected as input; when DIFF=1, Temp sensor(differential) is selected as input.
                     11011 When DIFF=0, Bandgap (single-ended) is selected as input; when DIFF=1, Bandgap(differential) is selected as input.
                     11100 Reserved.
                     11101 When DIFF=0, VREFSH is selected as input; when DIFF=1, -VREFSH (differential) is selected asinput. 
                     11110 When DIFF=0, VREFSL is selected as input; when DIFF=1, it is reserved. Voltage referenceselected is determined by the REFSEL bits in the SC2 register.
                     11111 Module disabled.
            result  AD�������
* ��    ������ȡADת�������ͨ������ADͨ���ɿ�ʼAD����
*******************************************************************************/
void ADC_readResult(ADC_MemMapPtr adc,int8u_t channel, int16u_t * result)
{
  int32u_t readReg = 0;
  
  readReg = ADC_SC1_REG(adc,0);
  readReg &= ~ADC_SC1_ADCH_MASK;
  readReg |= ADC_SC1_ADCH(channel);
  ADC_SC1_REG(adc,0) = readReg;                      // ���� ADC ����ͨ��
  
  while(!(ADC_SC1_REG(adc,0)&ADC_SC1_COCO_MASK));    // �ȴ� ADC ת������
  *result = ADC_R_REG(adc,0);                        // ��ȡ ADC ����Ĵ�����COCO �Զ�����
}
