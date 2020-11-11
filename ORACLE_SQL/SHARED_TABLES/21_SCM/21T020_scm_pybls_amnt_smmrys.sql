/* Formatted on 10/6/2014 8:53:58 PM (QP5 v5.126.903.23003) */
-- TABLE: SCM.SCM_PYBLS_AMNT_SMMRYS

-- DROP TABLE SCM.SCM_PYBLS_AMNT_SMMRYS;

CREATE TABLE SCM.SCM_PYBLS_AMNT_SMMRYS (
   PYBLS_SMMRY_ID          NUMBER NOT NULL,
   PYBLS_SMMRY_TYPE        VARCHAR2 (100 BYTE) NOT NULL, -- 1INITIAL AMOUNT (INCREASE ASSET/EXPENSE/PREPAID EXPENSE - INCREASE LIABILITY)...
   PYBLS_SMMRY_DESC        VARCHAR2 (200 BYTE),
   PYBLS_SMMRY_AMNT        NUMBER,
   CODE_ID_BEHIND          NUMBER,
   SRC_PYBLS_TYPE          VARCHAR2 (100 BYTE),
   SRC_PYBLS_HDR_ID        NUMBER,
   CREATED_BY              NUMBER,
   CREATION_DATE           VARCHAR2 (21 BYTE),
   LAST_UPDATE_BY          NUMBER,
   LAST_UPDATE_DATE        VARCHAR2 (21 BYTE),
   AUTO_CALC               VARCHAR2 (1 BYTE) DEFAULT '1' NOT NULL,
   INCRS_DCRS1             VARCHAR2 (15 BYTE),
   ASSET_EXPNS_ACNT_ID     NUMBER,
   INCRS_DCRS2             VARCHAR2 (15 BYTE),
   LIABILITY_ACNT_ID       NUMBER,
   APPLD_PREPYMNT_DOC_ID   NUMBER,
   VALIDTY_STATUS          VARCHAR2 (10 BYTE) DEFAULT '1' NOT NULL,
   ORGNL_LINE_ID           NUMBER DEFAULT -1 NOT NULL,
   ENTRD_CURR_ID           NUMBER,
   FUNC_CURR_ID            NUMBER,
   ACCNT_CURR_ID           NUMBER,
   FUNC_CURR_RATE          NUMBER,
   ACCNT_CURR_RATE         NUMBER,
   FUNC_CURR_AMOUNT        NUMBER,
   ACCNT_CURR_AMNT         NUMBER
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

ALTER TABLE SCM.SCM_PYBLS_AMNT_SMMRYS
ADD(  CONSTRAINT PK_PYBLS_SMMRY_ID PRIMARY KEY (PYBLS_SMMRY_ID ));


COMMENT ON COLUMN SCM.SCM_PYBLS_AMNT_SMMRYS.PYBLS_SMMRY_TYPE IS
'1Initial Amount (Increase Asset/Expense/Prepaid Expense - Increase Liability)
2Tax (Increase Purchase Tax Expense/Decrease Taxes Payable- Increase Liability)
3Discount (Increase Purchase Discounts-Decrease Liability)
4Extra Charge (Increase Asset/Expense-Increase Liability)
5Applied Prepayment (Decrease Prepaid Expense-Decrease Liability)
6Grand Total (No Accounting)
7Total Payments Received
8Change/Balance';


-- INDEX: SCM.SCM.IDX_PYBL_CODE_ID_BEHIND

-- DROP INDEX SCM.SCM.IDX_PYBL_CODE_ID_BEHIND;

CREATE INDEX SCM.IDX_PYBL_CODE_ID_BEHIND
   ON SCM.SCM_PYBLS_AMNT_SMMRYS (CODE_ID_BEHIND)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: SCM.SCM.IDX_PYBLS_SMMRY_DESC

-- DROP INDEX SCM.SCM.IDX_PYBLS_SMMRY_DESC;

CREATE INDEX SCM.IDX_PYBLS_SMMRY_DESC
   ON SCM.SCM_PYBLS_AMNT_SMMRYS (PYBLS_SMMRY_DESC)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

   /*
-- INDEX: SCM.SCM.IDX_PYBLS_SMMRY_ID

-- DROP INDEX SCM.SCM.IDX_PYBLS_SMMRY_ID;

CREATE UNIQUE INDEX SCM.IDX_PYBLS_SMMRY_ID
   ON SCM.SCM_PYBLS_AMNT_SMMRYS (PYBLS_SMMRY_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;
*/

-- INDEX: SCM.SCM.IDX_PYBLS_SMMRY_TYPE

-- DROP INDEX SCM.SCM.IDX_PYBLS_SMMRY_TYPE;

CREATE INDEX SCM.IDX_PYBLS_SMMRY_TYPE
   ON SCM.SCM_PYBLS_AMNT_SMMRYS (PYBLS_SMMRY_TYPE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: SCM.SCM.IDX_SMRY_SRC_PYBLS_HDR_ID

-- DROP INDEX SCM.SCM.IDX_SMRY_SRC_PYBLS_HDR_ID;

CREATE INDEX SCM.IDX_SMRY_SRC_PYBLS_HDR_ID
   ON SCM.SCM_PYBLS_AMNT_SMMRYS (SRC_PYBLS_HDR_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

-- INDEX: SCM.SCM.IDX_SMRY_SRC_PYBLS_TYPE

-- DROP INDEX SCM.SCM.IDX_SMRY_SRC_PYBLS_TYPE;

CREATE INDEX SCM.IDX_SMRY_SRC_PYBLS_TYPE
   ON SCM.SCM_PYBLS_AMNT_SMMRYS (SRC_PYBLS_TYPE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE SEQUENCE SCM.SCM_PYBLS_AMNT_SMMRYS_ID_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER SCM.SCM_PYBLS_AMNT_SMMRYS_ID_TRG
   BEFORE INSERT
   ON SCM.SCM_PYBLS_AMNT_SMMRYS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.PYBLS_SMMRY_ID IS NULL)
DECLARE
   V_ID   SCM.SCM_PYBLS_AMNT_SMMRYS.PYBLS_SMMRY_ID%TYPE;
BEGIN
   SELECT   SCM.SCM_PYBLS_AMNT_SMMRYS_ID_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.PYBLS_SMMRY_ID := V_ID;
END SCM_PYBLS_AMNT_SMMRYS_ID_TRG;