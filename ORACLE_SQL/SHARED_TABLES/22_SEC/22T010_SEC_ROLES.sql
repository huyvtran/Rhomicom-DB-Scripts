/* Formatted on 12-17-2018 9:59:24 AM (QP5 v5.126.903.23003) */
DROP TABLE SEC.SEC_ROLES  CASCADE CONSTRAINTS PURGE;

CREATE TABLE SEC.SEC_ROLES (
   ROLE_ID                  NUMBER NOT NULL,
   ROLE_NAME                VARCHAR2 (100 BYTE) NOT NULL,
   VALID_START_DATE         VARCHAR2 (21 BYTE),
   VALID_END_DATE           VARCHAR2 (21 BYTE),
   CREATED_BY               NUMBER NOT NULL,
   CREATION_DATE            VARCHAR2 (21 BYTE) NOT NULL,
   LAST_UPDATE_BY           NUMBER NOT NULL,
   LAST_UPDATE_DATE         VARCHAR2 (21 BYTE) NOT NULL,
   CAN_MINI_ADMINS_ASSIGN   VARCHAR2 (1) DEFAULT '0' NOT NULL
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

CREATE UNIQUE INDEX SEC.IDX_ROLE_ID
   ON SEC.SEC_ROLES (ROLE_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE SEC.SEC_ROLES_SEQ;

CREATE SEQUENCE SEC.SEC_ROLES_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

ALTER TABLE SEC.SEC_ROLES ADD (
CONSTRAINT PK_ROLE_ID
PRIMARY KEY
(ROLE_ID));


CREATE UNIQUE INDEX SEC.IDX_ROLE_NAME
   ON SEC.SEC_ROLES (ROLE_NAME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX SEC.IDX_RL_VALID_START_DATE
   ON SEC.SEC_ROLES (VALID_START_DATE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE INDEX SEC.IDX_RL_VALID_END_DATE
   ON SEC.SEC_ROLES (VALID_END_DATE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE OR REPLACE TRIGGER SEC.SEC_ROLES_TRG
   BEFORE INSERT
   ON SEC.SEC_ROLES
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.ROLE_ID IS NULL)
DECLARE
   V_ID   SEC.SEC_ROLES.ROLE_ID%TYPE;
BEGIN
   SELECT   SEC.SEC_ROLES_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.ROLE_ID := V_ID;
END SEC_ROLES_TRG;