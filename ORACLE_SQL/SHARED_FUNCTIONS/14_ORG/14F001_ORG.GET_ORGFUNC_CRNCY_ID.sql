/* Formatted on 12-20-2018 9:44:22 AM (QP5 v5.126.903.23003) */
CREATE OR REPLACE FUNCTION ORG.GET_ORGFUNC_CRNCY_ID (P_ORGIDNO NUMBER)
   RETURN NUMBER
AS
   L_RESULT   NUMBER;
BEGIN
   L_RESULT := -1;

   SELECT   OPRTNL_CRNCY_ID
     INTO   L_RESULT
     FROM   ORG.ORG_DETAILS
    WHERE   ORG_ID = P_ORGIDNO;

   RETURN L_RESULT;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN -1;
END;
/