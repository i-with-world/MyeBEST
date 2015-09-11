/******************************************************************************

* fat32txt.c

* fat32�ļ�ϵͳ������д�������TXT�ļ��� 

* ��һ���ߣ�  �ͳ�   (���Ľ�����ͷ)
  �������������Ľ� (����������ͷ)
* �汾��V1.15 (��V1.13��v1.14�������,��ʹ��˫����ʱ��V1.10֮��İ汾�����)
* �汾����ʱ�䣺2012��1��30��
 
******************************************************************************/

#include "./SD_System.h"
#include "AllHeaders.h"                                
#ifdef EN_SD                 

static byte_sd const dir_sd[32]=                             /************By Sword************/
{
0x41,0x2c,0x7b,0x8c,0x4e,0xe3,0x4e,0x0a,0x4e,0x4d,0x4f,0x0f,0x00,0x31,0x3a,0x67,
0x2e,0x00,0x6c,0x00,0x6e,0x00,0x6b,0x00,0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff 
};
//�������,����⵽��Ŀ¼�ĵ�һ����ԪΪ��ʱд�������
static byte_sd const file_property[15]=
{0x20,0x18,0x00,0x00,0x00,0x64,0x3b,0x64,0x3b,0x00,0x00,0x00,0x00,0x64,0x3b};
//�ļ�����
static byte_sd  file_name[11]=                               /************By Sword************/
{'C','A','R','-','-','0','0','0',0x54,0x58,0x54};
//�ļ�����(����չ��)
//ע,Ӣ����ĸ�����д�������ļ��򲻿�������

static dword_sd add_sta,add_dir,add_f1,add_f2;               /************By Sword************/
//������������Ŀ¼��fat1��fat2���׵�ַ����ʼֵ��
static dword_sd p_datasector;      //��������ָ��            /************By Sword************/
static word_sd  p_sector;  //����ָ��                        /************By Sword************/
static dword_sd file_size=0;
static byte_sd  sector_cluster; //ÿ������Ӧ�Ĵ���
static dword_sd sector_sta;     //��������������
static dword_sd sector_fat;     //fat��������
static word_sd  cluster_number,ram_number;
static word_sd  cnt_cluster;
static word_sd  p_segcluster;     //�����ָ��
static byte_sd  num_segcluster;   //��ǰ����ĳ���
static byte_sd  p_cluster;        //ָ��ǰ�����дص�λ�õ�ָ��
static byte_sd  DBUF[512];        //����512�ֽڻ�����
static dword_sd  next_cluster[SD_MAX_segment]; 
//�����һ������:��24λ��ʾ�ô������ʼ��ַ,��8λ��ʾ�صĸ���   
/************By Sword************/ 


#ifdef EN_SDbuf   //˫����ģʽ

static byte_sd  DBUF2[512];   //SD���ڶ�������
static dword_sd Sector_SDbuf; //�ڶ����������ݶ�Ӧ��Ŀ������
static byte_sd  Stat_SDbuf;   //�ڶ�����״̬��־(=0��ʾΪ��)

static byte_sd *pBuf_Now,*pBuf_2; //��ǰ������ڶ�����ָ��
/*
ע�⣺�����ݴ���ڶ�����Ĺ��̲����ǽ����ݸ��ƹ�ȥ,
���ǽ���������������ָ��,�Ӷ����Դ��ӿ����ִ���ٶ�
*/

#ifdef EN_Cnt_SDbuf
word_sd Cnt_SDbufS1,Cnt_SDbufS2,Cnt_SDbufS3,Cnt_SDbufS4,Cnt_SDbufS5;
/*����ʹ��״��ͳ�Ʊ���*/
/*
Cnt_SDbufS1:�������������(SD����æ,����Ϊ��)
Cnt_SDbufS2:SD����æ,����ǿ�,��д�뻺���ɼ���д��������
Cnt_SDbufS3:SD����æ,����ǿ�,��д�뻺���ȴ���ʱ,���ܼ���д��������
Cnt_SDbufS4:SD��æ,������Ϊ��,���Խ������ݴ��뻺��
Cnt_SDbufS5:SD��æ,�һ���ǿ�,ֻ�ܸɵ�
*/
#endif

