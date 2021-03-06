/* Formatted on 10/6/2014 6:20:23 PM (QP5 v5.126.903.23003) */
CREATE TABLE ACA.ACA_COURSES (COURSE_ID          NUMBER NOT NULL,
                              COURSE_NAME        VARCHAR2 (300 BYTE),
                              COURSE_DESC        VARCHAR2 (500 BYTE) NOT NULL,
                              CREATED_BY         NUMBER NOT NULL,
                              CREATION_DATE      VARCHAR2 (21 BYTE) NOT NULL,
                              LAST_UPDATE_BY     NUMBER NOT NULL,
                              LAST_UPDATE_DATE   VARCHAR2 (21 BYTE) NOT NULL,
                              COURSE_CODE        VARCHAR2 (100 BYTE))
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

CREATE UNIQUE INDEX ACA.IDX_COURSE_ID
   ON ACA.ACA_COURSES (COURSE_ID)
   LOGGING
   TABLESPACE RHODB
   PCTFREE 10
   INITRANS 2
   MAXTRANS 255
   STORAGE (PCTINCREASE 0 BUFFER_POOL DEFAULT)
   NOPARALLEL;

ALTER TABLE ACA.ACA_COURSES ADD (
  CONSTRAINT PK_COURSE_ID
 PRIMARY KEY
 (COURSE_ID));

CREATE SEQUENCE ACA.ACA_COURSES_SEQ
   START WITH 1
   MAXVALUE 9223372036854775807
   MINVALUE 1
   NOCYCLE
   CACHE 20
   ORDER;

CREATE OR REPLACE TRIGGER ACA.ACA_COURSES_TRG
   BEFORE INSERT
   ON ACA.ACA_COURSES
   FOR EACH ROW
   -- OPTIONALLY RESTRICT THIS TRIGGER TO FIRE ONLY WHEN REALLY NEEDED
   WHEN (NEW.COURSE_ID IS NULL)
DECLARE
   V_ID   ACA.ACA_COURSES.COURSE_ID%TYPE;
BEGIN
   SELECT   ACA.ACA_COURSES_SEQ.NEXTVAL INTO V_ID FROM DUAL;

   :NEW.COURSE_ID := V_ID;
END ACA_COURSES;