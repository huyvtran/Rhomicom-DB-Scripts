/* Formatted on 12-20-2018 1:38:29 PM (QP5 v5.126.903.23003) */
/*
"C:\Program Files (x86)\pgAdmin 4\v3\runtime\pg_dump" --host localhost --port 5432 --username postgres --verbose --table=PRS.PRSN_EXTRA_DATA --data-only --column-inserts psdc_live > PRS.PRSN_EXTRA_DATA.sql
*/
set define off;
TRUNCATE TABLE PRS.PRSN_EXTRA_DATA CASCADE;




COMMIT;
EXEC SYS.SEQUENCE_NEWVALUE( 'PRS', 'PRSN_EXTRA_DATA_SEQ', 2 );
COMMIT;

