/******************************************************************************

* key_7290.c

* Zlg7290�ײ�����Դ�ļ�. ֧�ְ�����ֵ��ȡ, �����������ʾ/���, ������ֵ��ʾ,
* �Լ������趨����.

* ����     : ���Ľ� @ SDU  
* �汾     : Ver 1.01
* ����ʱ�� : 2013 - 04 - 19

******************************************************************************/

#include "key_7290.h"

/******************************************************************************
*                                 �ڲ���������
******************************************************************************/
/* ����-�������ʾ�� */
static const unsigned char DigTab_7290[10]=
{                     
    0xFC, 0x60, 0xDA, 0xF2, 0x66, 0xB6, 0xBE, 0xE0, 0xFE, 0xF6
};


/******************************************************************************
* ��������: LongDelay_7290
* ��������: 7290��ʱ����ʱ����.
******************************************************************************/
static void LongDelay_7290(void)
{
    volatile unsigned int i, j;
    
    for(j = 120; j > 0; j--)
    {
        for(i = LONG_DELAY_TIME_7290; i > 0; i--);
    }
}
/******************************************************************************
* ��������: ShortDelay_7290
* ��������: 7290��ʱ����ʱ����.
******************************************************************************/
static void ShortDelay_7290(void)
{ 
    volatile int Num = SHORT_DELAY_TIME_7290;
    volatile int i;
  
    while(Num--)
    {
        for(i = 0; i < 2; i++);
    }
}

/******************************************************************************
* ��������: StartI2C_7290
* ��������: I2C�����ź�.
******************************************************************************/
static void StartI2C_7290(void)
{
    SET_SCL_OUT_7290();
    SET_SDA_OUT_7290();
    
    SET_SDA_HIGH_7290();  
    ShortDelay_7290();
  
    SET_SCL_HIGH_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
  
    SET_SDA_LOW_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
}
/******************************************************************************
* ��������: StopI2C_7290
* ��������: I2C�����ź�.
******************************************************************************/
static void StopI2C_7290(void)
{
    SET_SCL_OUT_7290();
    SET_SDA_OUT_7290();
    
    SET_SDA_LOW_7290();
    ShortDelay_7290();
  
    SET_SCL_HIGH_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
  
    SET_SDA_HIGH_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
}

/******************************************************************************
* ��������: WackI2C_7290
* ��������: ����I2CӦ���ź�.
******************************************************************************/
static void WackI2C_7290(void)
{ 
    SET_SCL_OUT_7290();
    SET_SDA_OUT_7290();
    SET_SDA_HIGH_7290();
    ShortDelay_7290();
  
    SET_SCL_LOW_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
  
    SET_SCL_HIGH_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
  
    SET_SCL_LOW_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
}

/******************************************************************************
* ��������: WriteByteI2C_7290
* ��������: ͨ��I2C����һ�ֽ�����.
* ��ڲ���: dat  ����������
******************************************************************************/
static void WriteByteI2C_7290(unsigned char dat)
{
    unsigned char i = 8, temp;
    
    SET_SCL_OUT_7290();
    SET_SDA_OUT_7290();
    
    SET_SCL_LOW_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();

    while(i--)
    {     
      temp = dat & 0x80;
      if(temp == 0)
      {
          SET_SDA_LOW_7290();
      }
      else
      {
          SET_SDA_HIGH_7290();
      }
      ShortDelay_7290();ShortDelay_7290();
      ShortDelay_7290();ShortDelay_7290();

      dat <<= 1;

      SET_SCL_HIGH_7290();
      ShortDelay_7290();ShortDelay_7290();
      ShortDelay_7290();ShortDelay_7290();

      SET_SCL_LOW_7290();
      ShortDelay_7290();ShortDelay_7290();
      ShortDelay_7290();ShortDelay_7290();
    }

    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
    ShortDelay_7290();ShortDelay_7290();
}
/******************************************************************************
* ��������: ReadByteI2C_7290
* ��������: ͨ��I2C��ȡһ�ֽ�����.
* ���ز���: ��ȡ���
******************************************************************************/
static unsigned char ReadByteI2C_7290(void)
{
    unsigned char dat = 0x00;
    unsigned char i   = 8;
    
    while(i--)
    { 
        SET_SCL_OUT_7290();
        SET_SDA_OUT_7290();
        
        SET_SDA_HIGH_7290();
        ShortDelay_7290();ShortDelay_7290();
        ShortDelay_7290();ShortDelay_7290();
        
        SET_SCL_OUT_7290();
        SET_SDA_IN_7290();  /* SDA�ķ���ı�:SCL�����SDA���� */
        
        dat <<= 1;
        SET_SCL_LOW_7290();
        ShortDelay_7290();ShortDelay_7290();
        ShortDelay_7290();ShortDelay_7290();

        SET_SCL_HIGH_7290();
        ShortDelay_7290();ShortDelay_7290();
        ShortDelay_7290();ShortDelay_7290();

        if(READ_SDA_7290() != 0)
        {
            dat |= 0x01;
        }
    }

    SET_SCL_OUT_7290();
    SET_SDA_OUT_7290();
    SET_SCL_LOW_7290();
    SET_SDA_HIGH_7290();
    
    return dat;
}

