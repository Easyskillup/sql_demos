-- CTE Common Table Expression, a temp resultset that we can refer in a SQL statement

use classicmodels;

SELECT * from employees;

with
    customer_product_orders as (
        select c.customernumber, c.customername, o.ordernumber, o.orderdate, o.requireddate, 
        o.shippeddate, o.status, od.productcode, p.productname, od.priceeach, od.quantityordered
        from
            orders o
            inner join customers c on o.customernumber = c.customernumber
            inner join orderdetails od on o.ordernumber = od.ordernumber
            inner join products p on od.productcode = p.productcode
    )
SELECT *
from customer_product_orders;

-- materialised view: it is a type of view that stores it's data in the database
create table mv_customer_product_details as
select c.customernumber, c.customername, o.ordernumber, o.orderdate, o.requireddate, o.shippeddate, o.status, od.productcode, p.productname, od.priceeach, od.quantityordered
from
    orders o
    inner join customers c on o.customernumber = c.customernumber
    inner join orderdetails od on o.ordernumber = od.ordernumber
    inner join products p on od.productcode = p.productcode;

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
            `reportsTo` is null
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