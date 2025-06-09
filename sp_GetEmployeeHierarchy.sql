use classicmodels;

DELIMITER / /

CREATE PROCEDURE GetEmployeeHierarchy(IN startEmpNum INT)
BEGIN
  with recursive
    employee_hierarchy as (
        select
            employeeNumber,
            firstName,
            lastName,
            reportsTo,
            1 as level,
            concat(firstName, ' ', lastName) As path
        from employees
        where
            (startEmpNum IS NULL AND `reportsTo` is null)
            OR
            `employeeNumber` = startEmpNum
        union all
        select e.employeeNumber, e.firstName, e.lastName, e.reportsTo, eh.level + 1, concat(
                eh.path, ' <- ', e.firstName, ' ', e.lastName
            ) As path
        from
            employees e
            join employee_hierarchy eh on e.`reportsTo` = eh.`employeeNumber`
    )
SELECT *
from employee_hierarchy
ORDER BY path;
END;

DELIMITER;

CALL GetEmployeeHierarchy (NULL);

CALL GetEmployeeHierarchy (1056);

CALL GetEmployeeHierarchy (1088);