/***********************************************************
* function:SD_WriteBlock_UserBuf
* description:sd��˫�����д����
************************************************************/
static byte_sd SD_WriteBlock_UserBuf(void)
{
  byte_sd r1=0,retry;
  byte_sd *pTmp;
  
  Wait_SDRdy(SD_SHORT_Wait);
  if(Flag_SDRdy == 0)
  { //SD��æ
    if(Stat_SDbuf == 0)
    { //����Ϊ��
    //�������ȴ��뻺��(��ν������ǽ������������ָ��)
      pTmp=pBuf_Now;
      pBuf_Now=pBuf_2;
      pBuf_2=pTmp;
      Sector_SDbuf=p_datasector;
      Stat_SDbuf=1; //��λ�����־
#ifdef EN_Cnt_SDbuf      
      Cnt_SDbufS4++;
#endif
    }
    else
    { //����ǿ�(����������,Ŀǰ���㷨û�а취�Ż�)
    //����ǿ�,ֻ�ܸɵ�  
      Wait_SDRdy(SD_LONG_Wait);
      retry=0;
      do //�������д������д��SD��
      {  
        r1=sd_writesingleblock(pBuf_2,Sector_SDbuf);
      } while(r1!=0 && (++retry)<3);
    //�������ٴ��뻺��
      pTmp=pBuf_Now;
      pBuf_Now=pBuf_2;
      pBuf_2=pTmp;
      Sector_SDbuf=p_datasector;
#ifdef EN_Cnt_SDbuf   
      Cnt_SDbufS5++;
#endif      
    }
  }
  else
  { //SD����æ
    if(Stat_SDbuf == 0)
    { //����Ϊ��(�������״��)
      retry=0;
      do //������д��SD��
      {  
        r1=sd_writesingleblock(pBuf_Now,p_datasector);
      } while(r1!=0 && (++retry)<3);
#ifdef EN_Cnt_SDbuf      
      Cnt_SDbufS1++;
#endif
    }
    else
    { //����ǿ�
      retry=0;
      do //�������д������д��SD��
      {  
        r1=sd_writesingleblock(pBuf_2,Sector_SDbuf);
      } while(r1!=0 && (++retry)<3);
     //д�껺�������ݽ��м���ʱ��ĵȴ�,���ݵȴ���Ľ���ж��Ƿ�д��������
      Wait_SDRdy(SD_VST_Wait);
      if(Flag_SDRdy == 0)
      { //SD��æ
      //�������ٴ��뻺��
        pTmp=pBuf_Now;
        pBuf_Now=pBuf_2;
        pBuf_2=pTmp;
        Sector_SDbuf=p_datasector;
#ifdef EN_Cnt_SDbuf        
        Cnt_SDbufS3++;
#endif
      }
      else
      { //SD����æ
      //�������ڽ�����,�����������
        Stat_SDbuf=0; //��������־
        retry=0;
        do //������д��SD��
        {  
          r1=sd_writesingleblock(pBuf_Now,p_datasector);
        } while(r1!=0 && (++retry)<3);
#ifdef EN_Cnt_SDbuf        
        Cnt_SDbufS2++;
#endif
      }
    }
  }
  
  return r1;
}
/***********************************************************
* function:SD_ClrBuf
* description:��ջ���������(������������д��SD��)
************************************************************/
static void SD_ClrBuf(void)
{
  byte_sd r1=0,retry=0;
  
  if(Stat_SDbuf != 0)
  {
    Wait_SDRdy(SD_LONG_Wait);
    do //�������д������д��SD��
    {  
      r1=sd_writesingleblock(pBuf_2,Sector_SDbuf);
    } while(r1!=0 && (++retry)<5);
    Stat_SDbuf=0; //��������־
  }
}

