#include "AllHeaders.h"

/******************************************************************************
* ��������: Init_7290
* ��������: ��ʼ��7290
******************************************************************************/
void Init_7290(void)
{
  I2C_Start();              
  I2C_WriteByte(SLVADDR_7290);
  I2C_WaitAck(1);

  I2C_WriteByte(0x0D);
  I2C_WaitAck(1);

  I2C_WriteByte(0x03);
  I2C_WaitAck(1);

  I2C_Stop();
  Delay_I2C();
  
}

/******************************************************************************
* ��������: Readkey_7290
* ��������: ��ȡ����ֵ.
* ���ز���: ������ֵ
******************************************************************************/
int8u_t Readkey_7290(void)
{
    int8u_t key;

    I2C_Start();
    I2C_WriteByte(SLVADDR_7290);    /* д�ӻ���ַ       */
    I2C_WaitAck(1);

    I2C_WriteByte(SUB_KEY_7290);    /* д��ȡ��������ַ */
    I2C_WaitAck(1);

    I2C_Start();
    I2C_WriteByte(SLVADDR_7290+0x01);
    I2C_WaitAck(1);

    key = I2C_ReadByte();

    I2C_Stop();
    Delay_I2C();
    
    return key;
}

