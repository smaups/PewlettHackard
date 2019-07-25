
CREATE TABLE employees (
emp_no INT PRIMARY KEY,
birth_date DATE,
first_name VARCHAR,
last_name VARCHAR,
gender VARCHAR,
hire_date DATE);


CREATE TABLE departments (
dept_no VARCHAR PRIMARY KEY,
dept_name VARCHAR);

CREATE TABLE department_employees (
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
dept_no VARCHAR,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
from_date DATE,
to_date DATE,
PRIMARY KEY (emp_no, dept_no));

             
CREATE TABLE department_managers (
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
dept_no VARCHAR,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
to_date DATE,
from_date DATE,
PRIMARY KEY (dept_no, emp_no));


CREATE TABLE salaries(
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
salary INT,
from_date DATE,
to_date DATE);

CREATE TABLE titles(
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
title VARCHAR,
from_date DATE,
to_date DATE);
