/* Formatted on 10/6/2014 8:52:27 PM (QP5 v5.126.903.23003) */
-- TABLE: SCM.SCM_PRCHS_DOC_ATTCHMNTS

-- DROP TABLE SCM.SCM_PRCHS_DOC_ATTCHMNTS;

CREATE TABLE SCM.SCM_PRCHS_DOC_ATTCHMNTS (
   ATTCHMNT_ID        NUMBER NOT NULL,
   DOC_HDR_ID         NUMBER NOT NULL,
   ATTCHMNT_DESC      VARCHAR2 (500 BYTE) NOT NULL,
   FILE_NAME          VARCHAR2 (50 BYTE) NOT NULL,
   CREATED_BY         NUMBER NOT NULL,
   CREATION_DATE      VARCHAR2 (21 BYTE) NOT NULL,
   LAST_UPDATE_BY     NUMBER NOT NULL,
   LAST_UPDATE_DATE   VARCHAR2 (21 BYTE) NOT NULL
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

ALTER TABLE SCM.SCM_PRCHS_DOC_ATTCHMNTS
ADD(  CONSTRAINT PK_P_ATTCHMNT_ID PRIMARY KEY (ATTCHMNT_ID ));

-- INDEX: SCM.SCM.IDX_P_ATTCHMNT_DESC

-- DROP INDEX SCM.SCM.IDX_P_ATTCHMNT_DESC;

CREATE INDEX SCM.IDX_P_ATTCHMNT_DESC
   ON SCM.SCM_PRCHS_DOC_ATTCHMNTS (ATTCHMNT_DESC)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

   /*
-- INDEX: SCM.SCM.IDX_P_ATTCHMNT_ID

-- DROP INDEX SCM.SCM.IDX_P_ATTCHMNT_ID;

CREATE UNIQUE INDEX SCM.IDX_P_ATTCHMNT_ID
   ON SCM.SCM_PRCHS_DOC_ATTCHMNTS (ATTCHMNT_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;
*/

-- INDEX: SCM.SCM.IDX_P_ATTCHMT_DOC_HDR_ID

-- DROP INDEX SCM.SCM.IDX_P_ATTCHMT_DOC_HDR_ID;

CREATE INDEX SCM.IDX_P_ATTCHMT_DOC_HDR_ID
   ON SCM.SCM_PRCHS_DOC_ATTCHMNTS (DOC_HDR_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE SEQUENCE SCM.SCM_PRCHS_DOC_ATTCHMNTS_ID_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER SCM.SCM_PRCHS_DOC_ATTCHMNTS_ID_TRG
   BEFORE INSERT
   ON SCM.SCM_PRCHS_DOC_ATTCHMNTS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.ATTCHMNT_ID IS NULL)
DECLARE
   V_ID   SCM.SCM_PRCHS_DOC_ATTCHMNTS.ATTCHMNT_ID%TYPE;
BEGIN
   SELECT   SCM.SCM_PRCHS_DOC_ATTCHMNTS_ID_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.ATTCHMNT_ID := V_ID;
END SCM_PRCHS_DOC_ATTCHMNTS_ID_TRG;