--01_List the following details of each employee: employee number, last name, first name, gender, and salary.

CREATE VIEW EmpData AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
INNER JOIN salaries ON (salaries.emp_no = employees.emp_no);

--02_List employees who were hired in 1986.
CREATE VIEW Emp1986 AS
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date > '1985-12-31' AND hire_date <'1987-01-01'
ORDER BY hire_date;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

--03_working
CREATE VIEW DeptManagers AS
SELECT sub1.dept_no AS DEPARTMENT_NUMBER, 
	   sub1.dept_name AS DEPARTMENT_NAME,
	   e.emp_no AS EMPLOYEE_NUMBER, 
	   e.first_name AS NAME, 
	   e.last_name AS SURNAME,  
	   sub1.from_date AS START_DATE, 
	   sub1.to_date AS END_DATE
FROM employees AS e,
(SELECT dm.emp_no, dm.dept_no, dm.from_date, dm.to_date, d.dept_name
    FROM dept_manager AS dm 
    INNER JOIN  departments AS d ON (dm.dept_no = d.dept_no) 
) sub1
WHERE e.emp_no = sub1.emp_no
ORDER BY SURNAME
;

--04_List the department of each employee with the following information: employee number, last name, first name, and department name.
CREATE VIEW EmpAndDept AS
SELECT 	e.emp_no AS EMPLOYEE_NUMBER, 
		e.last_name AS SURNAME, 
		e.first_name AS NAME,
		sql1.dept_name AS DEPARTMENT_NAME
FROM employees as e,
	(SELECT de.emp_no,de.dept_no, d.dept_name
	FROM dept_emp AS de
	JOIN departments AS d
	ON (d.dept_no = de.dept_no)
	)sql1
WHERE e.emp_no = sql1.emp_no
ORDER BY SURNAME
; 

--05_List all employees whose first name is "Hercules" and last names begin with "B."

SELECT 	e.emp_no AS EMPLOYEE_NUMBER, 
		e.last_name AS SURNAME, 
		e.first_name AS NAME
FROM employees AS e
WHERE 
	e.first_name = 'Hercules'  
OR 
	e.last_name LIKE 'B%'
;

--06 List all employees in the Sales department, including their employee number, last name, first name, and department name.

CREATE VIEW SalesDepartment AS
SELECT 	e.emp_no AS EMPLOYEE_NUMBER, 
		e.last_name AS SURNAME, 
		e.first_name AS NAME,
		sql1.dept_name AS DEPARTMENT_NAME
FROM employees as e,
	(SELECT de.emp_no,de.dept_no, d.dept_name
	FROM dept_emp AS de
	JOIN departments AS d
	ON (d.dept_no = de.dept_no)
	)sql1
WHERE 
	e.emp_no = sql1.emp_no
AND
	sql1.dept_name = 'Sales'
ORDER BY SURNAME
; 


--07 List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW Sales_and_Development_Department AS
SELECT 	e.emp_no AS EMPLOYEE_NUMBER, 
		e.last_name AS SURNAME, 
		e.first_name AS NAME,
		sql1.dept_name AS DEPARTMENT_NAME
FROM employees as e,
	(SELECT de.emp_no,de.dept_no, d.dept_name
	FROM dept_emp AS de
	JOIN departments AS d
	ON (d.dept_no = de.dept_no)
	)sql1
WHERE 
	e.emp_no = sql1.emp_no
AND
	(
	sql1.dept_name = 'Sales'
	OR
	sql1.dept_name = 'Development'
	)
ORDER BY SURNAME


---In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE VIEW Last_Name_Frequency AS
SELECT 	employees.last_name AS LAST_NAME,
		COUNT (employees.last_name) AS FREQUENCY
FROM 
		employees
GROUP BY
		last_name 
ORDER BY FREQUENCY DESC
;