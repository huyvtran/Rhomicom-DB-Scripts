/* Formatted on 12-6-2018 5:25:03 PM (QP5 v5.126.903.23003) */
--DROP USER SYSADMIN CASCADE;
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
ALTER DATABASE DEFAULT TABLESPACE RHODB;
CREATE USER SYSADMIN
  IDENTIFIED BY Password1
  DEFAULT TABLESPACE RHODB
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 53 Roles for SYSADMIN
  GRANT DELETE_CATALOG_ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT AQ_ADMINISTRATOR_ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT JAVASYSPRIV TO SYSADMIN WITH ADMIN OPTION;
  GRANT JAVADEBUGPRIV TO SYSADMIN WITH ADMIN OPTION;
  GRANT XDBADMIN TO SYSADMIN WITH ADMIN OPTION;
  GRANT ORDADMIN TO SYSADMIN WITH ADMIN OPTION;
  GRANT OWB_DESIGNCENTER_VIEW TO SYSADMIN WITH ADMIN OPTION;
  GRANT IMP_FULL_DATABASE TO SYSADMIN WITH ADMIN OPTION;
  GRANT RECOVERY_CATALOG_OWNER TO SYSADMIN WITH ADMIN OPTION;
  GRANT HS_ADMIN_SELECT_ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT JAVAIDPRIV TO SYSADMIN WITH ADMIN OPTION;
  GRANT XDB_WEBSERVICES_OVER_HTTP TO SYSADMIN WITH ADMIN OPTION;
  GRANT WFS_USR_ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT MGMT_USER TO SYSADMIN WITH ADMIN OPTION;
  GRANT OWB$CLIENT TO SYSADMIN WITH ADMIN OPTION;
  GRANT CONNECT TO SYSADMIN WITH ADMIN OPTION;
  GRANT SELECT_CATALOG_ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT EXECUTE_CATALOG_ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT EXP_FULL_DATABASE TO SYSADMIN WITH ADMIN OPTION;
  GRANT JAVAUSERPRIV TO SYSADMIN WITH ADMIN OPTION;
  GRANT SPATIAL_CSW_ADMIN TO SYSADMIN WITH ADMIN OPTION;
  GRANT CSW_USR_ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT AQ_USER_ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT HS_ADMIN_EXECUTE_ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT HS_ADMIN_ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT OLAP_XS_ADMIN TO SYSADMIN WITH ADMIN OPTION;
  GRANT OWB_USER TO SYSADMIN WITH ADMIN OPTION;
  GRANT OLAP_DBA TO SYSADMIN WITH ADMIN OPTION;
  GRANT CWM_USER TO SYSADMIN WITH ADMIN OPTION;
  GRANT OLAP_USER TO SYSADMIN WITH ADMIN OPTION;
  GRANT RESOURCE TO SYSADMIN WITH ADMIN OPTION;
  GRANT DATAPUMP_IMP_FULL_DATABASE TO SYSADMIN WITH ADMIN OPTION;
  GRANT JAVA_DEPLOY TO SYSADMIN WITH ADMIN OPTION;
  GRANT SCHEDULER_ADMIN TO SYSADMIN WITH ADMIN OPTION;
  GRANT JMXSERVER TO SYSADMIN WITH ADMIN OPTION;
  GRANT XDB_SET_INVOKER TO SYSADMIN WITH ADMIN OPTION;
  GRANT XDB_WEBSERVICES TO SYSADMIN WITH ADMIN OPTION;
  GRANT SPATIAL_WFS_ADMIN TO SYSADMIN WITH ADMIN OPTION;
  GRANT LOGSTDBY_ADMINISTRATOR TO SYSADMIN WITH ADMIN OPTION;
  GRANT DATAPUMP_EXP_FULL_DATABASE TO SYSADMIN WITH ADMIN OPTION;
  GRANT GATHER_SYSTEM_STATISTICS TO SYSADMIN WITH ADMIN OPTION;
  GRANT OEM_ADVISOR TO SYSADMIN WITH ADMIN OPTION;
  GRANT JAVA_ADMIN TO SYSADMIN WITH ADMIN OPTION;
  GRANT OLAPI_TRACE_USER TO SYSADMIN WITH ADMIN OPTION;
  GRANT DBA TO SYSADMIN WITH ADMIN OPTION;
  GRANT DBFS_ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT AUTHENTICATEDUSER TO SYSADMIN WITH ADMIN OPTION;
  GRANT APEX_ADMINISTRATOR_ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ADM_PARALLEL_EXECUTE_TASK TO SYSADMIN WITH ADMIN OPTION;
  GRANT OEM_MONITOR TO SYSADMIN WITH ADMIN OPTION;
  GRANT EJBCLIENT TO SYSADMIN WITH ADMIN OPTION;
  GRANT CTXAPP TO SYSADMIN WITH ADMIN OPTION;
  GRANT XDB_WEBSERVICES_WITH_PUBLIC TO SYSADMIN WITH ADMIN OPTION;
  ALTER USER SYSADMIN DEFAULT ROLE ALL;
  -- 200 System Privileges for SYSADMIN

  GRANT ADMINISTER SQL MANAGEMENT OBJECT TO SYSADMIN WITH ADMIN OPTION;

  GRANT DROP ANY CUBE BUILD PROCESS TO SYSADMIN WITH ADMIN OPTION;

  GRANT DROP ANY CUBE TO SYSADMIN WITH ADMIN OPTION;

  GRANT DELETE ANY CUBE DIMENSION TO SYSADMIN WITH ADMIN OPTION;
  GRANT ADMINISTER SQL TUNING SET TO SYSADMIN WITH ADMIN OPTION;
  GRANT EXECUTE ANY CLASS TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE JOB TO SYSADMIN WITH ADMIN OPTION;

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.ALTER_ANY_RULE_SET,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

  GRANT DEBUG ANY PROCEDURE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ON COMMIT REFRESH TO SYSADMIN WITH ADMIN OPTION;
  GRANT ADMINISTER DATABASE TRIGGER TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY OUTLINE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE DIMENSION TO SYSADMIN WITH ADMIN OPTION;
  GRANT EXECUTE ANY OPERATOR TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE OPERATOR TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY TYPE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY TYPE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ANALYZE ANY TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT SELECT ANY TABLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT UNLIMITED TABLESPACE TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY MEASURE FOLDER TO SYSADMIN WITH ADMIN OPTION;

  GRANT ALTER ANY CUBE TO SYSADMIN WITH ADMIN OPTION;

  GRANT ALTER ANY CUBE DIMENSION TO SYSADMIN WITH ADMIN OPTION;

  GRANT DROP ANY EDITION TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE EXTERNAL JOB TO SYSADMIN WITH ADMIN OPTION;
  GRANT MANAGE FILE GROUP TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY SQL PROFILE TO SYSADMIN WITH ADMIN OPTION;
  GRANT SELECT ANY TRANSACTION TO SYSADMIN WITH ADMIN OPTION;
  GRANT EXECUTE ANY PROGRAM TO SYSADMIN WITH ADMIN OPTION;

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.DROP_ANY_RULE,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.EXECUTE_ANY_RULE_SET,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.DROP_ANY_RULE_SET,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.CREATE_RULE_SET_OBJ,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.ALTER_ANY_EVALUATION_CONTEXT,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

  GRANT GRANT ANY OBJECT PRIVILEGE TO SYSADMIN WITH ADMIN OPTION;
  GRANT DEBUG CONNECT SESSION TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY CONTEXT TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY DIMENSION TO SYSADMIN WITH ADMIN OPTION;
  GRANT EXECUTE ANY INDEXTYPE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE INDEXTYPE TO SYSADMIN WITH ADMIN OPTION;
  GRANT EXECUTE ANY LIBRARY TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE LIBRARY TO SYSADMIN WITH ADMIN OPTION;
  GRANT GRANT ANY PRIVILEGE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE PUBLIC DATABASE LINK TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE DATABASE LINK TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY SEQUENCE TO SYSADMIN WITH ADMIN OPTION;
  GRANT UPDATE ANY TABLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT INSERT ANY TABLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT UPDATE ANY CUBE BUILD PROCESS TO SYSADMIN WITH ADMIN OPTION;

  GRANT CREATE MEASURE FOLDER TO SYSADMIN WITH ADMIN OPTION;

  GRANT CREATE ANY CUBE DIMENSION TO SYSADMIN WITH ADMIN OPTION;

  GRANT COMMENT ANY MINING MODEL TO SYSADMIN WITH ADMIN OPTION;

  GRANT ALTER ANY EDITION TO SYSADMIN WITH ADMIN OPTION;

  GRANT CREATE ANY EDITION TO SYSADMIN WITH ADMIN OPTION;
  GRANT ADMINISTER ANY SQL TUNING SET TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY JOB TO SYSADMIN WITH ADMIN OPTION;

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.EXECUTE_ANY_EVALUATION_CONTEXT,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

  GRANT MERGE ANY VIEW TO SYSADMIN WITH ADMIN OPTION;

