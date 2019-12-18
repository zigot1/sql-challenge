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