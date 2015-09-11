#include "AllHeaders.h"

int16s_t Gyro_X,Gyro_Z;
int16s_t Gyro_Y;
// �������̷�Χ
void SetScaleRange(void)
{
    int8u_t byData;

    // Linda
    int8u_t Itg3200Wr;


    Itg3200Wr = ITG3200_IIC_ADDR << 1;
    Itg3200Wr = Itg3200Wr | 0x0; // wirte : 0

    // Bit4 Bit3 ����11ʱ��ѡ��2000��/�������
    byData = 0x18;
    Single_Write(Itg3200Wr, REG_DLPF_FS, byData);
}

//��������ITG3200��ֵ
void Read_ITG3200D(void)
{
   int8u_t BUF[6];
  
   BUF[0]=Single_Read(ITG3200_IIC_ADDR,REG_GYRO_XOUT_L);
   //Delay_I2C();
   BUF[1]=Single_Read(ITG3200_IIC_ADDR,REG_GYRO_XOUT_H);
   //Delay_I2C();
   Gyro_X=(BUF[1]<<8)|BUF[0];
   Gyro_X*=-0.06;
   
   //�������¼����Խ�ʡʱ�䣬���ĸ����ĸ�
   /*BUF[2]=Single_Read(ITG3200_IIC_ADDR,REG_GYRO_YOUT_L);
   //Delay_I2C();
   BUF[3]=Single_Read(ITG3200_IIC_ADDR,REG_GYRO_YOUT_H);
   //Delay_I2C();
   Gyro_Y=(BUF[3]<<8)|BUF[2];
   Gyro_Y*=0.07;
   BUF[4]=Single_Read(ITG3200_IIC_ADDR,REG_GYRO_ZOUT_L);
   //Delayms(5);
   BUF[5]=Single_Read(ITG3200_IIC_ADDR,REG_GYRO_ZOUT_H);
   //Delayms(5);
   Gyro_Z=(BUF[5]<<8)|BUF[4];
   Gyro_Z*=0.07;
   */
}

void Read_ITG3200D_Y(void)
{
   int8u_t BUF[6];
  
   BUF[0]=Single_Read(ITG3200_IIC_ADDR,REG_GYRO_ZOUT_L);
   //Delay_I2C();
   BUF[1]=Single_Read(ITG3200_IIC_ADDR,REG_GYRO_ZOUT_H);
   //Delay_I2C();
   Gyro_Y=(BUF[1]<<8)|BUF[0];
   Gyro_Y/=32;    //��5λ��32
   //�������¼����Խ�ʡʱ�䣬���ĸ����ĸ�
   /*BUF[2]=Single_Read(ITG3200_IIC_ADDR,REG_GYRO_YOUT_L);
   //Delay_I2C();
   BUF[3]=Single_Read(ITG3200_IIC_ADDR,REG_GYRO_YOUT_H);
   //Delay_I2C();
   Gyro_Y=(BUF[3]<<8)|BUF[2];
   Gyro_Y*=0.07;
   BUF[4]=Single_Read(ITG3200_IIC_ADDR,REG_GYRO_ZOUT_L);
   //Delayms(5);
   BUF[5]=Single_Read(ITG3200_IIC_ADDR,REG_GYRO_ZOUT_H);
   //Delayms(5);
   Gyro_Z=(BUF[5]<<8)|BUF[4];
   Gyro_Z*=0.07;
   */
}