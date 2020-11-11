/* Formatted on 12-18-2018 9:20:04 PM (QP5 v5.126.903.23003) */
DROP TABLE EPAY.EPAY_PSB9_TRNS_FEES CASCADE CONSTRAINTS PURGE;

CREATE TABLE EPAY.EPAY_PSB9_TRNS_FEES (
   FEE_ID             NUMBER NOT NULL,
   TRANSACTIONS_ID    NUMBER,
   LOW_RANGE          NUMBER,
   HIGH_RANGE         NUMBER,
   FEE                NUMBER,
   CREATED_BY         NUMBER,
   CREATION_DATE      VARCHAR2 (21),
   LAST_UPDATE_BY     NUMBER,
   LAST_UPDATE_DATE   VARCHAR2 (21),
   FEE_TYPE           VARCHAR2 (4) DEFAULT 'GHS' NOT NULL,
   CONSTRAINT PK_PSB9_FEE_ID PRIMARY KEY (FEE_ID)
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

DROP SEQUENCE EPAY.EPAY_PSB9_TRNS_FEES_SEQ;

CREATE SEQUENCE EPAY.EPAY_PSB9_TRNS_FEES_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER EPAY.EPAY_PSB9_TRNS_FEES_TRG
   BEFORE INSERT
   ON EPAY.EPAY_PSB9_TRNS_FEES
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.FEE_ID IS NULL)
DECLARE
   V_ID   EPAY.EPAY_PSB9_TRNS_FEES.FEE_ID%TYPE;
BEGIN
   SELECT   EPAY.EPAY_PSB9_TRNS_FEES_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.FEE_ID := V_ID;
END EPAY_PSB9_TRNS_FEES_TRG;