#endif
/*********************************************************/
//function:write_dir
//description:д��Ŀ¼����
//�޸ģ� Sword
/***********************************************************/
void write_dir(void)
{
  word_sd i=0,j,k,flag,retry=0;
  word_sd h_add,l_add,sum;
  word_sd addr=0,addh=0,max=0;
  byte_sd r1;
  
  do     //����Ŀ¼�ĵ�һ����Ԫ(���)�Ƿ�Ϊ��
   {
     r1=sd_readsingleblock(DBUF,add_dir);
     C_WDOG();
     retry++;
   } while(r1!=0x00&&retry<100);
  retry=0;
  
  if(DBUF[0]==0x00)   //�����Ŀ¼��һ����ԪΪ����д����
   {
     for(i=0;i<32;i++) DBUF[i]=dir_sd[i];
     while(sd_writesingleblock(DBUF,add_dir)&&retry<1000) //д���
      {                            
        C_WDOG(); //�忪�Ź� 
        retry++;
      } 
   }
  
  for(i=0;i<sector_cluster;i++)
   { 
     do     //�ȶ���Ŀ¼�ٸ�д,�Ӷ���֤�������ԭ�����ļ�
      {
        r1=sd_readsingleblock(DBUF,add_dir+i);
        C_WDOG();
        retry++;
      } while(r1!=0x00&&retry<100);
     retry=0;
    
     for(k=0;k<512;k+=32)
      {
       
        if(addr==0&&addh==0&&DBUF[k]==0x00||DBUF[k]==0xE5) 
         { addh=i;addr=k; }  //Ѱ��һ���հ׵�32�ֽ�����
       
        for(j=0,flag=1;j<5;j++)  //�����ļ����
          if(DBUF[k+j]!=file_name[j]) flag=0;
        if(flag)
         {
           if(DBUF[k+5]>'9'||DBUF[k+5]<'0') continue;
           if(DBUF[k+6]>'9'||DBUF[k+6]<'0') continue;
           if(DBUF[k+7]>'9'||DBUF[k+7]<'0') continue;
           sum=(DBUF[k+7]-'0')+(DBUF[k+6]-'0')*10+(DBUF[k+5]-'0')*100;
           if(sum>max) max=sum;
         }
      }
   }
  
  if(addh==0&&addr==0)
   {     //û���ڸ�Ŀ¼�ҵ�����λ��
     CloseSD();
     return;
   }
  
  do     //�ȶ���Ŀ¼�ٸ�д,�Ӷ���֤�������ԭ�����ļ�
   {
     r1=sd_readsingleblock(DBUF,add_dir+addh);
     C_WDOG();
     retry++;
   } while(r1!=0x00&&retry<100);
  retry=0; 
   
  file_name[7]=(max+1)%10+'0';   //�����ļ���
  file_name[6]=(max+1)/10%10+'0'; 
  file_name[5]=(max+1)/100+'0';

  h_add=(next_cluster[0]&0x00FF0000)>>16;
  l_add=next_cluster[0]&0x0000FFFF;   
  
  for(i=0,j=0;i<11;i++,j++)
   {
     DBUF[addr+i]=file_name[j];    //�ļ���
   }
  for(j=0;i<26;i++,j++)
   {
     DBUF[addr+i]=file_property[j];         //�ļ�����
   }
  DBUF[addr+26]=(byte_sd)(l_add&0x00FF);      //д���ļ���ʼ�صĵ�16λ
  DBUF[addr+27]=(byte_sd)((l_add>>8)&0x00FF);  
    
  file_size=ram_number+(((dword_sd)(cnt_cluster*sector_cluster+p_sector))<<9L);
  if(ram_number!=0) file_size-=512; 
  DBUF[addr+28]=(byte_sd)(file_size&0x000000ff);        //�ļ���С
  DBUF[addr+29]=(byte_sd)((file_size&0x0000ff00)>>8);
  DBUF[addr+30]=(byte_sd)((file_size&0x00ff0000)>>16);
  DBUF[addr+31]=(byte_sd)((file_size&0xff000000)>>24);

  while(sd_writesingleblock(DBUF,add_dir+addh)&&retry<1000) //д��Ŀ¼
   {
     C_WDOG(); //�忪�Ź� 
     retry++;
   }
}
/***********************************************************************/
//function:write_fat
//description:дSD����fat1��fat2��(�㷨�ܸ��ӣ�����ϸ˼������)
//�޸ģ� Sword
/***********************************************************************/
void write_fat(void)
{
  dword_sd sector=0,cluster;        
  word_sd  i=0,p,retry=0,num,k,j;
  byte_sd  r1;
                                       
  num=cnt_cluster;
  if(p_sector!=0) num++;
  
  k=j=0;
  num_segcluster=(next_cluster[0]&0xFF000000)>>24;
  cluster=next_cluster[0]&0x00FFFFFF;
  
  for(i=0;i<num;i++)
   {
     if((cluster>>7)!=sector||i==0)
      { 
        if(i!=0) 
         {  //дfat��
           while(sd_writesingleblock(DBUF,add_f1+sector)&&(retry<1000))
            {
               C_WDOG(); //�忪�Ź� 
               retry++;
            }
           retry=0;
           while(sd_writesingleblock(DBUF,add_f2+sector)&&(retry<1000)) 
            {
              C_WDOG(); //�忪�Ź� 
              retry++;
            }
           retry=0;
         }
      
        sector=(cluster>>7);
        
        do     //�ȶ��ٰ��õ����´ظ�д,�Ӷ���֤�������ԭ�����ļ�
         {
           r1=sd_readsingleblock(DBUF,add_f1+sector);
           C_WDOG();
           retry++;
         } while(r1!=0x00&&retry<100);
        retry=0;
      }
     
     p=((cluster&0x007F)<<2);      //�ҵ���ǰ�ض�Ӧ��FAT���λ��
     
     j++;        //�ҵ���һ�����ô�
     if(j==num_segcluster)
      {
        j=0;
        num_segcluster=(next_cluster[++k]&0xFF000000)>>24;
        cluster=next_cluster[k]&0x00FFFFFF; 
      }
     else
      {
        cluster++;
      }
     
     DBUF[p]=(byte_sd)(cluster&0x00FF); //д���ļ�����һ����
     DBUF[p+1]=(byte_sd)((cluster>>8)&0x00FF);
     DBUF[p+2]=(byte_sd)((cluster>>16)&0x00FF);
     
     if(i==(num-1))
      {
        DBUF[p]=0xff;
        DBUF[p+1]=0xff;
        DBUF[p+2]=0xff;
        DBUF[p+3]=0x0f;
        while(sd_writesingleblock(DBUF,add_f1+sector)&&(retry<1000))
         {
            C_WDOG(); //�忪�Ź� 
            retry++;
         }
        retry=0;
        while(sd_writesingleblock(DBUF,add_f2+sector)&&(retry<1000)) 
         {
           C_WDOG(); //�忪�Ź� 
           retry++;
         }
        retry=0;
      }
   }
}

