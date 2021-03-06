/* Formatted on 10/1/2014 4:57:14 PM (QP5 v5.126.903.23003) */
CREATE OR REPLACE FUNCTION APLAPPS.GET_ACCNT_NUM (P_ACCNTID NUMBER)
   RETURN VARCHAR2
AS
   L_RESULT   VARCHAR2 (200 BYTE);
BEGIN
   L_RESULT := '';

   SELECT   A.ACCNT_NUM
     INTO   L_RESULT
     FROM   ACCB.ACCB_CHART_OF_ACCNTS A
    WHERE   A.ACCNT_ID = P_ACCNTID;

   RETURN L_RESULT;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN '';
END;
/