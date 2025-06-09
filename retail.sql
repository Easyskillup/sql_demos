
-- Create database
CREATE DATABASE IF NOT EXISTS retail_db;
USE retail_db;

-- Drop existing tables if they exist
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS employees;

-- Create employees table
CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  name VARCHAR(50),
  department VARCHAR(50),
  region VARCHAR(50)
);

-- Insert sample data into employees
INSERT INTO employees (employee_id, name, department, region) VALUES
(1, 'Alice', 'Sales', 'East'),
(2, 'Bob', 'Sales', 'West'),
(3, 'Charlie', 'Marketing', 'East'),
(4, 'Diana', 'Sales', 'East'),
(5, 'Evan', 'Sales', 'West');

-- Create sales table
CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  employee_id INT,
  product VARCHAR(50),
  amount DECIMAL(10,2),
  sale_date DATE,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert sample data into sales
INSERT INTO sales (sale_id, employee_id, product, amount, sale_date) VALUES
(101, 1, 'TV', 1200, '2024-01-10'),
(102, 2, 'Phone', 800, '2024-01-11'),
(103, 1, 'Laptop', 1500, '2024-01-12'),
(104, 3, 'TV', 1300, '2024-01-15'),
(105, 4, 'Phone', 700, '2024-01-18'),
(106, 5, 'Laptop', 1000, '2024-01-20'),
(107, 2, 'TV', 1400, '2024-01-21'),
(108, 4, 'Laptop', 1600, '2024-01-23'),
(109, 1, 'Phone', 900, '2024-01-25');