/******************************************************************************
* ��������: Init_7290
* ��������: ��ʼ��7290
******************************************************************************/
void Init_7290(void)
{
  INIT_SCL_7290();
  INIT_SDA_7290();
  INIT_INT_7290();
  SET_INT_IN_7290();
  
  StartI2C_7290();              
  WriteByteI2C_7290(SLVADDR_7290);
  WackI2C_7290();

  WriteByteI2C_7290(0x0D);
  WackI2C_7290();

  WriteByteI2C_7290(0x03);
  WackI2C_7290();

  StopI2C_7290();
  LongDelay_7290();
}

/******************************************************************************
* ��������: DisplayOne_7290
* ��������: ʹĳһλ�������ʾ�ַ�
* ��ڲ���: pos ��ʾҪ��ʾ��һλ�����(�����Ϊ��0λ)
*           c   Ҫ��ʾ���ַ�(ASCII��)
******************************************************************************/
void DisplayOne_7290(unsigned char pos,unsigned char c)
{
    unsigned char dis; 
  
    dis = 0xFF;    /* �ַ�����(�ǿ���ʾ�ַ�)ʱ,�������ж���ʾ���� */
  
    if(c >= '0' && c <= '9')  dis = DigTab_7290[c-'0']; 
    else if(c == '-')         dis = _DISP_7290__;
    else if(c == 'A')         dis = _DISP_7290_A;
    else if(c == 'b')         dis = _DISP_7290_b;
    else if(c == 'C')         dis = _DISP_7290_C;
    else if(c == 'c')         dis = _DISP_7290_c;
    else if(c == 'd')         dis = _DISP_7290_d;
    else if(c == 'E')         dis = _DISP_7290_E;            
    else if(c == 'F')         dis = _DISP_7290_F;
    else if(c == 'G')         dis = _DISP_7290_G;
    else if(c == 'H')         dis = _DISP_7290_H;
    else if(c == 'J')         dis = _DISP_7290_J;
    else if(c == 'L')         dis = _DISP_7290_L;
    else if(c == 'n')         dis = _DISP_7290_n;
    else if(c == 'o')         dis = _DISP_7290_o;
    else if(c == 'p')         dis = _DISP_7290_p;
    else if(c == 'q')         dis = _DISP_7290_q;
  
    StartI2C_7290();
    WriteByteI2C_7290(SLVADDR_7290);
    WackI2C_7290();

    WriteByteI2C_7290(SUB_DP_RAM_7290 + pos);
    WackI2C_7290();

    WriteByteI2C_7290(dis);
    WackI2C_7290();

    StopI2C_7290();
    LongDelay_7290();
}
/******************************************************************************
* ��������: DisplayValue_7290
* ��������: ��ʾһ������(���е�0λ,������ߵ�һλ��ʾ��������,�޶�Ϊһ��ASCII
*           �ַ�;��3λΪ��ֵ,��Χ-99~999).
* ��ڲ���: name  ��������(һ��ASCII�ַ�)
*           value ������ֵ(-99~999)
******************************************************************************/
void DisplayValue_7290(unsigned char name,int value)
{
    int uvalue;
  
    DisplayOne_7290(0, name);
    if(value < 0)
    {   /* ��ʾ���� */
        uvalue = -value;
        DisplayOne_7290(1, '-');
        DisplayOne_7290(2, '0'+uvalue/10);
        DisplayOne_7290(3, '0'+uvalue%10);
    }
    else
    {   /* ��ʾ���� */
        DisplayOne_7290(1, '0'+value/100);
        DisplayOne_7290(2, '0'+(value/10)%10);
        DisplayOne_7290(3, '0'+value%10);
    }
}
/******************************************************************************
* ��������: ClearOne_7290
* ��������: ���ĳһλ����ܵ���ʾ.
* ��ڲ���: pos ��ʾҪ�����һλ�����(�����Ϊ��0λ)
******************************************************************************/
void ClearOne_7290(unsigned char pos) 
{
    StartI2C_7290();
    WriteByteI2C_7290(SLVADDR_7290);
    WackI2C_7290();

    WriteByteI2C_7290(SUB_DP_RAM_7290 + pos);
    WackI2C_7290();

    WriteByteI2C_7290(0);
    WackI2C_7290();

    StopI2C_7290();
    LongDelay_7290();
}
/*!
**Name: KeyConvert
**Description: ��ֵת��
**Notes: 
!
unsigned char KeyConvert(unsigned char kkey)
{
  unsigned char keyvalue;
    
  switch ( kkey )
  {
    case  17 :
      keyvalue = 1;
      break;
    case  25 :
      keyvalue = 2;
      break;      
    case  9  :
      keyvalue = 3;
      break;
    case  18 :
      keyvalue = 4;
      break; 
    case  26 :
      keyvalue = 5;
      break;
    case  10 :
      keyvalue = 6;
      break;      
    case  19 :
      keyvalue = 7;
      break;
    case  27 :
      keyvalue = 8;
      break;  
    case  11 :
      keyvalue = 9;
      break;
    case  20 :
      keyvalue = 10;      //N
      break;      
    case  28 :
      keyvalue = 0;
      break;
    case  12 :
      keyvalue = 11;      //Y
      break;   
  default:
    break;
  }
  
  return keyvalue;
}
*/
/******************************************************************************
* ��������: Readkey_7290
* ��������: ��ȡ����ֵ.
* ���ز���: ������ֵ
******************************************************************************/
unsigned char Readkey_7290(void)
{
    unsigned char key;

    StartI2C_7290();
    WriteByteI2C_7290(SLVADDR_7290);    /* д�ӻ���ַ       */
    WackI2C_7290();

    WriteByteI2C_7290(SUB_KEY_7290);    /* д��ȡ��������ַ */
    WackI2C_7290();

    StartI2C_7290();
    WriteByteI2C_7290(SLVADDR_7290+0x01);
    WackI2C_7290();

    key = ReadByteI2C_7290();

    StopI2C_7290();
    LongDelay_7290();

    return key;
}

