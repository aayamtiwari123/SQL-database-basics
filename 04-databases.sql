-- ============================================
-- AUTOCOMMIT, TRANSACTIONS & CONSTRAINTS
-- ============================================
-- This file demonstrates transaction control and table constraints in MySQL
-- Topics covered:
--   - AUTOCOMMIT, COMMIT, ROLLBACK (transaction control)
--   - CURRENT_DATE(), CURRENT_TIME(), NOW() (date/time functions)
--   - UNIQUE constraint (prevent duplicate values)
--   - NOT NULL constraint (prevent empty values)
--   - CHECK constraint (validate data)
--   - DEFAULT constraint (set default values)
-- ============================================

-- Create and select database
CREATE DATABASE mydb;
USE mydb;

-- ============================================
-- TRANSACTION CONTROL - AUTOCOMMIT, COMMIT, ROLLBACK
-- ============================================
-- Transactions allow you to group multiple operations together
-- and decide whether to save or undo them as a single unit

-- Disable autocommit (changes are not permanent until COMMIT)
SET AUTOCOMMIT = OFF;

-- Make changes (this is temporary while autocommit is off)
DELETE FROM employees;

-- Undo changes (rollback) - brings back deleted data
ROLLBACK;

-- OR save changes permanently (commit)
COMMIT;

-- Enable autocommit (back to default - changes are instant and permanent)
SET AUTOCOMMIT = ON;

-- KEY LEARNING:
-- - AUTOCOMMIT ON = Changes are permanent immediately (no undo)
-- - AUTOCOMMIT OFF = Changes are temporary until COMMIT (can ROLLBACK)
-- - ROLLBACK only works for DML (INSERT, UPDATE, DELETE)
-- - ROLLBACK does NOT work for DDL (CREATE, DROP, ALTER)

-- ============================================
-- DATE AND TIME FUNCTIONS
-- ============================================
-- MySQL provides built-in functions to work with dates and times

-- Create a table to store date/time data
CREATE TABLE test (
    my_date DATE,
    my_time TIME,
    my_datetime DATETIME
);

-- View empty table
SELECT * FROM test;

-- Insert current date, time, and datetime
INSERT INTO test
VALUES (CURRENT_DATE(), CURRENT_TIME(), NOW());

-- Note: Date arithmetic like CURRENT_DATE()+1 may not work as expected
-- Better to use DATE_ADD() and DATE_SUB() functions for date manipulation

-- View inserted data
SELECT * FROM test;

-- ============================================
-- UNIQUE CONSTRAINT
-- ============================================
-- UNIQUE ensures that all values in a column are different
-- Prevents duplicate entries

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(25) UNIQUE,  -- No two products can have the same name
    price DECIMAL(4, 2) NOT NULL      -- Total 4 digits, 2 after decimal (max: 99.99)
);

-- Alternative: Add UNIQUE constraint to existing table
ALTER TABLE products 
ADD CONSTRAINT UNIQUE(product_name);

-- ============================================
-- NOT NULL CONSTRAINT
-- ============================================
-- NOT NULL ensures a column cannot have NULL (empty) values
-- Every row must have a value for this column

-- Alternative: Add NOT NULL to existing column
ALTER TABLE products
MODIFY price DECIMAL(4, 2) NOT NULL;

-- Insert sample data
INSERT INTO products
VALUES (100, "Hammer", 5.00), 
       (121, "Fridge", 30.00),
       (190, "PS5", 85.00),
       (114, "Bottle", 3.00);

-- This will fail (duplicate product_name)
-- INSERT INTO products VALUES (999, "Hammer", 10.00);  -- ERROR: Duplicate entry

-- This will fail (NULL price)
-- INSERT INTO products VALUES (200, "Keyboard", NULL);  -- ERROR: Column cannot be NULL

-- ============================================
-- CHECK CONSTRAINT
-- ============================================
-- CHECK validates that values in a column meet a specific condition
-- Useful for business rules (e.g., salary must be positive, age >= 18)

CREATE TABLE empo (
    emp_id INT,
    first_name VARCHAR(24),
    last_name VARCHAR(24),
    hourly_pay DECIMAL(5, 2) DEFAULT 10.00,  -- Default value if none provided
    hire_date DATE,
    CHECK(hourly_pay >= 10.00)  -- Ensures hourly_pay is at least 10.00
);

-- BEST PRACTICE: Name your constraints for easier management
CREATE TABLE employees_better (
    emp_id INT,
    first_name VARCHAR(24),
    last_name VARCHAR(24),
    hourly_pay DECIMAL(5, 2) DEFAULT 10.00,
    hire_date DATE,
    CONSTRAINT chk_hourly_pay CHECK(hourly_pay >= 10.00)  -- Named constraint
);

-- Alternative: Add CHECK constraint to existing table
ALTER TABLE empo
ADD CONSTRAINT chk_min_pay CHECK(hourly_pay >= 10.00);

-- This will fail (hourly_pay less than 10.00)
-- INSERT INTO empo VALUES (1, "Bob", "Smith", 5.00, "2023-01-01");  -- ERROR: Check constraint violated

-- ============================================
-- DEFAULT CONSTRAINT
-- ============================================
-- DEFAULT sets a default value for a column when no value is specified
-- Instead of NULL, the column gets the default value

-- Example: hourly_pay has DEFAULT 10.00
INSERT INTO empo (emp_id, first_name, last_name, hire_date)
VALUES (1, "Alice", "Johnson", "2024-01-15");
-- hourly_pay will automatically be 10.00

-- Alternative: Add DEFAULT to existing column
ALTER TABLE empo
ALTER hourly_pay SET DEFAULT 10.00;

-- ============================================
-- COMBINING CONSTRAINTS
-- ============================================
-- You can combine multiple constraints on a single column

CREATE TABLE users (
    user_id INT PRIMARY KEY,                    -- PRIMARY KEY = UNIQUE + NOT NULL
    username VARCHAR(50) UNIQUE NOT NULL,       -- Must be unique and cannot be empty
    email VARCHAR(100) UNIQUE NOT NULL,         -- Must be unique and cannot be empty
    age INT CHECK(age >= 18),                   -- Must be 18 or older
    status VARCHAR(20) DEFAULT 'active',        -- Default to 'active' if not specified
    created_at DATETIME DEFAULT NOW()           -- Default to current timestamp
);

-- ============================================
-- KEY TAKEAWAYS
-- ============================================
-- 1. AUTOCOMMIT OFF + ROLLBACK = Safety net for mistakes (DML only)
-- 2. UNIQUE = No duplicates allowed
-- 3. NOT NULL = Value required (cannot be empty)
-- 4. CHECK = Custom validation rules
-- 5. DEFAULT = Automatic value if none provided
-- 6. Constraints can be combined for stronger data integrity
-- 7. Name your constraints (CONSTRAINT name ...) for easier management
-- 8. DECIMAL(4,2) means 4 TOTAL digits, 2 after decimal (max: 99.99)
-- ============================================