/*********************************************************/
//function:writeram_sd
//description:дram512�ֽ����ݵ�sd����������
//�޸ģ� Sword
/***********************************************************/
void writeram_sd(void)
{
  word_sd retry=0;
#ifdef EN_SDbuf
  while(SD_WriteBlock_UserBuf()&&(retry<300)) 
   {
     C_WDOG(); //�忪�Ź� 
     retry++;
   }
#else                  
  while(sd_writesingleblock(DBUF,p_datasector)&&(retry<300)) 
   {
     C_WDOG(); //�忪�Ź� 
     retry++;
   }
#endif   
  if((++p_sector)==sector_cluster)  //д��һ�صĴ���
   {
     p_sector=0;
     p_cluster++;
     cnt_cluster++;
     if(p_cluster==num_segcluster)
      {       //���һ������д��,��д��ָ��ָ����һ�������ʼ��ַ
        p_datasector=((dword_sd)((next_cluster[++p_segcluster]&0x00FFFFFF)-2))*sector_cluster+add_dir; 
        num_segcluster=(next_cluster[p_segcluster]&0xFF000000)>>24;
        p_cluster=0;
      }
     else
      {
        p_datasector++;
      }
   }
  else
   {
     p_datasector++;
   }
}
/*********************************************************/
//function:write_ram
//description:д�ֽ����ݵ�ram��������������fat32�ļ�ϵͳ�����Ľӿڣ�
//�޸ģ� Sword
/***********************************************************/
void writebyte_ram(byte_sd wdata)
{
  
  if(cnt_cluster<cluster_number)
   {
#ifdef EN_SDbuf
     pBuf_Now[ram_number]=wdata;
#else
     DBUF[ram_number]=wdata;
#endif     
     ram_number++;
     if(ram_number==512) 
      {
        ram_number=0;
        writeram_sd();
      }
   }
}
/*********************************************************/
//function:write_stop
//description:дSD����������ɺ�����������дFAT�����Ŀ¼
//�޸ģ� Sword
/*********************************************************/
void write_stop(void)
{
   if(cnt_cluster==0&&p_sector==0&&ram_number==0) 
   {
     return; //���û��д������,��дfat��͸�Ŀ¼
   }
   
   if(ram_number!=0) writeram_sd(); 
 //����󲻹�һ����������������д��
 
#ifdef EN_SDbuf
   SD_ClrBuf();
#endif
   
   write_dir();
   write_fat(); 

   Wait_SDRdy(SD_LONG_Wait);   //�ȴ����һ����������д��SD��

   CloseSD();//�ر�SD��  
}

