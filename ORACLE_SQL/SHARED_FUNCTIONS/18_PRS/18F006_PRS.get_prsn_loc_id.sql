/* Formatted on 12-19-2018 5:34:44 PM (QP5 v5.126.903.23003) */
CREATE OR REPLACE FUNCTION PRS.GET_PRSN_LOC_ID (P_PRSNID NUMBER)
   RETURN VARCHAR2
AS
   L_RESULT   VARCHAR2 (200 BYTE);
BEGIN
   L_RESULT := '';

   SELECT   LOCAL_ID_NO
     INTO   L_RESULT
     FROM   PRS.PRSN_NAMES_NOS
    WHERE   PERSON_ID = P_PRSNID;

   RETURN L_RESULT;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN '';
END;
/