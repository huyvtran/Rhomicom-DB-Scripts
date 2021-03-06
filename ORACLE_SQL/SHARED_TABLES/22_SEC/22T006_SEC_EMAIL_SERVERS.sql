/* Formatted on 12-17-2018 9:35:38 AM (QP5 v5.126.903.23003) */
DROP TABLE SEC.SEC_EMAIL_SERVERS  CASCADE CONSTRAINTS PURGE;

CREATE TABLE SEC.SEC_EMAIL_SERVERS (
   SERVER_ID                  NUMBER NOT NULL,
   SMTP_CLIENT                VARCHAR2 (200 BYTE),
   MAIL_USER_NAME             VARCHAR2 (100 BYTE),
   MAIL_PASSWORD              VARCHAR2 (100 BYTE),
   SMTP_PORT                  NUMBER,
   IS_DEFAULT                 VARCHAR2 (1 BYTE),
   ACTV_DRCTRY_DOMAIN_NAME    VARCHAR2 (100 BYTE),
   CREATED_BY                 NUMBER,
   CREATION_DATE              VARCHAR2 (21 BYTE),
   LAST_UPDATE_BY             NUMBER,
   LAST_UPDATE_DATE           VARCHAR2 (21 BYTE),
   FTP_SERVER_URL             VARCHAR2 (200 BYTE),
   FTP_USER_NAME              VARCHAR2 (100 BYTE),
   FTP_USER_PSWD              VARCHAR2 (100 BYTE),
   FTP_PORT                   NUMBER,
   FTP_APP_SUB_DIRECTORY      VARCHAR2 (200 BYTE),
   ENFORCE_FTP                VARCHAR2 (1 BYTE) NOT NULL,
   PG_DUMP_DIR                CLOB,
   BACKUP_DIR                 CLOB,
   COM_PORT                   VARCHAR2 (100 BYTE),
   BAUD_RATE                  VARCHAR2 (100 BYTE),
   TIMEOUT                    VARCHAR2 (100),
   SMS_PARAM1                 VARCHAR2 (300)
         DEFAULT 'url|http://txtconnect.co/api/send/' NOT NULL,
   SMS_PARAM2                 VARCHAR2 (300)
         DEFAULT 'token|123456789' NOT NULL,
   SMS_PARAM3                 VARCHAR2 (300) DEFAULT 'msg|{:msg}' NOT NULL,
   SMS_PARAM4                 VARCHAR2 (300) DEFAULT 'from|Rhomicom' NOT NULL,
   SMS_PARAM5                 VARCHAR2 (300) DEFAULT 'to|{:to}' NOT NULL,
   SMS_PARAM6                 VARCHAR2 (300) DEFAULT 'Extra Param1|' NOT NULL,
   SMS_PARAM7                 VARCHAR2 (300) DEFAULT 'Extra Param2|' NOT NULL,
   SMS_PARAM8                 VARCHAR2 (300) DEFAULT 'Extra Param3|' NOT NULL,
   SMS_PARAM9                 VARCHAR2 (300) DEFAULT 'Extra Param4|' NOT NULL,
   SMS_PARAM10                VARCHAR2 (300)
         DEFAULT 'success txt|"error":0' NOT NULL,
   FTP_USER_START_DIRECTORY   VARCHAR2 (300),
   INHOUSE_SMTP_IP            VARCHAR2 (50)
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

CREATE UNIQUE INDEX SEC.IDX_SERVER_ID
   ON SEC.SEC_EMAIL_SERVERS (SERVER_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE SEC.SEC_EMAIL_SERVERS_SEQ;

CREATE SEQUENCE SEC.SEC_EMAIL_SERVERS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

ALTER TABLE SEC.SEC_EMAIL_SERVERS ADD (
CONSTRAINT PK_SERVER_ID
PRIMARY KEY
(SERVER_ID));



CREATE OR REPLACE TRIGGER SEC.SEC_EMAIL_SERVERS_TRG
   BEFORE INSERT
   ON SEC.SEC_EMAIL_SERVERS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.SERVER_ID IS NULL)
DECLARE
   V_ID   SEC.SEC_EMAIL_SERVERS.SERVER_ID%TYPE;
BEGIN
   SELECT   SEC.SEC_EMAIL_SERVERS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.SERVER_ID := V_ID;
END SEC_EMAIL_SERVERS_TRG;