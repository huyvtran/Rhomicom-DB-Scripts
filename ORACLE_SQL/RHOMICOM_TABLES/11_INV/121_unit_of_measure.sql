/* Formatted on 10/6/2014 8:24:10 PM (QP5 v5.126.903.23003) */
-- TABLE: INV.UNIT_OF_MEASURE

-- DROP TABLE INV.UNIT_OF_MEASURE;

CREATE TABLE INV.UNIT_OF_MEASURE (UOM_ID             NUMBER NOT NULL,
                                  UOM_NAME           VARCHAR2 (50 BYTE),
                                  UOM_DESC           VARCHAR2 (100 BYTE),
                                  ENABLED_FLAG       VARCHAR2 (1 BYTE),
                                  ORG_ID             NUMBER,
                                  CREATION_DATE      VARCHAR2 (21 BYTE),
                                  CREATED_BY         NUMBER,
                                  LAST_UPDATE_DATE   VARCHAR2 (21 BYTE),
                                  LAST_UPDATE_BY     NUMBER)
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

ALTER TABLE INV.UNIT_OF_MEASURE ADD (
CONSTRAINT PK_UOM_ID
PRIMARY KEY
(UOM_ID));

/*
-- INDEX: INV.IDX_UOM_ID

-- DROP INDEX INV.IDX_UOM_ID;

CREATE UNIQUE INDEX INV.IDX_UOM_ID
   ON INV.UNIT_OF_MEASURE (UOM_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;
*/

CREATE SEQUENCE INV.UNIT_OF_MEASURE_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER INV.UNIT_OF_MEASURE_TRG
   BEFORE INSERT
   ON INV.UNIT_OF_MEASURE
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.UOM_ID IS NULL)
DECLARE
   V_ID   INV.UNIT_OF_MEASURE.UOM_ID%TYPE;
BEGIN
   SELECT   INV.UNIT_OF_MEASURE_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.UOM_ID := V_ID;
END UNIT_OF_MEASURE_TRG;