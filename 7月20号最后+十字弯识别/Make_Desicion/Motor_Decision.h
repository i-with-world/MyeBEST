#ifndef _MOTOR_DECISION_H_
#define _MOTOR_DECISION_H_

//#define SetMotorForward(x) FTM_setPWMDty(FTM0, 4, x)
//#define SetMotorBack(x) FTM_setPWMDty(FTM0, 4, x)
#define RFOWARD_DEAD_PWM 13         //�ҵ��ǰ����������
#define LFOWARD_DEAD_PWM 15         //����ǰ��������
#define RBACKWARD_DEAD_PWM 14         //�ҵ������������
#define LBACKWARD_DEAD_PWM 14         //��������������

#define MOTOR_SPEED_SET_MAX	 1400                //�Ƕȿ����ٶ�����
#define MOTOR_SPEED_SET_MIN	-1400                //�Ƕȿ����ٶ�����

# define MAX_MotorOut 500    /*���PWM�����ֵ*/
# define MIN_MotorOut (-500) /*���PWM����Сֵ*/

extern int16u_t Forward_Dty;

extern void L_SetPwm(int16s_t l_pwm);
extern void R_SetPwm(int16s_t r_pwm);
extern void SetMotorPWM(int16s_t motor_l,int16s_t motor_r);




#endif