/* Formatted on 24/09/2014 15:33:22 (QP5 v5.126.903.23003) */
-- TABLE: ACCB.ACCB_PERIODS_HDR

-- DROP TABLE ACCB.ACCB_PERIODS_HDR;

CREATE TABLE ACCB.ACCB_PERIODS_HDR (
   PERIODS_HDR_ID           NUMBER NOT NULL,
   PERIOD_HDR_NAME          VARCHAR2 (200),
   PERIOD_HDR_DESC          VARCHAR2 (500),
   PERIOD_TYPE              VARCHAR2 (50),                      -- 1-WEEKLY...
   CREATED_BY               NUMBER NOT NULL,
   CREATION_DATE            VARCHAR2 (21) NOT NULL,
   LAST_UPDATE_BY           NUMBER NOT NULL,
   LAST_UPDATE_DATE         VARCHAR2 (21) NOT NULL,
   USE_PERIODS_FOR_ORG      VARCHAR2 (1) DEFAULT '0' NOT NULL,
   NO_TRNS_WK_DAYS_LOV_NM   VARCHAR2 (200),
   NO_TRNS_DATES_LOV_NM     VARCHAR2 (200),
   ORG_ID                   NUMBER,
   CONSTRAINT PK_PERIOD_HDR_ID PRIMARY KEY (PERIODS_HDR_ID)
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

CREATE INDEX ACCB.IDX_ORG_ID3
   ON ACCB.ACCB_PERIODS_HDR (ORG_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ACCB.IDX_PERIOD_HDR_NAME
   ON ACCB.ACCB_PERIODS_HDR (PERIOD_HDR_NAME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ACCB.IDX_PERIOD_TYPE
   ON ACCB.ACCB_PERIODS_HDR (PERIOD_TYPE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ACCB.IDX_USE_PERIODS_FOR_ORG
   ON ACCB.ACCB_PERIODS_HDR (USE_PERIODS_FOR_ORG)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE SEQUENCE ACCB.ACCB_PERIODS_HDR_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER ACCB.ACCB_PERIODS_HDR_TRG
   BEFORE INSERT
   ON ACCB.ACCB_PERIODS_HDR
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.PERIODS_HDR_ID IS NULL)
DECLARE
   V_ID   ACCB.ACCB_PERIODS_HDR.PERIODS_HDR_ID%TYPE;
BEGIN
   SELECT   ACCB.ACCB_PERIODS_HDR_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.PERIODS_HDR_ID := V_ID;
END ACCB_PERIODS_HDR_TRG;