-- Triggers: Special kind of database object that gets executed or fired on the basis of certain events
-- in the databse or in the table. They can be executed before and event or after an event.
-- DML operations: Insert, Update, Delete

use retail_db;

desc employees;

drop table emp_audit;

create table emp_audit (
    audit_id int primary key AUTO_INCREMENT,
    employee_id int,
    action_time DATETIME,
    action VARCHAR(40),
    remark VARCHAR(300)
);

Drop trigger trg_before_emp_insert;

DELIMITER / /

CREATE TRIGGER trg_before_emp_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
  INSERT INTO emp_audit(employee_id, action_time, action, remark) 
  values (NEW.employee_id, NOW(), 'INSERT', CONCAT( NEW.employee_id, NEW.name, NEW.department, NEW.region ));
  -- Insert or Update triggers NEW refers to the new row of data
  -- Delete trigger OLD refers to the old row of data that is getting delete
END;

DELIMITER;

SELECT * FROM employees;

INSERT INTO employees values ( 8, 'Jane', 'Security', 'North' );

SELECT * from emp_audit;