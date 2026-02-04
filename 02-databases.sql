-- ============================================
-- TABLE OPERATIONS
-- ============================================
-- Demonstrates how to:
-- - CREATE a table with various data types
-- - SELECT/display table data
-- - RENAME tables
-- - ALTER table structure (add, rename, modify, reposition, drop columns)
-- 
-- Example table: employees (employee_id, first_name, last_name, salary, date_of_hiring)
-- ============================================



create database mydb;

-- -- selecting that database
use mydb;

-- creating table in database
create table employees
(
employee_id int ,
first_name  varchar(50),
last_name   varchar(50),
salary     float  , 
date_of_hiring  date
);

-- display the entire table
select * 
from employees

-- rename table
rename table employees to emp


-- altering tables emp and add an coloumn
alter table emp
add phone_number varchar(15);

-- displaying the table
select *
from emp

-- to rename coloumn
alter table emp
rename column phone_number to phone

-- to change the data type form varchar to int for phone
alter table emp
modify column phone int;

-- to move position of column
alter table emp
modify phone int 
after last_name

-- to drop the coloumn
alter table emp
drop column phone
