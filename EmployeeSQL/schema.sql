-- Drop statements if running code multiple times. --

DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

-- Creating tables for each CSV file: starting with departments, titles, and employees. --

CREATE TABLE departments(
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name TEXT NOT NULL
);

CREATE TABLE titles(
    title_id VARCHAR(5) PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE employees(
    emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
    birth_date VARCHAR NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date VARCHAR NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- For easier data manipulation, I decided to alter the employees table columns --
-- with dates into a DATE type. This allows me to search for date years easier. --

ALTER TABLE employees
ALTER COLUMN birth_date TYPE DATE using to_date(birth_date , 'MM/DD/YYYY');

ALTER TABLE employees
ALTER COLUMN hire_date TYPE DATE using to_date(hire_date , 'MM/DD/YYYY');


-- The below three tables need to be created after the above three to prevent import errors, --
-- as the keys and references rely on the above tables. --

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
); 

CREATE TABLE salaries(
	emp_no INT NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);