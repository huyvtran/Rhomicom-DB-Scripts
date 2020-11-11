/* Formatted on 12-17-2018 5:06:44 PM (QP5 v5.126.903.23003) */
DROP TABLE SELF.SELF_QUESTION_BANK CASCADE CONSTRAINTS PURGE;

CREATE TABLE SELF.SELF_QUESTION_BANK (
   QSTN_ID               NUMBER NOT NULL,
   QSTN_DESC             CLOB,
   QSTN_ANSR_TYPE        VARCHAR2 (100),           -- SINGLE ANSWER (RADIO)...
   CREATED_BY            NUMBER,
   CREATION_DATE         VARCHAR2 (21),
   LAST_UPDATE_BY        NUMBER,
   LAST_UPDATE_DATE      VARCHAR2 (21),
   QSTN_IMG_LOC          VARCHAR2 (300),
   ALLWD_NUM_SLCTD_ANS   INTEGER DEFAULT 1 NOT NULL,
   CATEGORY_CLSFCTN      VARCHAR2 (400),
   QUESTION_HINT         CLOB,
   CONSTRAINT PK_QSTN_ID PRIMARY KEY (QSTN_ID)
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

CREATE INDEX SELF.IDX_QB_CATEGORY_CLSFCTN
   ON SELF.SELF_QUESTION_BANK (CATEGORY_CLSFCTN)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX SELF.IDX_QB_QSTN_ANSR_TYPE
   ON SELF.SELF_QUESTION_BANK (QSTN_ANSR_TYPE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE SELF.SELF_QUESTION_BANK_SEQ;

CREATE SEQUENCE SELF.SELF_QUESTION_BANK_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER SELF.SELF_QUESTION_BANK_TRG
   BEFORE INSERT
   ON SELF.SELF_QUESTION_BANK
   FOR EACH ROW
   WHEN (NEW.QSTN_ID IS NULL)
DECLARE
   V_ID   SELF.SELF_QUESTION_BANK.QSTN_ID%TYPE;
BEGIN
   SELECT   SELF.SELF_QUESTION_BANK_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.QSTN_ID := V_ID;
END SELF_QUESTION_BANK_TRG;