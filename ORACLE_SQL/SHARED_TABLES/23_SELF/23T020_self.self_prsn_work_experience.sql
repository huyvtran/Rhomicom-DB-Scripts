/* Formatted on 12-17-2018 5:03:03 PM (QP5 v5.126.903.23003) */
DROP TABLE SELF.SELF_PRSN_WORK_EXPERIENCE CASCADE CONSTRAINTS PURGE;

CREATE TABLE SELF.SELF_PRSN_WORK_EXPERIENCE (
   PERSON_ID          NUMBER NOT NULL,
   JOB_NAME_TITLE     VARCHAR2 (200),
   INSTITUTION_NAME   VARCHAR2 (200),
   JOB_LOCATION       VARCHAR2 (200),
   JOB_DESCRIPTION    VARCHAR2 (300),
   FEATS_ACHVMENTS    VARCHAR2 (300),
   JOB_START_DATE     VARCHAR2 (12),
   JOB_END_DATE       VARCHAR2 (12),
   CREATED_BY         NUMBER NOT NULL,
   CREATION_DATE      VARCHAR2 (21) NOT NULL,
   LAST_UPDATE_BY     NUMBER NOT NULL,
   LAST_UPDATE_DATE   VARCHAR2 (21) NOT NULL,
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

CREATE INDEX SELF.IDX_PW_PERSON_ID
   ON SELF.SELF_PRSN_WORK_EXPERIENCE (PERSON_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX SELF.IDX_PW_JOB_NAME_TITLE
   ON SELF.SELF_PRSN_WORK_EXPERIENCE (JOB_NAME_TITLE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE SELF.SELF_PRSN_WORK_EXPERIENCE_SEQ;

CREATE SEQUENCE SELF.SELF_PRSN_WORK_EXPERIENCE_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER SELF.SELF_PRSN_WORK_EXPERIENCE_TRG
   BEFORE INSERT
   ON SELF.SELF_PRSN_WORK_EXPERIENCE
   FOR EACH ROW
   WHEN (NEW.WRK_EXPRNC_ID IS NULL)
DECLARE
   V_ID   SELF.SELF_PRSN_WORK_EXPERIENCE.WRK_EXPRNC_ID%TYPE;
BEGIN
   SELECT   SELF.SELF_PRSN_WORK_EXPERIENCE_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.WRK_EXPRNC_ID := V_ID;
END SELF_PRSN_WORK_EXPERIENCE_TRG;