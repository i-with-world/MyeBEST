#include "AllHeaders.h"
#include "stdio.h"
#include "math.h"
#include "string.h"

CCD_GROUP MAIN_CCD={main_CCD,{0},{0},{0},{0},{0},{0},{0},0,0,Autoadjust_min,Autoadjust_max};
CCD_GROUP ASSI_CCD={Assi_CCD,{0},{0},{0},{0},{0},{0},{0},0,0,ASSI_Autoadjust_min,ASSI_Autoadjust_max};

int8s_t CCD_k_max_Value;
int8s_t CCD_k_min_Value;
int16s_t Sum_limit;
int8u_t num_rise;     //��������Ŀ
int8u_t num_down;     //�½�����Ŀ
int8u_t Black_TO_White_Flag;    //�׵��������־
int8u_t White_TO_Black_Flag;    //�ڵ��������־
int8u_t SingleLineMid;         //�м䵥�ߺ����е�
int8u_t Black_Tip_Num=0;           //�������ȼ�¼
int8u_t WholeBlack_Flag=0;         //ֱ��ǰ������־
int8u_t AfterTurn_Flag = 0;        //ת��ֱ�Ǳ�־
int16s_t Track_Slope;
int8u_t Double_Edge_Flag = 0;      //˫�ؼ�����־λ
int16u_t Double_Edge_Num = 0;      //˫�ؼ�������
int16u_t Check_Single_Edge_Num = 0; //ȷ���������ر���
int16u_t Single_Edge_Num = 0;     //���ظ�������
int16u_t Check_Bend_L_Num = 0;
int16u_t Check_Bend_R_Num = 0;
int16u_t Bend_L_Num = 0;
int16u_t Bend_R_Num = 0;
int8u_t Black_Tid_Bend_B_to_W[5] = {0};
int8u_t Black_Tid_Bend_W_to_B[5] = {0};
int8u_t Black_Tid_Bend_Flag = 0;
int8u_t Bend_Single_Edge_Num = 0;
int8u_t Check_Bend_Single_Edge_Num = 0;
int8u_t Whole_White_cnt = 0;
int8u_t Check_Whole_White_cnt = 0;
int8u_t Whole_White_flag = 0;

//
char slopeBuff[12] = {0};

//4��4�� P��0.17  D:0.025
/*const short int tab[128]=
{
  -1,-1,-2,-2,-3,-3,-4,-4,-5,-5,-6,-6,-7,-7,
  -8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-21,
  -23,-25,-27,-29,-31,-33,-35,-37,-39,-41,-43,-45,-47,-49,-51,-53,-55,-57,-59,-61,//48
  -64,-67, -70,-73,-76,-79,-82,-85,-88,-91,
  -95,-99,-103,-107,-111,-115,
  
  
  
  115,111,107,103,99,95,
  91,88,85,82,79,76,73,70,67,64,
  61,59,57,55,53,51,49,47,45,43,41,39,37,35,33,31,29,27,25,23,
  21,20,19,18,17,16,15,14,13,12,11,10,9,8,
  7,7,6,6,5,5,4,4,3,3,2,2,1,1
};*/

/*const short int tab[128]=
{
-1,-1,-2,-2,-3,-3,-4,-4,-5,-5,-6,-6,-7,-7,-8,-8,
-9,-9,-10,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-21,-22,
-23,-24,-25,-26,-27,-28,-29,-30,-32,-34,-36,-38,-40,-42,-44,-46,
-48,-50,-52,-54,-56,-58,-60,-62,-64,-66,-68,-70,-72,-74,-76,-78,
78,76,74,72,70,68,66,64,62,60,58,56,54,52,50,48,
46,44,42,40,38,36,34,32,30,29,28,27,26,25,24,23,
22,21,20,19,18,17,16,15,14,13,12,11,10,10,9,9,
8,8,7,7,6,6,5,5,4,4,3,3,2,2,1,1,

};*/


/*const short int tab[128]=                                                                                 //�Ͻ�Ȩֵ�� ��Ȩֵ1711
{
  -1,-1,-2,-2,-3,-3,-4,-4,-5,-5,-6,-6,-7,-7,-8,-8,-9,-9,-10,-10,
  -11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-21,-22,-23,-24,-25,-26,-27,-28,-29,-30,-31,-32,-33,-34,-35,
  -36,-38,-40,-42,-44,-46,-48,-50,-52,-54,-56,-58,-60,-62,-64,-66,-68,-70,-72,
  72,70,68,66,64,62,60,58,56,54,52,50,48,46,44,42,40,38,36,
  35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,
  10,10,9,9,8,8,7,7,6,6,5,5,4,4,3,3,2,2,1,1
};*/

const short int tab[128]=                                                                                 //�Ͻ�Ȩֵ�� ��Ȩֵ1745
{
 -1,-1,-2,-2,-3,-3,-4,-4,-5,-5,-6,-6,-7,-7,-8,-8,
-9,-9,-10,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-21,-22,
-23,-24,-25,-26,-27,-28,-29,-30,-31,-32,-33,-34,-35,-37,-39,-41,
-43,-45,-47,-49,-51,-53,-55,-57,-59,-61,-63,-66,-69,-72,-75,-78,
78,75,72,69,66,63,61,59,57,55,53,51,49,47,45,43,
41,39,37,35,34,33,32,31,30,29,28,27,26,25,24,23,
22,21,20,19,18,17,16,15,14,13,12,11,10,10,9,9,
8,8,7,7,6,6,5,5,4,4,3,3,2,2,1,1,

};

