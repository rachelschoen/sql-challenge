-- The following are the Data Analysis queries required for the assignment. 
-- 1. Employee Number, Last Name, First Name, Sex & Salary
SELECT employees.emp_no
    , employees.last_name
    , employees.first_name
    , employees.sex
    , salaries.salary
FROM employees
INNER JOIN salaries ON
    employees.emp_no = salaries.emp_no;
    -- I returned 300,024 results.

-- 2. Employee's First Name, Last Name, & Hire Date for those hired in 1986
SELECT first_name
    , last_name
    , hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986;
    -- I returned 36,150 results.


-- 3. The Manager of each department with: their Department Number,
--  Employee Number, Last Name, & First Name
SELECT dept_manager.dept_no
    , departments.dept_name
    , dept_manager.emp_no
    , employees.last_name
    , employees.first_name
FROM dept_manager
INNER JOIN departments ON
    dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
    dept_manager.emp_no = employees.emp_no;
    -- I returned 24 results.

-- 4. The Department Number for each employee, with their Employee Number,
-- Last Name, First Name, & Department Name.
SELECT dept_emp.dept_no
    , dept_emp.emp_no
    , employees.last_name
    , employees.first_name
    , departments.dept_name
FROM dept_emp
INNER JOIN employees ON
    dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
    dept_emp.dept_no = departments.dept_no;
    -- I returned 331,603 results.

-- 5. The First Name, Last Name, & Sex for each employee where
-- the first name is Hercules & the last name starts with 'B'
SELECT first_name
    , last_name
    , sex
FROM employees
WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';
    -- I returned 20 results.

-- 6. All Employees in 'Sales', with their Employee Number, Last Name, & First Name.
SELECT employees.emp_no
    , employees.last_name
    , employees.first_name
FROM employees
INNER JOIN dept_emp ON
    employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
    departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';
    -- I returned 52,245 results.

-- 7. All Employees in 'Sales' and 'Development', with their Employee Number,
-- Last Name, First Name, & their Department Name.
SELECT employees.emp_no
    , employees.last_name
    , employees.first_name
    , departments.dept_name
FROM employees
INNER JOIN dept_emp ON
    employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
    departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');
    -- I returned 137,952 results.

-- 8. The frequency counts in descending order of all employee last names.
SELECT last_name
    , count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;
    -- I returned 1,638 different last names.
