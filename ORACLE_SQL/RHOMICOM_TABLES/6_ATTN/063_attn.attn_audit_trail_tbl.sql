/* Formatted on 10/6/2014 7:25:11 PM (QP5 v5.126.903.23003) */
CREATE TABLE ATTN.ATTN_AUDIT_TRAIL_TBL (DFLT_ROW_ID      NUMBER NOT NULL,
                                        USER_ID          NUMBER NOT NULL,
                                        ACTION_TYPE      VARCHAR2 (30 BYTE),
                                        ACTION_DETAILS   CLOB,
                                        ACTION_TIME      VARCHAR2 (21 BYTE),
                                        LOGIN_NUMBER     NUMBER)
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

CREATE UNIQUE INDEX ATTN.IDX_DFLT_ROW_ID_AUDIT
   ON ATTN.ATTN_AUDIT_TRAIL_TBL (DFLT_ROW_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

   ALTER TABLE ATTN.ATTN_AUDIT_TRAIL_TBL ADD (
  CONSTRAINT PK_DFLT_ROW_ID_AUDIT
 PRIMARY KEY
 (DFLT_ROW_ID));


CREATE INDEX ATTN.IDX_ACTION_TIME
   ON ATTN.ATTN_AUDIT_TRAIL_TBL (ACTION_TIME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ATTN.IDX_ACTION_TYPE
   ON ATTN.ATTN_AUDIT_TRAIL_TBL (ACTION_TYPE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ATTN.IDX_LOGIN_NUMBER
   ON ATTN.ATTN_AUDIT_TRAIL_TBL (LOGIN_NUMBER)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ATTN.IDX_USER_ID
   ON ATTN.ATTN_AUDIT_TRAIL_TBL (USER_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE SEQUENCE ATTN.ATTN_AUDIT_TRAIL_TBL_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER ATTN.ATTN_AUDIT_TRAIL_TBL_TRG
   BEFORE INSERT
   ON ATTN.ATTN_AUDIT_TRAIL_TBL
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.DFLT_ROW_ID IS NULL)
DECLARE
   V_ID   ATTN.ATTN_AUDIT_TRAIL_TBL.DFLT_ROW_ID%TYPE;
BEGIN
   SELECT   ATTN.ATTN_AUDIT_TRAIL_TBL_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.DFLT_ROW_ID := V_ID;
END ATTN_AUDIT_TRAIL_TBL_TRG;