/* Formatted on 18/09/2014 09:16:56 (QP5 v5.126.903.23003) */
CREATE OR REPLACE FUNCTION APLAPPS.GET_PAYITM_ID (P_ITMNAME VARCHAR2)
   RETURN NUMBER
AS
   L_RESULT   NUMBER;
BEGIN
   L_RESULT := -1;

   SELECT   ITEM_ID
     INTO   L_RESULT
     FROM   ORG.ORG_PAY_ITEMS
    WHERE   UPPER (ITEM_CODE_NAME) = UPPER (P_ITMNAME);

   RETURN L_RESULT;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN -1;
END;
/