BEGIN
   SYS.DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SYSTEM_PRIVILEGE (
      GRANTEE_NAME     => 'SYSADMIN',
      PRIVILEGE_NAME   => 'ADMINISTER_RESOURCE_MANAGER',
      ADMIN_OPTION     => TRUE
   );
END;
/

  GRANT GLOBAL QUERY REWRITE TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY INDEXTYPE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY TRIGGER TO SYSADMIN WITH ADMIN OPTION;
  GRANT FORCE ANY TRANSACTION TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY VIEW TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE PUBLIC SYNONYM TO SYSADMIN WITH ADMIN OPTION;
  GRANT DELETE ANY TABLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY TABLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP USER TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP TABLESPACE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY CUBE BUILD PROCESS TO SYSADMIN WITH ADMIN OPTION;

  GRANT CREATE CUBE TO SYSADMIN WITH ADMIN OPTION;

  GRANT EXECUTE ANY ASSEMBLY TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY SQL PROFILE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ADVISOR TO SYSADMIN WITH ADMIN OPTION;

BEGIN
   SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE (PRIVILEGE      => 'DEQUEUE_ANY',
                                          GRANTEE        => 'SYSADMIN',
                                          ADMIN_OPTION   => TRUE);
END;
/

BEGIN
   SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE (PRIVILEGE      => 'MANAGE_ANY',
                                          GRANTEE        => 'SYSADMIN',
                                          ADMIN_OPTION   => TRUE);
