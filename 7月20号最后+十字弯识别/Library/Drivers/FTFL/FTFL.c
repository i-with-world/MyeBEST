#include "FTFL.h"
#include "stdlib.h"
#include "inttypes.h"

/*******************************************************************************
* �������ƣ�FTFL_Init
* ��ڲ�����
* ���ز�����
* ��    ������ʼ��FTFLģ��
*******************************************************************************/
void FTFL_Init (void)
{
  SIM_SCGC6 |= SIM_SCGC6_FTFL_MASK;
}
/*******************************************************************************
* �������ƣ�FTFL_IsCmdLaunched
* ��ڲ�����
* ���ز�����
* ��    ����ִ�в��ж�FTFLָ���Ƿ�ɹ�
*******************************************************************************/
uint8_t FTFL_IsCmdLaunched (void)
{
  uint32_t nWaitCnt = 0; // �ȴ�������
  
  if (FTFL_IsAccessErr () || FTFL_IsProtectionViolated ())
  {
    // ����ѷ�������ԽȨ�򱣻�������ʣ����������Ĵ����־������FTFL�����޷�ִ��
    FTFL_ClearErrBits ();
  }
  
  // ���CCIFλ�����������ִ��
  FTFL_FSTAT = FTFL_FSTAT_CCIF_MASK;
  // �ȴ�FTFL�������
  while (((nWaitCnt++) <= 100000) && (!FTFL_IsCmdFinish ()));
  
  // ������
  if (nWaitCnt > 100000)
  {
    // ����ʱ���򷵻ش���
    return FTFL_CODE_ERR;
  }
  
  if (FTFL_IsAccessErr () || FTFL_IsProtectionViolated ())
  {
    // �����������ԽȨ�򱣻�������ʣ����ش���
    return FTFL_CODE_ERR;
  }
  // ������ȷ��ɣ�������ʾ��
  return FTFL_CODE_SUCCESS;
}
/*******************************************************************************
* �������ƣ�FTFL_EraseSector
* ��ڲ�����uint16_t iSectorNo ��������
* ���ز�����FTFL_CODE_ERR������ʧ�ܣ�FTFL_CODE_SUCCESS�������ɹ�
* ��    ������������flash����
*******************************************************************************/
uint8_t FTFL_EraseSector (uint16_t iSectorNo)
{
  union{
    uint32_t addrs_word;
    uint8_t addrs_byte[4];
  }union_addrs; // �����壬���ڵ�ַ����
  
  // ��κϷ��Լ���
  if (iSectorNo < 2)
  {
    /* flash��0��sectorΪ�ж������Լ������Ĵ洢λ�ã����ɸ���
    ��Ϊȷ����ȫ���ӵ�������ʼд��K10DN512��512K flash��ÿ��2K
    ������256����                                             */
    return FTFL_CODE_ERR;
  }
  
  // ������ƫ�Ƶ�ַ
  union_addrs.addrs_word = (((uint32_t)iSectorNo) << 11);
  
  // װ��ָ��
  FTFL_FCCOB0 = FTFL_CMD_EFS;  // ��������ָ��
  FTFL_FCCOB1 = union_addrs.addrs_byte[2]; // ������ַ
  FTFL_FCCOB2 = union_addrs.addrs_byte[1];
  FTFL_FCCOB3 = union_addrs.addrs_byte[0];
  
  if (FTFL_CODE_ERR == FTFL_IsCmdLaunched ())
  {
    // ��ָ��ִ��ʧ�ܣ����ش�����
    return FTFL_CODE_ERR;
  }
  // �����ɹ���������ʾ��
  return FTFL_CODE_SUCCESS;
}
/*******************************************************************************
* �������ƣ�FTFL_WriteLongWord
* ��ڲ�����uint16_t iSectorNo �������ţ�
            uint16_t iOffset��ƫ�Ƶ�ַ��
            uint8_t iByte[4]��д������ֽ�
* ���ز�����FTFL_CODE_ERR������ʧ�ܣ�FTFL_CODE_SUCCESS�������ɹ�
* ��    ����д�����flash�ĸ��ֽ�
*******************************************************************************/
uint8_t FTFL_WriteLongWord (uint16_t iSectorNo, uint16_t iOffset, uint8_t iByte[4])
{
  union{
    uint32_t addrs_word;
    uint8_t addrs_byte[4];
  }union_addrs; // �����壬���ڵ�ַ����
  
  // ��κϷ��Լ���
  if (iSectorNo < 2)
  {
    /* flash��0��sectorΪ�ж������Լ������Ĵ洢λ�ã����ɸ���
    ��Ϊȷ����ȫ���ӵ�������ʼд��K10DN512��512K flash��ÿ��2K
    ������256����                                             */
    return FTFL_CODE_ERR;
  }
  
  // ������ƫ�Ƶ�ַ
  union_addrs.addrs_word = (((uint32_t)iSectorNo) << 11) + iOffset;
  
  // װ��ָ��
  FTFL_FCCOB0 = FTFL_CMD_PGM4;  // ��������ָ��
  FTFL_FCCOB1 = union_addrs.addrs_byte[2];   // ������ַ
  FTFL_FCCOB2 = union_addrs.addrs_byte[1];
  FTFL_FCCOB3 = union_addrs.addrs_byte[0];
  // װ������            
  FTFL_FCCOB4 = iByte[3];
  FTFL_FCCOB5 = iByte[2];
  FTFL_FCCOB6 = iByte[1];
  FTFL_FCCOB7 = iByte[0];
  
  if (FTFL_CODE_ERR == FTFL_IsCmdLaunched ())
  {
    // ��ָ��ִ��ʧ�ܣ����ش�����
    return FTFL_CODE_ERR;
  }
  // �����ɹ���������ʾ��
  return FTFL_CODE_SUCCESS;
}
/*******************************************************************************
* �������ƣ�FTFL_ReadFlash
* ��ڲ�����uint16_t iSectorNo �������ţ�uint16_t iOffset��ƫ�Ƶ�ַ��uint16_t nByteCnt���������ݵĸ���
* ���ز�����NULL������ʧ�ܣ�uint8_t* addrsBkp���������׵�ַ
* ��    ����д�����flash�ĸ��ֽ�
*******************************************************************************/
uint8_t * FTFL_ReadFlash (uint16_t iSectorNo, uint16_t iOffset, uint16_t nByteCnt)
{
  uint32_t addrs = 0; // flash��ַ
  
  uint8_t* recBuffer = (uint8_t*) malloc (nByteCnt * sizeof (uint8_t)); // ������ܻ���
  uint8_t* addrsBkp = NULL; // �����׵�ַ����
  if (NULL == recBuffer)
  {
    // ������ʧ�ܣ���˵���ڴ���Ѻľ������ش���
    return (uint8_t*)NULL;
  }
  addrsBkp = recBuffer; // ���滺���ַ
  // ����Ŀ���ַ
  addrs = (((uint32_t)iSectorNo) << 11) + iOffset;
  // ��ȡnByteCnt�ֽڵ�ַ
  while (nByteCnt--)
  {
    *recBuffer++ = *((uint8_t*)addrs++); // -1����Ϊ��addrs��ʼ��addrs + n - 1
  }
  // ���ػ�������ַ
  return addrsBkp;
}

