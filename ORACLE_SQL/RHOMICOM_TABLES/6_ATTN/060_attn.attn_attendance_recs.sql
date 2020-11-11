/* Formatted on 10/6/2014 7:23:48 PM (QP5 v5.126.903.23003) */
CREATE TABLE ATTN.ATTN_ATTENDANCE_RECS (
   ATTND_REC_ID       NUMBER NOT NULL,
   RECS_HDR_ID        NUMBER,
   PERSON_ID          NUMBER,
   DATE_TIME_IN       VARCHAR2 (21 BYTE),
   DATE_TIME_OUT      VARCHAR2 (21 BYTE),
   CREATED_BY         VARCHAR2 (21 BYTE) NOT NULL,
   CREATION_DATE      VARCHAR2 (21 BYTE) NOT NULL,
   LAST_UPDATE_BY     VARCHAR2 (21 BYTE) NOT NULL,
   LAST_UPDATE_DATE   VARCHAR2 (21 BYTE) NOT NULL,
   IS_PRESENT         VARCHAR2 (1 BYTE),
   ATTN_COMMENTS      VARCHAR2 (300 BYTE)
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

CREATE UNIQUE INDEX ATTN.IDX_ATTND_REC_ID
   ON ATTN.ATTN_ATTENDANCE_RECS (ATTND_REC_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

   ALTER TABLE ATTN.ATTN_ATTENDANCE_RECS ADD (
  CONSTRAINT PK_ATTND_REC_ID
 PRIMARY KEY
 (ATTND_REC_ID));

CREATE SEQUENCE ATTN.ATTN_ATTENDANCE_RECS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER ATTN.ATTN_ATTENDANCE_RECS_TRG
   BEFORE INSERT
   ON ATTN.ATTN_ATTENDANCE_RECS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.ATTND_REC_ID IS NULL)
DECLARE
   V_ID   ATTN.ATTN_ATTENDANCE_RECS.ATTND_REC_ID%TYPE;
BEGIN
   SELECT   ATTN.ATTN_ATTENDANCE_RECS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.ATTND_REC_ID := V_ID;
END ATTN_ATTENDANCE_RECS_TRG;