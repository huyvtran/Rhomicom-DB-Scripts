/* Formatted on 9/22/2014 1:34:03 PM (QP5 v5.126.903.23003) */
-- TABLE: ACCB.ACCB_DOC_TMPLTS_HDR

-- DROP TABLE ACCB.ACCB_DOC_TMPLTS_HDR;

CREATE TABLE ACCB.ACCB_DOC_TMPLTS_HDR (
   DOC_TMPLTS_HDR_ID   NUMBER NOT NULL,
   DOC_TMPLT_NAME      VARCHAR2 (200),
   DOC_TMPLT_DESC      VARCHAR2 (300),
   CREATED_BY          NUMBER NOT NULL,
   CREATION_DATE       VARCHAR2 (21),
   LAST_UPDATE_BY      NUMBER NOT NULL,
   LAST_UPDATE_DATE    VARCHAR2 (21) NOT NULL,
   IS_ENABLED          VARCHAR2 (1),
   ORG_ID              NUMBER,
   DOC_TYPE            VARCHAR2 (200),
   CONSTRAINT PK_DOC_TMPLT_HDR_ID PRIMARY KEY (DOC_TMPLTS_HDR_ID)
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

CREATE INDEX ACCB.IDX_DOC_TMPLT_NAME
   ON ACCB.ACCB_DOC_TMPLTS_HDR (DOC_TMPLT_NAME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ACCB.IDX_DOC_TYPE
   ON ACCB.ACCB_DOC_TMPLTS_HDR (DOC_TYPE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ACCB.IDX_IS_ENABLED1
   ON ACCB.ACCB_DOC_TMPLTS_HDR (IS_ENABLED)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE SEQUENCE ACCB.ACCB_DOC_TMPLTS_HDR_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER ACCB.ACCB_DOC_TMPLTS_HDR_TRG
   BEFORE INSERT
   ON ACCB.ACCB_DOC_TMPLTS_HDR
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.DOC_TMPLTS_HDR_ID IS NULL)
DECLARE
   V_ID   ACCB.ACCB_DOC_TMPLTS_HDR.DOC_TMPLTS_HDR_ID%TYPE;
BEGIN
   SELECT   ACCB.ACCB_DOC_TMPLTS_HDR_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.DOC_TMPLTS_HDR_ID := V_ID;
END ACCB_DOC_TMPLTS_HDR_TRG;