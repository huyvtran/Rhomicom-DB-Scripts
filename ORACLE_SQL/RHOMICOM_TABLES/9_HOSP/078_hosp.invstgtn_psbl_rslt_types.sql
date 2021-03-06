/* Formatted on 10/6/2014 7:34:06 PM (QP5 v5.126.903.23003) */
CREATE TABLE HOSP.INVSTGTN_PSBL_RSLT_TYPES (
   RSLT_ID            NUMBER NOT NULL,
   INVSTGTN_LIST_ID   NUMBER,
   RSLT               VARCHAR2 (500 BYTE),
   MNG                VARCHAR2 (500 BYTE),                   -- RESULT MEANING
   CREATED_BY         VARCHAR2 (21 BYTE),
   CREATION_DATE      VARCHAR2 (21 BYTE),
   LAST_UPDATE_BY     NUMBER,
   LAST_UPDATE_DATE   VARCHAR2 (21 BYTE),
   CMNTS              VARCHAR2 (500 BYTE)
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

CREATE UNIQUE INDEX HOSP.IDX_ID
   ON HOSP.INVSTGTN_PSBL_RSLT_TYPES (RSLT_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

ALTER TABLE HOSP.INVSTGTN_PSBL_RSLT_TYPES ADD (
  CONSTRAINT PK_RSLT_ID
 PRIMARY KEY
 (RSLT_ID));

CREATE SEQUENCE HOSP.INVSTGTN_PSBL_RSLT_TYPES_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER HOSP.INVSTGTN_PSBL_RSLT_TYPES_TRG
   BEFORE INSERT
   ON HOSP.INVSTGTN_PSBL_RSLT_TYPES
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.RSLT_ID IS NULL)
DECLARE
   V_ID   HOSP.INVSTGTN_PSBL_RSLT_TYPES.RSLT_ID%TYPE;
BEGIN
   SELECT   HOSP.INVSTGTN_PSBL_RSLT_TYPES_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.RSLT_ID := V_ID;
END INVSTGTN_PSBL_RSLT_TYPES_TRG;