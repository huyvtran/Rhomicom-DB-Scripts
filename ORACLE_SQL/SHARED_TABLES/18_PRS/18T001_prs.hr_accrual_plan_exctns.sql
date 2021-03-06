/* Formatted on 12-15-2018 9:24:43 AM (QP5 v5.126.903.23003) */
DROP TABLE PRS.HR_ACCRUAL_PLAN_EXCTNS  CASCADE CONSTRAINTS PURGE;

CREATE TABLE PRS.HR_ACCRUAL_PLAN_EXCTNS (
   PLAN_EXECUTION_ID    NUMBER NOT NULL,
   PERSON_ID            NUMBER NOT NULL,
   ACCRUAL_PLAN_ID      INTEGER NOT NULL,
   EXECUTION_STRT_DTE   VARCHAR2 (12),
   EXECUTION_END_DTE    VARCHAR2 (12),
   DAYS_ENTITLED        NUMERIC NOT NULL,
   CMMNT_REMARK         VARCHAR2 (500),
   RQST_STATUS          VARCHAR2 (10),                  -- INITIATED, APPROVED
   ORG_ID               INTEGER NOT NULL,
   CREATED_BY           NUMBER DEFAULT -1 NOT NULL,
   CREATION_DATE        VARCHAR2 (21) NOT NULL,
   LAST_UPDATE_BY       NUMBER DEFAULT -1 NOT NULL,
   LAST_UPDATE_DATE     VARCHAR2 (21) NOT NULL
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

CREATE UNIQUE INDEX PRS.IDX_PE_PLAN_EXECUTION_ID
   ON PRS.HR_ACCRUAL_PLAN_EXCTNS (PLAN_EXECUTION_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

ALTER TABLE PRS.HR_ACCRUAL_PLAN_EXCTNS ADD (
CONSTRAINT PK_PLAN_EXECUTION_ID
PRIMARY KEY
(PLAN_EXECUTION_ID));


CREATE INDEX PRS.IDX_PE_ACCRUAL_PLAN_ID
   ON PRS.HR_ACCRUAL_PLAN_EXCTNS (ACCRUAL_PLAN_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX PRS.IDX_PE_PERSON_ID
   ON PRS.HR_ACCRUAL_PLAN_EXCTNS (PERSON_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX PRS.IDX_PE_EXECUTION_STRT_DTE
   ON PRS.HR_ACCRUAL_PLAN_EXCTNS (EXECUTION_STRT_DTE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX PRS.IDX_PE_EXECUTION_END_DTE
   ON PRS.HR_ACCRUAL_PLAN_EXCTNS (EXECUTION_END_DTE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX PRS.IDX_PE_RQST_STATUS
   ON PRS.HR_ACCRUAL_PLAN_EXCTNS (RQST_STATUS)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE PRS.HR_ACCRUAL_PLAN_EXCTNS_SEQ;

CREATE SEQUENCE PRS.HR_ACCRUAL_PLAN_EXCTNS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER PRS.HR_ACCRUAL_PLAN_EXCTNS_TRG
   BEFORE INSERT
   ON PRS.HR_ACCRUAL_PLAN_EXCTNS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.PLAN_EXECUTION_ID IS NULL)
DECLARE
   V_ID   PRS.HR_ACCRUAL_PLAN_EXCTNS.PLAN_EXECUTION_ID%TYPE;
BEGIN
   SELECT   PRS.HR_ACCRUAL_PLAN_EXCTNS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.PLAN_EXECUTION_ID := V_ID;
END HR_ACCRUAL_PLAN_EXCTNS_TRG;