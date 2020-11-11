/* Formatted on 10/6/2014 8:14:14 PM (QP5 v5.126.903.23003) */
-- TABLE: INV.INV_PRODUCT_CATEGORIES

-- DROP TABLE INV.INV_PRODUCT_CATEGORIES;

CREATE TABLE INV.INV_PRODUCT_CATEGORIES (
   CAT_ID             NUMBER NOT NULL,
   CAT_NAME           VARCHAR2 (100 BYTE),
   CAT_DESC           VARCHAR2 (200 BYTE),
   CREATION_DATE      VARCHAR2 (50 BYTE),
   CREATED_BY         NUMBER,
   LAST_UPDATE_DATE   VARCHAR2 (50 BYTE),
   LAST_UPDATE_BY     NUMBER,
   START_DATE         VARCHAR2 (21 BYTE),
   END_DATE           VARCHAR2 (21 BYTE),
   ORG_ID             NUMBER,
   ENABLED_FLAG       VARCHAR2 (1 BYTE)
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

ALTER TABLE INV.INV_PRODUCT_CATEGORIES
ADD(  CONSTRAINT PK_PRDT_CAT PRIMARY KEY (CAT_ID ));

/*
-- INDEX: INV.IDX_CAT_ID

-- DROP INDEX INV.IDX_CAT_ID;

CREATE UNIQUE INDEX INV.IDX_CAT_ID
   ON INV.INV_PRODUCT_CATEGORIES (CAT_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;
*/
-- INDEX: INV.IDX_CAT_NAME

-- DROP INDEX INV.IDX_CAT_NAME;

CREATE INDEX INV.IDX_CAT_NAME
   ON INV.INV_PRODUCT_CATEGORIES (CAT_NAME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE SEQUENCE INV.INV_PRODUCT_CATEGORIES_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER INV.INV_PRODUCT_CATEGORIES_TRG
   BEFORE INSERT
   ON INV.INV_PRODUCT_CATEGORIES
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.CAT_ID IS NULL)
DECLARE
   V_ID   INV.INV_PRODUCT_CATEGORIES.CAT_ID%TYPE;
BEGIN
   SELECT   INV.INV_PRODUCT_CATEGORIES_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.CAT_ID := V_ID;
END INV_PRODUCT_CATEGORIES_TRG;