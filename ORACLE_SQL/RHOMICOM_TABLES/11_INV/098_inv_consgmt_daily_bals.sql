/* Formatted on 10/6/2014 7:48:23 PM (QP5 v5.126.903.23003) */
-- TABLE: INV.INV_CONSGMT_DAILY_BALS

-- DROP TABLE INV.INV_CONSGMT_DAILY_BALS;

CREATE TABLE INV.INV_CONSGMT_DAILY_BALS (
   BAL_ID              NUMBER NOT NULL,
   CONSGMT_ID          NUMBER,
   CONSGMT_TOT_QTY     NUMBER,
   BALS_DATE           VARCHAR2 (12 BYTE),
   CREATED_BY          NUMBER,
   CREATION_DATE       VARCHAR2 (50 BYTE),
   LAST_UPDATE_BY      NUMBER,
   LAST_UPDATE_DATE    VARCHAR2 (50 BYTE),
   SOURCE_TRNS_IDS     CLOB,
   RESERVATIONS        NUMBER,
   AVAILABLE_BALANCE   NUMBER
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

ALTER TABLE INV.INV_CONSGMT_DAILY_BALS
  ADD(CONSTRAINT PK_CONSGMT_DAILY_BALS PRIMARY KEY (BAL_ID ));

  /*
-- INDEX: INV.INV.IDX_BAL_ID1

-- DROP INDEX INV.INV.IDX_BAL_ID1;

CREATE UNIQUE INDEX INV.IDX_BAL_ID1
   ON INV.INV_CONSGMT_DAILY_BALS (BAL_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;
*/
-- INDEX: INV.INV.IDX_BALS_DATE1

-- DROP INDEX INV.INV.IDX_BALS_DATE1;

CREATE INDEX INV.IDX_BALS_DATE1
   ON INV.INV_CONSGMT_DAILY_BALS (BALS_DATE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: INV.INV.IDX_CONSGMT_ID2

-- DROP INDEX INV.INV.IDX_CONSGMT_ID2;

CREATE INDEX INV.IDX_CONSGMT_ID2
   ON INV.INV_CONSGMT_DAILY_BALS (CONSGMT_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE SEQUENCE INV.INV_CONSGMT_DAILY_BALS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER INV.INV_CONSGMT_DAILY_BALS_TRG
   BEFORE INSERT
   ON INV.INV_CONSGMT_DAILY_BALS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.BAL_ID IS NULL)
DECLARE
   V_ID   INV.INV_CONSGMT_DAILY_BALS.BAL_ID%TYPE;
BEGIN
   SELECT   INV.INV_CONSGMT_DAILY_BALS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.BAL_ID := V_ID;
END INV_CONSGMT_DAILY_BALS_TRG;

--SEQUENCE

--TRIGGER