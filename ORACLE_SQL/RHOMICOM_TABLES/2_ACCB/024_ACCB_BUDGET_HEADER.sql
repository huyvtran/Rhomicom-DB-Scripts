/* Formatted on 9/22/2014 1:01:49 PM (QP5 v5.126.903.23003) */
-- TABLE: ACCB.ACCB_BUDGET_HEADER

-- DROP TABLE ACCB.ACCB_BUDGET_HEADER;

CREATE TABLE ACCB.ACCB_BUDGET_HEADER (
   BUDGET_ID           NUMBER NOT NULL,
   BUDGET_NAME         VARCHAR2 (200 BYTE),
   BUDGET_DESC         VARCHAR2 (300),
   IS_THE_ACTIVE_ONE   VARCHAR2 (1),
   CREATED_BY          NUMBER NOT NULL,
   CREATION_DATE       VARCHAR2 (21) NOT NULL,
   LAST_UPDATE_BY      NUMBER NOT NULL,
   LAST_UPDATE_DATE    VARCHAR2 (21) NOT NULL,
   ORG_ID              NUMBER,
   CONSTRAINT PK_BUDGET_ID PRIMARY KEY (BUDGET_ID)
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

CREATE INDEX ACCB.IDX_BUDGET_DESC
   ON ACCB.ACCB_BUDGET_HEADER (BUDGET_DESC)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ACCB.IDX_BUDGET_NAME
   ON ACCB.ACCB_BUDGET_HEADER (BUDGET_NAME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE SEQUENCE ACCB.ACCB_BUDGET_HEADER_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER ACCB.ACCB_BUDGET_HEADER_TRG
   BEFORE INSERT
   ON ACCB.ACCB_BUDGET_HEADER
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.BUDGET_ID IS NULL)
DECLARE
   V_ID   ACCB.ACCB_BUDGET_HEADER.BUDGET_ID%TYPE;
BEGIN
   SELECT   ACCB.ACCB_BUDGET_HEADER_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.BUDGET_ID := V_ID;
END ACCB_BUDGET_HEADER_TRG;