void TSL1401_GetLine(CCD_GROUP* ccd_group)
{  
   int8u_t i;
   TSL1401_0_SI(0);
   TSL1401_0_CLK(0);
   asm("nop");
   TSL1401_0_SI(1);     //SIά�ָߵ�ƽ����20ns
   asm("nop");
   TSL1401_0_CLK(1);       //��ʱ��һ�����ص�ģ������AO�ڿ��Եõ�
   asm("nop");
   TSL1401_0_SI(0);
   asm("nop");
   ADC_readResult(ADC0, 17,&ccd_group->CCD_AD_Value[0]);      //�ɼ���һ�����ص������ģ����ת����������
   TSL1401_0_CLK(0);
   
   for(i=1; i<128; i++)                                           //�������1~127���ص��ADת��ֵ�������һ��ѭ���ɼ���128���ص��ģ����
   {
      asm("nop");
      TSL1401_0_CLK(1);
      asm("nop");
      ADC_readResult(ADC0, 17,&ccd_group->CCD_AD_Value[i-1]);                         
      TSL1401_0_CLK(0);
   }
   asm("nop");
   ADC_readResult(ADC0, 17,&ccd_group->CCD_AD_Value[127]);           //����128���ص��ģ����ת�����                 
   asm("nop");
   TSL1401_0_CLK(1);      //���͵�129��clkʹ�������ݲɼ�128���ص���ֵ��ݵĻ��ֽ��
   asm("nop");
   TSL1401_0_CLK(0);       //��129���������һ��SI�������ȴ�����20��s����ɵ�128���ص�Ĳ��� 
}

void TSL1401_GetASSILine(CCD_GROUP* ccd_group)
{
   int8u_t i;
   TSL1401_1_SI(0);
   TSL1401_1_CLK(0);
   asm("nop");
   TSL1401_1_SI(1);     //SIά�ָߵ�ƽ����20ns
   asm("nop");
   TSL1401_1_CLK(1);       //��ʱ��һ�����ص�ģ������AO�ڿ��Եõ�
   asm("nop");
   TSL1401_1_SI(0);
   asm("nop");
   ADC_readResult(ADC0, 18,&ccd_group->CCD_AD_Value[127]);      //�ɼ���һ�����ص������ģ����ת����������
   TSL1401_1_CLK(0);
   
   for(i=126; i>0; i--)                                           //�������1~127���ص��ADת��ֵ�������һ��ѭ���ɼ���128���ص��ģ����
   {
      asm("nop");
      TSL1401_1_CLK(1);
      asm("nop");
      ADC_readResult(ADC0, 18,&ccd_group->CCD_AD_Value[i+1]);                         
      TSL1401_1_CLK(0);
   }
   asm("nop");
   ADC_readResult(ADC0, 18,&ccd_group->CCD_AD_Value[0]);           //����128���ص��ģ����ת�����                 
   asm("nop");
   TSL1401_1_CLK(1);      //���͵�129��clkʹ�������ݲɼ�128���ص���ֵ��ݵĻ��ֽ��
   asm("nop");
   TSL1401_1_CLK(0);       //��129���������һ��SI�������ȴ�����20��s����ɵ�128���ص�Ĳ��� 
}

