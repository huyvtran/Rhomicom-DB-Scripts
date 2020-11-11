/* Formatted on 10/6/2014 7:34:42 PM (QP5 v5.126.903.23003) */
CREATE TABLE HOSP.PRSCPTN (PRSCPTN_ID           NUMBER,
                           CNSLTN_ID            NUMBER,
                           PRSCRBD_QTY          NUMBER,
                           PRSCRBD_DSGE         VARCHAR2 (200 BYTE),
                           PRSCRBD_DSGE_MTHD    VARCHAR2 (200 BYTE),
                           CREATED_BY           VARCHAR2 (21 BYTE),
                           CREATION_DATE        VARCHAR2 (21 BYTE),
                           LAST_UPDATE_BY       VARCHAR2 (21 BYTE),
                           LAST_UPDATE_DATE     VARCHAR2 (21 BYTE),
                           PRSCRBD_ITM_DESC     VARCHAR2 (200 BYTE),
                           RQSTR_APRVL_STATUS   VARCHAR2 (20 BYTE), -- REQUESTOR'S APPROVAL STATUS...
                           DOC_CMNTS            VARCHAR2 (500 BYTE),
                           PHARM_CMNTS          VARCHAR2 (500 BYTE),
                           DSPNSD_STATUS        VARCHAR2 (20 BYTE), -- DISPENSED STATUS...
                           DEST_APPNTMNT_ID     NUMBER,
                           ITM_ID               NUMBER)
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

CREATE UNIQUE INDEX HOSP.IDX_PRSCPTN_ID
   ON HOSP.PRSCPTN (PRSCPTN_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

ALTER TABLE HOSP.PRSCPTN ADD (
  CONSTRAINT PK_PRSCPTN_ID
 PRIMARY KEY
 (PRSCPTN_ID));

CREATE SEQUENCE HOSP.PRSCPTN_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER HOSP.PRSCPTN_TRG
   BEFORE INSERT
   ON HOSP.PRSCPTN
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.PRSCPTN_ID IS NULL)
DECLARE
   V_ID   HOSP.PRSCPTN.PRSCPTN_ID%TYPE;
BEGIN
   SELECT   HOSP.PRSCPTN_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.PRSCPTN_ID := V_ID;
END PRSCPTN_TRG;