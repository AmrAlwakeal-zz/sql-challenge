-- Tables Schema ;
-- # Create tables
-- 1. Create a  department table
CREATE TABLE department (
    dept_no CHAR(5) NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (dept_no)
);
-- 2. Create a titles table 
CREATE TABLE titles (
    title_id CHAR(5) NOT NULL,
    title VARCHAR(30) NOT NULL,
    PRIMARY KEY (title_id)
);

-- 3. Create a employee table 
CREATE TABLE employee (
    emp_no INT NOT NULL,
    emp_title_id CHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
-- 4. Create a dept.emp table 
CREATE TABLE dept_emp (
    emp_no INT  NOT NULL,
    dept_no CHAR(30) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
    FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);
-- 5. Create a salaries table 
CREATE TABLE salaries (
    emp_no INT  NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);
-- 6. Create a manager table 
CREATE TABLE manager (
    dept_no CHAR(5) NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);


