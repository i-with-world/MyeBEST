/**
 * --------------����"��������K60�ײ��V3"�Ĺ��̣�myK10Project��-----------------
 * @file myK10Project.c
 * @version 0.0
 * @date 2013-9-29
 * @brief ���ڸù��̵�����
 *
 * ��Ȩ����:�����������µ��Ӽ������޹�˾
 * http://www.lpld.cn
 * mail:support@lpld.cn
 * Ӳ��ƽ̨:  LPLD K60 Card / LPLD K60 Nano
 *
 * �����̻���"��������K60�ײ��V3"������
 * ���п�Դ�������"lib"�ļ����£��û����ظ��ĸ�Ŀ¼�´��룬
 * �����û������豣����"project"�ļ����£��Թ����������ļ�������
 * �ײ��ʹ�÷���������ĵ��� 
 *
 */
#include "common.h"
#include "DEV_OLED.h"

void main (void)
{
  OLED_Init();
  OLED_Clear();
  
  while(1)
  {
<<<<<<< Updated upstream
//    OLED_WriteChar(0, 0, 'a', 0);
//    OLED_Refresh_Gram();
=======
    OLED_WriteChar(0, 0, 'a', 1);
    OLED_Refresh_Gram();
>>>>>>> Stashed changes
  }
}


