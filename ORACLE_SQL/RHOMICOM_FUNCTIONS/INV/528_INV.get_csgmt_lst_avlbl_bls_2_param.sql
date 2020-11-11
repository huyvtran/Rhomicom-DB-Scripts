/* Formatted on 10/5/2014 10:40:06 PM (QP5 v5.126.903.23003) */
-- FUNCTION: APLAPPS.GET_CSGMT_LST_AVLBL_BLS(BIGINT, CHARACTER VARYING)

-- DROP FUNCTION APLAPPS.GET_CSGMT_LST_AVLBL_BLS(BIGINT, CHARACTER VARYING);

CREATE OR REPLACE FUNCTION APLAPPS.GET_CSGMT_LST_AVLBL_BLS1 (
   CNSGMNTID    NUMBER,
   BALSDATE     VARCHAR2
)
   RETURN NUMBER
AS
   L_RESULT   NUMBER := 0.00;
BEGIN
   SELECT   TBL1.AVLBLS
     INTO   L_RESULT
     FROM   (  SELECT   NVL (A.AVAILABLE_BALANCE, 0) AVLBLS
                 FROM   INV.INV_CONSGMT_DAILY_BALS A
                WHERE   (TO_TIMESTAMP (A.BALS_DATE, 'YYYY-MM-DD') <=
                            TO_TIMESTAMP (BALSDATE, 'YYYY-MM-DD')
                         AND A.CONSGMT_ID = CNSGMNTID)
             ORDER BY   TO_TIMESTAMP (A.BALS_DATE, 'YYYY-MM-DD') DESC) TBL1
    WHERE   ROWNUM < 2;

   --DESC LIMIT 1 OFFSET 0;
   RETURN L_RESULT;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN 0.00;
END;
/