/* Formatted on 12-15-2018 10:24:24 AM (QP5 v5.126.903.23003) */
DROP TABLE PRS.PRSN_WORK_EXPERIENCE  CASCADE CONSTRAINTS PURGE;

CREATE TABLE PRS.PRSN_WORK_EXPERIENCE (
   PERSON_ID          NUMBER NOT NULL,
   JOB_NAME_TITLE     VARCHAR2 (200 BYTE),
   INSTITUTION_NAME   VARCHAR2 (200 BYTE),
   JOB_LOCATION       VARCHAR2 (200 BYTE),
   JOB_DESCRIPTION    VARCHAR2 (300 BYTE),
   FEATS_ACHVMENTS    VARCHAR2 (300 BYTE),
   JOB_START_DATE     VARCHAR2 (12 BYTE),
   JOB_END_DATE       VARCHAR2 (12 BYTE),
   CREATED_BY         NUMBER DEFAULT (-1) NOT NULL,
   CREATION_DATE      VARCHAR2 (21 BYTE) NOT NULL,
   LAST_UPDATE_BY     NUMBER NOT NULL,
   LAST_UPDATE_DATE   VARCHAR2 (21 BYTE) NOT NULL,
   WRK_EXPRNC_ID      NUMBER NOT NULL,
   CONSTRAINT PK_WRK_EXP_ID PRIMARY KEY (WRK_EXPRNC_ID)
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


CREATE INDEX PRS.IDX_INSTITUTION_NAME
   ON PRS.PRSN_WORK_EXPERIENCE (INSTITUTION_NAME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX PRS.IDX_JOB_DESCRIPTION
   ON PRS.PRSN_WORK_EXPERIENCE (JOB_DESCRIPTION)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX PRS.IDX_JOB_LOCATION
   ON PRS.PRSN_WORK_EXPERIENCE (JOB_LOCATION)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX PRS.IDX_JOB_NAME_TITLE
   ON PRS.PRSN_WORK_EXPERIENCE (JOB_NAME_TITLE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX PRS.IDX_WK_PERSON_ID
   ON PRS.PRSN_WORK_EXPERIENCE (PERSON_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE PRS.PRSN_WORK_EXPERIENCE_SEQ;

CREATE SEQUENCE PRS.PRSN_WORK_EXPERIENCE_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER PRS.PRSN_WORK_EXPERIENCE_TRG
   BEFORE INSERT
   ON PRS.PRSN_WORK_EXPERIENCE
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.WRK_EXPRNC_ID IS NULL)
DECLARE
   V_ID   PRS.PRSN_WORK_EXPERIENCE.WRK_EXPRNC_ID%TYPE;
BEGIN
   SELECT   PRS.PRSN_WORK_EXPERIENCE_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.WRK_EXPRNC_ID := V_ID;
END PRSN_WORK_EXPERIENCE_TRG;