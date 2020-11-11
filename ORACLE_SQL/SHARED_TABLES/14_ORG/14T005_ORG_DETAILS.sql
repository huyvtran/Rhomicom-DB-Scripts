/* Formatted on 12-15-2018 7:59:12 AM (QP5 v5.126.903.23003) */
DROP TABLE ORG.ORG_DETAILS  CASCADE CONSTRAINTS PURGE;

CREATE TABLE ORG.ORG_DETAILS (
   ORG_ID                 NUMBER NOT NULL,
   ORG_NAME               VARCHAR2 (200 BYTE),
   PARENT_ORG_ID          NUMBER,
   RES_ADDRS              VARCHAR2 (300 BYTE),
   PSTL_ADDRS             VARCHAR2 (300 BYTE),
   EMAIL_ADDRSSES         VARCHAR2 (300 BYTE),
   WEBSITES               VARCHAR2 (300 BYTE),
   CNTCT_NOS              VARCHAR2 (300 BYTE),
   ORG_TYP_ID             NUMBER,
   IS_ENABLED             VARCHAR2 (1 BYTE),
   CREATED_BY             NUMBER NOT NULL,
   CREATION_DATE          VARCHAR2 (21 BYTE) NOT NULL,
   LAST_UPDATE_BY         NUMBER NOT NULL,
   LAST_UPDATE_DATE       VARCHAR2 (21 BYTE) NOT NULL,
   OPRTNL_CRNCY_ID        NUMBER,
   ORG_LOGO               VARCHAR2 (300 BYTE),
   ORG_DESC               CLOB,
   ORG_SLOGAN             VARCHAR2 (300 BYTE) DEFAULT '' NOT NULL,
   NO_OF_ACCNT_SGMNTS     INTEGER DEFAULT 1 NOT NULL,
   SEGMENT_DELIMITER      VARCHAR2 (10) DEFAULT 'Period (.)' NOT NULL,
   LOC_SGMNT_NUMBER       INTEGER DEFAULT 1 NOT NULL,
   SUB_LOC_SGMNT_NUMBER   INTEGER DEFAULT 0 NOT NULL
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

CREATE UNIQUE INDEX ORG.IDX_ORG_ID
   ON ORG.ORG_DETAILS (ORG_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

ALTER TABLE ORG.ORG_DETAILS ADD (
  CONSTRAINT PK_ORG_ID
 PRIMARY KEY
 (ORG_ID));

CREATE INDEX ORG.IDX_CNTCT_NOS
   ON ORG.ORG_DETAILS (CNTCT_NOS)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ORG.IDX_EMAIL_ADDRSSES
   ON ORG.ORG_DETAILS (EMAIL_ADDRSSES)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ORG.IDX_OPRTNL_CRNCY_ID
   ON ORG.ORG_DETAILS (OPRTNL_CRNCY_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE UNIQUE INDEX ORG.IDX_ORG_NAME
   ON ORG.ORG_DETAILS (ORG_NAME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ORG.IDX_ORG_TYP_ID
   ON ORG.ORG_DETAILS (ORG_TYP_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ORG.IDX_PARENT_ORG_ID
   ON ORG.ORG_DETAILS (PARENT_ORG_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ORG.IDX_PSTL_ADDRS
   ON ORG.ORG_DETAILS (PSTL_ADDRS)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE INDEX ORG.IDX_RES_ADDRS
   ON ORG.ORG_DETAILS (RES_ADDRS)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE INDEX ORG.IDX_WEBSITES
   ON ORG.ORG_DETAILS (WEBSITES)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE ORG.ORG_DETAILS_SEQ;

CREATE SEQUENCE ORG.ORG_DETAILS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER ORG.ORG_DETAILS_TRG
   BEFORE INSERT
   ON ORG.ORG_DETAILS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.ORG_ID IS NULL)
DECLARE
   V_ID   ORG.ORG_DETAILS.ORG_ID%TYPE;
BEGIN
   SELECT   ORG.ORG_DETAILS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.ORG_ID := V_ID;
END ORG_DETAILS_TRG;