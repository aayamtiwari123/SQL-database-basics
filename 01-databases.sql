
-- DATABASE OPERATIONS - MySQL Basics
-- ============================================
-- This file demonstrates fundamental database operations in MySQL
-- Topics covered:
--   - Creating a new database
--   - Selecting/using a database
--   - Deleting a database
--   - Setting read-only mode on a database
--   - Understanding read-only protection (prevents accidental deletion)
--   - Disabling read-only mode
-- 
-- Key Learning: Read-only mode is a safety feature that prevents
-- modification or deletion of a database until it's disabled
-- ============================================


-- --creating my database
create database mydb;

-- -- selecting that database
use mydb;

-- --drop the database
drop database mydb;


-- to set database to read only mode
alter database mydb READ ONLY=1;

drop database mydb
-- Error- drop database mydb	Error Code: 3989. Schema 'mydb' is in read only mode


-- to reset the read only mode
alter database mydb READ ONLY=0;
drop database mydb
-- database dropped