/*
�������ƣ�search_addr_sd
�������ܣ�Ѱ��sd����������,��Ŀ¼,��������,fat1��fat2���׵�ַ
�� д �ߣ�Sword
*/
void search_addr_sd(void)
{
  word_sd  retry;
  byte_sd  r1,flag_yes=1;
  
  retry=0;
  do
   {  //��ȡ��0������������
     r1=sd_readsingleblock(DBUF,0);
     C_WDOG();
     retry++;
   } while(r1!=0x00&&retry<100);
 
  if(retry>=100) 
   {
     flag_err_sd=SDERR_ReadOverTime;
     flag_yes=0; //��ʱ����
   }
     
  if(DBUF[0]!=0xeb||DBUF[1]!=0x58||DBUF[2]!=0x90)   
 //ͨ����0����������ǰ3�ֽ��Ƿ�����תָ�����ж��ǲ�����������    
   {
     add_sta=DBUF[454]+((dword_sd)DBUF[455]<<8)+((dword_sd)DBUF[456]<<16)+((dword_sd)DBUF[457]<<24);
  //�������ĵ�0����������������,���ɵ�454-457byte_sd����������������ƫ����   
     retry=0;   
     do
      {  //��ȡ������������
        r1=sd_readsingleblock(DBUF,add_sta);
        C_WDOG();
        retry++;
      } while(r1!=0x00&&retry<100);
     
     if(retry>=100) 
      {
        flag_err_sd=SDERR_ReadOverTime;
        flag_yes=0; //��ʱ����
      }
     else if(DBUF[0]!=0xeb||DBUF[1]!=0x58||DBUF[2]!=0x90)
      {
        flag_err_sd=SDERR_StartSector;
        flag_yes=0; //������������
      }
   }
  else
   {
     add_sta=0;
   }
  
  sector_cluster=DBUF[13];    //��ȡÿ�ض�Ӧ��������
  sector_sta=DBUF[14]+((dword_sd)DBUF[15]<<8);   //��������������
  sector_fat=DBUF[36]+((dword_sd)DBUF[37]<<8)+((dword_sd)DBUF[38]<<16)+((dword_sd)DBUF[39]<<24);
 //����fat����ռ�������� 
    
 //�����Ŀ¼,��������,fat1��fat2���׵�ַ 
  add_f1=add_sta+sector_sta;
  add_f2=add_f1+sector_fat;
  add_dir=add_f2+sector_fat;
  
  if(flag_yes==0) CloseSD();
}
/*
�������ƣ�search_fat
�������ܣ���Ѱfat��,�ҵ��㹻��Ŀ�������
�� д �ߣ�Sword
*/
void search_fat(void)
{
  byte_sd retry,r1,num,flag,flag_over=0;
  dword_sd i,j,k;   
  
  for(i=k=num=flag=0,j=12;i<10000;i++,j=0)
   {    //���Ѱ��10000������
//10000��������ӦԼ1280000����,��һ��4K��,��Ϊ5G�Ŀռ�
     retry=0;
     do
      {
        r1=sd_readsingleblock(DBUF,add_f1+i);
        C_WDOG();
        retry++;
      } while(r1!=0x00&&retry<100);
     
     if(retry>=100) 
      {
        flag_err_sd=SDERR_ReadOverTime;
        break; //��ʱ����
      }
     for(;j<512;j+=4)
      {
        if(DBUF[j]==0x00&&DBUF[j+1]==0x00&&DBUF[j+2]==0x00&&DBUF[j+3]==0x00) 
         {       //��ǿ��ô�
           if(flag==0)
            {         //һ�ο��ôصĵ�һ��
              next_cluster[k]=((i<<7)+(j>>2));
              num=flag=1;
            }
           else
            {     //��¼�öδصĸ���
              num++;
              if(num==250)
               {       //��ֹһ�δ�̫���������
                 next_cluster[k]|=(((dword_sd)num)<<24L);
                 k++;flag=0;
               }
            }
           cluster_number++; 
         }
        else
         {
           if(flag==1)
            {       //��ָ��ָ����һ���
              next_cluster[k]|=(((dword_sd)num)<<24L);
              k++;
            }
           flag=0;
         }
        if(cluster_number==SD_MAX_cluster||k==SD_MAX_segment) 
         {  //���ҵ��㹻��Ŀ��ôػ��������
           if(cluster_number==SD_MAX_cluster)
            {
              next_cluster[k]|=(((dword_sd)num)<<24L);
            }
           flag_over=1;
           break;
         } 
      }
     
     if(flag_over) break; 
   }
  if(cluster_number<SD_MAX_cluster) 
   {
     if(flag_err_sd!=SDERR_ReadOverTime)
       flag_err_sd=SDERR_NoCluster;
     if(cluster_number==0||flag_err_sd==SDERR_ReadOverTime)
      { //�������������������һ���ض�û�ҵ��Ļ������д��
        CloseSD(); //û���ҵ����ôػ��ȡ��ʱ��ر�SPI 
      }
   }
}
/*
�������ƣ�fat32_init
�������ܣ�fat32�ļ�ϵͳ�ĳ�ʼ��
�� д �ߣ�Sword
*/
void fat32_init(void)
{
  search_addr_sd();
  if(sd_yes)
   {
     SetSD_High();
     search_fat(); 
  
     if(sd_yes==1)
      {
        p_datasector=add_dir+((dword_sd)((next_cluster[0]&0x00FFFFFF)-2))*sector_cluster; 
      //ע��,�������Ǵӵڶ��ؿ�ʼ��,����Ҫ��2  
        p_sector=0;
        ram_number=cnt_cluster=0;
        p_segcluster=p_cluster=0;
        num_segcluster=(next_cluster[0]&0xFF000000)>>24;
      }
   }
}
/*
�������ƣ�SD_System_Init
�������ܣ�SD���������ļ�ϵͳ�ĳ�ʼ��
          (��������ֱ�ӵ��øú����Ϳ���ɶ�SD��ȫ���ĳ�ʼ������)
�� д �ߣ�Sword
*/
void SD_System_Init(void)
{
  byte_sd retry=10;

  sd_yes=1;      //Ĭ��SD���Ѿ���,���������,����ִ��CloseSD()ʱ������ñ���
  Flag_SDRdy=1;  //��SD����״̬���Ϊ����
  flag_err_sd=SD_Normal;
  SD_driver_Init();
  SetSD_Low();
  while(sd_init()&&retry!=0) 
   {
     retry--;
     C_WDOG();
   }

  if(retry==0)         //���sd����ʼ����ʱ���ɹ�����ر�spi 
   {
     CloseSD();
   }
  else          
   {
     flag_err_sd=SD_Normal;
     fat32_init(); //�ļ�ϵͳ�ĳ�ʼ��
     
   #ifdef EN_SDbuf   //��ʼ���ڶ�����
   #ifdef EN_Cnt_SDbuf  
     Cnt_SDbufS1=0;
     Cnt_SDbufS2=0;
     Cnt_SDbufS3=0;
     Cnt_SDbufS4=0;
     Cnt_SDbufS5=0;
   #endif
     Stat_SDbuf=0;
     pBuf_Now=DBUF; //�趨����ָ��ĳ�ʼֵ
     pBuf_2=DBUF2;
   #endif
   }
  
  sd_initover = 1;
}
/*
�������ƣ�SD_System_Init_Ext
�������ܣ���չ���SD��ϵͳ��ʼ������
          (�����ڳ�ʼ��ʱԤ��д�벿������)
��ڲ�����pbuf:��ʼ����ָ��
         len:���ݳ���
�� д �ߣ�Sword
*/
void SD_System_Init_Ext(byte_sd * pbuf , word_sd len)
{
	word_sd i;
	
	SD_System_Init();
	
	if(sd_yes != 0)
	{
		sd_initover = 0;
		
		for(i=0;i<len;i++)
		{
			writebyte_ram(*pbuf++);
		}
		
		sd_initover = 1;
	}
}
/*
�������ƣ�test_sd
�������ܣ�����SD��
�� д �ߣ�Sword
*/
void test_sd(void)
{
  byte_sd const str[]="If you see these words, your SD and hardware is OK!";
  word_sd i;
  if(sd_yes)
   { 
     file_name[0]='T';
     file_name[1]='E';
     file_name[2]='S';
     file_name[3]='T';
     file_name[4]='-';
     
     for(i=0;str[i]!='\0';i++)
       writebyte_ram(str[i]);
            
     write_stop();
   }
}

