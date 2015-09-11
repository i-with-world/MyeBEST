///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      22/Jul/2015  10:59:28 /
// IAR ANSI C/C++ Compiler V6.30.6.23336/W32 EVALUATION for ARM               /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\dong\Desktop\7月20号最后+十字弯识别\SD_System\ /
//                    fat32txt.c                                              /
//    Command line =  C:\Users\dong\Desktop\7月20号最后+十字弯识别\SD_System\ /
//                    fat32txt.c -D IAR -lCN C:\Users\dong\Desktop\7月20号最� /
//                    �+十字弯识别\Flash_512K\List\ -lB                       /
//                    C:\Users\dong\Desktop\7月20号最后+十字弯识别\Flash_512K /
//                    \List\ -o C:\Users\dong\Desktop\7月20号最后+十字弯识别\ /
//                    Flash_512K\Obj\ --no_cse --no_unroll --no_inline        /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --char_is_signed --fpu=None          /
//                    --dlib_config "C:\Program Files\IAR Systems\Embedded    /
//                    Workbench 6.0 Evaluation\arm\INC\c\DLib_Config_Normal.h /
//                    " -I C:\Users\dong\Desktop\7月20号最后+十字弯识别\Libra /
//                    ry\CPU\ -I C:\Users\dong\Desktop\7月20号最后+十字弯识别 /
//                    \Library\Drivers\ADC\ -I C:\Users\dong\Desktop\7月20号� /
//                    詈�+十字弯识别\Library\Drivers\FTM\ -I                  /
//                    C:\Users\dong\Desktop\7月20号最后+十字弯识别\Library\Dr /
//                    ivers\GPIO\ -I C:\Users\dong\Desktop\7月20号最后+十字弯 /
//                    识别\Library\Drivers\PIT\ -I                            /
//                    C:\Users\dong\Desktop\7月20号最后+十字弯识别\Library\Dr /
//                    ivers\I2C\ -I C:\Users\dong\Desktop\7月20号最后+十字弯� /
//                    侗餦Library\Drivers\UART\ -I                            /
//                    C:\Users\dong\Desktop\7月20号最后+十字弯识别\Library\Dr /
//                    ivers\FTFL\ -I C:\Users\dong\Desktop\7月20号最后+十字弯 /
//                    识别\MyFunction\ -I C:\Users\dong\Desktop\7月20号最后+� /
//                    滞涫侗餦SD_System\ -I C:\Users\dong\Desktop\7月20号最 /
//                    后+十字弯识别\Delay\ -I C:\Users\dong\Desktop\7月20号最 /
//                    后+十字弯识别\System_Init\ -I                           /
//                    C:\Users\dong\Desktop\7月20号最后+十字弯识别\OLED\ -I   /
//                    C:\Users\dong\Desktop\7月20号最后+十字弯识别\ZLG7290\   /
//                    -I C:\Users\dong\Desktop\7月20号最后+十字弯识别\Simple_ /
//                    AD\ -I C:\Users\dong\Desktop\7月20号最后+十字弯识别\Mak /
//                    e_Desicion\ -I C:\Users\dong\Desktop\7月20号最后+十字弯 /
//                    识别\Make_Desicion\Judge_Way\ -I                        /
//                    C:\Users\dong\Desktop\7月20号最后+十字弯识别\Make_Desic /
//                    ion\Speed_Control\ -I C:\Users\dong\Desktop\7月20号最后 /
//                    +十字弯识别\Source\ -I C:\Users\dong\Desktop\7月20号最� /
//                    �+十字弯识别\Peripheral_Oparation\ -I                   /
//                    C:\Users\dong\Desktop\7月20号最后+十字弯识别\Balance_co /
//                    ntrol\ -Ol                                              /
//    List file    =  C:\Users\dong\Desktop\7月20号最后+十字弯识别\Flash_512K /
//                    \List\fat32txt.s                                        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME fat32txt

        #define SHT_PROGBITS 0x1

        EXTERN Bend_L_Num
        EXTERN Black_Tip_Flag
        EXTERN CloseSD
        EXTERN Flag_SDRdy
        EXTERN MAIN_CCD
        EXTERN ResureTip_Flag
        EXTERN SD_driver_Init
        EXTERN SetSD_High
        EXTERN SetSD_Low
        EXTERN Wait_SDRdy
        EXTERN __aeabi_memcpy4
        EXTERN flag_err_sd
        EXTERN sd_init
        EXTERN sd_initover
        EXTERN sd_readsingleblock
        EXTERN sd_writesingleblock
        EXTERN sd_yes

        PUBLIC SD_System_Init
        PUBLIC SD_System_Init_Ext
        PUBLIC fat32_init
        PUBLIC search_addr_sd
        PUBLIC search_fat
        PUBLIC test_sd
        PUBLIC write_SD
        PUBLIC write_dir
        PUBLIC write_fat
        PUBLIC write_stop
        PUBLIC writebyte_ram
        PUBLIC writeram_sd


        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "If you see these word...">`:
        DATA
        DC8 49H, 66H, 20H, 79H, 6FH, 75H, 20H, 73H
        DC8 65H, 65H, 20H, 74H, 68H, 65H, 73H, 65H
        DC8 20H, 77H, 6FH, 72H, 64H, 73H, 2CH, 20H
        DC8 79H, 6FH, 75H, 72H, 20H, 53H, 44H, 20H
        DC8 61H, 6EH, 64H, 20H, 68H, 61H, 72H, 64H
        DC8 77H, 61H, 72H, 65H, 20H, 69H, 73H, 20H
        DC8 4FH, 4BH, 21H, 0
// C:\Users\dong\Desktop\7月20号最后+十字弯识别\SD_System\fat32txt.c
//    1 /******************************************************************************
//    2 
//    3 * fat32txt.c
//    4 
//    5 * fat32文件系统操作（写单个大的TXT文件） 
//    6 
//    7 * 第一作者：  纪成   (第四届摄像头)
//    8   完善与整理：孙文健 (第六届摄像头)
//    9 * 版本：V1.15 (与V1.13、v1.14版相兼容,不使能双缓存时与V1.10之后的版本相兼容)
//   10 * 版本更新时间：2012年1月30日
//   11  
//   12 ******************************************************************************/
//   13 
//   14 #include "./SD_System.h"
//   15 #include "AllHeaders.h"                                
//   16 #ifdef EN_SD                 
//   17 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   18 static byte_sd const dir_sd[32]=                             /************By Sword************/
dir_sd:
        DATA
        DC8 65, 44, 123, 140, 78, 227, 78, 10, 78, 77, 79, 15, 0, 49, 58, 103
        DC8 46, 0, 108, 0, 110, 0, 107, 0, 0, 0, 0, 0, 255, 255, 255, 255
//   19 {
//   20 0x41,0x2c,0x7b,0x8c,0x4e,0xe3,0x4e,0x0a,0x4e,0x4d,0x4f,0x0f,0x00,0x31,0x3a,0x67,
//   21 0x2e,0x00,0x6c,0x00,0x6e,0x00,0x6b,0x00,0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff 
//   22 };
//   23 //卷标属性,当检测到根目录的第一个单元为空时写入该内容

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   24 static byte_sd const file_property[15]=
file_property:
        DATA
        DC8 32, 24, 0, 0, 0, 100, 59, 100, 59, 0, 0, 0, 0, 100, 59, 0
//   25 {0x20,0x18,0x00,0x00,0x00,0x64,0x3b,0x64,0x3b,0x00,0x00,0x00,0x00,0x64,0x3b};
//   26 //文件属性

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   27 static byte_sd  file_name[11]=                               /************By Sword************/
file_name:
        DATA
        DC8 67, 65, 82, 45, 45, 48, 48, 48, 84, 88, 84, 0
//   28 {'C','A','R','-','-','0','0','0',0x54,0x58,0x54};
//   29 //文件名称(含扩展名)
//   30 //注,英文字母必须大写，否则文件打不开！！！
//   31 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32 static dword_sd add_sta,add_dir,add_f1,add_f2;               /************By Sword************/
add_sta:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
add_dir:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
add_f1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
add_f2:
        DS8 4
//   33 //启动扇区、根目录、fat1、fat2的首地址（初始值）

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   34 static dword_sd p_datasector;      //数据扇区指针            /************By Sword************/
p_datasector:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   35 static word_sd  p_sector;  //扇区指针                        /************By Sword************/
p_sector:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   36 static dword_sd file_size=0;
file_size:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   37 static byte_sd  sector_cluster; //每扇区对应的簇数
sector_cluster:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   38 static dword_sd sector_sta;     //启动扇区扇区数
sector_sta:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   39 static dword_sd sector_fat;     //fat表扇区数
sector_fat:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   40 static word_sd  cluster_number,ram_number;
cluster_number:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
ram_number:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   41 static word_sd  cnt_cluster;
cnt_cluster:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   42 static word_sd  p_segcluster;     //簇组的指针
p_segcluster:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   43 static byte_sd  num_segcluster;   //当前簇组的长度
num_segcluster:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   44 static byte_sd  p_cluster;        //指向当前簇组中簇的位置的指针
p_cluster:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   45 static byte_sd  DBUF[512];        //定义512字节缓冲区
DBUF:
        DS8 512

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   46 static dword_sd  next_cluster[SD_MAX_segment]; 
next_cluster:
        DS8 160
//   47 //标记下一个簇组:低24位表示该簇组的起始地址,高8位表示簇的个数   
//   48 /************By Sword************/ 
//   49 
//   50 
//   51 #ifdef EN_SDbuf   //双缓冲模式
//   52 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   53 static byte_sd  DBUF2[512];   //SD卡第二缓冲区
DBUF2:
        DS8 512

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   54 static dword_sd Sector_SDbuf; //第二缓存中数据对应的目的扇区
Sector_SDbuf:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   55 static byte_sd  Stat_SDbuf;   //第二缓存状态标志(=0表示为空)
Stat_SDbuf:
        DS8 1
//   56 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   57 static byte_sd *pBuf_Now,*pBuf_2; //当前缓存与第二缓存指针
pBuf_Now:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
pBuf_2:
        DS8 4
//   58 /*
//   59 注意：将数据存入第二缓冲的过程并不是将数据复制过去,
//   60 而是交换两个缓冲区的指针,从而可以大大加快程序执行速度
//   61 */
//   62 
//   63 #ifdef EN_Cnt_SDbuf
//   64 word_sd Cnt_SDbufS1,Cnt_SDbufS2,Cnt_SDbufS3,Cnt_SDbufS4,Cnt_SDbufS5;
//   65 /*缓存使用状况统计变量*/
//   66 /*
//   67 Cnt_SDbufS1:正常情况的数量(SD卡非忙,缓存为空)
//   68 Cnt_SDbufS2:SD卡非忙,缓存非空,且写入缓存后可继续写入新数据
//   69 Cnt_SDbufS3:SD卡非忙,缓存非空,但写入缓存后等待超时,不能继续写入新数据
//   70 Cnt_SDbufS4:SD卡忙,但缓存为空,可以将新数据存入缓存
//   71 Cnt_SDbufS5:SD卡忙,且缓存非空,只能干等
//   72 */
//   73 #endif
//   74 
//   75 /***********************************************************
//   76 * function:SD_WriteBlock_UserBuf
//   77 * description:sd卡双缓冲读写函数
//   78 ************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   79 static byte_sd SD_WriteBlock_UserBuf(void)
//   80 {
SD_WriteBlock_UserBuf:
        PUSH     {R3-R5,LR}
//   81   byte_sd r1=0,retry;
        MOVS     R4,#+0
//   82   byte_sd *pTmp;
//   83   
//   84   Wait_SDRdy(SD_SHORT_Wait);
        MOVW     R0,#+5000
        BL       Wait_SDRdy
//   85   if(Flag_SDRdy == 0)
        LDR.W    R0,??DataTable7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SD_WriteBlock_UserBuf_0
//   86   { //SD卡忙
//   87     if(Stat_SDbuf == 0)
        LDR.W    R0,??DataTable7_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SD_WriteBlock_UserBuf_1
//   88     { //缓存为空
//   89     //将数据先存入缓存(所谓存入就是交换两个缓存的指针)
//   90       pTmp=pBuf_Now;
        LDR.W    R0,??DataTable9
        LDR      R0,[R0, #+0]
//   91       pBuf_Now=pBuf_2;
        LDR.W    R1,??DataTable9
        LDR.W    R2,??DataTable7_2
        LDR      R2,[R2, #+0]
        STR      R2,[R1, #+0]
//   92       pBuf_2=pTmp;
        LDR.W    R1,??DataTable7_2
        STR      R0,[R1, #+0]
//   93       Sector_SDbuf=p_datasector;
        LDR.W    R0,??DataTable7_3
        LDR.W    R1,??DataTable10
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//   94       Stat_SDbuf=1; //置位缓存标志
        LDR.W    R0,??DataTable7_1
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        B.N      ??SD_WriteBlock_UserBuf_2
//   95 #ifdef EN_Cnt_SDbuf      
//   96       Cnt_SDbufS4++;
//   97 #endif
//   98     }
//   99     else
//  100     { //缓存非空(最无语的情况,目前的算法没有办法优化)
//  101     //缓存非空,只能干等  
//  102       Wait_SDRdy(SD_LONG_Wait);
??SD_WriteBlock_UserBuf_1:
        LDR.W    R0,??DataTable7_4  ;; 0x1e8480
        BL       Wait_SDRdy
//  103       retry=0;
        MOVS     R5,#+0
//  104       do //将缓存中存的数据写入SD卡
//  105       {  
//  106         r1=sd_writesingleblock(pBuf_2,Sector_SDbuf);
??SD_WriteBlock_UserBuf_3:
        LDR.W    R0,??DataTable7_3
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_2
        LDR      R0,[R0, #+0]
        BL       sd_writesingleblock
        MOVS     R4,R0
//  107       } while(r1!=0 && (++retry)<3);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SD_WriteBlock_UserBuf_4
        ADDS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BCC.N    ??SD_WriteBlock_UserBuf_3
//  108     //将数据再存入缓存
//  109       pTmp=pBuf_Now;
??SD_WriteBlock_UserBuf_4:
        LDR.W    R0,??DataTable9
        LDR      R0,[R0, #+0]
//  110       pBuf_Now=pBuf_2;
        LDR.W    R1,??DataTable9
        LDR.W    R2,??DataTable7_2
        LDR      R2,[R2, #+0]
        STR      R2,[R1, #+0]
//  111       pBuf_2=pTmp;
        LDR.W    R1,??DataTable7_2
        STR      R0,[R1, #+0]
//  112       Sector_SDbuf=p_datasector;
        LDR.W    R0,??DataTable7_3
        LDR.W    R1,??DataTable10
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
        B.N      ??SD_WriteBlock_UserBuf_2
//  113 #ifdef EN_Cnt_SDbuf   
//  114       Cnt_SDbufS5++;
//  115 #endif      
//  116     }
//  117   }
//  118   else
//  119   { //SD卡非忙
//  120     if(Stat_SDbuf == 0)
??SD_WriteBlock_UserBuf_0:
        LDR.W    R0,??DataTable7_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SD_WriteBlock_UserBuf_5
//  121     { //缓存为空(最理想的状况)
//  122       retry=0;
        MOVS     R5,#+0
//  123       do //将数据写入SD卡
//  124       {  
//  125         r1=sd_writesingleblock(pBuf_Now,p_datasector);
??SD_WriteBlock_UserBuf_6:
        LDR.W    R0,??DataTable10
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable9
        LDR      R0,[R0, #+0]
        BL       sd_writesingleblock
        MOVS     R4,R0
//  126       } while(r1!=0 && (++retry)<3);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SD_WriteBlock_UserBuf_2
        ADDS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BCC.N    ??SD_WriteBlock_UserBuf_6
        B.N      ??SD_WriteBlock_UserBuf_2
//  127 #ifdef EN_Cnt_SDbuf      
//  128       Cnt_SDbufS1++;
//  129 #endif
//  130     }
//  131     else
//  132     { //缓存非空
//  133       retry=0;
??SD_WriteBlock_UserBuf_5:
        MOVS     R5,#+0
//  134       do //将缓存中存的数据写入SD卡
//  135       {  
//  136         r1=sd_writesingleblock(pBuf_2,Sector_SDbuf);
??SD_WriteBlock_UserBuf_7:
        LDR.W    R0,??DataTable7_3
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_2
        LDR      R0,[R0, #+0]
        BL       sd_writesingleblock
        MOVS     R4,R0
//  137       } while(r1!=0 && (++retry)<3);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SD_WriteBlock_UserBuf_8
        ADDS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BCC.N    ??SD_WriteBlock_UserBuf_7
//  138      //写完缓存中数据进行极短时间的等待,根据等待后的结果判定是否写入新数据
//  139       Wait_SDRdy(SD_VST_Wait);
??SD_WriteBlock_UserBuf_8:
        MOV      R0,#+4000
        BL       Wait_SDRdy
//  140       if(Flag_SDRdy == 0)
        LDR.W    R0,??DataTable7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SD_WriteBlock_UserBuf_9
//  141       { //SD卡忙
//  142       //将数据再存入缓存
//  143         pTmp=pBuf_Now;
        LDR.W    R0,??DataTable9
        LDR      R0,[R0, #+0]
//  144         pBuf_Now=pBuf_2;
        LDR.W    R1,??DataTable9
        LDR.W    R2,??DataTable7_2
        LDR      R2,[R2, #+0]
        STR      R2,[R1, #+0]
//  145         pBuf_2=pTmp;
        LDR.W    R1,??DataTable7_2
        STR      R0,[R1, #+0]
//  146         Sector_SDbuf=p_datasector;
        LDR.W    R0,??DataTable7_3
        LDR.W    R1,??DataTable10
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
        B.N      ??SD_WriteBlock_UserBuf_2
//  147 #ifdef EN_Cnt_SDbuf        
//  148         Cnt_SDbufS3++;
//  149 #endif
//  150       }
//  151       else
//  152       { //SD卡非忙
//  153       //缓存终于解脱了,进入正常情况
//  154         Stat_SDbuf=0; //清除缓存标志
??SD_WriteBlock_UserBuf_9:
        LDR.W    R0,??DataTable7_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  155         retry=0;
        MOVS     R5,#+0
//  156         do //将数据写入SD卡
//  157         {  
//  158           r1=sd_writesingleblock(pBuf_Now,p_datasector);
??SD_WriteBlock_UserBuf_10:
        LDR.W    R0,??DataTable10
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable9
        LDR      R0,[R0, #+0]
        BL       sd_writesingleblock
        MOVS     R4,R0
//  159         } while(r1!=0 && (++retry)<3);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SD_WriteBlock_UserBuf_2
        ADDS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BCC.N    ??SD_WriteBlock_UserBuf_10
//  160 #ifdef EN_Cnt_SDbuf        
//  161         Cnt_SDbufS2++;
//  162 #endif
//  163       }
//  164     }
//  165   }
//  166   
//  167   return r1;
??SD_WriteBlock_UserBuf_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//  168 }
//  169 /***********************************************************
//  170 * function:SD_ClrBuf
//  171 * description:清空缓存中数据(将缓存中数据写入SD卡)
//  172 ************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  173 static void SD_ClrBuf(void)
//  174 {
SD_ClrBuf:
        PUSH     {R4,LR}
//  175   byte_sd r1=0,retry=0;
        MOVS     R0,#+0
        MOVS     R4,#+0
//  176   
//  177   if(Stat_SDbuf != 0)
        LDR.W    R1,??DataTable7_1
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??SD_ClrBuf_0
//  178   {
//  179     Wait_SDRdy(SD_LONG_Wait);
        LDR.W    R0,??DataTable7_4  ;; 0x1e8480
        BL       Wait_SDRdy
//  180     do //将缓存中存的数据写入SD卡
//  181     {  
//  182       r1=sd_writesingleblock(pBuf_2,Sector_SDbuf);
??SD_ClrBuf_1:
        LDR.W    R0,??DataTable7_3
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_2
        LDR      R0,[R0, #+0]
        BL       sd_writesingleblock
//  183     } while(r1!=0 && (++retry)<5);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SD_ClrBuf_2
        ADDS     R4,R4,#+1
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BCC.N    ??SD_ClrBuf_1
//  184     Stat_SDbuf=0; //清除缓存标志
??SD_ClrBuf_2:
        LDR.W    R0,??DataTable7_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  185   }
//  186 }
??SD_ClrBuf_0:
        POP      {R4,PC}          ;; return
//  187 
//  188 #endif
//  189 /*********************************************************/
//  190 //function:write_dir
//  191 //description:写根目录函数
//  192 //修改： Sword
//  193 /***********************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  194 void write_dir(void)
//  195 {
write_dir:
        PUSH     {R4-R8,LR}
//  196   word_sd i=0,j,k,flag,retry=0;
        MOVS     R4,#+0
        MOVS     R5,#+0
//  197   word_sd h_add,l_add,sum;
//  198   word_sd addr=0,addh=0,max=0;
        MOVS     R7,#+0
        MOVS     R6,#+0
        MOVS     R8,#+0
//  199   byte_sd r1;
//  200   
//  201   do     //看根目录的第一个单元(卷标)是否为空
//  202    {
//  203      r1=sd_readsingleblock(DBUF,add_dir);
??write_dir_0:
        LDR.W    R0,??DataTable9_1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable12
        BL       sd_readsingleblock
//  204      C_WDOG();
        CPSID i          
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??write_dir_1
        CPSIE i          
//  205      retry++;
??write_dir_1:
        ADDS     R5,R5,#+1
//  206    } while(r1!=0x00&&retry<100);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??write_dir_2
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+100
        BCC.N    ??write_dir_0
//  207   retry=0;
??write_dir_2:
        MOVS     R5,#+0
//  208   
//  209   if(DBUF[0]==0x00)   //如果根目录第一个单元为空则写入卷标
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??write_dir_3
//  210    {
//  211      for(i=0;i<32;i++) DBUF[i]=dir_sd[i];
        MOVS     R4,#+0
        B.N      ??write_dir_4
??write_dir_5:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LDR.W    R0,??DataTable12
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LDR.W    R1,??DataTable9_4
        LDRB     R1,[R4, R1]
        STRB     R1,[R4, R0]
        ADDS     R4,R4,#+1
??write_dir_4:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+32
        BCC.N    ??write_dir_5
//  212      while(sd_writesingleblock(DBUF,add_dir)&&retry<1000) //写卷标
??write_dir_6:
        LDR.W    R0,??DataTable9_1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable12
        BL       sd_writesingleblock
        CMP      R0,#+0
        BEQ.N    ??write_dir_3
        MOV      R0,#+1000
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BCS.N    ??write_dir_3
//  213       {                            
//  214         C_WDOG(); //清开门狗 
        CPSID i          
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_dir_7
        CPSIE i          
//  215         retry++;
??write_dir_7:
        ADDS     R5,R5,#+1
        B.N      ??write_dir_6
//  216       } 
//  217    }
//  218   
//  219   for(i=0;i<sector_cluster;i++)
??write_dir_3:
        MOVS     R4,#+0
        B.N      ??write_dir_8
??write_dir_9:
        ADDS     R4,R4,#+1
??write_dir_8:
        LDR.W    R0,??DataTable9_5
        LDRB     R0,[R0, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R4,R0
        BCS.W    ??write_dir_10
//  220    { 
//  221      do     //先读根目录再改写,从而保证不会更改原来的文件
//  222       {
//  223         r1=sd_readsingleblock(DBUF,add_dir+i);
??write_dir_11:
        LDR.W    R0,??DataTable9_1
        LDR      R0,[R0, #+0]
        UXTAH    R1,R0,R4
        LDR.W    R0,??DataTable12
        BL       sd_readsingleblock
//  224         C_WDOG();
        CPSID i          
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??write_dir_12
        CPSIE i          
//  225         retry++;
??write_dir_12:
        ADDS     R5,R5,#+1
//  226       } while(r1!=0x00&&retry<100);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??write_dir_13
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+100
        BCC.N    ??write_dir_11
//  227      retry=0;
??write_dir_13:
        MOVS     R5,#+0
//  228     
//  229      for(k=0;k<512;k+=32)
        MOVS     R0,#+0
        B.N      ??write_dir_14
//  230       {
//  231        
//  232         if(addr==0&&addh==0&&DBUF[k]==0x00||DBUF[k]==0xE5) 
//  233          { addh=i;addr=k; }  //寻找一个空白的32字节区间
//  234        
//  235         for(j=0,flag=1;j<5;j++)  //决策文件序号
//  236           if(DBUF[k+j]!=file_name[j]) flag=0;
//  237         if(flag)
//  238          {
//  239            if(DBUF[k+5]>'9'||DBUF[k+5]<'0') continue;
//  240            if(DBUF[k+6]>'9'||DBUF[k+6]<'0') continue;
//  241            if(DBUF[k+7]>'9'||DBUF[k+7]<'0') continue;
//  242            sum=(DBUF[k+7]-'0')+(DBUF[k+6]-'0')*10+(DBUF[k+5]-'0')*100;
??write_dir_15:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #+7]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R2,??DataTable12
        ADDS     R2,R0,R2
        LDRB     R2,[R2, #+6]
        MOVS     R3,#+10
        MULS     R2,R3,R2
        UXTAB    R1,R2,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R2,??DataTable12
        ADDS     R2,R0,R2
        LDRB     R2,[R2, #+5]
        MOVS     R3,#+100
        MLA      R1,R3,R2,R1
        MOVW     R2,#+5328
        SUBS     R1,R1,R2
//  243            if(sum>max) max=sum;
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R8,R1
        BCS.N    ??write_dir_16
        MOV      R8,R1
??write_dir_16:
        ADDS     R0,R0,#+32
??write_dir_14:
        MOV      R1,#+512
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BCS.N    ??write_dir_9
        ORRS     R1,R6,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BNE.N    ??write_dir_17
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        LDRB     R1,[R0, R1]
        CMP      R1,#+0
        BEQ.N    ??write_dir_18
??write_dir_17:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        LDRB     R1,[R0, R1]
        CMP      R1,#+229
        BNE.N    ??write_dir_19
??write_dir_18:
        MOVS     R6,R4
        MOVS     R7,R0
??write_dir_19:
        MOVS     R1,#+0
        MOVS     R2,#+1
        B.N      ??write_dir_20
??write_dir_21:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTAH    R3,R1,R0
        LDR.W    R12,??DataTable12
        LDRB     R3,[R3, R12]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R12,??DataTable11
        LDRB     R12,[R1, R12]
        CMP      R3,R12
        BEQ.N    ??write_dir_22
        MOVS     R2,#+0
??write_dir_22:
        ADDS     R1,R1,#+1
??write_dir_20:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+5
        BCC.N    ??write_dir_21
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BEQ.N    ??write_dir_16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #+5]
        SUBS     R1,R1,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+10
        BCS.N    ??write_dir_16
??write_dir_23:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #+6]
        SUBS     R1,R1,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+10
        BCS.N    ??write_dir_16
??write_dir_24:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #+7]
        SUBS     R1,R1,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+10
        BCC.N    ??write_dir_15
        B.N      ??write_dir_16
//  244          }
//  245       }
//  246    }
//  247   
//  248   if(addh==0&&addr==0)
??write_dir_10:
        ORRS     R0,R7,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??write_dir_25
//  249    {     //没有在根目录找到空闲位置
//  250      CloseSD();
        BL       CloseSD
//  251      return;
        B.N      ??write_dir_26
//  252    }
//  253   
//  254   do     //先读根目录再改写,从而保证不会更改原来的文件
//  255    {
//  256      r1=sd_readsingleblock(DBUF,add_dir+addh);
??write_dir_25:
        LDR.W    R0,??DataTable9_1
        LDR      R0,[R0, #+0]
        UXTAH    R1,R0,R6
        LDR.W    R0,??DataTable12
        BL       sd_readsingleblock
//  257      C_WDOG();
        CPSID i          
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??write_dir_27
        CPSIE i          
//  258      retry++;
??write_dir_27:
        ADDS     R5,R5,#+1
//  259    } while(r1!=0x00&&retry<100);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??write_dir_28
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+100
        BCC.N    ??write_dir_25
//  260   retry=0; 
??write_dir_28:
        MOVS     R5,#+0
//  261    
//  262   file_name[7]=(max+1)%10+'0';   //生成文件名
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        ADDS     R0,R8,#+1
        MOVS     R1,#+10
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+48
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+7]
//  263   file_name[6]=(max+1)/10%10+'0'; 
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        ADDS     R0,R8,#+1
        MOVS     R1,#+10
        SDIV     R0,R0,R1
        MOVS     R1,#+10
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+48
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+6]
//  264   file_name[5]=(max+1)/100+'0';
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        ADDS     R0,R8,#+1
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+48
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+5]
//  265 
//  266   h_add=(next_cluster[0]&0x00FF0000)>>16;
        LDR.W    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+16
        UXTB     R2,R0            ;; ZeroExt  R2,R0,#+24,#+24
//  267   l_add=next_cluster[0]&0x0000FFFF;   
        LDR.W    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
//  268   
//  269   for(i=0,j=0;i<11;i++,j++)
        MOVS     R4,#+0
        MOVS     R1,#+0
        B.N      ??write_dir_29
//  270    {
//  271      DBUF[addr+i]=file_name[j];    //文件名
??write_dir_30:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTAH    R2,R4,R7
        LDR.W    R3,??DataTable12
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R12,??DataTable11
        LDRB     R12,[R1, R12]
        STRB     R12,[R2, R3]
//  272    }
        ADDS     R4,R4,#+1
        ADDS     R1,R1,#+1
??write_dir_29:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+11
        BCC.N    ??write_dir_30
//  273   for(j=0;i<26;i++,j++)
        MOVS     R1,#+0
        B.N      ??write_dir_31
//  274    {
//  275      DBUF[addr+i]=file_property[j];         //文件属性
??write_dir_32:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTAH    R2,R4,R7
        LDR.W    R3,??DataTable12
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R12,??DataTable12_2
        LDRB     R12,[R1, R12]
        STRB     R12,[R2, R3]
//  276    }
        ADDS     R4,R4,#+1
        ADDS     R1,R1,#+1
??write_dir_31:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+26
        BCC.N    ??write_dir_32
//  277   DBUF[addr+26]=(byte_sd)(l_add&0x00FF);      //写入文件起始簇的低16位
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R7,R1
        STRB     R0,[R1, #+26]
//  278   DBUF[addr+27]=(byte_sd)((l_add>>8)&0x00FF);  
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR.W    R1,??DataTable12
        ADDS     R1,R7,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R1, #+27]
//  279     
//  280   file_size=ram_number+(((dword_sd)(cnt_cluster*sector_cluster+p_sector))<<9L);
        LDR.W    R0,??DataTable12_3
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable12_4
        LDRH     R1,[R1, #+0]
        LDR.W    R2,??DataTable9_5
        LDRB     R2,[R2, #+0]
        MULS     R1,R2,R1
        LDR.W    R2,??DataTable12_5
        LDRH     R2,[R2, #+0]
        UXTAH    R1,R1,R2
        LSLS     R1,R1,#+9
        UXTAH    R0,R1,R0
        LDR.W    R1,??DataTable12_6
        STR      R0,[R1, #+0]
//  281   if(ram_number!=0) file_size-=512; 
        LDR.W    R0,??DataTable12_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_dir_33
        LDR.W    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+512
        LDR.W    R1,??DataTable12_6
        STR      R0,[R1, #+0]
//  282   DBUF[addr+28]=(byte_sd)(file_size&0x000000ff);        //文件大小
??write_dir_33:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR.W    R0,??DataTable12
        ADDS     R0,R7,R0
        LDR.W    R1,??DataTable12_6
        LDR      R1,[R1, #+0]
        STRB     R1,[R0, #+28]
//  283   DBUF[addr+29]=(byte_sd)((file_size&0x0000ff00)>>8);
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR.W    R0,??DataTable12
        ADDS     R0,R7,R0
        LDR.W    R1,??DataTable12_6
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+8
        STRB     R1,[R0, #+29]
//  284   DBUF[addr+30]=(byte_sd)((file_size&0x00ff0000)>>16);
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR.W    R0,??DataTable12
        ADDS     R0,R7,R0
        LDR.W    R1,??DataTable12_6
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+16
        STRB     R1,[R0, #+30]
//  285   DBUF[addr+31]=(byte_sd)((file_size&0xff000000)>>24);
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR.W    R0,??DataTable12
        ADDS     R0,R7,R0
        LDR.W    R1,??DataTable12_6
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+24
        STRB     R1,[R0, #+31]
        B.N      ??write_dir_34
//  286 
//  287   while(sd_writesingleblock(DBUF,add_dir+addh)&&retry<1000) //写根目录
//  288    {
//  289      C_WDOG(); //清开门狗 
??write_dir_35:
        CPSID i          
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_dir_36
        CPSIE i          
//  290      retry++;
??write_dir_36:
        ADDS     R5,R5,#+1
//  291    }
??write_dir_34:
        LDR.W    R0,??DataTable9_1
        LDR      R0,[R0, #+0]
        UXTAH    R1,R0,R6
        LDR.W    R0,??DataTable12
        BL       sd_writesingleblock
        CMP      R0,#+0
        BEQ.N    ??write_dir_37
        MOV      R0,#+1000
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BCC.N    ??write_dir_35
//  292 }
??write_dir_37:
??write_dir_26:
        POP      {R4-R8,PC}       ;; return
//  293 /***********************************************************************/
//  294 //function:write_fat
//  295 //description:写SD卡的fat1，fat2表(算法很复杂，须仔细思考分析)
//  296 //修改： Sword
//  297 /***********************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  298 void write_fat(void)
//  299 {
write_fat:
        PUSH     {R4-R10,LR}
//  300   dword_sd sector=0,cluster;        
        MOVS     R7,#+0
//  301   word_sd  i=0,p,retry=0,num,k,j;
        MOVS     R6,#+0
        MOVS     R8,#+0
//  302   byte_sd  r1;
//  303                                        
//  304   num=cnt_cluster;
        LDR.W    R0,??DataTable12_4
        LDRH     R5,[R0, #+0]
//  305   if(p_sector!=0) num++;
        LDR.W    R0,??DataTable12_5
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_fat_0
        ADDS     R5,R5,#+1
//  306   
//  307   k=j=0;
??write_fat_0:
        MOVS     R9,#+0
        MOV      R4,R9
//  308   num_segcluster=(next_cluster[0]&0xFF000000)>>24;
        LDR.W    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+24
        LDR.W    R1,??DataTable13
        STRB     R0,[R1, #+0]
//  309   cluster=next_cluster[0]&0x00FFFFFF;
        LDR.W    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        LSLS     R10,R0,#+8       ;; ZeroExtS R10,R0,#+8,#+8
        LSRS     R10,R10,#+8
//  310   
//  311   for(i=0;i<num;i++)
        MOVS     R6,#+0
        B.N      ??write_fat_1
//  312    {
//  313      if((cluster>>7)!=sector||i==0)
//  314       { 
//  315         if(i!=0) 
//  316          {  //写fat表
//  317            while(sd_writesingleblock(DBUF,add_f1+sector)&&(retry<1000))
//  318             {
//  319                C_WDOG(); //清开门狗 
//  320                retry++;
//  321             }
//  322            retry=0;
//  323            while(sd_writesingleblock(DBUF,add_f2+sector)&&(retry<1000)) 
//  324             {
//  325               C_WDOG(); //清开门狗 
//  326               retry++;
//  327             }
//  328            retry=0;
//  329          }
//  330       
//  331         sector=(cluster>>7);
//  332         
//  333         do     //先读再把用到的新簇改写,从而保证不会更改原来的文件
//  334          {
//  335            r1=sd_readsingleblock(DBUF,add_f1+sector);
//  336            C_WDOG();
//  337            retry++;
//  338          } while(r1!=0x00&&retry<100);
//  339         retry=0;
//  340       }
//  341      
//  342      p=((cluster&0x007F)<<2);      //找到当前簇对应的FAT表的位置
//  343      
//  344      j++;        //找到下一个有用簇
//  345      if(j==num_segcluster)
//  346       {
//  347         j=0;
//  348         num_segcluster=(next_cluster[++k]&0xFF000000)>>24;
//  349         cluster=next_cluster[k]&0x00FFFFFF; 
//  350       }
//  351      else
//  352       {
//  353         cluster++;
//  354       }
//  355      
//  356      DBUF[p]=(byte_sd)(cluster&0x00FF); //写入文件的下一个簇
//  357      DBUF[p+1]=(byte_sd)((cluster>>8)&0x00FF);
//  358      DBUF[p+2]=(byte_sd)((cluster>>16)&0x00FF);
//  359      
//  360      if(i==(num-1))
//  361       {
//  362         DBUF[p]=0xff;
//  363         DBUF[p+1]=0xff;
//  364         DBUF[p+2]=0xff;
//  365         DBUF[p+3]=0x0f;
//  366         while(sd_writesingleblock(DBUF,add_f1+sector)&&(retry<1000))
//  367          {
//  368             C_WDOG(); //清开门狗 
//  369             retry++;
//  370          }
//  371         retry=0;
//  372         while(sd_writesingleblock(DBUF,add_f2+sector)&&(retry<1000)) 
//  373          {
//  374            C_WDOG(); //清开门狗 
??write_fat_2:
        CPSID i          
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_fat_3
        CPSIE i          
//  375            retry++;
??write_fat_3:
        ADDS     R8,R8,#+1
//  376          }
??write_fat_4:
        LDR.W    R0,??DataTable13_1
        LDR      R0,[R0, #+0]
        ADDS     R1,R7,R0
        LDR.W    R0,??DataTable13_2
        BL       sd_writesingleblock
        CMP      R0,#+0
        BEQ.N    ??write_fat_5
        MOV      R0,#+1000
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,R0
        BCC.N    ??write_fat_2
//  377         retry=0;
??write_fat_5:
        MOVS     R8,#+0
??write_fat_6:
        ADDS     R6,R6,#+1
??write_fat_1:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R6,R5
        BCS.W    ??write_fat_7
        LSRS     R0,R10,#+7
        CMP      R0,R7
        BNE.N    ??write_fat_8
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BNE.N    ??write_fat_9
??write_fat_8:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BNE.N    ??write_fat_10
        B.N      ??write_fat_11
??write_fat_12:
        CPSID i          
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_fat_13
        CPSIE i          
??write_fat_13:
        ADDS     R8,R8,#+1
??write_fat_10:
        LDR.W    R0,??DataTable13_3
        LDR      R0,[R0, #+0]
        ADDS     R1,R7,R0
        LDR.W    R0,??DataTable13_2
        BL       sd_writesingleblock
        CMP      R0,#+0
        BEQ.N    ??write_fat_14
        MOV      R0,#+1000
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,R0
        BCC.N    ??write_fat_12
??write_fat_14:
        MOVS     R8,#+0
        B.N      ??write_fat_15
??write_fat_16:
        CPSID i          
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_fat_17
        CPSIE i          
??write_fat_17:
        ADDS     R8,R8,#+1
??write_fat_15:
        LDR.W    R0,??DataTable13_1
        LDR      R0,[R0, #+0]
        ADDS     R1,R7,R0
        LDR.W    R0,??DataTable13_2
        BL       sd_writesingleblock
        CMP      R0,#+0
        BEQ.N    ??write_fat_18
        MOV      R0,#+1000
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,R0
        BCC.N    ??write_fat_16
??write_fat_18:
        MOVS     R8,#+0
??write_fat_11:
        LSRS     R7,R10,#+7
??write_fat_19:
        LDR.W    R0,??DataTable13_3
        LDR      R0,[R0, #+0]
        ADDS     R1,R7,R0
        LDR.W    R0,??DataTable13_2
        BL       sd_readsingleblock
        CPSID i          
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??write_fat_20
        CPSIE i          
??write_fat_20:
        ADDS     R8,R8,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??write_fat_21
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+100
        BCC.N    ??write_fat_19
??write_fat_21:
        MOVS     R8,#+0
??write_fat_9:
        ANDS     R0,R10,#0x7F
        LSLS     R0,R0,#+2
        ADDS     R4,R4,#+1
        LDR.W    R1,??DataTable13
        LDRB     R1,[R1, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R4,R1
        BNE.N    ??write_fat_22
        MOVS     R4,#+0
        ADDS     R1,R9,#+1
        MOV      R9,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R2,??DataTable12_1
        LDR      R1,[R2, R1, LSL #+2]
        LSRS     R1,R1,#+24
        LDR.W    R2,??DataTable13
        STRB     R1,[R2, #+0]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LDR.W    R1,??DataTable12_1
        LDR      R1,[R1, R9, LSL #+2]
        LSLS     R10,R1,#+8       ;; ZeroExtS R10,R1,#+8,#+8
        LSRS     R10,R10,#+8
        B.N      ??write_fat_23
??write_fat_22:
        ADDS     R10,R10,#+1
??write_fat_23:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable13_2
        STRB     R10,[R0, R1]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable13_2
        ADDS     R1,R0,R1
        LSRS     R2,R10,#+8
        STRB     R2,[R1, #+1]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable13_2
        ADDS     R1,R0,R1
        LSRS     R2,R10,#+16
        STRB     R2,[R1, #+2]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        SUBS     R1,R5,#+1
        CMP      R6,R1
        BNE.W    ??write_fat_6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable13_2
        MOVS     R2,#+255
        STRB     R2,[R0, R1]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable13_2
        ADDS     R1,R0,R1
        MOVS     R2,#+255
        STRB     R2,[R1, #+1]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable13_2
        ADDS     R1,R0,R1
        MOVS     R2,#+255
        STRB     R2,[R1, #+2]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable13_2
        ADDS     R0,R0,R1
        MOVS     R1,#+15
        STRB     R1,[R0, #+3]
        B.N      ??write_fat_24
??write_fat_25:
        CPSID i          
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_fat_26
        CPSIE i          
??write_fat_26:
        ADDS     R8,R8,#+1
??write_fat_24:
        LDR.W    R0,??DataTable13_3
        LDR      R0,[R0, #+0]
        ADDS     R1,R7,R0
        LDR.W    R0,??DataTable13_2
        BL       sd_writesingleblock
        CMP      R0,#+0
        BEQ.N    ??write_fat_27
        MOV      R0,#+1000
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,R0
        BCC.N    ??write_fat_25
??write_fat_27:
        MOVS     R8,#+0
        B.N      ??write_fat_4
//  378       }
//  379    }
//  380 }
??write_fat_7:
        POP      {R4-R10,PC}      ;; return
//  381 
//  382 /*********************************************************/
//  383 //function:writeram_sd
//  384 //description:写ram512字节数据到sd卡扇区函数
//  385 //修改： Sword
//  386 /***********************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  387 void writeram_sd(void)
//  388 {
writeram_sd:
        PUSH     {R4,LR}
//  389   word_sd retry=0;
        MOVS     R4,#+0
        B.N      ??writeram_sd_0
//  390 #ifdef EN_SDbuf
//  391   while(SD_WriteBlock_UserBuf()&&(retry<300)) 
//  392    {
//  393      C_WDOG(); //清开门狗 
??writeram_sd_1:
        CPSID i          
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_2  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??writeram_sd_2
        CPSIE i          
//  394      retry++;
??writeram_sd_2:
        ADDS     R4,R4,#+1
//  395    }
??writeram_sd_0:
        BL       SD_WriteBlock_UserBuf
        CMP      R0,#+0
        BEQ.N    ??writeram_sd_3
        MOV      R0,#+300
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,R0
        BCC.N    ??writeram_sd_1
//  396 #else                  
//  397   while(sd_writesingleblock(DBUF,p_datasector)&&(retry<300)) 
//  398    {
//  399      C_WDOG(); //清开门狗 
//  400      retry++;
//  401    }
//  402 #endif   
//  403   if((++p_sector)==sector_cluster)  //写完一簇的处理
??writeram_sd_3:
        LDR.W    R0,??DataTable12_5
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable12_5
        STRH     R0,[R1, #+0]
        LDR.W    R1,??DataTable9_5
        LDRB     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R0,R1
        BNE.N    ??writeram_sd_4
//  404    {
//  405      p_sector=0;
        LDR.W    R0,??DataTable12_5
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  406      p_cluster++;
        LDR.W    R0,??DataTable13_4
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable13_4
        STRB     R0,[R1, #+0]
//  407      cnt_cluster++;
        LDR.W    R0,??DataTable12_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable12_4
        STRH     R0,[R1, #+0]
//  408      if(p_cluster==num_segcluster)
        LDR.W    R0,??DataTable13_4
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable13
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??writeram_sd_5
//  409       {       //如果一个簇组写完,将写入指针指向下一簇组的起始地址
//  410         p_datasector=((dword_sd)((next_cluster[++p_segcluster]&0x00FFFFFF)-2))*sector_cluster+add_dir; 
        LDR.W    R0,??DataTable13_5
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable13_5
        STRH     R0,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable12_1
        LDR      R0,[R1, R0, LSL #+2]
        LSLS     R0,R0,#+8        ;; ZeroExtS R0,R0,#+8,#+8
        LSRS     R0,R0,#+8
        SUBS     R0,R0,#+2
        LDR.W    R1,??DataTable9_5
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable9_1
        LDR      R2,[R2, #+0]
        MLA      R0,R1,R0,R2
        LDR.W    R1,??DataTable10
        STR      R0,[R1, #+0]
//  411         num_segcluster=(next_cluster[p_segcluster]&0xFF000000)>>24;
        LDR.W    R0,??DataTable13_5
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable12_1
        LDR      R0,[R1, R0, LSL #+2]
        LSRS     R0,R0,#+24
        LDR.W    R1,??DataTable13
        STRB     R0,[R1, #+0]
//  412         p_cluster=0;
        LDR.W    R0,??DataTable13_4
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        B.N      ??writeram_sd_6
//  413       }
//  414      else
//  415       {
//  416         p_datasector++;
??writeram_sd_5:
        LDR.W    R0,??DataTable10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable10
        STR      R0,[R1, #+0]
        B.N      ??writeram_sd_6
//  417       }
//  418    }
//  419   else
//  420    {
//  421      p_datasector++;
??writeram_sd_4:
        LDR.W    R0,??DataTable10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable10
        STR      R0,[R1, #+0]
//  422    }
//  423 }
??writeram_sd_6:
        POP      {R4,PC}          ;; return
//  424 /*********************************************************/
//  425 //function:write_ram
//  426 //description:写字节数据到ram函数（主函数与fat32文件系统函数的接口）
//  427 //修改： Sword
//  428 /***********************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  429 void writebyte_ram(byte_sd wdata)
//  430 {
writebyte_ram:
        PUSH     {R7,LR}
//  431   
//  432   if(cnt_cluster<cluster_number)
        LDR.W    R1,??DataTable12_4
        LDRH     R1,[R1, #+0]
        LDR.W    R2,??DataTable13_6
        LDRH     R2,[R2, #+0]
        CMP      R1,R2
        BCS.N    ??writebyte_ram_0
//  433    {
//  434 #ifdef EN_SDbuf
//  435      pBuf_Now[ram_number]=wdata;
        LDR.W    R1,??DataTable12_3
        LDRH     R1,[R1, #+0]
        LDR.W    R2,??DataTable9
        LDR      R2,[R2, #+0]
        STRB     R0,[R1, R2]
//  436 #else
//  437      DBUF[ram_number]=wdata;
//  438 #endif     
//  439      ram_number++;
        LDR.W    R0,??DataTable12_3
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable12_3
        STRH     R0,[R1, #+0]
//  440      if(ram_number==512) 
        LDR.W    R0,??DataTable12_3
        LDRH     R0,[R0, #+0]
        MOV      R1,#+512
        CMP      R0,R1
        BNE.N    ??writebyte_ram_0
//  441       {
//  442         ram_number=0;
        LDR.W    R0,??DataTable12_3
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  443         writeram_sd();
        BL       writeram_sd
//  444       }
//  445    }
//  446 }
??writebyte_ram_0:
        POP      {R0,PC}          ;; return
//  447 /*********************************************************/
//  448 //function:write_stop
//  449 //description:写SD卡结束，完成后续工作，即写FAT表与根目录
//  450 //修改： Sword
//  451 /*********************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  452 void write_stop(void)
//  453 {
write_stop:
        PUSH     {R7,LR}
//  454    if(cnt_cluster==0&&p_sector==0&&ram_number==0) 
        LDR.W    R0,??DataTable12_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable12_5
        LDRH     R1,[R1, #+0]
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable12_3
        LDRH     R1,[R1, #+0]
        ORRS     R0,R1,R0
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??write_stop_0
//  455    {
//  456      return; //如果没有写过数据,则不写fat表和根目录
//  457    }
//  458    
//  459    if(ram_number!=0) writeram_sd(); 
??write_stop_1:
        LDR.W    R0,??DataTable12_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??write_stop_2
        BL       writeram_sd
//  460  //把最后不够一个完整扇区的数据写入
//  461  
//  462 #ifdef EN_SDbuf
//  463    SD_ClrBuf();
??write_stop_2:
        BL       SD_ClrBuf
//  464 #endif
//  465    
//  466    write_dir();
        BL       write_dir
//  467    write_fat(); 
        BL       write_fat
//  468 
//  469    Wait_SDRdy(SD_LONG_Wait);   //等待最后一个扇区数据写入SD卡
        LDR.N    R0,??DataTable7_4  ;; 0x1e8480
        BL       Wait_SDRdy
//  470 
//  471    CloseSD();//关闭SD卡  
        BL       CloseSD
//  472 }
??write_stop_0:
        POP      {R0,PC}          ;; return
//  473 
//  474 /*
//  475 函数名称：search_addr_sd
//  476 函数功能：寻找sd卡启动扇区,根目录,数据扇区,fat1和fat2的首地址
//  477 编 写 者：Sword
//  478 */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  479 void search_addr_sd(void)
//  480 {
search_addr_sd:
        PUSH     {R3-R5,LR}
//  481   word_sd  retry;
//  482   byte_sd  r1,flag_yes=1;
        MOVS     R4,#+1
//  483   
//  484   retry=0;
        MOVS     R5,#+0
//  485   do
//  486    {  //读取第0物理扇区内容
//  487      r1=sd_readsingleblock(DBUF,0);
??search_addr_sd_0:
        MOVS     R1,#+0
        LDR.W    R0,??DataTable12
        BL       sd_readsingleblock
//  488      C_WDOG();
        CPSID i          
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.W    R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??search_addr_sd_1
        CPSIE i          
//  489      retry++;
??search_addr_sd_1:
        ADDS     R5,R5,#+1
//  490    } while(r1!=0x00&&retry<100);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??search_addr_sd_2
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+100
        BCC.N    ??search_addr_sd_0
//  491  
//  492   if(retry>=100) 
??search_addr_sd_2:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+100
        BCC.N    ??search_addr_sd_3
//  493    {
//  494      flag_err_sd=SDERR_ReadOverTime;
        LDR.W    R0,??DataTable13_7
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  495      flag_yes=0; //超时出错
        MOVS     R4,#+0
//  496    }
//  497      
//  498   if(DBUF[0]!=0xeb||DBUF[1]!=0x58||DBUF[2]!=0x90)   
??search_addr_sd_3:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+235
        BNE.N    ??search_addr_sd_4
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+1]
        CMP      R0,#+88
        BNE.N    ??search_addr_sd_4
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+2]
        CMP      R0,#+144
        BEQ.N    ??search_addr_sd_5
//  499  //通过第0物理扇区的前3字节是否是跳转指令来判定是不是启动扇区    
//  500    {
//  501      add_sta=DBUF[454]+((dword_sd)DBUF[455]<<8)+((dword_sd)DBUF[456]<<16)+((dword_sd)DBUF[457]<<24);
??search_addr_sd_4:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+454]
        LDR.W    R1,??DataTable12
        LDRB     R1,[R1, #+455]
        LSLS     R1,R1,#+8
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable12
        LDRB     R1,[R1, #+456]
        ADDS     R0,R0,R1, LSL #+16
        LDR.W    R1,??DataTable12
        LDRB     R1,[R1, #+457]
        ADDS     R0,R0,R1, LSL #+24
        LDR.W    R1,??DataTable13_8
        STR      R0,[R1, #+0]
//  502   //如果物理的第0扇区不是启动扇区,则由第454-457byte_sd来计算启动扇区的偏移量   
//  503      retry=0;   
        MOVS     R5,#+0
//  504      do
//  505       {  //读取启动扇区内容
//  506         r1=sd_readsingleblock(DBUF,add_sta);
??search_addr_sd_6:
        LDR.W    R0,??DataTable13_8
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable12
        BL       sd_readsingleblock
//  507         C_WDOG();
        CPSID i          
        LDR.N    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.N    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.N    R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??search_addr_sd_7
        CPSIE i          
//  508         retry++;
??search_addr_sd_7:
        ADDS     R5,R5,#+1
//  509       } while(r1!=0x00&&retry<100);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??search_addr_sd_8
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+100
        BCC.N    ??search_addr_sd_6
//  510      
//  511      if(retry>=100) 
??search_addr_sd_8:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+100
        BCC.N    ??search_addr_sd_9
//  512       {
//  513         flag_err_sd=SDERR_ReadOverTime;
        LDR.W    R0,??DataTable13_7
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  514         flag_yes=0; //超时出错
        MOVS     R4,#+0
        B.N      ??search_addr_sd_10
//  515       }
//  516      else if(DBUF[0]!=0xeb||DBUF[1]!=0x58||DBUF[2]!=0x90)
??search_addr_sd_9:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+235
        BNE.N    ??search_addr_sd_11
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+1]
        CMP      R0,#+88
        BNE.N    ??search_addr_sd_11
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+2]
        CMP      R0,#+144
        BEQ.N    ??search_addr_sd_10
//  517       {
//  518         flag_err_sd=SDERR_StartSector;
??search_addr_sd_11:
        LDR.W    R0,??DataTable13_7
        MOVS     R1,#+4
        STRB     R1,[R0, #+0]
//  519         flag_yes=0; //启动扇区出错
        MOVS     R4,#+0
        B.N      ??search_addr_sd_10
//  520       }
//  521    }
//  522   else
//  523    {
//  524      add_sta=0;
??search_addr_sd_5:
        LDR.W    R0,??DataTable13_8
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  525    }
//  526   
//  527   sector_cluster=DBUF[13];    //读取每簇对应的扇区数
??search_addr_sd_10:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+13]
        LDR.N    R1,??DataTable9_5
        STRB     R0,[R1, #+0]
//  528   sector_sta=DBUF[14]+((dword_sd)DBUF[15]<<8);   //计算启动扇区数
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+14]
        LDR.W    R1,??DataTable12
        LDRB     R1,[R1, #+15]
        LSLS     R1,R1,#+8
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable13_9
        STR      R0,[R1, #+0]
//  529   sector_fat=DBUF[36]+((dword_sd)DBUF[37]<<8)+((dword_sd)DBUF[38]<<16)+((dword_sd)DBUF[39]<<24);
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+36]
        LDR.W    R1,??DataTable12
        LDRB     R1,[R1, #+37]
        LSLS     R1,R1,#+8
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable12
        LDRB     R1,[R1, #+38]
        ADDS     R0,R0,R1, LSL #+16
        LDR.W    R1,??DataTable12
        LDRB     R1,[R1, #+39]
        ADDS     R0,R0,R1, LSL #+24
        LDR.W    R1,??DataTable13_10
        STR      R0,[R1, #+0]
//  530  //计算fat表所占的扇区数 
//  531     
//  532  //计算根目录,数据扇区,fat1和fat2的首地址 
//  533   add_f1=add_sta+sector_sta;
        LDR.W    R0,??DataTable13_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable13_9
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable13_3
        STR      R0,[R1, #+0]
//  534   add_f2=add_f1+sector_fat;
        LDR.W    R0,??DataTable13_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable13_10
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable13_1
        STR      R0,[R1, #+0]
//  535   add_dir=add_f2+sector_fat;
        LDR.W    R0,??DataTable13_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable13_10
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable9_1
        STR      R0,[R1, #+0]
//  536   
//  537   if(flag_yes==0) CloseSD();
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??search_addr_sd_12
        BL       CloseSD
//  538 }
??search_addr_sd_12:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     Flag_SDRdy

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     Stat_SDbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     pBuf_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     Sector_SDbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0x1e8480
//  539 /*
//  540 函数名称：search_fat
//  541 函数功能：搜寻fat表,找到足够多的空闲扇区
//  542 编 写 者：Sword
//  543 */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  544 void search_fat(void)
//  545 {
search_fat:
        PUSH     {R4-R10,LR}
//  546   byte_sd retry,r1,num,flag,flag_over=0;
        MOVS     R4,#+0
//  547   dword_sd i,j,k;   
//  548   
//  549   for(i=k=num=flag=0,j=12;i<10000;i++,j=0)
        MOVS     R6,#+0
        MOVS     R5,R6
        MOV      R8,R6
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MOV      R7,R8
        MOVS     R9,#+12
        B.N      ??search_fat_0
??search_fat_1:
        ADDS     R8,R8,#+1
        MOVS     R9,#+0
??search_fat_0:
        MOVW     R0,#+10000
        CMP      R8,R0
        BCS.W    ??search_fat_2
//  550    {    //最多寻找10000个扇区
//  551 //10000个扇区对应约1280000个簇,按一簇4K算,则为5G的空间
//  552      retry=0;
        MOVS     R10,#+0
//  553      do
//  554       {
//  555         r1=sd_readsingleblock(DBUF,add_f1+i);
??search_fat_3:
        LDR.W    R0,??DataTable13_3
        LDR      R0,[R0, #+0]
        ADDS     R1,R8,R0
        LDR.N    R0,??DataTable12
        BL       sd_readsingleblock
//  556         C_WDOG();
        CPSID i          
        LDR.N    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+42498
        STRH     R2,[R1, #+0]
        LDR.N    R1,??DataTable9_2  ;; 0x4005200c
        MOVW     R2,#+46208
        STRH     R2,[R1, #+0]
        LDR.N    R1,??DataTable9_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??search_fat_4
        CPSIE i          
//  557         retry++;
??search_fat_4:
        ADDS     R10,R10,#+1
//  558       } while(r1!=0x00&&retry<100);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??search_fat_5
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+100
        BCC.N    ??search_fat_3
//  559      
//  560      if(retry>=100) 
??search_fat_5:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+100
        BCC.N    ??search_fat_6
//  561       {
//  562         flag_err_sd=SDERR_ReadOverTime;
        LDR.W    R0,??DataTable13_7
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  563         break; //超时出错
        B.N      ??search_fat_2
//  564       }
//  565      for(;j<512;j+=4)
??search_fat_7:
        ADDS     R9,R9,#+4
??search_fat_6:
        MOV      R0,#+512
        CMP      R9,R0
        BCS.N    ??search_fat_8
//  566       {
//  567         if(DBUF[j]==0x00&&DBUF[j+1]==0x00&&DBUF[j+2]==0x00&&DBUF[j+3]==0x00) 
        LDR.N    R0,??DataTable12
        LDRB     R0,[R9, R0]
        CMP      R0,#+0
        BNE.N    ??search_fat_9
        LDR.N    R0,??DataTable12
        ADDS     R0,R9,R0
        LDRB     R0,[R0, #+1]
        CMP      R0,#+0
        BNE.N    ??search_fat_9
        LDR.N    R0,??DataTable12
        ADDS     R0,R9,R0
        LDRB     R0,[R0, #+2]
        CMP      R0,#+0
        BNE.N    ??search_fat_9
        LDR.N    R0,??DataTable12
        ADDS     R0,R9,R0
        LDRB     R0,[R0, #+3]
        CMP      R0,#+0
        BNE.N    ??search_fat_9
//  568          {       //标记可用簇
//  569            if(flag==0)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??search_fat_10
//  570             {         //一段可用簇的第一个
//  571               next_cluster[k]=((i<<7)+(j>>2));
        LSRS     R0,R9,#+2
        ADDS     R0,R0,R8, LSL #+7
        LDR.N    R1,??DataTable12_1
        STR      R0,[R1, R7, LSL #+2]
//  572               num=flag=1;
        MOVS     R6,#+1
        MOVS     R5,R6
        B.N      ??search_fat_11
//  573             }
//  574            else
//  575             {     //记录该段簇的个数
//  576               num++;
??search_fat_10:
        ADDS     R6,R6,#+1
//  577               if(num==250)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+250
        BNE.N    ??search_fat_11
//  578                {       //防止一段簇太长变量溢出
//  579                  next_cluster[k]|=(((dword_sd)num)<<24L);
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, R7, LSL #+2]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ORRS     R0,R0,R6, LSL #+24
        LDR.N    R1,??DataTable12_1
        STR      R0,[R1, R7, LSL #+2]
//  580                  k++;flag=0;
        ADDS     R7,R7,#+1
        MOVS     R5,#+0
//  581                }
//  582             }
//  583            cluster_number++; 
??search_fat_11:
        LDR.W    R0,??DataTable13_6
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable13_6
        STRH     R0,[R1, #+0]
        B.N      ??search_fat_12
//  584          }
//  585         else
//  586          {
//  587            if(flag==1)
??search_fat_9:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??search_fat_13
//  588             {       //将指针指向下一组簇
//  589               next_cluster[k]|=(((dword_sd)num)<<24L);
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, R7, LSL #+2]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ORRS     R0,R0,R6, LSL #+24
        LDR.N    R1,??DataTable12_1
        STR      R0,[R1, R7, LSL #+2]
//  590               k++;
        ADDS     R7,R7,#+1
//  591             }
//  592            flag=0;
??search_fat_13:
        MOVS     R5,#+0
//  593          }
//  594         if(cluster_number==SD_MAX_cluster||k==SD_MAX_segment) 
??search_fat_12:
        LDR.W    R0,??DataTable13_6
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+950
        CMP      R0,R1
        BEQ.N    ??search_fat_14
        CMP      R7,#+40
        BNE.N    ??search_fat_7
//  595          {  //已找到足够多的可用簇或数组存满
//  596            if(cluster_number==SD_MAX_cluster)
??search_fat_14:
        LDR.W    R0,??DataTable13_6
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+950
        CMP      R0,R1
        BNE.N    ??search_fat_15
//  597             {
//  598               next_cluster[k]|=(((dword_sd)num)<<24L);
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, R7, LSL #+2]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ORRS     R0,R0,R6, LSL #+24
        LDR.N    R1,??DataTable12_1
        STR      R0,[R1, R7, LSL #+2]
//  599             }
//  600            flag_over=1;
??search_fat_15:
        MOVS     R4,#+1
//  601            break;
//  602          } 
//  603       }
//  604      
//  605      if(flag_over) break; 
??search_fat_8:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.W    ??search_fat_1
//  606    }
//  607   if(cluster_number<SD_MAX_cluster) 
??search_fat_2:
        LDR.W    R0,??DataTable13_6
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+950
        CMP      R0,R1
        BCS.N    ??search_fat_16
//  608    {
//  609      if(flag_err_sd!=SDERR_ReadOverTime)
        LDR.W    R0,??DataTable13_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BEQ.N    ??search_fat_17
//  610        flag_err_sd=SDERR_NoCluster;
        LDR.W    R0,??DataTable13_7
        MOVS     R1,#+5
        STRB     R1,[R0, #+0]
//  611      if(cluster_number==0||flag_err_sd==SDERR_ReadOverTime)
??search_fat_17:
        LDR.W    R0,??DataTable13_6
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??search_fat_18
        LDR.W    R0,??DataTable13_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??search_fat_16
//  612       { //如果簇数不够但并不是一个簇都没找到的话则继续写卡
//  613         CloseSD(); //没有找到有用簇或读取超时则关闭SPI 
??search_fat_18:
        BL       CloseSD
//  614       }
//  615    }
//  616 }
??search_fat_16:
        POP      {R4-R10,PC}      ;; return
//  617 /*
//  618 函数名称：fat32_init
//  619 函数功能：fat32文件系统的初始化
//  620 编 写 者：Sword
//  621 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  622 void fat32_init(void)
//  623 {
fat32_init:
        PUSH     {R7,LR}
//  624   search_addr_sd();
        BL       search_addr_sd
//  625   if(sd_yes)
        LDR.W    R0,??DataTable13_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??fat32_init_0
//  626    {
//  627      SetSD_High();
        BL       SetSD_High
//  628      search_fat(); 
        BL       search_fat
//  629   
//  630      if(sd_yes==1)
        LDR.W    R0,??DataTable13_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??fat32_init_0
//  631       {
//  632         p_datasector=add_dir+((dword_sd)((next_cluster[0]&0x00FFFFFF)-2))*sector_cluster; 
        LDR.N    R0,??DataTable9_1
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable12_1
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+8        ;; ZeroExtS R1,R1,#+8,#+8
        LSRS     R1,R1,#+8
        SUBS     R1,R1,#+2
        LDR.N    R2,??DataTable9_5
        LDRB     R2,[R2, #+0]
        MLA      R0,R2,R1,R0
        LDR.N    R1,??DataTable10
        STR      R0,[R1, #+0]
//  633       //注意,数据区是从第二簇开始的,所以要减2  
//  634         p_sector=0;
        LDR.N    R0,??DataTable12_5
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  635         ram_number=cnt_cluster=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_4
        STRH     R0,[R1, #+0]
        LDR.N    R1,??DataTable12_3
        STRH     R0,[R1, #+0]
//  636         p_segcluster=p_cluster=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_4
        STRB     R0,[R1, #+0]
        LDR.W    R1,??DataTable13_5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STRH     R0,[R1, #+0]
//  637         num_segcluster=(next_cluster[0]&0xFF000000)>>24;
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+24
        LDR.W    R1,??DataTable13
        STRB     R0,[R1, #+0]
//  638       }
//  639    }
//  640 }
??fat32_init_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     pBuf_Now

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     add_dir

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0x4005200c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     sd_initover

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     dir_sd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     sector_cluster
//  641 /*
//  642 函数名称：SD_System_Init
//  643 函数功能：SD卡即整个文件系统的初始化
//  644           (主函数中直接调用该函数就可完成对SD卡全部的初始化工作)
//  645 编 写 者：Sword
//  646 */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  647 void SD_System_Init(void)
//  648 {
SD_System_Init:
        PUSH     {R4,LR}
//  649   byte_sd retry=10;
        MOVS     R4,#+10
//  650 
//  651   sd_yes=1;      //默认SD卡已就绪,如果出问题,后面执行CloseSD()时会清零该变量
        LDR.W    R0,??DataTable13_11
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  652   Flag_SDRdy=1;  //将SD卡的状态标记为可用
        LDR.W    R0,??DataTable13_12
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  653   flag_err_sd=SD_Normal;
        LDR.W    R0,??DataTable13_7
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  654   SD_driver_Init();
        BL       SD_driver_Init
//  655   SetSD_Low();
        BL       SetSD_Low
        B.N      ??SD_System_Init_0
//  656   while(sd_init()&&retry!=0) 
//  657    {
//  658      retry--;
??SD_System_Init_1:
        SUBS     R4,R4,#+1
//  659      C_WDOG();
        CPSID i          
        LDR.W    R0,??DataTable13_13  ;; 0x4005200c
        MOVW     R1,#+42498
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable13_13  ;; 0x4005200c
        MOVW     R1,#+46208
        STRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable13_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SD_System_Init_0
        CPSIE i          
//  660    }
??SD_System_Init_0:
        BL       sd_init
        CMP      R0,#+0
        BEQ.N    ??SD_System_Init_2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??SD_System_Init_1
//  661 
//  662   if(retry==0)         //如果sd卡初始化超时不成功，则关闭spi 
??SD_System_Init_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??SD_System_Init_3
//  663    {
//  664      CloseSD();
        BL       CloseSD
        B.N      ??SD_System_Init_4
//  665    }
//  666   else          
//  667    {
//  668      flag_err_sd=SD_Normal;
??SD_System_Init_3:
        LDR.N    R0,??DataTable13_7
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  669      fat32_init(); //文件系统的初始化
        BL       fat32_init
//  670      
//  671    #ifdef EN_SDbuf   //初始化第二缓存
//  672    #ifdef EN_Cnt_SDbuf  
//  673      Cnt_SDbufS1=0;
//  674      Cnt_SDbufS2=0;
//  675      Cnt_SDbufS3=0;
//  676      Cnt_SDbufS4=0;
//  677      Cnt_SDbufS5=0;
//  678    #endif
//  679      Stat_SDbuf=0;
        LDR.W    R0,??DataTable13_15
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  680      pBuf_Now=DBUF; //设定缓存指针的初始值
        LDR.W    R0,??DataTable13_16
        LDR.N    R1,??DataTable12
        STR      R1,[R0, #+0]
//  681      pBuf_2=DBUF2;
        LDR.N    R0,??DataTable13_17
        LDR.N    R1,??DataTable13_18
        STR      R1,[R0, #+0]
//  682    #endif
//  683    }
//  684   
//  685   sd_initover = 1;
??SD_System_Init_4:
        LDR.N    R0,??DataTable13_14
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  686 }
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     p_datasector
//  687 /*
//  688 函数名称：SD_System_Init_Ext
//  689 函数功能：扩展版的SD卡系统初始化函数
//  690           (允许在初始化时预先写入部分数据)
//  691 入口参数：pbuf:初始数据指针
//  692          len:数据长度
//  693 编 写 者：Sword
//  694 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  695 void SD_System_Init_Ext(byte_sd * pbuf , word_sd len)
//  696 {
SD_System_Init_Ext:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  697 	word_sd i;
//  698 	
//  699 	SD_System_Init();
        BL       SD_System_Init
//  700 	
//  701 	if(sd_yes != 0)
        LDR.N    R0,??DataTable13_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SD_System_Init_Ext_0
//  702 	{
//  703 		sd_initover = 0;
        LDR.N    R0,??DataTable13_14
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  704 		
//  705 		for(i=0;i<len;i++)
        MOVS     R6,#+0
        B.N      ??SD_System_Init_Ext_1
//  706 		{
//  707 			writebyte_ram(*pbuf++);
??SD_System_Init_Ext_2:
        LDRB     R0,[R4, #+0]
        BL       writebyte_ram
        ADDS     R4,R4,#+1
//  708 		}
        ADDS     R6,R6,#+1
??SD_System_Init_Ext_1:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R6,R5
        BCC.N    ??SD_System_Init_Ext_2
//  709 		
//  710 		sd_initover = 1;
        LDR.N    R0,??DataTable13_14
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  711 	}
//  712 }
??SD_System_Init_Ext_0:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     file_name
//  713 /*
//  714 函数名称：test_sd
//  715 函数功能：测试SD卡
//  716 编 写 者：Sword
//  717 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  718 void test_sd(void)
//  719 {
test_sd:
        PUSH     {R4,LR}
        SUB      SP,SP,#+56
//  720   byte_sd const str[]="If you see these words, your SD and hardware is OK!";
        ADD      R0,SP,#+0
        LDR.N    R1,??DataTable13_19
        MOVS     R2,#+52
        BL       __aeabi_memcpy4
//  721   word_sd i;
//  722   if(sd_yes)
        LDR.N    R0,??DataTable13_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??test_sd_0
//  723    { 
//  724      file_name[0]='T';
        LDR.N    R0,??DataTable13_20
        MOVS     R1,#+84
        STRB     R1,[R0, #+0]
//  725      file_name[1]='E';
        LDR.N    R0,??DataTable13_20
        MOVS     R1,#+69
        STRB     R1,[R0, #+1]
//  726      file_name[2]='S';
        LDR.N    R0,??DataTable13_20
        MOVS     R1,#+83
        STRB     R1,[R0, #+2]
//  727      file_name[3]='T';
        LDR.N    R0,??DataTable13_20
        MOVS     R1,#+84
        STRB     R1,[R0, #+3]
//  728      file_name[4]='-';
        LDR.N    R0,??DataTable13_20
        MOVS     R1,#+45
        STRB     R1,[R0, #+4]
//  729      
//  730      for(i=0;str[i]!='\0';i++)
        MOVS     R4,#+0
        B.N      ??test_sd_1
//  731        writebyte_ram(str[i]);
??test_sd_2:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ADD      R0,SP,#+0
        LDRB     R0,[R4, R0]
        BL       writebyte_ram
        ADDS     R4,R4,#+1
??test_sd_1:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ADD      R0,SP,#+0
        LDRB     R0,[R4, R0]
        CMP      R0,#+0
        BNE.N    ??test_sd_2
//  732             
//  733      write_stop();
        BL       write_stop
//  734    }
//  735 }
??test_sd_0:
        ADD      SP,SP,#+56
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     DBUF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     next_cluster

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     file_property

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     ram_number

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     cnt_cluster

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     p_sector

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     file_size
//  736 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  737 void write_SD(void)
//  738 {
write_SD:
        PUSH     {R4,LR}
//  739   int i;
//  740   writebyte_ram('U');
        MOVS     R0,#+85
        BL       writebyte_ram
//  741   writebyte_ram('Z');
        MOVS     R0,#+90
        BL       writebyte_ram
//  742   for(i=0;i<128;i++)
        MOVS     R4,#+0
        B.N      ??write_SD_0
//  743   {
//  744     writebyte_ram(' ');
??write_SD_1:
        MOVS     R0,#+32
        BL       writebyte_ram
//  745     writebyte_ram('0');
        MOVS     R0,#+48
        BL       writebyte_ram
//  746     writebyte_ram(MAIN_CCD.ccd_value[i]+48);
        LDR.N    R0,??DataTable13_21
        ADDS     R0,R4,R0
        LDRB     R0,[R0, #+376]
        ADDS     R0,R0,#+48
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  747   }
        ADDS     R4,R4,#+1
??write_SD_0:
        CMP      R4,#+128
        BLT.N    ??write_SD_1
//  748   writebyte_ram(' ');
        MOVS     R0,#+32
        BL       writebyte_ram
//  749   //变量1
//  750   writebyte_ram(Bend_L_Num/100+65);
        LDR.N    R0,??DataTable13_22
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  751   writebyte_ram(Bend_L_Num%100+65);
        LDR.N    R0,??DataTable13_22
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  752   writebyte_ram(' ');
        MOVS     R0,#+32
        BL       writebyte_ram
//  753   //变量2
//  754   writebyte_ram(Bend_L_Num/100+65);
        LDR.N    R0,??DataTable13_22
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  755   writebyte_ram(Bend_L_Num%100+65);
        LDR.N    R0,??DataTable13_22
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  756   writebyte_ram(' ');
        MOVS     R0,#+32
        BL       writebyte_ram
//  757   //变量3
//  758   writebyte_ram(Black_Tip_Flag/100+65);
        LDR.N    R0,??DataTable13_23
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  759   writebyte_ram(Black_Tip_Flag%100+65);
        LDR.N    R0,??DataTable13_23
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  760   writebyte_ram(' ');
        MOVS     R0,#+32
        BL       writebyte_ram
//  761   //变量4
//  762   writebyte_ram(ResureTip_Flag/100+65);
        LDR.N    R0,??DataTable13_24
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  763   writebyte_ram(ResureTip_Flag%100+65);
        LDR.N    R0,??DataTable13_24
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  764   writebyte_ram(' ');
        MOVS     R0,#+32
        BL       writebyte_ram
//  765   //变量5
//  766   writebyte_ram(MAIN_CCD.Black_TO_White[1]/100+65);
        LDR.N    R0,??DataTable13_21
        LDRB     R0,[R0, #+505]
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  767   writebyte_ram(MAIN_CCD.Black_TO_White[1]%100+65);
        LDR.N    R0,??DataTable13_21
        LDRB     R0,[R0, #+505]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  768   writebyte_ram(' ');
        MOVS     R0,#+32
        BL       writebyte_ram
//  769   //变量6
//  770   writebyte_ram(MAIN_CCD.White_TO_Black[0]/100+65);
        LDR.N    R0,??DataTable13_21
        LDRB     R0,[R0, #+508]
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  771   writebyte_ram(MAIN_CCD.White_TO_Black[0]%100+65);
        LDR.N    R0,??DataTable13_21
        LDRB     R0,[R0, #+508]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  772   writebyte_ram(' ');
        MOVS     R0,#+32
        BL       writebyte_ram
//  773   //变量7
//  774   writebyte_ram(MAIN_CCD.Black_Position/100+65);
        LDR.N    R0,??DataTable13_21
        LDRSH    R0,[R0, #+524]
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  775   writebyte_ram(MAIN_CCD.Black_Position%100+65);
        LDR.N    R0,??DataTable13_21
        LDRSH    R0,[R0, #+524]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  776   writebyte_ram(' ');
        MOVS     R0,#+32
        BL       writebyte_ram
//  777   //变量8
//  778   writebyte_ram(MAIN_CCD.Black_Position/100+65);
        LDR.N    R0,??DataTable13_21
        LDRSH    R0,[R0, #+524]
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  779   writebyte_ram(MAIN_CCD.Black_Position%100+65);
        LDR.N    R0,??DataTable13_21
        LDRSH    R0,[R0, #+524]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  780   writebyte_ram(' ');
        MOVS     R0,#+32
        BL       writebyte_ram
//  781   //变量9
//  782   writebyte_ram(MAIN_CCD.Black_Position/100+65);
        LDR.N    R0,??DataTable13_21
        LDRSH    R0,[R0, #+524]
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  783   writebyte_ram(MAIN_CCD.Black_Position%100+65);
        LDR.N    R0,??DataTable13_21
        LDRSH    R0,[R0, #+524]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  784   writebyte_ram(' ');
        MOVS     R0,#+32
        BL       writebyte_ram
//  785   //变量10
//  786   writebyte_ram(MAIN_CCD.Black_Position/100+65);
        LDR.N    R0,??DataTable13_21
        LDRSH    R0,[R0, #+524]
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  787   writebyte_ram(MAIN_CCD.Black_Position%100+65);
        LDR.N    R0,??DataTable13_21
        LDRSH    R0,[R0, #+524]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  788   writebyte_ram(' ');
        MOVS     R0,#+32
        BL       writebyte_ram
//  789   //变量11
//  790   writebyte_ram(MAIN_CCD.Black_Position/100+65);
        LDR.N    R0,??DataTable13_21
        LDRSH    R0,[R0, #+524]
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  791   writebyte_ram(MAIN_CCD.Black_Position%100+65);
        LDR.N    R0,??DataTable13_21
        LDRSH    R0,[R0, #+524]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  792   writebyte_ram(' ');
        MOVS     R0,#+32
        BL       writebyte_ram
//  793   //变量12
//  794   writebyte_ram(MAIN_CCD.Black_Position/100+65);
        LDR.N    R0,??DataTable13_21
        LDRSH    R0,[R0, #+524]
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  795   writebyte_ram(MAIN_CCD.Black_Position%100+65);
        LDR.N    R0,??DataTable13_21
        LDRSH    R0,[R0, #+524]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        ADDS     R0,R0,#+65
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       writebyte_ram
//  796   writebyte_ram(' ');
        MOVS     R0,#+32
        BL       writebyte_ram
//  797 }
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     num_segcluster

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     add_f2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     DBUF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC32     add_f1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     p_cluster

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_5:
        DC32     p_segcluster

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_6:
        DC32     cluster_number

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_7:
        DC32     flag_err_sd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_8:
        DC32     add_sta

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_9:
        DC32     sector_sta

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_10:
        DC32     sector_fat

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_11:
        DC32     sd_yes

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_12:
        DC32     Flag_SDRdy

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_13:
        DC32     0x4005200c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_14:
        DC32     sd_initover

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_15:
        DC32     Stat_SDbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_16:
        DC32     pBuf_Now

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_17:
        DC32     pBuf_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_18:
        DC32     DBUF2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_19:
        DC32     `?<Constant "If you see these word...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_20:
        DC32     file_name

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_21:
        DC32     MAIN_CCD

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_22:
        DC32     Bend_L_Num

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_23:
        DC32     Black_Tip_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_24:
        DC32     ResureTip_Flag

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  798 
//  799 #endif
// 
// 1 242 bytes in section .bss
//    12 bytes in section .data
//   100 bytes in section .rodata
// 4 516 bytes in section .text
// 
// 4 516 bytes of CODE  memory
//   100 bytes of CONST memory
// 1 254 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