void Deal_MainCCD(CCD_GROUP* ccd_group)
{
  int8u_t i=0,j=0;
  int16u_t total_weight;
  int8u_t black_num=0;
  int8u_t white_num=0;
  WholeBlack_Flag=0;
  
  if((ResureTip_Flag == 1))
  {
    Check_Single_Edge_Num++;
  }
  Check_Bend_L_Num++;
  Check_Bend_R_Num++;
  Check_Whole_White_cnt++;

/*  if(num_rise==2)                                                      //����������  �ڰ׺ڰ�
   {
     if((ccd_group->White_TO_Black[0]-ccd_group->Black_TO_White[0])>(127-ccd_group->Black_TO_White[1])
        &&ccd_group->Black_Position>-200)                                       //��һ����ɫΪ�ܵ����ڶ���Ϊ���ʣ����ڶ�����ɫΪ��1�����򲹵�һ��
     {
       for(j=ccd_group->Black_TO_White[1];j<=127;j++)                           //�Ѱ�ɫ���ʲ��ɺ�ɫ
       {
         ccd_group->ccd_value[j]=1;
       }
       num_rise--;
       Black_TO_White_Flag=0;
       White_TO_Black_Flag=1;
     }
     else
     {
       for(j=ccd_group->Black_TO_White[0];j<=ccd_group->White_TO_Black[0];j++)          //��һ���ɫΪ���ʣ����ɺ�ɫ1
       {
         ccd_group->ccd_value[j]=1;
         ccd_group->Black_TO_White[0]=ccd_group->Black_TO_White[1];                
         num_rise--;
         num_down--;
         Black_TO_White_Flag=1;
         White_TO_Black_Flag=0;
       }
     }
   }
   if(num_down==2)                                                      //���������� �׺ڰ׺�
   {
     if(ccd_group->White_TO_Black[0]<(ccd_group->White_TO_Black[1]-ccd_group->Black_TO_White[0])
        &&ccd_group->Black_Position< 200)                               //ֻ����һ����Ϊ���ʣ��ڶ���Ϊ�ܵ������ڵ�һ�������򣬲��ڶ���
     {
       for(j=0;j<=ccd_group->White_TO_Black[0];j++)
       {
         ccd_group->ccd_value[j]=1;
       }
       num_down--;
       ccd_group->White_TO_Black[0]=ccd_group->White_TO_Black[1];
     }
     else
     {
        for(j=ccd_group->Black_TO_White[0];j<=ccd_group->White_TO_Black[1];j++)
        {
           ccd_group->ccd_value[j]=1;
           num_rise--;
           num_down--;
           Black_TO_White_Flag=0;
           White_TO_Black_Flag=1;          
        }
     }
   }
  */
   
  if(num_rise==2&&num_down==2&&
     ((ccd_group->Black_TO_White[1]-ccd_group->White_TO_Black[0]) < GINGLELINE)&&
     (ccd_group->White_TO_Black[0]-ccd_group->Black_TO_White[0] >=S_HALFPATHLGH) )                                 //���ߴ���Ĩȥ���ߺ�ɫ
  {
    for(j=0;j<=ccd_group->Black_TO_White[0];j++)
    {
     ccd_group->ccd_value[j]=0;
    }
    for(j=ccd_group->White_TO_Black[1];j<128;j++)
    {
     ccd_group->ccd_value[j]=0;
    }
    ccd_group->Black_TO_White[0] = ccd_group->Black_TO_White[1];
    ccd_group->Black_TO_White[1] = 0;
    ccd_group->White_TO_Black[1] = 0;
    num_rise--;
    num_down--;

  }
  
  if(num_rise==2&&num_down==1)
  {
    if(((ccd_group->Black_TO_White[1]-ccd_group->White_TO_Black[0]) < GINGLELINE)&&
     (ccd_group->White_TO_Black[0]-ccd_group->Black_TO_White[0] >=S_HALFPATHLGH) )              //���ߴ���Ĩȥһ�ߺ�ɫ
    {
      for(j=0;j<=ccd_group->Black_TO_White[0];j++)
      {
        ccd_group->ccd_value[j]=0;
      }
      ccd_group->Black_TO_White[0] = ccd_group->Black_TO_White[1];
      ccd_group->Black_TO_White[1] = 0;
      num_rise--;
    }
    else if((ccd_group->Black_TO_White[1]-ccd_group->White_TO_Black[0]) > Black_Tid_Bend_Min
            &&(ccd_group->Black_TO_White[0]-ccd_group->White_TO_Black[0]) < Black_Tid_Bend_Max
             &&(ccd_group->Black_Position<-500))
    {
      Black_Tid_Bend_B_to_W[Bend_L_Num] = ccd_group->Black_TO_White[1];
      Black_Tid_Bend_W_to_B[Bend_L_Num] = ccd_group->White_TO_Black[0];
      Bend_L_Num++;
      if(Bend_L_Num > 5)
        Bend_L_Num = 5;
      if((Bend_L_Num >= 5)
         &&(Black_Tid_Bend_W_to_B[1] - Black_Tid_Bend_W_to_B[0] <= 0)&&(Black_Tid_Bend_B_to_W[1] - Black_Tid_Bend_B_to_W[0] <= 0)
           &&(Black_Tid_Bend_W_to_B[2] - Black_Tid_Bend_W_to_B[1] <= 0)&&(Black_Tid_Bend_B_to_W[1] - Black_Tid_Bend_B_to_W[0] <= 0)
              &&(Black_Tid_Bend_W_to_B[3] - Black_Tid_Bend_W_to_B[2] <= 0)&&(Black_Tid_Bend_B_to_W[1] - Black_Tid_Bend_B_to_W[0] <= 0)
                &&(Black_Tid_Bend_W_to_B[4] - Black_Tid_Bend_W_to_B[3] <= 0)&&(Black_Tid_Bend_B_to_W[1] - Black_Tid_Bend_B_to_W[0] <= 0))
                  
      {
        Bend_L_Num = 0;
        Check_Bend_L_Num = 0;
        Black_Tip_Flag = 1;
//        ONBUZZER();
      }
    }
  }
  if(Check_Bend_L_Num != Bend_L_Num)
  {
    Check_Bend_L_Num = 0;
    Bend_L_Num = 0;
  }
  if(num_rise==1&&num_down==2)
  {
     if((ccd_group->Black_TO_White[0]-ccd_group->White_TO_Black[0]) < GINGLELINE
        &&(ccd_group->White_TO_Black[1]-ccd_group->Black_TO_White[0] >=S_HALFPATHLGH))                                          //���ߴ���Ĩȥһ���ɫ
     {
      for(j=ccd_group->White_TO_Black[1];j<=127;j++)
      {
        ccd_group->ccd_value[j]=0;
      }
      ccd_group->White_TO_Black[1] = 0;
      num_down--;
     }
     else if((ccd_group->Black_TO_White[0]-ccd_group->White_TO_Black[0]) > Black_Tid_Bend_Min
             &&(ccd_group->Black_TO_White[0]-ccd_group->White_TO_Black[0]) < Black_Tid_Bend_Max
              &&(ccd_group->Black_Position > 500))
     {
      Black_Tid_Bend_B_to_W[Bend_R_Num] = ccd_group->Black_TO_White[0];
      Black_Tid_Bend_W_to_B[Bend_R_Num] = ccd_group->White_TO_Black[0];
      Bend_R_Num++;
      if(Bend_R_Num > 5)
        Bend_R_Num = 5;
      if((Bend_R_Num >= 5)
         &&(Black_Tid_Bend_W_to_B[1] - Black_Tid_Bend_W_to_B[0] <= 0)&&(Black_Tid_Bend_B_to_W[1] - Black_Tid_Bend_B_to_W[0] <= 0)
           &&(Black_Tid_Bend_W_to_B[2] - Black_Tid_Bend_W_to_B[1] <= 0)&&(Black_Tid_Bend_B_to_W[1] - Black_Tid_Bend_B_to_W[0] <= 0)
              &&(Black_Tid_Bend_W_to_B[3] - Black_Tid_Bend_W_to_B[2] <= 0)&&(Black_Tid_Bend_B_to_W[1] - Black_Tid_Bend_B_to_W[0] <= 0)
                &&(Black_Tid_Bend_W_to_B[4] - Black_Tid_Bend_W_to_B[3] <= 0)&&(Black_Tid_Bend_B_to_W[1] - Black_Tid_Bend_B_to_W[0] <= 0))
                  
      {
        Bend_R_Num = 0;
        Check_Bend_R_Num = 0;
        Black_Tip_Flag = 1;
//       ONBUZZER();
      }
    }
  }
  if(Check_Bend_R_Num != Bend_R_Num)
  {
    Check_Bend_R_Num = 0;
    Bend_R_Num = 0;
  }
  
  

  if(num_rise==1&&num_down==1)                                       //�׺ڰ�
  {
//    OFFBUZZER();
    if( AfterTurn_Flag == 1)                                      //ת��ֱ�������ֱֹͣ���䴦��
    {
//      OFFBUZZER();
      AfterTurn_Flag = 0;
      Double_Edge_Num = 0;
      Double_Edge_Flag = 0;
      TipAfter_Len = 0;
      Black_Tip_Flag = 0;
      ResureTip_Flag = 0;
      Black_Tid_Bend_Flag = 0;
      Single_Edge_Num = 0;
    }
    if(Whole_White_flag == 1)       //CCD �л�
    {
      Whole_White_flag = 0;
    }

    if(ccd_group->Black_TO_White[0]-ccd_group->White_TO_Black[0]>=GINGLELINE)    //��������ش����½���
    {
      if(ccd_group->Black_Position<-500)                            //��תĨ�ұ߰ױ�
      {
        for(j=0;j<ccd_group->White_TO_Black[0];j++)
        {
          ccd_group->ccd_value[j]=1;
        }

        num_down--;
      }
      else if(ccd_group->Black_Position>500)                        //��תĨ��߰ױ�
      {
        for(j=ccd_group->Black_TO_White[0];j<=127;j++)
        {
           ccd_group->ccd_value[j]=1;
        }

        num_rise--;
      }
        
    }
    else if((ccd_group->Black_TO_White[0]-ccd_group->White_TO_Black[0]<GINGLELINE)&&
      (ccd_group->Black_TO_White[0]-ccd_group->White_TO_Black[0]>=6))
    {
      SingleLineMid = (ccd_group->Black_TO_White[0]+ccd_group->White_TO_Black[0])/2;       //�����м�����е�
      if(SingleLineMid+HALFPATHLGH < 111)                                                  //������չ���½�������
        ccd_group->White_TO_Black[0] = SingleLineMid+HALFPATHLGH;
      else
      {
        ccd_group->White_TO_Black[0] = 0;
        num_down--;
      }
      if(SingleLineMid-HALFPATHLGH > 16)                                                     //������չ������������
        ccd_group->Black_TO_White[0] = SingleLineMid-HALFPATHLGH;
      else
      {
        ccd_group->Black_TO_White[0] = 0;
        num_rise--;
      }
      for(j=SingleLineMid;j <= SingleLineMid+HALFPATHLGH;j++)                               //����������չ��ɫ����
      {
        ccd_group->ccd_value[j]=0;
        if(j > 127)
        {
          num_down--;
          break;
        }
      }
      for(;j<127;j++)                                                                      //����������չ��ɫ����
        ccd_group->ccd_value[j]=1;
      
      for(j=SingleLineMid;j >=SingleLineMid-HALFPATHLGH;j--)                               //����������չ��ɫ����
      {
        ccd_group->ccd_value[j]=0;
        if(j <= 0)
        {
          num_rise--;
          break;
        }
      }
      for(;j>0;j--)                                                                         //����������չ��ɫ����
        ccd_group->ccd_value[j]=1;
    }
    else 
    {
      if(1 == Double_Edge_Flag)
      {
        Double_Edge_Num++;
      }
    }
  }
    
  if(num_rise==1&&num_down==0)                                                              
  {
    if(ccd_group->Black_Position_Last>Weight_max)                                     //���������������ڵ���
    {
      for(j=ccd_group->Black_TO_White[0];j<=127;j++)
      {
        ccd_group->ccd_value[j]=1;
      }
      num_rise--;
      ccd_group->Black_Position = ccd_group->Black_Position_Last;
    }
    else if((ResureTip_Flag == 1))                                                        //ֱ���䴦����ת
    {
      if(pathType == STRGPATH)
      {
        Single_Edge_Num++;
      }
      if(Single_Edge_Num >= 4 || AfterTurn_Flag == 1)
      {
        AfterTurn_Flag = 1;
        
        for(j=ccd_group->Black_TO_White[0];j<=64;j++)
        {
          ccd_group->ccd_value[j]=1;
        }
        ccd_group->Black_TO_White[0] = 64;
      }
    }
    else if(1 == Black_Tid_Bend_Flag)
    {
      Bend_Single_Edge_Num++;
      if((Bend_Single_Edge_Num >= 4) || (1 == AfterTurn_Flag))
      {
//        ONBUZZER();
        AfterTurn_Flag = 1;
        for(j=ccd_group->Black_TO_White[0];j<=64;j++)
        {
          ccd_group->ccd_value[j]=1;
        }
        ccd_group->Black_TO_White[0] = 64;
      }
    }
  }
  
  if(num_rise==0&&num_down==1)                                                             
  {
    if(ccd_group->Black_Position_Last<Weight_min)                                  //���������������׵���
    { 
      for(j=0;j<=ccd_group->White_TO_Black[0];j++)
      {
        ccd_group->ccd_value[j]=1;
      }
      num_down--;
      ccd_group->Black_Position = ccd_group->Black_Position_Last;
    }
   else if((ResureTip_Flag == 1))                                                        //ֱ���䴦����ת
    {
      if(pathType == STRGPATH)
      {
        Single_Edge_Num++;
      }
      if(Single_Edge_Num >= 4 || AfterTurn_Flag == 1)
      {
        AfterTurn_Flag = 1;
        for(j=64;j<=ccd_group->White_TO_Black[0];j++)
        {
          ccd_group->ccd_value[j]=1;
        }
        ccd_group->Black_TO_White[0] = 64;
      }
    }
    else if(1 == Black_Tid_Bend_Flag)
    {
      Bend_Single_Edge_Num++;
      if((Bend_Single_Edge_Num >= 4) || (1 == AfterTurn_Flag))
      {
//        ONBUZZER();
        AfterTurn_Flag = 1;
        for(j=64;j<=ccd_group->White_TO_Black[0];j++)
        {
          ccd_group->ccd_value[j]=1;
        }
        ccd_group->Black_TO_White[0] = 64;
      }
    }
  }
  
  if(Single_Edge_Num != Check_Single_Edge_Num)
    {
      Single_Edge_Num = 0;
      Check_Single_Edge_Num = 0;
    }
  if(Bend_Single_Edge_Num != Check_Bend_Single_Edge_Num)
  {
    Bend_Single_Edge_Num = 0;
    Check_Bend_Single_Edge_Num = 0;
  }
  
  if(num_rise==0&&num_down==1&&ccd_group->White_TO_Black[0]<63)                              //��Խ�紦�� 
    for(j=ccd_group->White_TO_Black[0];j<=63;j++)
      ccd_group->ccd_value[j]=0;
      
   if(num_rise==1&&num_down==0&& ccd_group->Black_TO_White[0]>63)                            //��Խ�紦��
     for(j=64;j<=ccd_group->Black_TO_White[0];j++)
       ccd_group->ccd_value[j]=0;

    
  //CCD_AD_Average_YaoTou=0;
  for(j=0;j<=127;j++)                                                //ͳ�ƺڵ����
  {
    if(ccd_group->ccd_value[j]==1)
      black_num++;
    else if(j>61&&j<67)                                              //����Ӧ����
    {
      white_num++;
      
  #if AUTOADJUST_EN
      
      ccd_group->CCD_AD_Average=ccd_group->CCD_AD_Average+(float)(ccd_group->CCD_AD_Value[j]);
  #endif
      
    }
  }

#if AUTOADJUST_EN
    
  if(white_num!=0)
    ccd_group->CCD_AD_Average= ccd_group->CCD_AD_Average/(float)(white_num*120);
  
  if(ccd_group->CCD_AD_Average<1)
    ccd_group->CCD_AD_Average=1;
#endif
    
  if((num_rise==0&&num_down==0))                                      //ȫ��ȫ���ж�
  {
    if(
      ccd_group->CCD_AD_Value[20]>baizhi&&
     ccd_group->CCD_AD_Value[55]>baizhi&&
      ccd_group->CCD_AD_Value[63]>baizhi&&
        ccd_group->CCD_AD_Value[64]>baizhi&&
          ccd_group->CCD_AD_Value[70]>baizhi
     &&ccd_group->CCD_AD_Value[105]>baizhi
     )
    {
      black_num=0;
      Whole_White_cnt++;
      if(Whole_White_cnt > 6)
      {
        Whole_White_flag = 1;
      }
      for(j=0;j<=127;j++)
        ccd_group->ccd_value[j]=0;
      ccd_group->Black_Position = ccd_group->Black_Position_Last;
    }
    else
    {
      for(j=0;j<=127;j++)
        ccd_group->ccd_value[j]=1;
      if(ccd_group->Black_Position<500&&ccd_group->Black_Position>-500)                               //ֱ������ȫ���ñ�־λ
      {
        WholeBlack_Flag=1;
//        ONBUZZER();
      }
      ccd_group->Black_Position = ccd_group->Black_Position_Last;
  
    }
  }
  if(Check_Whole_White_cnt != Whole_White_cnt)
  {
    Check_Whole_White_cnt = 0;
    Whole_White_cnt = 0;
  }
  
  if((num_rise==1&&num_down==1))                                               //�������������ʣ�����ԭ֭
  {
    if((ccd_group->White_TO_Black[0]-ccd_group->Black_TO_White[0])<20)
    {
      black_num=127;
      ccd_group->Black_Position = ccd_group->Black_Position_Last;
    }
  }
  if((black_num>3&&black_num<90&&num_rise<=1&&num_down<=1))//||ZhuanTou_Flag==1  
  {
    total_weight=0;                       //������Ȩֵ֮�͵ı�������
    for(i = 4;i<124;i++)                   //�������м������Ȩֵ
    {
      if(ccd_group->ccd_value[i]==1)
        total_weight += tab[i];
    }
  
      //ccd_group->Black_Position=(total_weight/black_num);  //�����ƽ��Ȩֵ
      ccd_group->Black_Position = total_weight;
    
      ccd_group->Black_Position=(int)(ccd_group->Black_Position*0.9+ccd_group->Black_Position_Last*0.1);
  }
  
  if((ccd_group->Black_Position_Last<Weight_min&&ccd_group->Black_Position>Weight_max 
     ||ccd_group->Black_Position_Last>Weight_max&&ccd_group->Black_Position<Weight_min))
  {
    ccd_group->Black_Position = ccd_group->Black_Position_Last;
  }
  ccd_group->Black_Position_Last= ccd_group->Black_Position;
  //ServePID.MeasuredValue = ccd_group->Black_Position;
  
  ccd_group->Black_TO_White_His[0]=ccd_group->Black_TO_White_His[1];
  ccd_group->Black_TO_White_His[1]=ccd_group->Black_TO_White_His[2];
  ccd_group->Black_TO_White_His[2]=ccd_group->Black_TO_White_His[3];
  ccd_group->Black_TO_White_His[3]=ccd_group->Black_TO_White_His[4];
  ccd_group->Black_TO_White_His[4]=ccd_group->Black_TO_White_His[5];
  ccd_group->Black_TO_White_His[5]=ccd_group->Black_TO_White[0]; 
}
//������CCD
void Deal_AssiCCD(CCD_GROUP* ccd_group)
{
  int8u_t i=0,j=0;
  int16u_t total_weight;
  int8u_t black_num=0;
  
  if(num_rise==1&&num_down==1)                                       //�׺ڰ�
  {
    if(ccd_group->Black_TO_White[0]-ccd_group->White_TO_Black[0]>=SINGLELINE)    //��������ش����½���
    {
      if(ccd_group->Black_Position<-500)                            //��תĨ�ұ߰ױ�
      {
        for(j=0;j<ccd_group->White_TO_Black[0];j++)
        {
          ccd_group->ccd_value[j]=1;
        }
        num_down--;
      }
      else if(ccd_group->Black_Position>500)                        //��תĨ��߰ױ�
      {
        for(j=ccd_group->Black_TO_White[0];j<=127;j++)
        {
           ccd_group->ccd_value[j]=1;
        }
        num_rise--;
      }
    }
  }
    
  if(num_rise==1&&num_down==0)                                                              
  {
    if(ccd_group->Black_Position_Last>Weight_max)                                     //���������������ڵ���
    {
      for(j=ccd_group->Black_TO_White[0];j<=127;j++)
      {
        ccd_group->ccd_value[j]=1;
      }
      num_rise--;
      ccd_group->Black_Position = ccd_group->Black_Position_Last;
    }
  }
  
  if(num_rise==0&&num_down==1)                                                             
  {
    if(ccd_group->Black_Position_Last<Weight_min)                                  //���������������׵���
    { 
      for(j=0;j<=ccd_group->White_TO_Black[0];j++)
      {
        ccd_group->ccd_value[j]=1;
      }
      num_down--;
      ccd_group->Black_Position = ccd_group->Black_Position_Last;
    }
  }
  
  if(num_rise==0&&num_down==1&&ccd_group->White_TO_Black[0]<63)                              //��Խ�紦�� 
    for(j=ccd_group->White_TO_Black[0];j<=63;j++)
      ccd_group->ccd_value[j]=0;
      
   if(num_rise==1&&num_down==0&& ccd_group->Black_TO_White[0]>63)                            //��Խ�紦��
     for(j=64;j<=ccd_group->Black_TO_White[0];j++)
       ccd_group->ccd_value[j]=0;

    
  //CCD_AD_Average_YaoTou=0;
  for(j=0;j<=127;j++)                                                //ͳ�ƺڵ����
  {
    if(ccd_group->ccd_value[j]==1)
      black_num++;
  }
    
  if((num_rise==0&&num_down==0))                                      //ȫ��ȫ���ж�
  {
    if(
      ccd_group->CCD_AD_Value[20]>baizhi_Assi&&
     ccd_group->CCD_AD_Value[55]>baizhi_Assi&&
      ccd_group->CCD_AD_Value[63]>baizhi_Assi&&
        ccd_group->CCD_AD_Value[64]>baizhi_Assi&&
          ccd_group->CCD_AD_Value[70]>baizhi_Assi
     &&ccd_group->CCD_AD_Value[105]>baizhi_Assi
     )
    {
      black_num=0;
      for(j=0;j<=127;j++)
        ccd_group->ccd_value[j]=0;
      ccd_group->Black_Position = ccd_group->Black_Position_Last;
    }
    else
    {
      for(j=0;j<=127;j++)
        ccd_group->ccd_value[j]=1;
      ccd_group->Black_Position = ccd_group->Black_Position_Last;
    }
  }
    
  if((num_rise==1&&num_down==1))                                               //�������������ʣ�����ԭ֭
  {
    if((ccd_group->White_TO_Black[0]-ccd_group->Black_TO_White[0])<20)
    {
      black_num=127;
      ccd_group->Black_Position = ccd_group->Black_Position_Last;
    }
  }
  if((black_num>3&&black_num<90&&num_rise<=1&&num_down<=1))//||ZhuanTou_Flag==1  
  {
    total_weight=0;                       //������Ȩֵ֮�͵ı�������
    for(i = 4;i<124;i++)                   //�������м������Ȩֵ
    {
      if(ccd_group->ccd_value[i]==1)
        total_weight += tab[i];
    }
  
      //ccd_group->Black_Position=(total_weight/black_num);  //�����ƽ��Ȩֵ
      ccd_group->Black_Position = total_weight;
    
      ccd_group->Black_Position=(int)(ccd_group->Black_Position*0.9+ccd_group->Black_Position_Last*0.1);
  }
  
  if((ccd_group->Black_Position_Last<Weight_min&&ccd_group->Black_Position>Weight_max 
     ||ccd_group->Black_Position_Last>Weight_max&&ccd_group->Black_Position<Weight_min))
  {
    ccd_group->Black_Position = ccd_group->Black_Position_Last;
  }
  ccd_group->Black_Position_Last= ccd_group->Black_Position;
  
  ccd_group->Black_TO_White_His[0]=ccd_group->Black_TO_White_His[1];
  ccd_group->Black_TO_White_His[1]=ccd_group->Black_TO_White_His[2];
  ccd_group->Black_TO_White_His[2]=ccd_group->Black_TO_White_His[3];
  ccd_group->Black_TO_White_His[3]=ccd_group->Black_TO_White_His[4];
  ccd_group->Black_TO_White_His[4]=ccd_group->Black_TO_White_His[5];
  ccd_group->Black_TO_White_His[5]=ccd_group->Black_TO_White[0]; 
}

