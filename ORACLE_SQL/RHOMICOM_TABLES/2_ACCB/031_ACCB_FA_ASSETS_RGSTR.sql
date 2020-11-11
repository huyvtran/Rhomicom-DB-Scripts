/* Formatted on 9/22/2014 2:05:25 PM (QP5 v5.126.903.23003) */
-- TABLE: ACCB.ACCB_FA_ASSETS_RGSTR

-- DROP TABLE ACCB.ACCB_FA_ASSETS_RGSTR;

CREATE TABLE ACCB.ACCB_FA_ASSETS_RGSTR (
   ASSET_ID                NUMBER NOT NULL,
   ASSET_CODE_NAME         VARCHAR2 (200),
   ASSET_DESC              VARCHAR2 (300),
   ASSET_LOCATION          VARCHAR2 (300),
   TAG_NUMBER              VARCHAR2 (200),
   SERIAL_NUMBER           VARCHAR2 (200),
   BARCODE                 VARCHAR2 (200),
   MANUFACTURING_DATE      VARCHAR2 (21),
   EXPIRY_DATE             VARCHAR2 (21),
   ASSET_ACCNT_ID          NUMBER,
   ASSET_DPRCTN_ACCNT_ID   NUMBER,
   CREATED_BY              NUMBER NOT NULL,
   CREATION_DATE           VARCHAR2 (21) NOT NULL,
   LAST_UPDATE_BY          NUMBER NOT NULL,
   LAST_UPDATE_DATE        VARCHAR2 (21) NOT NULL,
   INV_ITEM_ID             NUMBER,
   CONSTRAINT PK_ASSET_ID PRIMARY KEY (ASSET_ID)
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

CREATE INDEX ACCB.IDX_ASSET_CODE_NAME
   ON ACCB.ACCB_FA_ASSETS_RGSTR (ASSET_CODE_NAME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE SEQUENCE ACCB.ACCB_FA_ASSETS_RGSTR_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER ACCB.ACCB_FA_ASSETS_RGSTR_TRG
   BEFORE INSERT
   ON ACCB.ACCB_FA_ASSETS_RGSTR
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.ASSET_ID IS NULL)
DECLARE
   V_ID   ACCB.ACCB_FA_ASSETS_RGSTR.ASSET_ID%TYPE;
BEGIN
   SELECT   ACCB.ACCB_FA_ASSETS_RGSTR_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.ASSET_ID := V_ID;
END ACCB_FA_ASSETS_RGSTR_TRG;