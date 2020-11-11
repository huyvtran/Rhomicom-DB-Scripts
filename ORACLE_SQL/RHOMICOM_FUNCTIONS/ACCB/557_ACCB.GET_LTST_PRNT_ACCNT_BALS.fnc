/* Formatted on 10/6/2014 2:12:26 AM (QP5 v5.126.903.23003) */
-- FUNCTION: APLAPPS.GET_LTST_PRNT_ACCNT_BALS(INTEGER, CHARACTER VARYING, CHARACTER VARYING)

-- DROP FUNCTION APLAPPS.GET_LTST_PRNT_ACCNT_BALS(INTEGER, CHARACTER VARYING, CHARACTER VARYING);

CREATE OR REPLACE FUNCTION APLAPPS.GET_LTST_PRNT_ACCNT_BALS (
   P_ACCNTID    NUMBER,
   P_BALSDTE    VARCHAR2,
   P_TYP        VARCHAR2
)
   RETURN NUMBER
AS
   L_RESULT   NUMBER := 0.00;
BEGIN
   SELECT   SUM (APLAPPS.GET_LTST_ACCNT_BALS (A.ACCNT_ID, P_BALSDTE, P_TYP))
     INTO   L_RESULT
     FROM   ACCB.ACCB_CHART_OF_ACCNTS A
    WHERE   A.PRNT_ACCNT_ID = P_ACCNTID;

   RETURN NVL (L_RESULT, 0);
END;