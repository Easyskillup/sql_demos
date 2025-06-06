-- use the db
use hr;

show tables;

show databases;

-- Creating tables for HR schema

CREATE TABLE employees (
  employee_id int primary key,
  first_name varchar(40),
  last_name varchar(40) not null,
  email varchar(100) not null,
  phone_number varchar(15),
  hire_date date not null,
  job_id varchar(10) not null,
  salary decimal(8,2),
  commission_pct decimal(2,2),
  manager_id int,
  department_id int
);

CREATE TABLE departments (
    department_id INT primary key,
    department_name VARCHAR(30) NOT NULL,
    manager_id INT,
    location_id INT
);

CREATE TABLE locations (
    location_id INT primary key,
    street_address VARCHAR(40),
    postal_code VARCHAR(12),
    city VARCHAR(30) NOT NULL,
    state_province VARCHAR(25),
    country_id CHAR(2)
);

CREATE TABLE countries (
    country_id CHAR(2) primary key,
    country_name VARCHAR(40),
    region_id INT
);

CREATE TABLE regions (
  region_id int primary key,
  region_name varchar(50) not null
);

CREATE TABLE jobs (
    job_id VARCHAR(10) primary key,
    job_title VARCHAR(35) NOT NULL,
    min_salary DECIMAL(8,2),
    max_salary DECIMAL(8,2)
);

CREATE TABLE job_history (
    employee_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    department_id INT
);

show tables;

desc Employees;

-- for the current session turn sql_require_primary_key OFF
set session sql_require_primary_key = OFF;

alter table job_history drop primary key;

ALTER TABLE job_history ADD PRIMARY KEY (employee_id, start_date);

desc job_history;

rename table Employees to employees;

-- Employee -> Department
alter table Employees add foreign key(department_id)
references departments(department_id);

-- Employee -> Jobs
alter table employees add foreign key(job_id)
references jobs(job_id);

-- EMployee -> Employee
alter table employees add foreign key(manager_id)
references employees(employee_id);

ALTER TABLE locations ADD FOREIGN KEY (country_id) 
REFERENCES countries(country_id);

ALTER TABLE countries ADD FOREIGN KEY (region_id) 
REFERENCES regions(region_id);

ALTER TABLE departments ADD FOREIGN KEY (manager_id) 
REFERENCES employees(employee_id);

ALTER TABLE departments ADD FOREIGN KEY (location_id) 
REFERENCES locations(location_id);

ALTER TABLE job_history ADD FOREIGN KEY (employee_id) 
REFERENCES employees(employee_id);

ALTER TABLE job_history ADD FOREIGN KEY (job_id) 
REFERENCES jobs(job_id);

ALTER TABLE job_history ADD FOREIGN KEY (department_id) 
REFERENCES departments(department_id);

alter table employees add constraint unique (email);