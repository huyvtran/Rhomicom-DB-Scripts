/* Formatted on 12-15-2018 12:16:14 PM (QP5 v5.126.903.23003) */
DROP TABLE RPT.RPT_RUN_SCHDULE_PARAMS  CASCADE CONSTRAINTS PURGE;

CREATE TABLE RPT.RPT_RUN_SCHDULE_PARAMS (
   SCHDL_PARAM_ID     NUMBER NOT NULL,
   SCHEDULE_ID        NUMBER,
   PARAMETER_ID       NUMBER,
   PARAMETER_VALUE    CLOB,
   CREATED_BY         NUMBER NOT NULL,
   CREATION_DATE      VARCHAR2 (21 BYTE) NOT NULL,
   LAST_UPDATE_BY     NUMBER NOT NULL,
   LAST_UPDATE_DATE   VARCHAR2 (21 BYTE) NOT NULL,
   ALERT_ID           INTEGER DEFAULT -1 NOT NULL,
   CONSTRAINT PK_SCHDL_PARAM_ID PRIMARY KEY (SCHDL_PARAM_ID)
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

CREATE INDEX RPT.IDX_P_PARAMETER_ID
   ON RPT.RPT_RUN_SCHDULE_PARAMS (PARAMETER_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX RPT.IDX_P_SCHEDULE_ID
   ON RPT.RPT_RUN_SCHDULE_PARAMS (SCHEDULE_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE RPT.RPT_RUN_SCHDULE_PARAMS_ID_SEQ;

CREATE SEQUENCE RPT.RPT_RUN_SCHDULE_PARAMS_ID_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

CREATE OR REPLACE TRIGGER RPT.RPT_RUN_SCHDULE_PARAMS_ID_TRG
   BEFORE INSERT
   ON RPT.RPT_RUN_SCHDULE_PARAMS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.SCHDL_PARAM_ID IS NULL)
DECLARE
   V_ID   RPT.RPT_RUN_SCHDULE_PARAMS.SCHDL_PARAM_ID%TYPE;
BEGIN
   SELECT   RPT.RPT_RUN_SCHDULE_PARAMS_ID_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.SCHDL_PARAM_ID := V_ID;
END RPT_RUN_SCHDULE_PARAMS_ID_TRG;