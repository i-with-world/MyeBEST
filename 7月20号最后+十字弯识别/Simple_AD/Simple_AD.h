#ifndef _SIMPLE_AD_H_
#define _SIMPLE_AD_H_

#define Weight_max 1400                            //��ת�����Ϊ4294
#define Weight_min -1400                          //��ת��С��Ϊ-4294
#define Autoadjust_min -10                         //����Ӧ��С��ֵ
#define Autoadjust_max 10                          //����Ӧ���ֵ
#define ASSI_Autoadjust_min -20                         //����CCD����Ӧ��С��ֵ
#define ASSI_Autoadjust_max 20                         //����CCD����Ӧ��С��ֵ

#define HALFPATHLGH 35                          //����������
#define S_HALFPATHLGH 35
#define GINGLELINE 14                            //�������
#define SINGLELINE 14                             //����CCD�������
typedef struct
{
  int CCD_id;                     //CCD���ͨ��������ͬCCD�ĳ�����
  int16u_t CCD_AD_Value[128];
  int8s_t CCD_k_Value[116];
  int8u_t ccd_value[128];
  int8u_t Black_TO_White[4];
  int8u_t White_TO_Black[4];
  int8u_t Black_TO_White_His[6];
  int8u_t White_TO_Black_his[6]; 
  int16s_t Black_Position;
  int16s_t Black_Position_Last;
  int8s_t Groove_limit;
  int8s_t Heave_limit;
}CCD_GROUP;

//main_CCD�����Ŷ���
#define TSL1401_0_SI(x)   (GPIO_SetPinStat(PORTD,1,(x)))
#define TSL1401_0_CLK(x)  (GPIO_SetPinStat(PORTD,3,(x)))
//Assi_CCD�����Ŷ���
#define TSL1401_1_SI(x)   (GPIO_SetPinStat(PORTE,6,(x)))
#define TSL1401_1_CLK(x)  (GPIO_SetPinStat(PORTE,17,(x)))

#define baizhi 40                 //��ɫ�װ�ķ�ֵ
#define baizhi_Assi 70                 //��ɫ�װ�ķ�ֵ
#define Black_Tid_Bend_Min 15     //�����ֱ�Ǻ��������ж�
#define Black_Tid_Bend_Max 30     //�����ֱ�Ǻ��������ж�

//�����ⲿ����
extern CCD_GROUP MAIN_CCD;
extern CCD_GROUP ASSI_CCD;
extern int16u_t Sum_Speed;
extern int8u_t WholeBlack_Flag;
extern int16s_t Track_Slope;
extern int8u_t Double_Edge_Flag;      //˫�ؼ�����־λ
extern int16u_t Double_Edge_Num;      //˫�ؼ�������
extern int16u_t Single_Edge_Num;     //���ظ�������
extern int8u_t Black_Tid_Bend_Flag;
extern int16u_t Bend_L_Num;


//�����ⲿ����
extern void Deal_Black(CCD_GROUP* ccd_group);
extern void TSL1401_GetLine(CCD_GROUP* ccd_group);
extern void TSL1401_GetASSILine(CCD_GROUP* ccd_group);


#endif