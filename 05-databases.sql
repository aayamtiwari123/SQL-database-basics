use mydb;

-- Create teacher table
create table teacher
(
    teacher_id int primary key,
    name varchar(25),
    age int
);

-- Insert data into teacher
insert into teacher
values (1,'Tiffany',28), 
       (2,'Mathew',35);

-- Create student table
create table student
(
    student_id int primary key,
    name varchar(25),
    age int
);

-- Insert data into student
insert into student
values (10,'Benny',35);

--------------------------------------------------------------------------------
-- EXPLAINING JOINS
--------------------------------------------------------------------------------

-- 1️)INNER JOIN: only rows where teacher.age = student.age
select *
from teacher
inner join student
on teacher.age = student.age;


-- 2️)LEFT JOIN: all teacher rows + matching student rows
select *
from teacher
left join student
on teacher.age = student.age;

-- 3️)RIGHT JOIN: all student rows + matching teacher rows
select *
from teacher
right join student
on teacher.age = student.age;

-- 4) CROSS JOIN: every teacher combined with every student
select *
from teacher
cross join student;

-- 5) Self-join remains

-- VIEWS

Select * from emp

-- creating view table
create VIEW employee_attendance as
select first_name, last_name
from emp;

select * from employee_attendance
order by last_name ASC;

-- stored procedure
-- prepared sql code that can be saved
DELIMITER $$
create procedure get_customers()
BEGIN
     select * from customers;
END $$
DELIMITER ;

-- used to call procedures
call get_customers();

-- to send data in the stored procedure

DELIMITER $$
Create procedure find_customer(in id int ) 
-- send multiple like (in f_name varchar(50),in l_name varchar(50))
BEGIN
    select * from customers
    Where cust_id=id;
END $$
DELIMITER ;

CALL find_customer(2);
