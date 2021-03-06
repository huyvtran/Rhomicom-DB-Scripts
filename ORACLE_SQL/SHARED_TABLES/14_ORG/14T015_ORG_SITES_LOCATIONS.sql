/* Formatted on 12-15-2018 8:41:05 AM (QP5 v5.126.903.23003) */
DROP TABLE ORG.ORG_SITES_LOCATIONS  CASCADE CONSTRAINTS PURGE;

CREATE TABLE ORG.ORG_SITES_LOCATIONS (
   LOCATION_ID          NUMBER NOT NULL,
   LOCATION_CODE_NAME   VARCHAR2 (200 BYTE),
   ORG_ID               NUMBER,
   IS_ENABLED           VARCHAR2 (1 BYTE),
   CREATED_BY           NUMBER NOT NULL,
   CREATION_DATE        VARCHAR2 (21 BYTE) NOT NULL,
   LAST_UPDATE_BY       NUMBER NOT NULL,
   LAST_UPDATE_DATE     VARCHAR2 (21 BYTE) NOT NULL,
   SITE_DESC            VARCHAR2 (500 BYTE),
   ALLWD_GROUP_TYPE     VARCHAR2 (200) DEFAULT 'Everyone' NOT NULL,
   ALLWD_GROUP_VALUE    VARCHAR2 (200) DEFAULT '-1' NOT NULL,
   SITE_TYPE_ID         INTEGER DEFAULT -1 NOT NULL,
   LNKD_DIV_ID          INTEGER DEFAULT -1 NOT NULL,
   PRNT_LOCATION_ID     INTEGER DEFAULT -1 NOT NULL
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

CREATE UNIQUE INDEX ORG.IDX_LOCATION_ID
   ON ORG.ORG_SITES_LOCATIONS (LOCATION_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

ALTER TABLE ORG.ORG_SITES_LOCATIONS ADD (
  CONSTRAINT PK_LOCATION_ID
 PRIMARY KEY
 (LOCATION_ID));

CREATE INDEX ORG.IDX_LOCATION_CODE_NAME
   ON ORG.ORG_SITES_LOCATIONS (LOCATION_CODE_NAME)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

CREATE INDEX ORG.IDX_SITE_DESC
   ON ORG.ORG_SITES_LOCATIONS (SITE_DESC)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

DROP SEQUENCE ORG.ORG_SITES_LOCATIONS_SEQ;

CREATE SEQUENCE ORG.ORG_SITES_LOCATIONS_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   NOCACHE
   ORDER;


CREATE OR REPLACE TRIGGER ORG.ORG_SITES_LOCATIONS_TRG
   BEFORE INSERT
   ON ORG.ORG_SITES_LOCATIONS
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.LOCATION_ID IS NULL)
DECLARE
   V_ID   ORG.ORG_SITES_LOCATIONS.LOCATION_ID%TYPE;
BEGIN
   SELECT   ORG.ORG_SITES_LOCATIONS_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.LOCATION_ID := V_ID;
END ORG_SITES_LOCATIONS_TRG;