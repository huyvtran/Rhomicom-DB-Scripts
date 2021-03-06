/* Formatted on 12-15-2018 8:49:10 AM (QP5 v5.126.903.23003) */
DROP TABLE PASN.PRSN_BANK_ACCOUNTS  CASCADE CONSTRAINTS PURGE;

CREATE TABLE PASN.PRSN_BANK_ACCOUNTS (
   PRSN_ACCNT_ID      NUMBER NOT NULL,
   ACCOUNT_NAME       VARCHAR2 (200 BYTE),
   ACCOUNT_NUMBER     VARCHAR2 (200 BYTE),
   CREATED_BY         NUMBER NOT NULL,
   CREATION_DATE      VARCHAR2 (21 BYTE),
   LAST_UPDATE_BY     NUMBER NOT NULL,
   LAST_UPDATE_DATE   VARCHAR2 (21 BYTE),
   PERSON_ID          NUMBER NOT NULL,
   NET_PAY_PORTION    NUMBER DEFAULT 0 NOT NULL,
   PORTION_UOM        VARCHAR2 (10 BYTE) DEFAULT 'Percent' NOT NULL,
   BANK_NAME          VARCHAR2 (200 BYTE),
   BANK_BRANCH        VARCHAR2 (200 BYTE),
   ACCOUNT_TYPE       VARCHAR2 (100 BYTE)
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

CREATE UNIQUE INDEX PASN.IDX_PRSN_ACCNT_ID
   ON PASN.PRSN_BANK_ACCOUNTS (PRSN_ACCNT_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

ALTER TABLE PASN.PRSN_BANK_ACCOUNTS ADD (
  CONSTRAINT PK_PRSN_ACCNT_ID
 PRIMARY KEY
 (PRSN_ACCNT_ID));

CREATE INDEX PASN.IDX_ACNT_PERSON_ID
   ON PASN.PRSN_BANK_ACCOUNTS (PERSON_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE PASN.PRSN_BANK_ACCOUNTS_SEQ;

CREATE SEQUENCE PASN.PRSN_BANK_ACCOUNTS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER PASN.PRSN_BANK_ACCOUNTS_TRG
   BEFORE INSERT
   ON PASN.PRSN_BANK_ACCOUNTS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.PRSN_ACCNT_ID IS NULL)
DECLARE
   V_ID   PASN.PRSN_BANK_ACCOUNTS.PRSN_ACCNT_ID%TYPE;
BEGIN
   SELECT   PASN.PRSN_BANK_ACCOUNTS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.PRSN_ACCNT_ID := V_ID;
END PRSN_BANK_ACCOUNTS_TRG;