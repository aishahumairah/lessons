-- Lab 1 Solution Queries
-- Data Engineering Course - Week 1
-- Run these against the de_course database after loading employees.csv

-- ─────────────────────────────────────────────────────────────
-- STEP 2: Create the table
-- ─────────────────────────────────────────────────────────────

CREATE TABLE employees (
    employee_id  INTEGER      PRIMARY KEY,
    first_name   VARCHAR(50)  NOT NULL,
    last_name    VARCHAR(50)  NOT NULL,
    department   VARCHAR(50),
    salary       INTEGER,
    hire_date    DATE,
    city         VARCHAR(100),
    is_active    BOOLEAN
);


-- ─────────────────────────────────────────────────────────────
-- STEP 4: Verification queries
-- ─────────────────────────────────────────────────────────────

-- Count total rows (expect 20)
SELECT COUNT(*) AS total_rows FROM employees;

-- Preview the data
SELECT * FROM employees LIMIT 5;

-- Check for nulls in key columns
SELECT COUNT(*) AS null_first_names FROM employees WHERE first_name IS NULL;


-- ─────────────────────────────────────────────────────────────
-- STEP 5: Exploration queries
-- ─────────────────────────────────────────────────────────────

-- 5a. Headcount by department
SELECT department, COUNT(*) AS headcount
FROM employees
GROUP BY department
ORDER BY headcount DESC;

-- 5b. Max salary by department
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department
ORDER BY max_salary DESC;

-- 5c. Active Engineering employees sorted by salary
SELECT first_name, last_name, salary, hire_date
FROM employees
WHERE department = 'Engineering'
  AND is_active = TRUE
ORDER BY salary DESC;

-- 5d. Employees hired in 2022
SELECT first_name, last_name, hire_date, department
FROM employees
WHERE hire_date >= '2022-01-01'
  AND hire_date < '2023-01-01'
ORDER BY hire_date;

-- 5e. Unique cities
SELECT DISTINCT city
FROM employees
ORDER BY city;


-- ─────────────────────────────────────────────────────────────
-- STEP 6: Your own queries - solutions
-- ─────────────────────────────────────────────────────────────

-- Q1: Sales employees earning more than $70,000
SELECT first_name, last_name, salary
FROM employees
WHERE department = 'Sales'
  AND salary > 70000
ORDER BY salary DESC;

-- Q2: 5 most recently hired employees
SELECT first_name, last_name, hire_date, department
FROM employees
ORDER BY hire_date DESC
LIMIT 5;

-- Q3: Number of distinct cities
SELECT COUNT(DISTINCT city) AS num_cities
FROM employees;

-- Q4: Inactive employees sorted by last name
SELECT first_name, last_name, department, hire_date
FROM employees
WHERE is_active = FALSE
ORDER BY last_name ASC;

-- Q5: New York employees earning more than $80,000
SELECT first_name, last_name, salary, department
FROM employees
WHERE city = 'New York'
  AND salary > 80000
ORDER BY salary DESC;
