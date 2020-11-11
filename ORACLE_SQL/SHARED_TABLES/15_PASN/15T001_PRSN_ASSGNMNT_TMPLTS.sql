/* Formatted on 12-15-2018 8:47:51 AM (QP5 v5.126.903.23003) */
DROP TABLE PASN.PRSN_ASSGNMNT_TMPLTS  CASCADE CONSTRAINTS PURGE;

CREATE TABLE PASN.PRSN_ASSGNMNT_TMPLTS (
   TMPLT_ID            NUMBER NOT NULL,
   TMPLT_NAME          VARCHAR2 (200 BYTE),
   TMPLT_DESC          VARCHAR2 (500 BYTE),
   IS_ENABLED          VARCHAR2 (1 BYTE),
   CREATED_BY          NUMBER NOT NULL,
   CREATION_DATE       VARCHAR2 (21 BYTE) NOT NULL,
   LAST_UPDATE_BY      NUMBER NOT NULL,
   LAST_UPDATE_DATE    VARCHAR2 (21 BYTE) NOT NULL,
   DIV_IDS             CLOB,
   GRADE_ID            NUMBER,
   JOB_ID              NUMBER,
   LOC_ID              NUMBER,
   POS_ID              NUMBER,
   SPRVSOR_ID          NUMBER,
   WKHR_ID             NUMBER,
   PRSN_TYP            VARCHAR2 (300 BYTE),
   PRSN_TYP_ASGN_RSN   VARCHAR2 (300 BYTE),
   PRSN_TYP_FUTH_DET   VARCHAR2 (300 BYTE),
   GATH_TYP_IDS        CLOB,
   PAY_ITEM_IDS        CLOB,
   PAY_ITEM_VAL_IDS    CLOB,
   ORG_ID              NUMBER
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

CREATE UNIQUE INDEX PASN.IDX_TMPLT_ID
   ON PASN.PRSN_ASSGNMNT_TMPLTS (TMPLT_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

ALTER TABLE PASN.PRSN_ASSGNMNT_TMPLTS ADD (
  CONSTRAINT PK_TMPLT_ID
 PRIMARY KEY
 (TMPLT_ID));

CREATE INDEX PASN.IDX_TMPLT_DESC
   ON PASN.PRSN_ASSGNMNT_TMPLTS (TMPLT_DESC)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE UNIQUE INDEX PASN.IDX_TMPLT_NAME
   ON PASN.PRSN_ASSGNMNT_TMPLTS (TMPLT_NAME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE PASN.PRSN_ASSGNMNT_TMPLTS_SEQ;

CREATE SEQUENCE PASN.PRSN_ASSGNMNT_TMPLTS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER PASN.PRSN_ASSGNMNT_TMPLTS_TRG
   BEFORE INSERT
   ON PASN.PRSN_ASSGNMNT_TMPLTS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.TMPLT_ID IS NULL)
DECLARE
   V_ID   PASN.PRSN_ASSGNMNT_TMPLTS.TMPLT_ID%TYPE;
BEGIN
   SELECT   PASN.PRSN_ASSGNMNT_TMPLTS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.TMPLT_ID := V_ID;
END PRSN_ASSGNMNT_TMPLTS_TRG;