END;
/

  GRANT UNDER ANY VIEW TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY INDEXTYPE TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY OPERATOR TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY OPERATOR TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE TYPE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY MATERIALIZED VIEW TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP PROFILE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER PROFILE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE TRIGGER TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY VIEW TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY SYNONYM TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE SYNONYM TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY CLUSTER TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY TABLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ROLLBACK SEGMENT TO SYSADMIN WITH ADMIN OPTION;
  GRANT MANAGE TABLESPACE TO SYSADMIN WITH ADMIN OPTION;
  GRANT RESTRICTED SESSION TO SYSADMIN WITH ADMIN OPTION;
  GRANT AUDIT SYSTEM TO SYSADMIN WITH ADMIN OPTION;
  GRANT UPDATE ANY CUBE DIMENSION TO SYSADMIN WITH ADMIN OPTION;

  GRANT CREATE CUBE BUILD PROCESS TO SYSADMIN WITH ADMIN OPTION;

  GRANT UPDATE ANY CUBE TO SYSADMIN WITH ADMIN OPTION;

  GRANT CREATE CUBE DIMENSION TO SYSADMIN WITH ADMIN OPTION;

  GRANT ALTER ANY MINING MODEL TO SYSADMIN WITH ADMIN OPTION;

  GRANT DROP ANY MINING MODEL TO SYSADMIN WITH ADMIN OPTION;

  GRANT CREATE MINING MODEL TO SYSADMIN WITH ADMIN OPTION;

  GRANT MANAGE ANY FILE GROUP TO SYSADMIN WITH ADMIN OPTION;

  GRANT IMPORT FULL DATABASE TO SYSADMIN WITH ADMIN OPTION;

  GRANT EXPORT FULL DATABASE TO SYSADMIN WITH ADMIN OPTION;
  GRANT FLASHBACK ANY TABLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY CONTEXT TO SYSADMIN WITH ADMIN OPTION;

BEGIN
   SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE (PRIVILEGE      => 'ENQUEUE_ANY',
                                          GRANTEE        => 'SYSADMIN',
                                          ADMIN_OPTION   => TRUE);
