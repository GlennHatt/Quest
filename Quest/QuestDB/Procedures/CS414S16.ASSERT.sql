-- ****** Object: Procedure CS414S16.ASSERT Script Date: 2/16/2016 5:30:24 PM ******
CREATE OR REPLACE PROCEDURE ASSERT(
  p_Condition    BOOLEAN,
  p_ErrorCode    NUMBER,
  p_ErrorMessage VARCHAR2) 
AS 
  PROCEDURE assertion(p_Cond BOOLEAN, p_ErrNum NUMBER, p_ErrMsg VARCHAR2) AS
  BEGIN
    IF p_Cond = FALSE OR p_Cond IS NULL THEN
      RAISE_APPLICATION_ERROR(p_ErrNum, p_ErrMsg);
    END IF;
  END assertion;
BEGIN
  assertion(p_ErrorCode    BETWEEN -20997 AND -20000, -20998,      'Error Code Must Be Between -20997 AND -20000!');
  assertion(p_ErrorMessage IS NOT NULL,               -20999,      'Error Message Cannot Be NULL!');
  assertion(p_Condition,                              p_ErrorCode, p_ErrorMessage);
END ASSERT;
/
