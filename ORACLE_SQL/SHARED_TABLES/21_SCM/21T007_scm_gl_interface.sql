/* Formatted on 10/6/2014 8:51:38 PM (QP5 v5.126.903.23003) */
-- TABLE: SCM.SCM_GL_INTERFACE

-- DROP TABLE SCM.SCM_GL_INTERFACE;

CREATE TABLE SCM.SCM_GL_INTERFACE (
   INTERFACE_ID       NUMBER NOT NULL,
   ACCNT_ID           NUMBER,
   TRANSACTION_DESC   VARCHAR2 (500 BYTE) NOT NULL,
   DBT_AMOUNT         NUMBER DEFAULT 0.00 NOT NULL,
   TRNSCTN_DATE       VARCHAR2 (21 BYTE),
   FUNC_CUR_ID        NUMBER,
   CREATED_BY         NUMBER NOT NULL,
   CREATION_DATE      VARCHAR2 (21 BYTE),
   CRDT_AMOUNT        NUMBER DEFAULT 0.00 NOT NULL,
   LAST_UPDATE_BY     NUMBER NOT NULL,
   LAST_UPDATE_DATE   VARCHAR2 (21 BYTE) NOT NULL,
   NET_AMOUNT         NUMBER DEFAULT 0.00 NOT NULL,
   GL_BATCH_ID        NUMBER DEFAULT -1 NOT NULL,
   SRC_DOC_TYP        VARCHAR2 (100 BYTE),
   SRC_DOC_ID         NUMBER NOT NULL,
   SRC_DOC_LINE_ID    NUMBER,
   TRNS_LN_TYPE       VARCHAR2 (50 BYTE) DEFAULT '' NOT NULL,
   TRNS_SOURCE        VARCHAR2 (3 BYTE) DEFAULT 'SYS' NOT NULL
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

ALTER TABLE SCM.SCM_GL_INTERFACE
ADD(  CONSTRAINT PK_INTFC_ID PRIMARY KEY (INTERFACE_ID ));

-- INDEX: SCM.SCM.IDX_INFC_GL_BATCH_ID

-- DROP INDEX SCM.SCM.IDX_INFC_GL_BATCH_ID;

CREATE INDEX SCM.IDX_INFC_GL_BATCH_ID
   ON SCM.SCM_GL_INTERFACE (GL_BATCH_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: SCM.SCM.IDX_INFC_TRNSCTN_DATE

-- DROP INDEX SCM.SCM.IDX_INFC_TRNSCTN_DATE;

CREATE INDEX SCM.IDX_INFC_TRNSCTN_DATE
   ON SCM.SCM_GL_INTERFACE (TRNSCTN_DATE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

   /*
-- INDEX: SCM.SCM.IDX_INTERFACE_ID

-- DROP INDEX SCM.SCM.IDX_INTERFACE_ID;

CREATE UNIQUE INDEX SCM.IDX_INTERFACE_ID
   ON SCM.SCM_GL_INTERFACE (INTERFACE_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;
*/

-- INDEX: SCM.SCM.IDX_INTFC_ACCNT_ID

-- DROP INDEX SCM.SCM.IDX_INTFC_ACCNT_ID;

CREATE INDEX SCM.IDX_INTFC_ACCNT_ID
   ON SCM.SCM_GL_INTERFACE (ACCNT_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE SEQUENCE SCM.SCM_GL_INTERFACE_ID_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER SCM.SCM_GL_INTERFACE_ID_TRG
   BEFORE INSERT
   ON SCM.SCM_GL_INTERFACE
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.INTERFACE_ID IS NULL)
DECLARE
   V_ID   SCM.SCM_GL_INTERFACE.INTERFACE_ID%TYPE;
BEGIN
   SELECT   SCM.SCM_GL_INTERFACE_ID_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.INTERFACE_ID := V_ID;
END SCM_GL_INTERFACE_ID_TRG;