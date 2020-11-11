/* Formatted on 12-22-2018 12:04:54 AM (QP5 v5.126.903.23003) */
DROP TABLE WKF.WKF_MANL_HIERARCHY_DETAILS CASCADE CONSTRAINTS PURGE;

CREATE TABLE WKF.WKF_MANL_HIERARCHY_DETAILS (
   MNL_HRCHY_DET_ID   NUMBER NOT NULL,
   HIERARCHY_ID       NUMBER,
   PERSON_ID          NUMBER,
   HRCHY_LEVEL        NUMBER,
   CREATED_BY         NUMBER NOT NULL,
   CREATION_DATE      VARCHAR2 (21 BYTE),
   LAST_UPDATE_BY     NUMBER NOT NULL,
   LAST_UPDATE_DATE   VARCHAR2 (21 BYTE) NOT NULL,
   IS_ENABLED         VARCHAR2 (1 BYTE),
   APPRVR_GROUP_ID    INTEGER DEFAULT -1 NOT NULL,
   POSITION_ID        INTEGER DEFAULT -1 NOT NULL,
   APPRVR_TYPE        VARCHAR2 (15) DEFAULT 'Group' NOT NULL
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

ALTER TABLE WKF.WKF_MANL_HIERARCHY_DETAILS
ADD(  CONSTRAINT PK_MNL_HRCHY_DET_ID PRIMARY KEY (MNL_HRCHY_DET_ID ));
DROP SEQUENCE WKF.WKF_MANL_HIERARCHY_DTLS_ID_SEQ;

CREATE SEQUENCE WKF.WKF_MANL_HIERARCHY_DTLS_ID_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER WKF.WKF_MANL_HIERARCHY_DTLS_ID_TRG
   BEFORE INSERT
   ON WKF.WKF_MANL_HIERARCHY_DETAILS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.MNL_HRCHY_DET_ID IS NULL)
DECLARE
   V_ID   WKF.WKF_MANL_HIERARCHY_DETAILS.MNL_HRCHY_DET_ID%TYPE;
BEGIN
   SELECT   WKF.WKF_MANL_HIERARCHY_DTLS_ID_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.MNL_HRCHY_DET_ID := V_ID;
END WKF_MANL_HIERARCHY_DTLS_ID_TRG;