void Deal_Black(CCD_GROUP* ccd_group)
{
  int8u_t i=0, j=0, m=0;
  int8s_t k=0;

  Black_TO_White_Flag=0;
  White_TO_Black_Flag=0;
  num_rise=0;
  num_down=0;
  
   for(m=0;m<=3;m++)
   {
      ccd_group->Black_TO_White[m]=0;
      ccd_group->White_TO_Black[m]=0;
   }
   for(m=0;m<=127;m++)
   {
    ccd_group->ccd_value[m]=0; 
   }
   //    adֵΪ��Ļ����˲�
   for(k=0;k<=119;k++)
   {
     if(ccd_group->CCD_AD_Value[k+7]==0)
     {  
       ccd_group->CCD_AD_Value[k+7] = (ccd_group->CCD_AD_Value[k+6]/2 + ccd_group->CCD_AD_Value[k+8]/2);
     }
   }
   
   for(k=0;k<=107;k++) 
   {     
     ccd_group->CCD_k_Value[k]=(ccd_group->CCD_AD_Value[k+7] - ccd_group->CCD_AD_Value[k+13]);
   }
   
   CCD_k_max_Value = ccd_group->CCD_k_Value[0];
   CCD_k_min_Value = ccd_group->CCD_k_Value[107];
   for(k=0;k<=107;k++)
   {
     if(ccd_group->CCD_k_Value[k]>CCD_k_max_Value)
     {
       CCD_k_max_Value = ccd_group->CCD_k_Value[k];
     }
   }
   CCD_k_max_Value = CCD_k_max_Value/2;
   if(CCD_k_max_Value<ccd_group->Heave_limit)
     CCD_k_max_Value = ccd_group->Heave_limit;

   for(k=107;k>=0;k--)
   {
     if(ccd_group->CCD_k_Value[k]<CCD_k_min_Value)
     {
       CCD_k_min_Value = ccd_group->CCD_k_Value[k];
     }
   }
   CCD_k_min_Value = CCD_k_min_Value/2;
   
   if(CCD_k_min_Value>ccd_group->Groove_limit)
     CCD_k_min_Value = ccd_group->Groove_limit;
   
   //CCD������ֵ������
   for(i=10;i<=110;i++)                                                         //�ж�������
   {
     if((ccd_group->CCD_AD_Value[i] - ccd_group->CCD_AD_Value[i+6])<=CCD_k_min_Value&&
        (ccd_group->CCD_AD_Value[i+1] - ccd_group->CCD_AD_Value[i+7])<=CCD_k_min_Value&&
          (ccd_group->CCD_AD_Value[i+2] - ccd_group->CCD_AD_Value[i+8])<=CCD_k_min_Value&&
          Black_TO_White_Flag==0)
     {
       ccd_group->Black_TO_White[num_rise]=i+6;
       
       Sum_limit = 0;                                                           //����CCD_k_min_Value�����ֵ
       k = 0;
       for(j=i-7;j<=i+3;j++)
       {
         if(CCD_k_min_Value > ccd_group->CCD_k_Value[j])                          //����Ӧ����������С��CCD_k_min_Value��ֵ��ƽ��
         {
          Sum_limit = Sum_limit+ ccd_group->CCD_k_Value[j];
          k++;
         }
       }
       ccd_group->Groove_limit = Sum_limit/k/3;                                 //�����3 
       //�޷�����ֹ�𽥱䰵Groove_limit��С���ٰ������
       if(ccd_group->CCD_id == main_CCD)
       {
         if(ccd_group->Groove_limit>Autoadjust_min)                                             //��CCD����Ӧ�޷�
           ccd_group->Groove_limit = Autoadjust_min;
       }
         else if(ccd_group->CCD_id == Assi_CCD)
         { if(ccd_group->Groove_limit>ASSI_Autoadjust_min)                                             //����CCD����Ӧ�޷�
           ccd_group->Groove_limit = ASSI_Autoadjust_min;
         }
       if(num_down!=0)                                                 //�ڵ��׵�������ǰΪ�ڵ�
         for(j=ccd_group->White_TO_Black[num_down-1];j<=ccd_group->Black_TO_White[num_rise];j++)
         {
           ccd_group->ccd_value[j]=1;
         }
       else
         for(j=ccd_group->White_TO_Black[num_down];j<=ccd_group->Black_TO_White[num_rise];j++)
         {
           ccd_group->ccd_value[j]=1;
         }
         Black_TO_White_Flag=1;
         White_TO_Black_Flag=0;
         num_rise++;
         if(num_rise>3)
           num_rise=3;
      }
     //�ж��½���
     if((ccd_group->CCD_AD_Value[i]-ccd_group->CCD_AD_Value[i+6])>=CCD_k_max_Value&&
        (ccd_group->CCD_AD_Value[i+1]-ccd_group->CCD_AD_Value[i+7])>=CCD_k_max_Value&&
          (ccd_group->CCD_AD_Value[i+2]-ccd_group->CCD_AD_Value[i+8])>=CCD_k_max_Value&&
          White_TO_Black_Flag==0)
     {                                                                     //�׵��ڵ�������ǰ�ĵ�Ϊ�׵�
       ccd_group->White_TO_Black[num_down]=i+6;
       
       Sum_limit = 0;                                                       //����CCD_k_max_Value����С��ֵ
       k = 0;
       for(j=i-7;j<=i+2;j++)
       {
         if(CCD_k_max_Value<ccd_group->CCD_k_Value[j])                          //��Ӧ����������С��CCD_k_max_Value��ֵ��ƽ��
         {
           Sum_limit = Sum_limit+ ccd_group->CCD_k_Value[j];
           k++;
         }
       }
       ccd_group->Heave_limit = Sum_limit/k/3;                                  //�����3
       if(ccd_group->CCD_id == main_CCD)
       {
         if(ccd_group->Heave_limit<Autoadjust_max)                                             //��CCD����Ӧ�޷�
           ccd_group->Heave_limit = Autoadjust_max;
       }
       else if(ccd_group->CCD_id == Assi_CCD)
       {
         if(ccd_group->Heave_limit<ASSI_Autoadjust_max)                                             //����CCD����Ӧ�޷�
           ccd_group->Heave_limit = ASSI_Autoadjust_max;
       }
         
       if(num_rise!=0)
         for(j=ccd_group->Black_TO_White[num_rise-1] ;j<=ccd_group->White_TO_Black[num_down];j++)
         {
           ccd_group->ccd_value[j]=0;
         }
       else
         for(j=ccd_group->Black_TO_White[num_rise];j<=ccd_group->White_TO_Black[num_down];j++)
         {
           ccd_group->ccd_value[j]=0;
         } 
         num_down++;
         if(num_down>3)
           num_down=3;
         Black_TO_White_Flag=0;
         White_TO_Black_Flag=1;
     }
   }
   //���һ�������غ󲹵� ���� �������߳����е㣨���������
   if(White_TO_Black_Flag==1)                   
   {
     for(j=ccd_group->White_TO_Black[num_down-1];j<=127;j++)
     {
       ccd_group->ccd_value[j]=1;
     }
   }
   if(Black_TO_White_Flag==1)
   {
     {
       for(j=ccd_group->Black_TO_White[num_rise-1];j<=127;j++)
         ccd_group->ccd_value[j]=0;
     }
   }
/*****************���Ƿָ��ߣ��������Ǻڰ״�����������������***********************/
   if(ccd_group->CCD_id ==main_CCD)
   {
      Deal_MainCCD(&MAIN_CCD);
      //Judge_MainCCD(&MAIN_CCD);
   }
   else if(ccd_group->CCD_id ==Assi_CCD)
   {
     Deal_AssiCCD(&ASSI_CCD);
     //Judge_AssiCCD(&ASSI_CCD);
   }
   if(Whole_White_flag == 0)
   {
//     OFFBUZZER();
     ServePID.MeasuredValue = MAIN_CCD.Black_Position;
   }
   else
   {
//     ONBUZZER();
     ServePID.MeasuredValue = ASSI_CCD.Black_Position;
   }
}