#include "AllHeaders.h"
#include "math_car.h"

inline int16s_t abs_int16s(int16s_t num)
{
  if(num < 0)
    return (-num);
  else
    return num;
}


/*
inline int8u_t JudgeValid(int16s_t pointer, const int8u_t* edgeArr)
{
  int16s_t p_last, p_past, p_next, p_2nd;
  
  p_last = pointer - 1;
  if(p_last <0)
    p_last = EAGEARRLEN - 1;
  p_past = p_last - 1;
  if(p_past <0)
    p_past = EAGEARRLEN - 1;
  p_next = pointer + 1;
  if(p_next >= EAGEARRLEN)
    p_next = 0;
  p_2nd = p_next + 1;
  if(p_2nd >= EAGEARRLEN)
    p_2nd = 0;
  
  if(abs_int16s(edgeArr[pointer] - edgeArr[p_last]) < VALIDLIMIT
     &&abs_int16s(edgeArr[p_last] - edgeArr[p_past]) < VALIDLIMIT
       &&abs_int16s(edgeArr[pointer] - edgeArr[p_next]) < VALIDLIMIT
         &&abs_int16s(edgeArr[p_next] - edgeArr[p_2nd]) < VALIDLIMIT)
    return 1;
  else
    return 0;
}  */


/************************************************************************************************ 
* CalculateSlope
* ������С���˷���һ��ͼ���б��(*10��չ)
* ��ڲ���  x_start:��ʼ��2��(��һ����������е��±�)
            x_end:��ֹ����(���һ����������е��±�)
            y:��Ÿ�����������ֵ����(16λ����)
            Valid:��Ÿ�����Ч�Ա�־������(!!!8λ����) 
* ���ز���  ����б��(*10��չ)   
************************************************************************************************/
int16s_t CalculateSlope(int8u_t x_start ,int8u_t x_num ,const int8u_t *y,const int8u_t *valid)
{
  int16s_t n=0, num = 0;
  int32s_t x_sum=0;
  int32s_t y_sum=0;
  int32s_t xy_sum=0;
  int32s_t x2_sum=0;
  int32s_t tmp;                        
 
  if(x_num > EAGEARRLEN)
    x_num = EAGEARRLEN;
  for(;num<x_num;x_start++)
  {
    num++;
    if(x_start >= EAGEARRLEN)
      x_start = 0;
    if((valid[x_start] != 0)&&(y[x_start])) 
    {
      x_sum += x_start;
      y_sum += y[x_start];
      x2_sum += x_start*x_start;
      xy_sum += x_start*y[x_start];
      
      n++;
    }
  }
    
  
  tmp=n*x2_sum-x_sum*x_sum;
  if(tmp != 0)
  {
    return (int16s_t)(100*(n*xy_sum-x_sum*y_sum)/tmp); 
  }
  else
  {
    return 0;
  }
}