/*!
**Name: KeyConvert
**Description: ��ֵת��
**Notes: 
!*/
unsigned char GetKeyValue(void)
{
  unsigned char key;
  key = Readkey_7290();
  switch(key)
  {
  case 0x11:
    return 1;
  case 0x09:
    return 2;
  case 0x01:
    return 3;
  case 0x12:
    return 4;
  case 0x0A:
    return 5;
  case 0x02:
    return 6;
  case 0x13:
    return 7;
  case 0x0B:
    return 8;
  case 0x03:
    return 9;
  case 0x0C:
    return 0;
  case 0x14:
    return 'N';
  case 0x04:
    return 'Y';
  default:
    return 'E';   //��ʾerror
  }
}
/******************************************************************************
* ��������: SetParam_7290
* ��������: ����7290���в����趨.
* ��ڲ���: name   ��������(һ��ASCII�ַ�)
*           value  �����ĳ�ʼֵ(0~9999)
* ���ز���: �趨���(0-9999)
******************************************************************************
void SetParam_7290( unsigned char name[], 
                    unsigned int  value,
                    unsigned int  row,
                    int16u_t* setparam )
{
    unsigned char key, dat[4] = {0}, dis[5] = {0};
    unsigned int  pos = 0, flash = 0;
    int16u_t cnt1 = 0, cnt2 = 0;
    
    if(value < 1000) dat[0] = 0;
    else dat[0] = value / 1000;
    dat[1] = value / 100 % 10;
    dat[2] = value / 10 % 10;
    dat[3] = value % 10;

    dis[0] = dat[0] + 0x30;
    dis[1] = dat[1] + 0x30;
    dis[2] = dat[2] + 0x30;
    dis[3] = dat[3] + 0x30;
    dis[4] = '\0';
    
    
    * ������ʾ *
    OLED_P8x16Str(0, row, name); 
    OLED_P8x16Str(82, row, dis);
    
    do
    {        

      * �ȴ���������,��˸�ȴ� *
         while(!TEST_KEY_7290()) 
        {
          cnt1++;
          if(cnt1 == 100 && flash == 0)
          {
            cnt2 ++;
            cnt1 = 0;
            if(cnt2 == 10000)
            {
              OLED_P8x16_Clr_One(82+8*pos, row);
              cnt1 = 0; cnt2 = 0;
              flash = 1;
            }
          }

          if(cnt1 == 100 && flash ==1)
          {
            cnt2 ++;
            cnt1 = 0;
            if(cnt2 == 10000)
            {
              OLED_P8x16Str(82, row, dis);
              cnt1 = 0; cnt2 = 0;
              flash = 0;
            }
          }
        }
        
        * ������ȡ *
        key = Readkey_7290();
        
        key = KeyConvert(key);
       
        * �޸Ĳ�����������ʾ *
        if(key < 10)
        {     
            dat[pos] = key;
            dis[pos] = dat[pos] + 0x30;
            OLED_P8x16Str(82, row, dis);
            if(++pos == 4) pos = 0;
        }
    }
    while(key != 11);            * ȷ�ϼ���Ӧ�ļ�ֵΪ11 *
    OLED_P8x16Str(82, row, dis);
    
    * �����趨��� *
    *setparam = dat[0] * 1000 + dat[1] * 100 + dat[2] * 10 + dat[3];
           
    //Delay_ms(500);
}
******************************************************************************
* ��������: SetFloatParam_7290
* ��������: ����7290���и�������趨.
* ��ڲ���: name   ��������(һ��ASCII�ַ�)
*           value  �����ĳ�ʼֵ(00.00��ʽ)
            row    ���������OLED��ʾ����(0~7)
* ���ز���: �趨���(0-9999)
******************************************************************************
char SetFloatParam_7290( unsigned char name[], 
                         float  tempvalue,
                         unsigned int  row,
                         float* setparam )
{
    unsigned char key, dat[5] = {0}, dis[6] = {0};
    unsigned int  pos = 0, flash = 0;
    int16u_t cnt1 = 0, cnt2 = 0;
    int16u_t value = 0;
    
    value = (int16u_t)(tempvalue * 100);

    if(value < 1000) dat[0] = 0;
    else dat[0] = value / 1000;
    dat[1] = value / 100 % 10;
    dat[3] = value / 10 % 10;
    dat[4] = value % 10;

    dis[0] = dat[0] + 0x30;
    dis[1] = dat[1] + 0x30;
    dis[2] = '.';
    dis[3] = dat[3] + 0x30;
    dis[4] = dat[4] + 0x30;
    dis[5] = '\0';
    
    
    * ������ʾ *
    OLED_P8x16Str(0, row, name); 
    OLED_P8x16Str(82, row, dis);
    
    do
    {        
        * �ȴ��������� *
        while(!TEST_KEY_7290()) 
        {
          cnt1++;
          if(cnt1 == 100 && flash == 0)
          {
            cnt2 ++;
            cnt1 = 0;
            if(cnt2 == 10000)
            {
              OLED_P8x16_Clr_One(82+8*pos, row);
              cnt1 = 0; cnt2 = 0;
              flash = 1;
            }
          }

          if(cnt1 == 100 && flash ==1)
          {
            cnt2 ++;
            cnt1 = 0;
            if(cnt2 == 10000)
            {
              OLED_P8x16Str(82, row, dis);
              cnt1 = 0; cnt2 = 0;
              flash = 0;
            }
          }
        }

        * ������ȡ *
        key = Readkey_7290();
        
        if(key == 20)
          return 1;
        
        key = KeyConvert(key);
       
        * �޸Ĳ�����������ʾ *
        if(key < 10)
        {
            dat[pos] = key;
            dis[pos] = dat[pos] + 0x30;
            OLED_P8x16Str(82, row, dis);
            if(++pos == 5) pos = 0;
            if(pos == 2) pos = 3;
        }
    }
    while(key != 11);            * ȷ�ϼ���Ӧ�ļ�ֵΪ11 *
    OLED_P8x16Str(82, row, dis);
    
    * �����趨��� *
    *setparam = ((float)dat[0]) * 10 + ((float)dat[1])  + ((float)dat[3]) / 10 + ((float)dat[4]) / 100;
    return 0;
    //Delay_ms(500);
}
*/