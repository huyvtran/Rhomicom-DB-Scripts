/* Formatted on 10/6/2014 7:40:41 PM (QP5 v5.126.903.23003) */
CREATE TABLE HOTL.APPLICATION (APPLICATION_ID            NUMBER NOT NULL,
                               SPONSOR_ID                VARCHAR2 (50 BYTE),
                               SPONSOR_NAME              VARCHAR2 (200 BYTE),
                               SPONSOR_PHONE_NO          VARCHAR2 (50 BYTE),
                               SPONSOR_EMAIL             VARCHAR2 (100 BYTE),
                               SPONSOR_ADDRESS           VARCHAR2 (200 BYTE),
                               INTENDED_PAYMENT_METHOD   VARCHAR2 (100 BYTE),
                               CREDIT_CARD_NO            VARCHAR2 (100 BYTE),
                               SIGNATURE_CODE            VARCHAR2 (100 BYTE),
                               CREATED_BY                VARCHAR2 (21 BYTE),
                               CREATION_DATE             VARCHAR2 (21 BYTE),
                               LAST_UPDATE_BY            VARCHAR2 (21 BYTE),
                               LAST_UPDATE_DATE          VARCHAR2 (21 BYTE))
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

CREATE UNIQUE INDEX HOTL.IDX_APPLICATION_ID
   ON HOTL.APPLICATION (APPLICATION_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

ALTER TABLE HOTL.APPLICATION ADD (
  CONSTRAINT PK_APPLICATION_ID
 PRIMARY KEY
 (APPLICATION_ID));

CREATE SEQUENCE HOTL.APPLICATIONS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER HOTL.APPLICATIONS_TRG
   BEFORE INSERT
   ON HOTL.APPLICATION
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.APPLICATION_ID IS NULL)
DECLARE
   V_ID   HOTL.APPLICATION.APPLICATION_ID%TYPE;
BEGIN
   SELECT   HOTL.APPLICATIONS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.APPLICATION_ID := V_ID;
END APPLICATIONS_TRG;