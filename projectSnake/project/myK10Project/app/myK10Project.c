/**
 * --------------基于"拉普兰德K60底层库V3"的工程（myK10Project）-----------------
 * @file myK10Project.c
 * @version 0.0
 * @date 2013-9-29
 * @brief 关于该工程的描述
 *
 * 版权所有:北京拉普兰德电子技术有限公司
 * http://www.lpld.cn
 * mail:support@lpld.cn
 * 硬件平台:  LPLD K60 Card / LPLD K60 Nano
 *
 * 本工程基于"拉普兰德K60底层库V3"开发，
 * 所有开源代码均在"lib"文件夹下，用户不必更改该目录下代码，
 * 所有用户工程需保存在"project"文件夹下，以工程名定义文件夹名，
 * 底层库使用方法见相关文档。 
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


