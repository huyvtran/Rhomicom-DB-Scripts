/* Formatted on 12-17-2018 11:02:41 AM (QP5 v5.126.903.23003) */
DROP TABLE SEC.SEC_USERS_OLD_PSWDS  CASCADE CONSTRAINTS PURGE;

CREATE TABLE SEC.SEC_USERS_OLD_PSWDS (OLD_PSWD_ID    NUMBER NOT NULL,
                                      USER_ID        NUMBER NOT NULL,
                                      OLD_PASSWORD   VARCHAR2 (200 BYTE),
                                      DATE_ADDED     VARCHAR2 (21 BYTE))
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

CREATE UNIQUE INDEX SEC.INDX_OLD_PSWD_ID
   ON SEC.SEC_USERS_OLD_PSWDS (OLD_PSWD_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE SEC.SEC_USERS_OLD_PSWDS_SEQ;

CREATE SEQUENCE SEC.SEC_USERS_OLD_PSWDS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;

ALTER TABLE SEC.SEC_USERS_OLD_PSWDS ADD (
CONSTRAINT PK_OLD_PSWD_ID
PRIMARY KEY
(OLD_PSWD_ID));


CREATE INDEX SEC.IDX_DATE_ADDED
   ON SEC.SEC_USERS_OLD_PSWDS (DATE_ADDED)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;


CREATE OR REPLACE TRIGGER SEC.SEC_USERS_OLD_PSWDS_TRG
   BEFORE INSERT
   ON SEC.SEC_USERS_OLD_PSWDS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.OLD_PSWD_ID IS NULL)
DECLARE
   V_ID   SEC.SEC_USERS_OLD_PSWDS.OLD_PSWD_ID%TYPE;
BEGIN
   SELECT   SEC.SEC_USERS_OLD_PSWDS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.OLD_PSWD_ID := V_ID;
END SEC_USERS_OLD_PSWDS_TRG;