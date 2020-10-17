-------------------------------------------------------------------------
--1. Prepare DB for queries 
--   A- Create  "VIEW"
--   B- Joining Tables
---------------------------------------------------------------------------
DROP VIEW company;
CREATE VIEW company AS
SELECT  e.emp_no, e.last_name, e.first_name, i.title, 
d.dept_name, e.hire_date, s.salary,  e.sex, e.birth_date, d.dept_no
FROM department d
LEFT JOIN dept_emp dp
ON d.dept_no = dp.dept_no
JOIN employee e
ON e.emp_no = dp.emp_no
JOIN salaries s
ON s.emp_no = e.emp_no
JOIN titles i
ON i.title_id = e.emp_title_id;

SELECT * 
FROM company
ORDER BY emp_no;

---------------------------------------------------------------------------

-- Data Analysis:
---------------------------------------------------------------------------


-----------------------------------------------------------------

-- 1. List the following details of each employee: employee number, 
--    last name, first name, sex, and salary.
-----------------------------------------------------------------

SELECT c.emp_no, c.last_name, c.first_name, c.sex, c.salary
FROM company c ;
ALTER company 
ADD COLUMN 

-----------------------------------------------------------------
-- 2. List first name, last name, and hire date for employees 
--    who were hired in 1986.
-----------------------------------------------------------------

SELECT  c.first_name, c.last_name, c.hire_date
FROM company c 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

-----------------------------------------------------------------
-- 3.List the manager of each department with the following 
--   information: department number, department name, 
--   the manager's employee number, last name, first name
-----------------------------------------------------------------
SELECT c.title, c.dept_no, c.dept_name, 
c.emp_no, c.last_name, c.first_name
FROM company c
WHERE title='Manager';

---------------------------------------------------------------------
-- 4.List the department of each employee with the following 
--   information: employee number, last name, first name, 
--   and department name 
--------------------------------------------------------------------------

SELECT c.dept_name, c.emp_no, c.last_name, c.first_name
FROM company c
ORDER BY emp_no;

--------------------------------------------------------------
-- 5. List first name, last name, and sex for employees whose 
--    first name is "Hercules" and last names begin with "B."
---------------------------------------------------------------

SELECT c.first_name, c.last_name, c.sex
FROM company c
WHERE first_name='Hercules' AND last_name LIKE 'B%';

----------------------------------------------------------
-- 6.List all employees in the Sales department, 
--   including their employee number, last name, first name 
--   and department name.
-----------------------------------------------------------

SELECT c.emp_no, c.last_name, c.first_name, c.dept_name
FROM company c
WHERE dept_name = 'Sales';

----------------------------------------------------------
-- 7.List all employees in the Sales and Development
--   departments,including their employee number, last name,  
--   first name, and department name.
------------------------------------------------------------

SELECT c.emp_no, c.last_name, c.first_name, c.dept_name
FROM company c
WHERE dept_name='Sales' OR dept_name='Development';

-----------------------------------------------------------------
-- 8.In descending order, list the frequency count of employee
--   last names,i.e., how many employees share each last name.
-----------------------------------------------------------------

SELECT last_name, COUNT(*) AS "Last_Name Frequency"
FROM company 
GROUP BY last_name
ORDER BY 2 DESC;

