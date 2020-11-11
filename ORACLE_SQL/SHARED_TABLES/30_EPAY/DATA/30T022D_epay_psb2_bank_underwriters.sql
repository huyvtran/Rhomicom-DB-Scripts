/* Formatted on 12-18-2018 3:55:06 PM (QP5 v5.126.903.23003) */
DROP TABLE EPAY.EPAY_PSB2_BANK_UNDERWRITERS CASCADE CONSTRAINTS PURGE;

CREATE TABLE EPAY.EPAY_PSB2_BANK_UNDERWRITERS (
   BNK_ROW_ID         NUMBER NOT NULL,
   PSB_HDR_ID         NUMBER,
   BANK_ID            NUMBER,
   CATEGORY_ID        NUMBER,
   VALUE              NUMBER,
   VOLUME             NUMBER,
   CREATED_BY         NUMBER,
   CREATION_DATE      VARCHAR2 (21),
   LAST_UPDATE_BY     NUMBER,
   LAST_UPDATE_DATE   VARCHAR2 (21),
   PRODUCT_TYPE       VARCHAR2 (11) DEFAULT 'Savings' NOT NULL,
   NO_OF_CUSTOMERS    NUMBER,
   CONSTRAINT PK_BNK_ROW_ID PRIMARY KEY (BNK_ROW_ID)
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

DROP SEQUENCE EPAY.EPAY_PSB2_BANK_UNDERWRITERS_SEQ;

CREATE SEQUENCE EPAY.EPAY_PSB2_BANK_UNDERWRITERS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER EPAY.EPAY_PSB2_BANK_UNDERWRITERS_TRG
   BEFORE INSERT
   ON EPAY.EPAY_PSB2_BANK_UNDERWRITERS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.BNK_ROW_ID IS NULL)
DECLARE
   V_ID   EPAY.EPAY_PSB2_BANK_UNDERWRITERS.BNK_ROW_ID%TYPE;
BEGIN
   SELECT   EPAY.EPAY_PSB2_BANK_UNDERWRITERS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.BNK_ROW_ID := V_ID;
END EPAY_PSB2_BANK_UNDERWRITERS_TRG;