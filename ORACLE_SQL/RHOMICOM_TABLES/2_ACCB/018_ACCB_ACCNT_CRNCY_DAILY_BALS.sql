/* Formatted on 9/21/2014 8:46:58 PM (QP5 v5.126.903.23003) */
-- TABLE: ACCB.ACCB_ACCNT_CRNCY_DAILY_BALS
--DROP TABLE ACCB.ACCB_ACCNT_CRNCY_DAILY_BALS;

CREATE TABLE ACCB.ACCB_ACCNT_CRNCY_DAILY_BALS (
   DAILY_CBALS_ID     NUMBER NOT NULL,
   ACCNT_ID           NUMBER NOT NULL,
   NET_BALANCE        NUMBER NOT NULL,
   DBT_BAL            NUMBER DEFAULT 0.00 NOT NULL,
   CRDT_BAL           NUMBER DEFAULT 0.00 NOT NULL,
   AS_AT_DATE         VARCHAR2 (12 BYTE),
   CREATED_BY         NUMBER NOT NULL,
   CREATION_DATE      VARCHAR2 (21 BYTE) NOT NULL,
   LAST_UPDATE_BY     NUMBER NOT NULL,
   LAST_UPDATE_DATE   VARCHAR2 (21 BYTE) NOT NULL,
   SRC_TRNS_IDS       CLOB DEFAULT ',' NOT NULL,
   CRNCY_ID           NUMBER DEFAULT (-1) NOT NULL,
   CONSTRAINT PK_CBALS_BALSHT_ID PRIMARY KEY (DAILY_CBALS_ID)
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

CREATE INDEX ACCB.IDX_CBALS_AS_AT_DATE
   ON ACCB.ACCB_ACCNT_CRNCY_DAILY_BALS (AS_AT_DATE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE INDEX ACCB.IDX_CBALS_CREATED_BY
   ON ACCB.ACCB_ACCNT_CRNCY_DAILY_BALS (CREATED_BY)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ACCB.IDX_CBALS_CREATION_DATE
   ON ACCB.ACCB_ACCNT_CRNCY_DAILY_BALS (CREATION_DATE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ACCB.IDX_CBALS_CRNCY_ID
   ON ACCB.ACCB_ACCNT_CRNCY_DAILY_BALS (CRNCY_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ACCB.IDX_CBALS_D_BAL_ACCNT_ID
   ON ACCB.ACCB_ACCNT_CRNCY_DAILY_BALS (ACCNT_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ACCB.IDX_CBALS_LAST_UPDATE_BY
   ON ACCB.ACCB_ACCNT_CRNCY_DAILY_BALS (LAST_UPDATE_BY)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ACCB.IDX_CBALS_LAST_UPDATE_DATE
   ON ACCB.ACCB_ACCNT_CRNCY_DAILY_BALS (LAST_UPDATE_DATE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE SEQUENCE ACCB.ACCB_ACCNT_CRNCY_DBALS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER ACCB.ACCB_ACCNT_CRNCY_DBALS_TRG
   BEFORE INSERT
   ON ACCB.ACCB_ACCNT_CRNCY_DAILY_BALS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.DAILY_CBALS_ID IS NULL)
DECLARE
   V_ID   ACCB.ACCB_ACCNT_CRNCY_DAILY_BALS.DAILY_CBALS_ID%TYPE;
BEGIN
   SELECT   ACCB.ACCB_ACCNT_CRNCY_DBALS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.DAILY_CBALS_ID := V_ID;
END ACCB_ACCNT_CRNCY_DBALS_TRG;