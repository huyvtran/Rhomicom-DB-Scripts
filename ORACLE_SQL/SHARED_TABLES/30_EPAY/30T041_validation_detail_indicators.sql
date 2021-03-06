/* Formatted on 12-18-2018 9:33:07 PM (QP5 v5.126.903.23003) */
DROP TABLE EPAY.VALIDATION_DETAIL_INDICATORS CASCADE CONSTRAINTS PURGE;

CREATE TABLE EPAY.VALIDATION_DETAIL_INDICATORS (
   VLDTN_DETIND_ID    NUMBER NOT NULL,
   VLDTN_DET_ID       NUMBER,
   INDICATOR_ID       NUMBER,
   CREATED_BY         NUMBER,
   CREATION_DATE      VARCHAR2 (21),
   LAST_UPDATE_BY     NUMBER,
   LAST_UPDATE_DATE   VARCHAR2 (21),
   CATEGORY_ID        NUMBER,
   CONSTRAINT PK_DETIND_ID PRIMARY KEY (VLDTN_DETIND_ID)
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

DROP SEQUENCE EPAY.VALIDATION_DETAIL_INDICATORS_SEQ;

CREATE SEQUENCE EPAY.VALIDATION_DETAIL_INDICATORS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER EPAY.VALIDATION_DETAIL_INDICATORS_TRG
   BEFORE INSERT
   ON EPAY.VALIDATION_DETAIL_INDICATORS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.VLDTN_DETIND_ID IS NULL)
DECLARE
   V_ID   EPAY.VALIDATION_DETAIL_INDICATORS.VLDTN_DETIND_ID%TYPE;
BEGIN
   SELECT   EPAY.VALIDATION_DETAIL_INDICATORS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.VLDTN_DETIND_ID := V_ID;
END VALIDATION_DETAIL_INDICATORS_TRG;