/* Formatted on 12-15-2018 10:35:21 AM (QP5 v5.126.903.23003) */
DROP TABLE RPT.RPT_ACCB_DATA_STORAGE  CASCADE CONSTRAINTS PURGE;

CREATE TABLE RPT.RPT_ACCB_DATA_STORAGE (
   ACCB_RPT_RUNID   NUMBER NOT NULL,
   RUN_BY           NUMBER DEFAULT -1 NOT NULL,
   RPT_RUN_DATE     VARCHAR2 (21) NOT NULL,
   GNRL_DATA1       CLOB,
   GNRL_DATA2       CLOB,
   GNRL_DATA3       CLOB,
   GNRL_DATA4       CLOB,
   GNRL_DATA5       CLOB,
   GNRL_DATA6       CLOB,
   GNRL_DATA7       CLOB,
   GNRL_DATA8       CLOB,
   GNRL_DATA9       CLOB,
   GNRL_DATA10      CLOB,
   GNRL_DATA11      CLOB,
   GNRL_DATA12      CLOB,
   GNRL_DATA13      CLOB,
   GNRL_DATA14      CLOB,
   GNRL_DATA15      CLOB,
   GNRL_DATA16      CLOB,
   GNRL_DATA17      CLOB,
   GNRL_DATA18      CLOB,
   GNRL_DATA19      CLOB,
   GNRL_DATA20      CLOB,
   GNRL_DATA21      CLOB,
   GNRL_DATA22      CLOB,
   GNRL_DATA23      CLOB,
   GNRL_DATA24      CLOB,
   GNRL_DATA25      CLOB,
   GNRL_DATA26      CLOB,
   GNRL_DATA27      CLOB,
   GNRL_DATA28      CLOB,
   GNRL_DATA29      CLOB,
   GNRL_DATA30      CLOB,
   GNRL_DATA31      CLOB,
   GNRL_DATA32      CLOB,
   GNRL_DATA33      CLOB,
   GNRL_DATA34      CLOB,
   GNRL_DATA35      CLOB,
   GNRL_DATA36      CLOB,
   GNRL_DATA37      CLOB,
   GNRL_DATA38      CLOB,
   GNRL_DATA39      CLOB,
   GNRL_DATA40      CLOB,
   GNRL_DATA41      CLOB,
   GNRL_DATA42      CLOB,
   GNRL_DATA43      CLOB,
   GNRL_DATA44      CLOB,
   GNRL_DATA45      CLOB,
   GNRL_DATA46      CLOB,
   GNRL_DATA47      CLOB,
   GNRL_DATA48      CLOB,
   GNRL_DATA49      CLOB,
   GNRL_DATA50      CLOB
)
TABLESPACE RHODB
PCTUSED 0
PCTFREE 10
INITRANS 1
MAXTRANS 255
STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
LOGGING
NOCOMPRESS
NOCACHE
NOPARALLEL
MONITORING;


CREATE INDEX RPT.IDX_ADS_ACCB_RPT_RUNID
   ON RPT.RPT_ACCB_DATA_STORAGE (ACCB_RPT_RUNID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;