END;
/

  GRANT QUERY REWRITE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY OPERATOR TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY DIRECTORY TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE PROFILE TO SYSADMIN WITH ADMIN OPTION;
  GRANT EXECUTE ANY PROCEDURE TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY PROCEDURE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY PROCEDURE TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT BECOME USER TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER SYSTEM TO SYSADMIN WITH ADMIN OPTION;
  GRANT INSERT ANY MEASURE FOLDER TO SYSADMIN WITH ADMIN OPTION;

  GRANT DELETE ANY MEASURE FOLDER TO SYSADMIN WITH ADMIN OPTION;

  GRANT INSERT ANY CUBE DIMENSION TO SYSADMIN WITH ADMIN OPTION;

  GRANT SELECT ANY MINING MODEL TO SYSADMIN WITH ADMIN OPTION;

  GRANT CREATE ANY MINING MODEL TO SYSADMIN WITH ADMIN OPTION;

  GRANT CREATE ASSEMBLY TO SYSADMIN WITH ADMIN OPTION;
  GRANT CHANGE NOTIFICATION TO SYSADMIN WITH ADMIN OPTION;
  GRANT READ ANY FILE GROUP TO SYSADMIN WITH ADMIN OPTION;

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.CREATE_RULE_OBJ,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.CREATE_EVALUATION_CONTEXT_OBJ,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

  GRANT DROP ANY LIBRARY TO SYSADMIN WITH ADMIN OPTION;
  GRANT EXECUTE ANY TYPE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY TYPE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY DIRECTORY TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY MATERIALIZED VIEW TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY TRIGGER TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY TRIGGER TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY PROCEDURE TO SYSADMIN WITH ADMIN OPTION;
  GRANT FORCE TRANSACTION TO SYSADMIN WITH ADMIN OPTION;
  GRANT LOCK ANY TABLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE USER TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE TABLESPACE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER SESSION TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY MEASURE FOLDER TO SYSADMIN WITH ADMIN OPTION;

  GRANT SELECT ANY CUBE DIMENSION TO SYSADMIN WITH ADMIN OPTION;

  GRANT DROP ANY CUBE DIMENSION TO SYSADMIN WITH ADMIN OPTION;

  GRANT EXECUTE ASSEMBLY TO SYSADMIN WITH ADMIN OPTION;

  GRANT DROP ANY ASSEMBLY TO SYSADMIN WITH ADMIN OPTION;
  GRANT MANAGE SCHEDULER TO SYSADMIN WITH ADMIN OPTION;

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.EXECUTE_ANY_RULE,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.CREATE_ANY_EVALUATION_CONTEXT,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

  GRANT DROP ANY OUTLINE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY OUTLINE TO SYSADMIN WITH ADMIN OPTION;
  GRANT UNDER ANY TABLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY INDEXTYPE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY LIBRARY TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY LIBRARY TO SYSADMIN WITH ADMIN OPTION;
  GRANT UNDER ANY TYPE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE MATERIALIZED VIEW TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE PROCEDURE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER DATABASE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP PUBLIC DATABASE LINK TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY SEQUENCE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY SEQUENCE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE SEQUENCE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE VIEW TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY INDEX TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY INDEX TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY CLUSTER TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY CLUSTER TO SYSADMIN WITH ADMIN OPTION;
  GRANT COMMENT ANY TABLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ROLLBACK SEGMENT TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ROLLBACK SEGMENT TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER USER TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER TABLESPACE TO SYSADMIN WITH ADMIN OPTION;
  GRANT FLASHBACK ARCHIVE ADMINISTER TO SYSADMIN WITH ADMIN OPTION;

  GRANT SELECT ANY CUBE TO SYSADMIN WITH ADMIN OPTION;

  GRANT CREATE ANY CUBE TO SYSADMIN WITH ADMIN OPTION;

  GRANT ALTER ANY ASSEMBLY TO SYSADMIN WITH ADMIN OPTION;

  GRANT CREATE ANY ASSEMBLY TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY SQL PROFILE TO SYSADMIN WITH ADMIN OPTION;

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.ALTER_ANY_RULE,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.CREATE_ANY_RULE,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.CREATE_ANY_RULE_SET,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

BEGIN
   SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE (
      PRIVILEGE      => SYS.DBMS_RULE_ADM.DROP_ANY_EVALUATION_CONTEXT,
      GRANTEE        => 'SYSADMIN',
      GRANT_OPTION   => TRUE
   );
END;
/

  GRANT RESUMABLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY DIMENSION TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY DIMENSION TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP ANY MATERIALIZED VIEW TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER RESOURCE COST TO SYSADMIN WITH ADMIN OPTION;
  GRANT AUDIT ANY TO SYSADMIN WITH ADMIN OPTION;
  GRANT GRANT ANY ROLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT SELECT ANY SEQUENCE TO SYSADMIN WITH ADMIN OPTION;
  GRANT DROP PUBLIC SYNONYM TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY SYNONYM TO SYSADMIN WITH ADMIN OPTION;
  GRANT ALTER ANY INDEX TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE CLUSTER TO SYSADMIN WITH ADMIN OPTION;
  GRANT BACKUP ANY TABLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE ANY TABLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE TABLE TO SYSADMIN WITH ADMIN OPTION;
  GRANT CREATE SESSION TO SYSADMIN WITH ADMIN OPTION;
  -- 9 Object Privileges for SYSADMIN
    GRANT SELECT ON OUTLN.OL$ TO SYSADMIN WITH GRANT OPTION;
    GRANT SELECT ON OUTLN.OL$HINTS TO SYSADMIN WITH GRANT OPTION;
    GRANT SELECT ON OUTLN.OL$NODES TO SYSADMIN WITH GRANT OPTION;
    GRANT SELECT ON SYSTEM.DEF$_AQCALL TO SYSADMIN WITH GRANT OPTION;
    GRANT SELECT ON SYSTEM.DEF$_CALLDEST TO SYSADMIN WITH GRANT OPTION;
    GRANT SELECT ON SYSTEM.DEF$_DESTINATION TO SYSADMIN WITH GRANT OPTION;
    GRANT SELECT ON SYSTEM.DEF$_ERROR TO SYSADMIN WITH GRANT OPTION;
    GRANT SELECT ON SYSTEM.REPCAT$_REPPROP TO SYSADMIN WITH GRANT OPTION;
    GRANT SELECT ON SYSTEM.REPCAT$_REPSCHEMA TO SYSADMIN WITH GRANT OPTION;