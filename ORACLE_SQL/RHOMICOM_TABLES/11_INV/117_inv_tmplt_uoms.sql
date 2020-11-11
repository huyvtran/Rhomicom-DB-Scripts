/* Formatted on 10/6/2014 8:22:11 PM (QP5 v5.126.903.23003) */
-- TABLE: INV.INV_TMPLT_UOMS

-- DROP TABLE INV.INV_TMPLT_UOMS;

CREATE TABLE INV.INV_TMPLT_UOMS (TMPLT_UOM_ID       NUMBER NOT NULL,
                                 ITEM_TYPE_ID       NUMBER,
                                 UOM_ID             NUMBER,
                                 IS_BASE_UOM        VARCHAR2 (1 BYTE),
                                 CNVSN_FACTOR       NUMBER,
                                 UOM_LEVEL          NUMBER,
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

ALTER TABLE INV.INV_TMPLT_UOMS
  ADD(CONSTRAINT PK_TMPLT_UOM_ID PRIMARY KEY (TMPLT_UOM_ID ));

  /*
-- INDEX: INV.IDX_TMPLT_UOM_ID

-- DROP INDEX INV.IDX_TMPLT_UOM_ID;

CREATE UNIQUE INDEX INV.IDX_TMPLT_UOM_ID
   ON INV.INV_TMPLT_UOMS (TMPLT_UOM_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;
*/

CREATE SEQUENCE INV.INV_TMPLT_UOMS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER INV.INV_TMPLT_UOMS_TRG
   BEFORE INSERT
   ON INV.INV_TMPLT_UOMS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.TMPLT_UOM_ID IS NULL)
DECLARE
   V_ID   INV.INV_TMPLT_UOMS.TMPLT_UOM_ID%TYPE;
BEGIN
   SELECT   INV.INV_TMPLT_UOMS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.TMPLT_UOM_ID := V_ID;
END INV_TMPLT_UOMS_TRG;