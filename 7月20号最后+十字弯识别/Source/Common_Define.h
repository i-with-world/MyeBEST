#ifndef _COMMON_DEFINE_H_
#define _COMMON_DEFINE_H_


/*********************************CCD��ź궨��*********************************/
#define main_CCD      1          //��CCD id���
#define Assi_CCD      2          //����CCD id���
  

/*****************************��������*****************************************/
#define AUTOADJUST_EN 0             //����Ӧ����ʹ�� 1->ʹ�� 0->����
#define FUNC_MUSK 1          //����ѡ���־ 0->SD 1->����
#define OLED_EN 1           //OLEDʹ��λ 0->��ʹ�� 1->ʹ��
#define BLOOTH_EN 0         //����ʹ�ܱ�־��0->��ʹ�� 1->ʹ��
/**************************��������*********************************************/
#define TIME_PERIOD_NUM 5
#define CAR_MOTOR_PERIOD_LIMIT 20 

#define START_DELAY (int16u_t)1000    // ������ʱ,��λms
#define START_TIME  (int16u_t)1000    // �������̳���ʱ��,��λms

#define BLACK_POSITION_RATIO 0.05
/**************************�������ⲿ��������**********************************/
extern int SDerite_cnt;

#endif