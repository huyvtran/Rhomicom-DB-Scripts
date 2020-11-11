/* Formatted on 12-20-2018 9:49:11 AM (QP5 v5.126.903.23003) */
-- FUNCTION: ORG.GET_CRITERIA_ID(VARCHAR2, VARCHAR2)

-- DROP FUNCTION ORG.GET_CRITERIA_ID(VARCHAR2, VARCHAR2);

CREATE OR REPLACE FUNCTION ORG.GET_CRITERIA_ID (CRITERIA_NAME    VARCHAR2,
                                                CRTRIATYPE       VARCHAR2)
   RETURN INTEGER
AS
   BID   INTEGER := -1;
BEGIN
   IF CRTRIATYPE = 'Everyone'
   THEN
      SELECT   -1 INTO BID FROM DUAL;
   ELSIF CRTRIATYPE = 'Divisions/Groups'
   THEN
      SELECT   DIV_ID
        INTO   BID
        FROM   ORG.ORG_DIVS_GROUPS
       WHERE   LOWER (DIV_CODE_NAME) = LOWER (CRITERIA_NAME);
   ELSIF CRTRIATYPE = 'Grade'
   THEN
      SELECT   GRADE_ID
        INTO   BID
        FROM   ORG.ORG_GRADES
       WHERE   LOWER (GRADE_CODE_NAME) = LOWER (CRITERIA_NAME);
   ELSIF CRTRIATYPE = 'Job'
   THEN
      SELECT   JOB_ID
        INTO   BID
        FROM   ORG.ORG_JOBS
       WHERE   LOWER (JOB_CODE_NAME) = LOWER (CRITERIA_NAME);
   ELSIF CRTRIATYPE = 'Position'
   THEN
      SELECT   POSITION_ID
        INTO   BID
        FROM   ORG.ORG_POSITIONS
       WHERE   LOWER (POSITION_CODE_NAME) = LOWER (CRITERIA_NAME);
   ELSIF CRTRIATYPE = 'Site/Location'
   THEN
      SELECT   LOCATION_ID
        INTO   BID
        FROM   ORG.ORG_SITES_LOCATIONS
       WHERE   LOWER (LOCATION_CODE_NAME) = LOWER (CRITERIA_NAME);
   ELSIF CRTRIATYPE = 'Person Type'
   THEN
      SELECT   A.PSSBL_VALUE_ID
        INTO   BID
        FROM   GST.GEN_STP_LOV_VALUES A, GST.GEN_STP_LOV_NAMES B
       WHERE       A.VALUE_LIST_ID = B.VALUE_LIST_ID
               AND B.VALUE_LIST_NAME = 'Person Types'
               AND LOWER (A.PSSBL_VALUE) = LOWER (CRITERIA_NAME);
   ELSIF CRTRIATYPE = 'Single Person'
   THEN
      SELECT   PRS.GET_PRSN_ID (CRITERIA_NAME, 1) INTO BID FROM DUAL;
   END IF;

   RETURN COALESCE (BID, -1);
END;