use classicmodels;
-- select all information from a table
select * from customers;

-- select first 2o rows from the table
select * from customers limit 20;

-- describe the structure of customers
desc customers;

-- select customer name, phope, city, state and country
select customername, phone, city, state, country from customers;

-- select customer name, phope, city, state and country from the state of CA
select customername, phone, city, state, country from customers where state = 'CA';

-- select customer name, phope, city, state and country order by name of the customer
select customername, phone, city, state, country from customers order by 1;

-- column alias
select customername as 'Name', phone, city, state, country from customers order by 1;

-- select last name from employees
select lastname from employees;

-- get all unique product vendors
select distinct productvendor from products limit 150;

-- FROM -> WHERE -> SELECT -> DISTINCT -> ORDER BY

-- AND
SELECT CUSTOMERNAME, COUNTRY, STATE FROM customers WHERE COUNTRY = 'USA' AND STATE = 'CA';

-- OR
SELECT CUSTOMERNAME, COUNTRY, STATE FROM customers WHERE COUNTRY = 'USA' OR STATE = 'CA';

select * from orders;

-- FROM -> WHERE ->GROUP BY -> SELECT -> DISTINCT -> ORDER BY -> LIMIT
select count(status),status from orders group by status;

DESC orders;
select * from orders;

desc orderdetails;
select * from orderdetails where ordernumber = 10100;

-- joins allows us to connect multiple tables together with the help of common columns

select 
  o.ordernumber, o.orderdate, o.requireddate, o.shippeddate, o.status,
  od.productcode, p.productname, od.priceeach, od.quantityordered
from orders o,  orderdetails od, products p
where o.ordernumber = od.ordernumber and od.productcode = p.productcode; 

-- inner join
select 
  c.customernumber, c.customername,
  o.ordernumber, o.orderdate, o.requireddate, o.shippeddate, o.status,
  od.productcode, p.productname, od.priceeach, od.quantityordered
from orders o
inner join customers c on o.customernumber = c.customernumber
inner join orderdetails od on o.ordernumber = od.ordernumber
inner join products p on od.productcode = p.productcode;


-- views??
create view order_details_view as
select 
  c.customernumber, c.customername,
  o.ordernumber, o.orderdate, o.requireddate, o.shippeddate, o.status,
  od.productcode, p.productname, od.priceeach, od.quantityordered
from orders o
inner join customers c on o.customernumber = c.customernumber
inner join orderdetails od on o.ordernumber = od.ordernumber
inner join products p on od.productcode = p.productcode;

select * from order_details_view where customernumber = 385;


SELECT
    productLine,
    YEAR(orderDate) orderYear,
    SUM(quantityOrdered * priceEach) orderValue
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
        INNER JOIN
    products USING (productCode)
GROUP BY
    productLine, YEAR(orderdate) with rollup;

desc employees;
desc offices;

select * from offices;
select officecode from offices where country = 'USA';

-- subquery
-- outer query
select lastname, firstname from employees 
where officecode in (
  -- inner query
  select officecode from offices where country = 'USA'
);

desc products;
select * from products limit 10;

-- co related subquery
select productname, buyprice from products p1
where buyprice > (
  select avg(buyprice) from products 
  where productLine = p1.productLine
);

select now();
select curdate();
select curtime();
select utc_date();
select sysdate();
select utc_timestamp();
select @session.time_zone;
select year(now()), month(now()), hour(now()), week(now()), dayofweek(now());
show variables like '%time_zone%';
select convert_tz(now(), 'UTC', 'Asia/Kolkata');

select date_add(curdate(), interval 3 month);
select date_add(curdate(), interval 3 month);