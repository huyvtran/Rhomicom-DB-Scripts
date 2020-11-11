CREATE OR REPLACE FUNCTION PRS.GET_PRSN_ORG_ID (P_PRSNID NUMBER)
   RETURN INTEGER
AS
   L_RESULT   INTEGER := -1;
BEGIN
   SELECT   ORG_ID
     INTO   L_RESULT
     FROM   PRS.PRSN_NAMES_NOS
    WHERE   PERSON_ID = P_PRSNID;

   RETURN COALESCE (L_RESULT, -1);
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN -1;
END;
/
