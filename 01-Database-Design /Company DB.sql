-- Create Company database
CREATE DATABASE company_db;
USE company_db;

-- Create tables
-- Employee's Table
CREATE TABLE employees(
SSN INT PRIMARY KEY,
FName VARCHAR(20),
LName VARCHAR(20),
Gender VARCHAR(1),
BirthDate DATE,
Supervisor INT,
DNum INT
);

-- Department's Table
CREATE TABLE departments(
DNum INT PRIMARY KEY,
DName VARCHAR(30),
Location VARCHAR(20),
MGR INT,
mgr_hiring_date DATE,
FOREIGN KEY(MGR) REFERENCES employees(SSN) ON DELETE SET NULL
);

-- Aletr employees table to include it's foreign keys
ALTER TABLE employees
ADD FOREIGN KEY(Supervisor)
REFERENCES employees(SSN)
ON DELETE SET NULL;

ALTER TABLE employees
ADD FOREIGN KEY(DNum)
REFERENCES departments(DNum)
ON DELETE SET NULL;

-- Project's Table
CREATE TABLE projects(
PNum INT PRIMARY KEY,
PName VARCHAR(50),
Location VARCHAR(20),
City VARCHAR(20),
DNum INT,
FOREIGN KEY(DNum) REFERENCES departments(DNum) ON DELETE SET NULL
);

-- Dependent's Table
CREATE TABLE dependents(
Dependent_Name VARCHAR(50) PRIMARY KEY,
Gender VARCHAR(1),
BirthDate DATE,
SSN INT,
FOREIGN KEY(SSN) REFERENCES employees(SSN) ON DELETE CASCADE
);

-- Works On Table
CREATE TABLE works_on(
SSN INT,
PNum INT,
working_hours INT,
PRIMARY KEY(SSN, PNum),
FOREIGN KEY(SSN) REFERENCES employees(SSN) ON DELETE CASCADE,
FOREIGN KEY(PNum) REFERENCES projects(PNum) ON DELETE CASCADE
);

-- To see our Tables
SELECT * FROM employees;

SELECT * FROM departments;

SELECT * FROM projects;

SELECT * FROM dependents;

SELECT * FROM works_on;

-- to check cloumns and their data types
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'employees';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'departments';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'projects';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'dependents';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'works_on';
