/* Formatted on 12-15-2018 12:28:45 PM (QP5 v5.126.903.23003) */
DROP TABLE SCM.SCM_AUDIT_TRAIL_TBL  CASCADE CONSTRAINTS PURGE;

CREATE TABLE SCM.SCM_AUDIT_TRAIL_TBL (
   USER_ID          NUMBER NOT NULL,
   ACTION_TYPE      CHARACTER VARYING (30 BYTE),
   ACTION_DETAILS   CLOB,
   ACTION_TIME      CHARACTER VARYING (21 BYTE),
   LOGIN_NUMBER     NUMBER,
   DFLT_ROW_ID      NUMBER NOT NULL,
   CONSTRAINT PK_DFLT_ROW_ID PRIMARY KEY (DFLT_ROW_ID)
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

CREATE INDEX SCM.IDX_ACTION_TIME
   ON SCM.SCM_AUDIT_TRAIL_TBL (ACTION_TIME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE INDEX SCM.IDX_ACTION_TYPE
   ON SCM.SCM_AUDIT_TRAIL_TBL (ACTION_TYPE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX SCM.IDX_LOGIN_NUMBER
   ON SCM.SCM_AUDIT_TRAIL_TBL (LOGIN_NUMBER)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX SCM.IDX_USER_ID
   ON SCM.SCM_AUDIT_TRAIL_TBL (USER_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE SCM.SCM_AUDIT_TRAIL_TBL_SEQ;

CREATE SEQUENCE SCM.SCM_AUDIT_TRAIL_TBL_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER SCM.SCM_AUDIT_TRAIL_TBL_TRG
   BEFORE INSERT
   ON SCM.SCM_AUDIT_TRAIL_TBL
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.DFLT_ROW_ID IS NULL)
DECLARE
   V_ID   SCM.SCM_AUDIT_TRAIL_TBL.DFLT_ROW_ID%TYPE;
BEGIN
   SELECT   SCM.SCM_AUDIT_TRAIL_TBL_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.DFLT_ROW_ID := V_ID;
END SCM_AUDIT_TRAIL_TBL_TRG;