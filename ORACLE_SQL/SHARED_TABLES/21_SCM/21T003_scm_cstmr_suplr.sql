/* Formatted on 12-15-2018 12:31:51 PM (QP5 v5.126.903.23003) */
DROP TABLE SCM.SCM_CSTMR_SUPLR  CASCADE CONSTRAINTS PURGE;

CREATE TABLE SCM.SCM_CSTMR_SUPLR (
   CUST_SUP_NAME             VARCHAR2 (200 BYTE),
   CREATED_BY                NUMBER,
   CREATION_DATE             VARCHAR2 (50 BYTE),
   LAST_UPDATE_BY            NUMBER,
   LAST_UPDATE_DATE          VARCHAR2 (50 BYTE),
   CUST_SUP_ID               NUMBER NOT NULL,
   CUST_SUP_DESC             VARCHAR2 (300 BYTE),
   CUST_SUP_CLSSFCTN         VARCHAR2 (200 BYTE),
   CUST_OR_SUP               VARCHAR2 (50 BYTE),
   ORG_ID                    NUMBER,
   DFLT_PYBL_ACCNT_ID        NUMBER DEFAULT -1 NOT NULL,
   DFLT_RCVBL_ACCNT_ID       NUMBER DEFAULT -1 NOT NULL,
   LNKD_PRSN_ID              NUMBER DEFAULT -1 NOT NULL,
   PERSON_GENDER             VARCHAR2 (100) DEFAULT 'Not Applicable' NOT NULL,
   DOB_ESTBLSHMNT            VARCHAR2 (12),
   IS_ENABLED                VARCHAR2 (1) DEFAULT '1' NOT NULL,
   FIRM_BRAND_NAME           VARCHAR2 (200),
   TYPE_OF_ORGANISATION      VARCHAR2 (200),
   COMPANY_REG_NUM           VARCHAR2 (200),
   DATE_OF_INCORPTN          VARCHAR2 (12),
   TYPE_OF_INCORPORATION     VARCHAR2 (200),
   VAT_NUMBER                VARCHAR2 (100),
   TIN_NUMBER                VARCHAR2 (100),
   SSNIT_REG_NUMBER          VARCHAR2 (100),
   NO_OF_EMPLYEES            INTEGER DEFAULT 0 NOT NULL,
   DESCRIPTION_OF_SERVICES   VARCHAR2 (300),
   LIST_OF_SERVICES          CLOB,
   CSTMR_IMAGE               VARCHAR2 (200),
   CONSTRAINT PK_CUST_SUP_ID PRIMARY KEY (CUST_SUP_ID)
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

CREATE INDEX SCM.IDX_CUST_SUP_CLSSFCTN
   ON SCM.SCM_CSTMR_SUPLR (CUST_SUP_CLSSFCTN)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX SCM.IDX_CUST_SUP_DESC
   ON SCM.SCM_CSTMR_SUPLR (CUST_SUP_DESC)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE INDEX SCM.IDX_CUST_SUP_NAME
   ON SCM.SCM_CSTMR_SUPLR (CUST_SUP_NAME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE INDEX SCM.IDX_LNKD_PRSN_ID
   ON SCM.SCM_CSTMR_SUPLR (LNKD_PRSN_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE SCM.SCM_CUSTMR_SUPPLIERS_ID_SEQ;

CREATE SEQUENCE SCM.SCM_CUSTMR_SUPPLIERS_ID_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER SCM.SCM_CUSTMR_SUPPLIERS_ID_TRG
   BEFORE INSERT
   ON SCM.SCM_CSTMR_SUPLR
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.CUST_SUP_ID IS NULL)
DECLARE
   V_ID   SCM.SCM_CSTMR_SUPLR.CUST_SUP_ID%TYPE;
BEGIN
   SELECT   SCM.SCM_CUSTMR_SUPPLIERS_ID_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.CUST_SUP_ID := V_ID;
END SCM_CUSTMR_SUPPLIERS_ID_TRG;