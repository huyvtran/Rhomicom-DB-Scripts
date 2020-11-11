/* Formatted on 10/6/2014 9:00:00 PM (QP5 v5.126.903.23003) */
-- TABLE: SCM.SCM_SALES_INVC_DET

-- DROP TABLE SCM.SCM_SALES_INVC_DET;

CREATE TABLE SCM.SCM_SALES_INVC_DET (
   INVC_DET_LN_ID            NUMBER NOT NULL,
   INVC_HDR_ID               NUMBER,
   ITM_ID                    NUMBER,
   STORE_ID                  NUMBER,
   DOC_QTY                   NUMBER,
   UNIT_SELLING_PRICE        NUMBER,
   TAX_CODE_ID               NUMBER,
   CREATED_BY                NUMBER,
   CREATION_DATE             VARCHAR2 (50 BYTE),
   LAST_UPDATE_BY            NUMBER,
   LAST_UPDATE_DATE          VARCHAR2 (50 BYTE),
   DSCNT_CODE_ID             NUMBER,
   CHRG_CODE_ID              NUMBER,
   SRC_LINE_ID               NUMBER DEFAULT -1 NOT NULL,
   QTY_TRNSCTD_IN_DEST_DOC   NUMBER DEFAULT 0 NOT NULL,
   CRNCY_ID                  NUMBER,
   RTRN_REASON               CLOB DEFAULT '' NOT NULL,
   CONSGMNT_IDS              CLOB,
   CNSGMNT_QTY_DIST          CLOB DEFAULT ',' NOT NULL,
   ORGNL_SELLING_PRICE       NUMBER DEFAULT 0 NOT NULL
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

ALTER TABLE SCM.SCM_SALES_INVC_DET
ADD(  CONSTRAINT PK_INVC_DET_LN_ID PRIMARY KEY (INVC_DET_LN_ID ));

-- INDEX: SCM.IDX_CHRG_CODE_ID

-- DROP INDEX SCM.SCM.IDX_CHRG_CODE_ID;

CREATE INDEX SCM.IDX_CHRG_CODE_ID
   ON SCM.SCM_SALES_INVC_DET (CHRG_CODE_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: SCM.SCM.IDX_D_INVC_HDR_ID

-- DROP INDEX SCM.SCM.IDX_D_INVC_HDR_ID;

CREATE INDEX SCM.IDX_D_INVC_HDR_ID
   ON SCM.SCM_SALES_INVC_DET (INVC_HDR_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: SCM.SCM.IDX_DSCNT_CODE_ID

-- DROP INDEX SCM.SCM.IDX_DSCNT_CODE_ID;

CREATE INDEX SCM.IDX_DSCNT_CODE_ID
   ON SCM.SCM_SALES_INVC_DET (DSCNT_CODE_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: SCM.SCM.IDX_INVC_CREATED_BY

-- DROP INDEX SCM.SCM.IDX_INVC_CREATED_BY;

CREATE INDEX SCM.IDX_INVC_CREATED_BY
   ON SCM.SCM_SALES_INVC_DET (CREATED_BY)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

   /*
-- INDEX: SCM.SCM.IDX_INVC_DET_LN_ID

-- DROP INDEX SCM.SCM.IDX_INVC_DET_LN_ID;

CREATE UNIQUE INDEX SCM.IDX_INVC_DET_LN_ID
   ON SCM.SCM_SALES_INVC_DET (INVC_DET_LN_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;
*/

-- INDEX: SCM.SCM.IDX_INVC_ITM_ID

-- DROP INDEX SCM.SCM.IDX_INVC_ITM_ID;

CREATE INDEX SCM.IDX_INVC_ITM_ID
   ON SCM.SCM_SALES_INVC_DET (ITM_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: SCM.SCM.IDX_INVC_SRC_LINE_ID

-- DROP INDEX SCM.SCM.IDX_INVC_SRC_LINE_ID;

CREATE INDEX SCM.IDX_INVC_SRC_LINE_ID
   ON SCM.SCM_SALES_INVC_DET (SRC_LINE_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: SCM.SCM.IDX_IVD_LAST_UPDATE_BY

-- DROP INDEX SCM.SCM.IDX_IVD_LAST_UPDATE_BY;

CREATE INDEX SCM.IDX_IVD_LAST_UPDATE_BY
   ON SCM.SCM_SALES_INVC_DET (LAST_UPDATE_BY)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: SCM.SCM.IDX_STORE_ID

-- DROP INDEX SCM.SCM.IDX_STORE_ID;

CREATE INDEX SCM.IDX_STORE_ID
   ON SCM.SCM_SALES_INVC_DET (STORE_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: SCM.SCM.IDX_TAX_CODE_ID

-- DROP INDEX SCM.SCM.IDX_TAX_CODE_ID;

CREATE INDEX SCM.IDX_TAX_CODE_ID
   ON SCM.SCM_SALES_INVC_DET (TAX_CODE_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;



CREATE SEQUENCE SCM.SCM_ITM_SALES_ORDRS_DET_ID_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER SCM.SCM_ITM_SALES_ORDRS_DET_ID_TRG
   BEFORE INSERT
   ON SCM.SCM_SALES_INVC_DET
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.INVC_DET_LN_ID IS NULL)
DECLARE
   V_ID   SCM.SCM_SALES_INVC_DET.INVC_DET_LN_ID%TYPE;
BEGIN
   SELECT   SCM.SCM_ITM_SALES_ORDRS_DET_ID_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.INVC_DET_LN_ID := V_ID;
END SCM_ITM_SALES_ORDRS_DET_ID_TRG;