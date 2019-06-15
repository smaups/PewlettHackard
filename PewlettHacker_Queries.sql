-- Question 1
CREATE VIEW employee_details AS
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
e.emp_no=s.emp_no;

-- Question 2
CREATE VIEW hire_date AS
SELECT *
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- Question 3
CREATE VIEW manager_details AS
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, m.to_date, m.from_date
FROM employees AS e
LEFT JOIN department_managers AS m ON
e.emp_no=m.emp_no
JOIN departments AS d ON
d.dept_no=m.dept_no

-- Question 4
CREATE VIEW employee_department AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN department_employees AS de ON
e.emp_no=de.emp_no
JOIN departments AS d ON
d.dept_no=de.dept_no

-- Question 5
CREATE VIEW hercules_search AS
SELECT *
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

-- Question 6
CREATE VIEW sales_employees AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN department_employees AS de ON
e.emp_no=de.emp_no
JOIN departments AS d ON
d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales'

-- Question 7
CREATE VIEW sales_development_search AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN department_employees AS de ON
e.emp_no=de.emp_no
JOIN departments AS d ON
d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'

-- Question 8
CREATE VIEW last_name_search AS
SELECT last_name,
COUNT(last_name) AS "Number of Names"
FROM employees
GROUP BY last_name
ORDER BY "Number of Names" DESC;

