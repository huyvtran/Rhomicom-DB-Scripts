/* Formatted on 10/3/2014 3:30:10 PM (QP5 v5.126.903.23003) */
-- FUNCTION: APLAPPS.GET_PRD_TRNS_SUM(INTEGER, CHARACTER VARYING, CHARACTER VARYING)

-- DROP FUNCTION APLAPPS.GET_PRD_TRNS_SUM(INTEGER, CHARACTER VARYING, CHARACTER VARYING);

CREATE OR REPLACE FUNCTION APLAPPS.GET_PRD_TRNS_SUM (P_ACCNTID    NUMBER,
                                                  P_STRTDTE    VARCHAR2,
                                                  P_ENDDTE     VARCHAR2)
   RETURN NUMBER
AS
   L_RESULT   NUMBER := 0.00;
BEGIN
   SELECT   SUM (A.NET_AMOUNT)
     INTO   L_RESULT
     FROM   ACCB.ACCB_TRNSCTN_DETAILS A
    WHERE   A.TRNS_STATUS = '1'
            AND TO_DATE (A.TRNSCTN_DATE, 'YYYY-MM-DD HH24:MI:SS') <=
                  TO_DATE (P_ENDDTE, 'YYYY-MM-DD HH24:MI:SS')
            AND TO_DATE (A.TRNSCTN_DATE, 'YYYY-MM-DD HH24:MI:SS') >=
                  TO_DATE (P_STRTDTE, 'YYYY-MM-DD HH24:MI:SS')
            AND A.ACCNT_ID = P_ACCNTID;

   RETURN L_RESULT;
END;