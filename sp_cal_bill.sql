
DELIMITER \\

CREATE PROCEDURE CALC_BILL(
  IN TOTAL_AMT DECIMAL(10,2),
  OUT DISC_PERCENT DECIMAL(10,2),
  OUT FINAL_AMT DECIMAL(10,2)
)
BEGIN
  IF TOTAL_AMT >= 5000 THEN
    SET DISC_PERCENT = 20;
  ELSEIF TOTAL_AMT >= 3000 THEN
    SET DISC_PERCENT = 10;
  ELSE
    SET DISC_PERCENT = 0;
  END IF;
  SET FINAL_AMT = TOTAL_AMT - (TOTAL_AMT * DISC_PERCENT / 100);
END;

DELIMITER;

DROP PROCEDURE CALC_BILL;

SHOW ERRORS;

set @discount = 0;

set @final_bill = 0;

CALL CALC_BILL (3500, @discount, @final_bill);

select @final_bill as 'Final Bill', @discount as 'Discount';

SHOW CREATE PROCEDURE CALC_BILL;

SHOW PROCEDURE STATUS WHERE Db = 'classicmodels';

select * from information_schema.ROUTINES;

-- information_schema: read only database maintained by mysql server. This contains information about
-- databases, tables, columns, indexes, procedures, functions etc...

use information_schema;

desc SCHEMATA;

SELECT * FROM SCHEMATA;

DESC TABLES;

SELECT TABLE_NAME
FROM TABLES
WHERE
    TABLE_SCHEMA = 'information_schema';