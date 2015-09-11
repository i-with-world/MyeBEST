#ifndef _JUDGE_WAY_H_
#define _JUDGE_WAY_H_
#include "../math_car.h"

#define BLACKTPLEN 250
#define VALIDLIMIT 10
#define Double_Edge_Limit 5

extern int8u_t ResureTip_Flag;
extern void Measure_Length();
extern int8u_t Black_Tip_Flag;
extern int8u_t Finish_RightAngle_Flag;
extern int8u_t Main_L_array[EAGEARRLEN];      //��CCD����ؼ�¼����
extern int8u_t Main_R_array[EAGEARRLEN];      //��CCD�ұ��ؼ�¼����
extern int8u_t Assi_L_array[EAGEARRLEN];      //����CCD����ؼ�¼����
extern int8u_t Assi_R_array[EAGEARRLEN];      //����CCD�ұ��ؼ�¼����
//extern int32s_t Acr_RightAngle_Len;                 //��ʼ��⶯��ֱ�Ǿ���
extern int8u_t Valid_M_R[EAGEARRLEN];             //��Ч�Ա�־����
extern int8u_t Valid_M_L[EAGEARRLEN];             //��Ч�Ա�־����
extern int8u_t Valid_A_R[EAGEARRLEN];             //��Ч�Ա�־����
extern int8u_t Valid_A_L[EAGEARRLEN];             //��Ч�Ա�־����

extern int8u_t Main_Edge_Counter;       //��CCD���ؼ���
extern int8u_t Assi_Edge_Counter;       //����CCD���ؼ���
extern int32s_t TipAfter_Len;



extern void Judge_MainCCD(CCD_GROUP*Catch_Edge);
extern void Judge_AssiCCD(CCD_GROUP*Catch_Edge);
extern void JudgeValid(const int8u_t* edgeArr,int8u_t* Valid);



#endif