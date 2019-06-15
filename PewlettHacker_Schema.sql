DROP TABLE IF EXISTS Employees;
CREATE TABLE employees (
emp_no INT PRIMARY KEY,
birth_date DATE,
first_name VARCHAR,
last_name VARCHAR,
gender VARCHAR,
hire_date DATE);

DROP TABLE IF EXISTS Departments;
CREATE TABLE departments (
dept_no VARCHAR PRIMARY KEY,
dept_name VARCHAR);

DROP TABLE IF EXISTS Department_Employees;
CREATE TABLE department_employees (
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
dept_no VARCHAR,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
from_date DATE,
to_date DATE,
PRIMARY KEY (emp_no, dept_no));

DROP TABLE IF EXISTS Department_Managers;
CREATE TABLE department_managers (
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
dept_no VARCHAR,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
to_date DATE,
from_date DATE,
PRIMARY KEY (dept_no, emp_no));

DROP TABLE IF EXISTS Salaries;
CREATE TABLE salaries(
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
salary INT,
from_date DATE,
to_date DATE);

DROP TABLE IF EXISTS Titles;
CREATE TABLE titles(
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
title VARCHAR,
from_date DATE,
to_date DATE);

-- Question 1
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM Salaries AS s
INNER JOIN Employees AS e ON
e.emp_no=s.emp_no;

-- Question 2
SELECT *
FROM Employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- Question 3
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, m.to_date, m.from_date
FROM Employees AS e
LEFT JOIN Department_Managers AS m ON
e.emp_no=m.emp_no
JOIN Departments AS d ON
d.dept_no=m.dept_no

-- Question 4
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees AS e
LEFT JOIN Department_Employees AS de ON
e.emp_no=de.emp_no
JOIN Departments AS d ON
d.dept_no=de.dept_no

-- Question 5
SELECT *
FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

-- Question 6
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees AS e
LEFT JOIN Department_Employees AS de ON
e.emp_no=de.emp_no
JOIN Departments AS d ON
d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales'

-- Question 7
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees AS e
LEFT JOIN Department_Employees AS de ON
e.emp_no=de.emp_no
JOIN Departments AS d ON
d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'

-- Question 8
SELECT last_name,
COUNT(last_name) AS "Number of Names"
FROM Employees
GROUP BY last_name
ORDER BY "Number of Names" DESC;

