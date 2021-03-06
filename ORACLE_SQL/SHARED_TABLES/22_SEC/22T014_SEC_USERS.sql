/* Formatted on 12-17-2018 10:23:48 AM (QP5 v5.126.903.23003) */
DROP TABLE SEC.SEC_USERS  CASCADE CONSTRAINTS PURGE;

CREATE TABLE SEC.SEC_USERS (
   USER_ID                 NUMBER NOT NULL,
   USER_NAME               VARCHAR2 (50 BYTE),
   USR_PASSWORD            VARCHAR2 (100 BYTE),
   PERSON_ID               NUMBER,
   IS_SUSPENDED            VARCHAR2 (1 BYTE),
   IS_PSWD_TEMP            VARCHAR2 (1 BYTE),
   FAILED_LOGIN_ATMPTS     NUMBER,
   LAST_LOGIN_ATMPT_TIME   VARCHAR2 (21 BYTE),
   LAST_PSWD_CHNG_TIME     VARCHAR2 (21 BYTE),
   VALID_START_DATE        VARCHAR2 (21 BYTE),
   VALID_END_DATE          VARCHAR2 (21 BYTE),
   CREATED_BY              NUMBER,
   CREATION_DATE           VARCHAR2 (21 BYTE),
   LAST_UPDATE_BY          NUMBER,
   LAST_UPDATE_DATE        VARCHAR2 (21 BYTE),
   CUSTOMER_ID             NUMBER DEFAULT -1 NOT NULL,
   MODULES_NEEDED          VARCHAR2 (200),
   CODE_FOR_TRNS_NUMS      VARCHAR2 (5) DEFAULT '00' NOT NULL
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

CREATE UNIQUE INDEX SEC.IDX_MN_USER_ID
   ON SEC.SEC_USERS (USER_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE SEC.SEC_USERS_SEQ;

CREATE SEQUENCE SEC.SEC_USERS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

ALTER TABLE SEC.SEC_USERS ADD (
CONSTRAINT PK_USER_ID
PRIMARY KEY
(USER_ID));


CREATE INDEX SEC.IDX_U_VALID_END_DATE
   ON SEC.SEC_USERS (VALID_END_DATE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX SEC.IDX_U_VALID_START_DATE
   ON SEC.SEC_USERS (VALID_START_DATE)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE UNIQUE INDEX SEC.IDX_USER_NAME
   ON SEC.SEC_USERS (USER_NAME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE OR REPLACE TRIGGER SEC.SEC_USERS_TRG
   BEFORE INSERT
   ON SEC.SEC_USERS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.USER_ID IS NULL)
DECLARE
   V_ID   SEC.SEC_USERS.USER_ID%TYPE;
BEGIN
   SELECT   SEC.SEC_USERS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.USER_ID := V_ID;
END SEC_USERS_TRG;