void write_SD(void)
{
  int i;
  writebyte_ram('U');
  writebyte_ram('Z');
  for(i=0;i<128;i++)
  {
    writebyte_ram(' ');
    writebyte_ram('0');
    writebyte_ram(MAIN_CCD.ccd_value[i]+48);
  }
  writebyte_ram(' ');
  //����1
  writebyte_ram(Bend_L_Num/100+65);
  writebyte_ram(Bend_L_Num%100+65);
  writebyte_ram(' ');
  //����2
  writebyte_ram(Bend_L_Num/100+65);
  writebyte_ram(Bend_L_Num%100+65);
  writebyte_ram(' ');
  //����3
  writebyte_ram(Black_Tip_Flag/100+65);
  writebyte_ram(Black_Tip_Flag%100+65);
  writebyte_ram(' ');
  //����4
  writebyte_ram(ResureTip_Flag/100+65);
  writebyte_ram(ResureTip_Flag%100+65);
  writebyte_ram(' ');
  //����5
  writebyte_ram(MAIN_CCD.Black_TO_White[1]/100+65);
  writebyte_ram(MAIN_CCD.Black_TO_White[1]%100+65);
  writebyte_ram(' ');
  //����6
  writebyte_ram(MAIN_CCD.White_TO_Black[0]/100+65);
  writebyte_ram(MAIN_CCD.White_TO_Black[0]%100+65);
  writebyte_ram(' ');
  //����7
  writebyte_ram(MAIN_CCD.Black_Position/100+65);
  writebyte_ram(MAIN_CCD.Black_Position%100+65);
  writebyte_ram(' ');
  //����8
  writebyte_ram(MAIN_CCD.Black_Position/100+65);
  writebyte_ram(MAIN_CCD.Black_Position%100+65);
  writebyte_ram(' ');
  //����9
  writebyte_ram(MAIN_CCD.Black_Position/100+65);
  writebyte_ram(MAIN_CCD.Black_Position%100+65);
  writebyte_ram(' ');
  //����10
  writebyte_ram(MAIN_CCD.Black_Position/100+65);
  writebyte_ram(MAIN_CCD.Black_Position%100+65);
  writebyte_ram(' ');
  //����11
  writebyte_ram(MAIN_CCD.Black_Position/100+65);
  writebyte_ram(MAIN_CCD.Black_Position%100+65);
  writebyte_ram(' ');
  //����12
  writebyte_ram(MAIN_CCD.Black_Position/100+65);
  writebyte_ram(MAIN_CCD.Black_Position%100+65);
  writebyte_ram(' ');
}

#endif
