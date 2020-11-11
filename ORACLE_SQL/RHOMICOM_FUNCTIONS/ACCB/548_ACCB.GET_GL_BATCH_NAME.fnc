/* Formatted on 10/3/2014 3:04:43 PM (QP5 v5.126.903.23003) */
-- FUNCTION: APLAPPS.GET_GL_BATCH_NAME(BIGINT)

-- DROP FUNCTION APLAPPS.GET_GL_BATCH_NAME(BIGINT);

CREATE OR REPLACE FUNCTION APLAPPS.GET_GL_BATCH_NAME (P_GLBATCHID NUMBER)
   RETURN VARCHAR2
AS
   L_RESULT   VARCHAR2(300) := '';
BEGIN
   SELECT   BATCH_NAME
     INTO   L_RESULT
     FROM   ACCB.ACCB_TRNSCTN_BATCHES
    WHERE   BATCH_ID = P_GLBATCHID;

   RETURN L_RESULT;
END;