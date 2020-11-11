/* Formatted on 10/6/2014 2:07:13 AM (QP5 v5.126.903.23003) */
-- FUNCTION: APLAPPS.GET_LTST_STOCK_BALS(NUMBER, BALSDTE VARCHAR2)

 --DROP FUNCTION APLAPPS.GET_LTST_STOCK_BALS;
CREATE OR REPLACE FUNCTION APLAPPS.GET_LTST_STOCK_BALS1 (STCKID     NUMBER,
                                                        BALSDTE    VARCHAR2)
   RETURN NUMBER
AS
   L_RESULT   NUMBER := 0.00;
BEGIN
   SELECT   TBL1.TOTQTY
     INTO   L_RESULT
     FROM   (  SELECT   NVL (A.STOCK_TOT_QTY, 0) TOTQTY
                 FROM   INV.INV_STOCK_DAILY_BALS A
                WHERE   (A.BALS_DATE <= BALSDTE AND A.STOCK_ID = STCKID)
             ORDER BY   A.BALS_DATE DESC) TBL1
    WHERE   ROWNUM < 2;                                   -- LIMIT 1 OFFSET 0;

   RETURN NVL (L_RESULT, 0);
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN 0.00;
END;
/