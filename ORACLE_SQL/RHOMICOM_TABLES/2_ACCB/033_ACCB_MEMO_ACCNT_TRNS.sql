/* Formatted on 9/22/2014 3:20:05 PM (QP5 v5.126.903.23003) */
-- TABLE: ACCB.ACCB_MEMO_ACCNT_TRNS

-- DROP TABLE ACCB.ACCB_MEMO_ACCNT_TRNS;

CREATE TABLE ACCB.ACCB_MEMO_ACCNT_TRNS (
   MEMO_TRNS_ID       NUMBER NOT NULL,
   MEMO_ACCNT_ID      NUMBER,
   TRNS_DESC          VARCHAR2 (500),
   DBT_AMOUNT         NUMBER,
   CRDT_AMOUNT        NUMBER,
   NET_AMOUNT         NUMBER,
   CRNCY_ID           NUMBER,
   TRNS_STATUS        VARCHAR2 (1),
   ENTERED_AMNT       NUMBER,
   DBT_OR_CRDT        VARCHAR2 (1),
   CREATED_BY         NUMBER NOT NULL,
   CREATION_DATE      VARCHAR2 (21),
   LAST_UPDATE_BY     NUMBER NOT NULL,
   LAST_UPDATE_DATE   VARCHAR2 (21) NOT NULL,
   CONSTRAINT PK_MEMO_TRNS_ID PRIMARY KEY (MEMO_TRNS_ID)
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

CREATE INDEX ACCB.IDX_MEMO_ACCNT_ID1
   ON ACCB.ACCB_MEMO_ACCNT_TRNS (MEMO_ACCNT_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE SEQUENCE ACCB.ACCB_MEMO_ACCNT_TRNS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER ACCB.ACCB_MEMO_ACCNT_TRNS_TRG
   BEFORE INSERT
   ON ACCB.ACCB_MEMO_ACCNT_TRNS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.MEMO_TRNS_ID IS NULL)
DECLARE
   V_ID   ACCB.ACCB_MEMO_ACCNT_TRNS.MEMO_TRNS_ID%TYPE;
BEGIN
   SELECT   ACCB.ACCB_MEMO_ACCNT_TRNS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.MEMO_TRNS_ID := V_ID;
END ACCB_MEMO_ACCNT_TRNS_TRG;