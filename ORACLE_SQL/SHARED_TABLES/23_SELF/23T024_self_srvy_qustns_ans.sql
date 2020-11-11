/* Formatted on 12-17-2018 5:55:15 PM (QP5 v5.126.903.23003) */
DROP TABLE SELF.SELF_SRVY_QUSTNS_ANS CASCADE CONSTRAINTS PURGE;

CREATE TABLE SELF.SELF_SRVY_QUSTNS_ANS (
   SRVY_QSTN_ANS_ID       NUMBER NOT NULL,
   SRVY_ID                NUMBER,
   QSTN_ID                NUMBER,
   PSSBL_ANS_ID           NUMBER,
   ANS_ORDER              INTEGER,
   CREATED_BY             NUMBER,
   CREATION_DATE          VARCHAR2 (21),
   LAST_UPDATE_BY         NUMBER,
   LAST_UPDATE_DATE       VARCHAR2 (21),
   ANS_DSPLY_CONDTN_SQL   CLOB,
   CONSTRAINT PK_SRVY_QSTN_ANS_ID PRIMARY KEY (SRVY_QSTN_ANS_ID)
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

CREATE INDEX SELF.IDX_SQA_QSTN_ID
   ON SELF.SELF_SRVY_QUSTNS_ANS (QSTN_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX SELF.IDX_SQA_SRVY_ID
   ON SELF.SELF_SRVY_QUSTNS_ANS (SRVY_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE SELF.SELF_SRVY_QUSTNS_ANS_SEQ;

CREATE SEQUENCE SELF.SELF_SRVY_QUSTNS_ANS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER SELF.SELF_SRVY_QUSTNS_ANS_TRG
   BEFORE INSERT
   ON SELF.SELF_SRVY_QUSTNS_ANS
   FOR EACH ROW
   WHEN (NEW.SRVY_QSTN_ANS_ID IS NULL)
DECLARE
   V_ID   SELF.SELF_SRVY_QUSTNS_ANS.SRVY_QSTN_ANS_ID%TYPE;
BEGIN
   SELECT   SELF.SELF_SRVY_QUSTNS_ANS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.SRVY_QSTN_ANS_ID := V_ID;
END SELF_SRVY_QUSTNS_ANS_TRG;