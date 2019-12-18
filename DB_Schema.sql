-- DROP TABLE IF EXISTS departments, dept_emp, dept_manager, employees, salaries, titles;
--"dept_no","dept_name"
CREATE TABLE departments (
dept_no VARCHAR (10) NOT NULL,
dept_name VARCHAR (30) NOT NULL	
);

--"emp_no","dept_no","from_date","to_date"
CREATE TABLE dept_emp(
    emp_no VARCHAR (10),
    dept_no VARCHAR (10),
    from_date DATE,
    to_date DATE
);

--"dept_no","emp_no","from_date","to_date"
CREATE TABLE dept_manager (
    dept_no VARCHAR (10),
    emp_no VARCHAR (10),
    from_date DATE,
    to_date DATE
);
--"emp_no","birth_date","first_name","last_name","gender","hire_date"
CREATE TABLE employees (
    emp_no VARCHAR (10),
    birth_date DATE,
    first_name VARCHAR (20),
    last_name VARCHAR (20),
    gender CHAR (1),
    hire_date DATE
);
--emp_no,salary,from_date,to_date
CREATE TABLE salaries (
    emp_no VARCHAR (10),
    salary NUMERIC,
    from_date DATE,
    to_date DATE
);
--"emp_no","title","from_date","to_date"
CREATE TABLE titles (
    emp_no VARCHAR (10),
    title VARCHAR (30),
    from_date DATE,
    to_date DATE
);
