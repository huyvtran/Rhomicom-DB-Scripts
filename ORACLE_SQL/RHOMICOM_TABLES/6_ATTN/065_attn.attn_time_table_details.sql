/* Formatted on 10/6/2014 7:25:56 PM (QP5 v5.126.903.23003) */
CREATE TABLE ATTN.ATTN_TIME_TABLE_DETAILS (
   TIME_TABLE_DET_ID   NUMBER NOT NULL,
   TIME_TABLE_ID       NUMBER,
   EVENT_ID            NUMBER,
   TIME_MAJ_DIV        VARCHAR2 (100 BYTE),
   TIME_MIN_DIV        VARCHAR2 (100 BYTE),
   ASSGND_HOST_ID      NUMBER,
   CREATED_BY          VARCHAR2 (21 BYTE) NOT NULL,
   CREATION_DATE       VARCHAR2 (21 BYTE) NOT NULL,
   LAST_UPDATE_BY      VARCHAR2 (21 BYTE) NOT NULL,
   LAST_UPDATE_DATE    VARCHAR2 (21 BYTE) NOT NULL,
   ASSGND_VENUE_ID     NUMBER,
   IS_ENABLED          VARCHAR2 (1 BYTE)
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

CREATE UNIQUE INDEX ATTN.IDX_TIME_TABLE_DET_ID
   ON ATTN.ATTN_TIME_TABLE_DETAILS (TIME_TABLE_DET_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

   ALTER TABLE ATTN.ATTN_TIME_TABLE_DETAILS ADD (
  CONSTRAINT PK_TIME_TABLE_DET_ID
 PRIMARY KEY
 (TIME_TABLE_DET_ID));

CREATE SEQUENCE ATTN.ATTN_TIME_TABLE_DETAILS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER ATTN.ATTN_TIME_TABLE_DETAILS_TRG
   BEFORE INSERT
   ON ATTN.ATTN_TIME_TABLE_DETAILS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.TIME_TABLE_DET_ID IS NULL)
DECLARE
   V_ID   ATTN.ATTN_TIME_TABLE_DETAILS.TIME_TABLE_DET_ID%TYPE;
BEGIN
   SELECT   ATTN.ATTN_TIME_TABLE_DETAILS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.TIME_TABLE_DET_ID := V_ID;
END ATTN_TIME_TABLE_DETAILS_TRG;