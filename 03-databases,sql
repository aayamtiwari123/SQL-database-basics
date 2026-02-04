-- ============================================
-- SELECT, INSERT, UPDATE & DELETE OPERATIONS
-- ============================================
-- This file demonstrates basic CRUD operations in MySQL
-- Topics covered:
--   - Creating database and table
--   - INSERT: Adding data in different ways
--   - SELECT: Retrieving and filtering data with WHERE clause
--   - UPDATE: Modifying existing records
--   - DELETE: Removing records
--   - Working with NULL values
--   - Safe update mode and its implications
-- 
-- CRUD = Create, Read, Update, Delete (fundamental database operations)
-- ============================================

-- Create and select database
CREATE DATABASE mydb;
USE mydb;

-- Create employees table
CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary FLOAT,
    date_of_hiring DATE
);

-- Rename table
RENAME TABLE employees TO emp;

-- ============================================
-- INSERT OPERATIONS - Adding Data to Tables
-- ============================================
-- There are multiple ways to insert data into a table

-- View current table (should be empty)
SELECT * FROM emp;

-- Method 1: Insert a single row with all columns
INSERT INTO emp
VALUES (1, "Bruce", "Cheery", 0.1, "1955-05-05");

-- Method 2: Insert multiple rows at once (more efficient)
INSERT INTO emp
VALUES 
    (2, "Cobblpot", "Pen", 15000, "1995-06-05"),
    (3, "Dober", "Apple", 16000, "1999-09-10"),
    (4, "Wally", "Crabs", 15000, "1985-05-25"),
    (5, "Done", "Plankton", 190000.2, "2005-01-03");

-- Method 3: Insert with specific columns only
-- Columns not specified will be NULL
INSERT INTO emp (employee_id, first_name, salary)
VALUES (6, "Bat", 15000);

-- ============================================
-- SELECT OPERATIONS - Retrieving Data
-- ============================================
-- SELECT allows you to query and filter data from tables

-- Select specific columns
SELECT first_name, last_name
FROM emp;

-- Select all columns
SELECT * 
FROM emp;

-- ============================================
-- WHERE CLAUSE - Filtering Data
-- ============================================
-- WHERE clause filters records based on conditions

-- Filter by exact match (number)
SELECT * 
FROM emp
WHERE employee_id = 1;

-- Filter by exact match (string)
SELECT * 
FROM emp
WHERE first_name = "Wally";

-- Filter with comparison operator (<)
SELECT * 
FROM emp
WHERE salary < 10000;

-- Filter by date
SELECT *
FROM emp
WHERE date_of_hiring <= "1986-12-30";

-- Filter with NOT EQUAL (!=)
SELECT * 
FROM emp
WHERE employee_id != 1;

-- Filter for NULL values
SELECT * 
FROM emp
WHERE date_of_hiring IS NULL;

-- ============================================
-- SAFE UPDATE MODE - Important Note
-- ============================================
-- MySQL has a "safe update mode" that prevents accidental updates/deletes
-- 
-- ERROR: "You are using safe update mode and you tried to update a table 
--         without a WHERE that uses a KEY column"
--
-- WHY THIS HAPPENS:
-- - Safe mode requires WHERE clause to use a KEY column (PRIMARY KEY, UNIQUE, etc.)
-- - Without a PRIMARY KEY, MySQL treats employee_id as a regular column
-- - This protection prevents accidentally updating ALL rows
-- 
-- SIMPLE EXPLANATION:
-- If a column is not a primary key and we try to update it using WHERE,
-- MySQL throws an error because non-primary key values can repeat,
-- which could accidentally change multiple rows in the database
--
-- SOLUTION: Disable safe mode for practice (not recommended for production)
SET SQL_SAFE_UPDATES = 0;

-- ============================================
-- UPDATE OPERATIONS - Modifying Existing Data
-- ============================================
-- UPDATE allows you to change values in existing records

-- Check current data before update
SELECT * 
FROM emp
WHERE employee_id = 6;

-- Update a single column
UPDATE emp
SET salary = 10.25
WHERE employee_id = 6;

-- Verify the update
SELECT * 
FROM emp
WHERE employee_id = 6;

-- Update multiple columns at once
UPDATE emp
SET date_of_hiring = "2077-06-12"
WHERE employee_id = 6;

-- Set a value to NULL
UPDATE emp
SET salary = NULL
WHERE employee_id = 6;

-- ============================================
-- DELETE OPERATIONS - Removing Data
-- ============================================
-- DELETE removes records from a table

-- WARNING: This deletes ALL data from the table (dangerous!)
-- Should NOT be run without WHERE clause
-- DELETE FROM employees;

-- Correct way: Delete a specific row using WHERE
DELETE FROM emp 
WHERE employee_id = 6;

-- ============================================
-- KEY TAKEAWAYS
-- ============================================
-- 1. INSERT: Use multiple VALUES for efficiency
-- 2. SELECT with WHERE: Filter data precisely
-- 3. UPDATE: Always use WHERE to target specific rows
-- 4. DELETE: ALWAYS use WHERE clause (unless you really want to delete everything)
-- 5. Safe Update Mode: Protection against accidental bulk changes
-- 6. NULL values: Use IS NULL / IS NOT NULL (not = NULL)
-- ============================================
