/* Formatted on 10/6/2014 7:45:28 PM (QP5 v5.126.903.23003) */
-- TABLE: INV.INV_AUDIT_TRAIL_TBL

-- DROP TABLE INV.INV_AUDIT_TRAIL_TBL;

CREATE TABLE INV.INV_AUDIT_TRAIL_TBL (
   USER_ID          NUMBER NOT NULL,
   ACTION_TYPE      CHARACTER VARYING (30 BYTE),
   ACTION_DETAILS   CLOB,
   ACTION_TIME      CHARACTER VARYING (21 BYTE),
   LOGIN_NUMBER     NUMBER,
   DFLT_ROW_ID      NUMBER NOT NULL
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

ALTER TABLE INV.INV_AUDIT_TRAIL_TBL
  ADD(CONSTRAINT PK_DFLT_ROW_ID PRIMARY KEY (DFLT_ROW_ID));
-- INDEX: INV.IDX_ACTION_DETAILS

-- DROP INDEX INV.IDX_ACTION_DETAILS;

/*
CREATE INDEX INV.IDX_ACTION_DETAILS
   ON INV.INV_AUDIT_TRAIL_TBL (ACTION_DETAILS)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;
*/
-- INDEX: INV.IDX_ACTION_TIME

-- DROP INDEX INV.IDX_ACTION_TIME;

CREATE INDEX INV.IDX_ACTION_TIME
   ON INV.INV_AUDIT_TRAIL_TBL (ACTION_TIME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: INV.IDX_ACTION_TYPE

-- DROP INDEX INV.IDX_ACTION_TYPE;

CREATE INDEX INV.IDX_ACTION_TYPE
   ON INV.INV_AUDIT_TRAIL_TBL (ACTION_TYPE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: INV.IDX_ADT_DFLT_ROW_ID

-- DROP INDEX INV.IDX_ADT_DFLT_ROW_ID;

/*
CREATE UNIQUE INDEX IDX_ADT_DFLT_ROW_ID
   ON INV.INV_AUDIT_TRAIL_TBL (DFLT_ROW_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;
*/
-- INDEX: INV.IDX_LOGIN_NUMBER

-- DROP INDEX INV.IDX_LOGIN_NUMBER;

CREATE INDEX INV.IDX_LOGIN_NUMBER
   ON INV.INV_AUDIT_TRAIL_TBL (LOGIN_NUMBER)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: INV.IDX_USER_ID

-- DROP INDEX INV.IDX_USER_ID;

CREATE INDEX INV.IDX_USER_ID
   ON INV.INV_AUDIT_TRAIL_TBL (USER_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE SEQUENCE INV.INV_AUDIT_TRAIL_TBL_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER INV.INV_AUDIT_TRAIL_TBL_TRG
   BEFORE INSERT
   ON INV.INV_AUDIT_TRAIL_TBL
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.DFLT_ROW_ID IS NULL)
DECLARE
   V_ID   INV.INV_AUDIT_TRAIL_TBL.DFLT_ROW_ID%TYPE;
BEGIN
   SELECT   INV.INV_AUDIT_TRAIL_TBL_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.DFLT_ROW_ID := V_ID;
END INV_AUDIT_TRAIL_TBL_TRG;