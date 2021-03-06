/* Formatted on 10/6/2014 4:29:07 PM (QP5 v5.126.903.23003) */
-- FUNCTION: SCM.GET_HGST_COST_PRICE(BIGINT)

-- DROP FUNCTION SCM.GET_HGST_COST_PRICE(BIGINT);

CREATE OR REPLACE FUNCTION APLAPPS.GET_HGST_COST_PRICE (P_ITMID NUMBER)
   RETURN NUMBER
AS
   L_RESULT   NUMBER := 0.00;
BEGIN
   SELECT   TBL1.CPRICE
     INTO   L_RESULT
     FROM   (  SELECT   NVL (C.COST_PRICE, 0) CPRICE
                 FROM   INV.INV_CONSGMT_RCPT_DET C
                WHERE   (C.ITM_ID = P_ITMID)
             ORDER BY   C.CONSGMT_ID DESC) TBL1
    WHERE   ROWNUM = 1;

   RETURN NVL (L_RESULT, 0);
END;