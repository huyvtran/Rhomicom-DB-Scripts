/* Formatted on 12-15-2018 10:36:54 AM (QP5 v5.126.903.23003) */
DROP TABLE RPT.RPT_AUDIT_TRAIL_TBL  CASCADE CONSTRAINTS PURGE;

CREATE TABLE RPT.RPT_AUDIT_TRAIL_TBL (
   USER_ID          NUMBER NOT NULL,
   ACTION_TYPE      VARCHAR2 (100 BYTE),
   ACTION_DETAILS   CLOB,
   ACTION_TIME      VARCHAR2 (21 BYTE),
   LOGIN_NUMBER     NUMBER NOT NULL,
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

CREATE INDEX RPT.IDX_ACTION_TIME
   ON RPT.RPT_AUDIT_TRAIL_TBL (ACTION_TIME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: RPT.RPT.IDX_ACTION_TYPE

-- DROP INDEX RPT.RPT.IDX_ACTION_TYPE;

CREATE INDEX RPT.IDX_ACTION_TYPE
   ON RPT.RPT_AUDIT_TRAIL_TBL (ACTION_TYPE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX RPT.IDX_LOGIN_NUMBER
   ON RPT.RPT_AUDIT_TRAIL_TBL (LOGIN_NUMBER)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: RPT.RPT.IDX_USER_ID

-- DROP INDEX RPT.RPT.IDX_USER_ID;

CREATE INDEX RPT.IDX_RPT_USER_ID
   ON RPT.RPT_AUDIT_TRAIL_TBL (USER_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE RPT.RPT_AUDIT_TRAIL_DFT_ROW_ID_SEQ;

CREATE SEQUENCE RPT.RPT_AUDIT_TRAIL_DFT_ROW_ID_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER RPT.RPT_AUDIT_TRAIL_ROW_ID_SEQ
   BEFORE INSERT
   ON RPT.RPT_AUDIT_TRAIL_TBL
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.DFLT_ROW_ID IS NULL)
DECLARE
   V_ID   RPT.RPT_AUDIT_TRAIL_TBL.DFLT_ROW_ID%TYPE;
BEGIN
   SELECT   RPT.RPT_AUDIT_TRAIL_DFT_ROW_ID_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.DFLT_ROW_ID := V_ID;
END RPT_AUDIT_TRAIL_ROW_ID_SEQ;