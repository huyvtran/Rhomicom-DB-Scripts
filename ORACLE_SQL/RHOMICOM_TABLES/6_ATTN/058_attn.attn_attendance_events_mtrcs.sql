/* Formatted on 10/6/2014 7:23:04 PM (QP5 v5.126.903.23003) */
--DROP TABLE ATTN.ATTN_ATTENDANCE_EVENTS_MTRCS;

CREATE TABLE ATTN.ATTN_ATTENDANCE_EVENTS_MTRCS (
   RSLT_METRIC_ID          NUMBER NOT NULL,
   RSLT_METRIC_NAME_DESC   VARCHAR2 (500 BYTE),
   RSLT_TYPE               VARCHAR2 (100 BYTE),
   RSLT_COMMENT            VARCHAR2 (500 BYTE),
   RSLT_QUERY              CLOB,
   CREATED_BY              VARCHAR2 (21 BYTE) NOT NULL,
   CREATION_DATE           VARCHAR2 (21 BYTE) NOT NULL,
   LAST_UPDATE_BY          VARCHAR2 (21 BYTE) NOT NULL,
   LAST_UPDATE_DATE        VARCHAR2 (21 BYTE) NOT NULL,
   EVENT_ID                NUMBER NOT NULL,
   IS_ENABLED              VARCHAR2 (1 BYTE) NOT NULL
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

CREATE UNIQUE INDEX ATTN.IDX_RSLT_METRIC_ID
   ON ATTN.ATTN_ATTENDANCE_EVENTS_MTRCS (RSLT_METRIC_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

   ALTER TABLE ATTN.ATTN_ATTENDANCE_EVENTS_MTRCS ADD (
  CONSTRAINT PK_RSLT_METRIC_ID
 PRIMARY KEY
 (RSLT_METRIC_ID));

CREATE SEQUENCE ATTN.ATTN_ATTENDANCE_MTRCS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER ATTN.ATTN_ATTENDANCE_MTRCS_TRG
   BEFORE INSERT
   ON ATTN.ATTN_ATTENDANCE_EVENTS_MTRCS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.RSLT_METRIC_ID IS NULL)
DECLARE
   V_ID   ATTN.ATTN_ATTENDANCE_EVENTS_MTRCS.RSLT_METRIC_ID%TYPE;
BEGIN
   SELECT   ATTN.ATTN_ATTENDANCE_MTRCS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.RSLT_METRIC_ID := V_ID;
END ATTN_ATTENDANCE_MTRCS_TRG;