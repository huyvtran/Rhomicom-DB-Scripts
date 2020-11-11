/* Formatted on 12-18-2018 5:08:07 PM (QP5 v5.126.903.23003) */
ALTER TABLE EPAY.EPAY_PSB2_INTEREST_DISBURSEMENT_CRITERIA
 DROP PRIMARY KEY CASCADE;
DROP TABLE EPAY.EPAY_PSB2_INTEREST_DISBURSEMENT_CRITERIA CASCADE CONSTRAINTS;

CREATE TABLE EPAY.EPAY_PSB2_INTEREST_DISBURSEMENT_CRITERIA (
   INTDISB_ID         NUMBER NOT NULL,
   PSB_HDR_ID         NUMBER,
   CRITERIA           CLOB,
   CREATED_BY         NUMBER,
   CREATION_DATE      VARCHAR2 (21 BYTE),
   LAST_UPDATE_BY     NUMBER,
   LAST_UPDATE_DATE   VARCHAR2 (21 BYTE),
   CATEGORY_ID        NUMBER
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


CREATE UNIQUE INDEX EPAY.PK_INTDISB_ID
   ON EPAY.EPAY_PSB2_INTEREST_DISBURSEMENT_CRITERIA (INTDISB_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE OR REPLACE TRIGGER EPAY.EPAY_PSB2_INTEREST_DISBURSEMENT_CRITERIA_TRG
   BEFORE INSERT
   ON EPAY.EPAY_PSB2_INTEREST_DISBURSEMENT_CRITERIA
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.INTDISB_ID IS NULL)
DECLARE
   V_ID   EPAY.EPAY_PSB2_INTEREST_DISBURSEMENT_CRITERIA.INTDISB_ID%TYPE;
BEGIN
   SELECT   EPAY.EPAY_PSB2_INTEREST_DISBURSEMENT_CRITERIA_SEQ.NEXTVAL
     INTO   V_ID
     FROM   DUAL;

   :NEW.INTDISB_ID := V_ID;
END EPAY_PSB2_INTEREST_DISBURSEMENT_CRITERIA_TRG;
/

ALTER TABLE EPAY.EPAY_PSB2_INTEREST_DISBURSEMENT_CRITERIA ADD (
  CONSTRAINT PK_INTDISB_ID
 PRIMARY KEY
 (INTDISB_ID));