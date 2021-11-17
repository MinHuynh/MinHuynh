-- Explore employees database through MySQL Workbench, started this as a complete beginner. Totally raw original codes with personal notes and multiple fail attempts. 
-- Try-Fail-Success :)
-- Use advanced MySQL toward the end including joins, unions, stored procedure, user-defined functions, variables, triggers
-- Data Visualize using Tableau toward the super end 


SELECT * FROM employees.employees
WHERE first_name LIKE ("Mark%");

SELECT * FROM employees.employees
WHERE hire_date LIKE ("2000%");

SELECT * FROM employees.employees
WHERE emp_no LIKE ("1000_");

SELECT * FROM employees.employees
WHERE first_name LIKE ("%Jack%");

SELECT * FROM employees.employees
WHERE first_name NOT IN ("%Jack%");

SELECT * FROM employees.salaries
WHERE salary BETWEEN '66000' AND '70000';

SELECT * FROM employees.employees
WHERE emp_no NOT BETWEEN '10004' AND '10012';

SELECT * FROM employees.departments
WHERE dept_no BETWEEN 'd003' AND 'd006';

SELECT * FROM employees.departments
WHERE dept_no IS NULL;

SELECT * FROM employees.employees
WHERE gender = 'F' AND hire_date >= "2000-00-00";

SELECT * FROM employees.salaries
WHERE salary > 150000;

SELECT DISTINCT hire_date 
FROM employees.employees;

SELECT * FROM employees.salaries;

SELECT COUNT(salary>= 100000) /* this is wrong because you dont put condition in the parenthesis after COUNT. Only the column_name*/
FROM employees.salaries;

SELECT * FROM employees.salaries
WHERE salary >= 100000;

SELECT * FROM employees.salaries
WHERE salary IS NOT NULL;

SELECT * FROM employees.dept_manager;

SELECT COUNT(emp_no) FROM employees.dept_manager;

SELECT COUNT(*) FROM employees.dept_manager;

SELECT COUNT(salary) FROM employees.salaries
WHERE salary >= 100000;

SELECT COUNT(*) FROM employees.salaries
WHERE salary >= 100000;


SELECT COUNT(*) 
FROM employees.salaries
WHERE salary>= 100000;

SELECT COUNT(emp_no) FROM  employees;

SELECT COUNT(*) FROM dept_manager;

SELECT * FROM  employees.employees
ORDER BY emp_no DESC;

SELECT first_name FROM employees.employees;

SELECT first_name, COUNT(first_name) FROM employees.employees
GROUP BY first_name;

SELECT DISTINCT first_name FROM employees.employees;

SELECT salary, COUNT(emp_no) AS emps_with_same_salary
FROM employees.salaries
WHERE salary >= 80000
GROUP BY salary
ORDER BY salary;

SELECT salary, COUNT(emp_no) AS emps_with_same_salary
FROM employees.salaries
GROUP BY salary
HAVING COUNT(emp_no) >= 10
ORDER BY salary;

SELECT AVG(salary) AS avg_salary, emp_no
FROM employees.salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY AVG(salary);

SELECT *, AVG(salary)
FROM employees.salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY AVG(salary);

SELECT *, AVG(salary) 
FROM employees.salaries
WHERE salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

SELECT *, first_name, COUNT(first_name) AS names_count
FROM employees.employees
WHERE hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name, hire_date;

SELECT first_name, COUNT(first_name)
FROM employees.employees
GROUP BY first_name
ORDER BY COUNT(first_name) DESC;


/*SELECT *, COUNT(dept_no)
FROM employees.dept_emp
GROUP BY dept_no
HAVING COUNT(dept_no) > 1;

SELECT *, COUNT(dept_no) AS contracts_count, COUNT(emp_no) AS emps_count
FROM employees.dept_emp
WHERE from_date > "2000'01-01"
GROUP BY dept_no, emp_no
HAVING COUNT(dept_no) > 1
ORDER BY from_date;*/

SELECT * FROM dept_emp;

SELECT emp_no
FROM employees.dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(DISTINCT dept_no) >1	
ORDER BY emp_no;

SELECT *
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) >1
ORDER BY emp_no; #the solution in the presentation$

SELECT *, COUNT(emp_no) AS emps_count 
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) >1; #this is my own code, not sure if it's right, might be wrong#

#TIM SO LAN EMP_NO DUOC LAP LAI:
SELECT *, COUNT(emp_no)
FROM employees.dept_emp
GROUP BY emp_no, dept_no;

# THIS IS THE RIGHT CODE, AND IT WAS MY OWN
SELECT *
FROM employees.dept_emp
WHERE from_date > "2000-01-01"
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY emp_no;

SELECT * 
FROM employees.dept_emp
LIMIT 100;

SELECT * FROM employees.titles
LIMIT 10;

INSERT INTO employees.employees
VALUES
(
	999903,
    "2001-07-20",
    "Minh",
    "Huynh",
    "F",
    "2021-08-23"
);

SELECT * FROM employees.employees
ORDER BY emp_no DESC;

INSERT INTO employees.titles
VALUES
(
	999903,
    "Senior Engineer",
    "2021-08-23",
    "9999-01-00"
);

SELECT * FROM TITLES
ORDER BY emp_no DESC;

SELECT * FROM dept_emp;

INSERT INTO dept_emp
VALUES
(	
	999903,
    "d005",
    "2021-08-23",
    "9999-01-01"
);

SELECT * FROM dept_emp
ORDER BY emp_no DESC
LIMIT 10;


SELECT * FROM employees.business_analysis;

DROP TABLE business_analysis;

SELECT * FROM employees.departments;

INSERT INTO departments 
VALUES ("d010", "Business Analysis");


CREATE TABLE departments_dup
(	
	dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

INSERT INTO departments_dup
SELECT * FROM employees.departments
ORDER BY dept_no;

SELECT * FROM departments_dup;
DROP TABLE departments_dup;

COMMIT;

SELECT * FROM departments;
UPDATE departments
SET dept_name = "Data Analysis"
WHERE dept_no = "d010";

ROLLBACK;
COMMIT;
DELETE FROM departments
WHERE dept_no = "d010";

SELECT * FROM departments
WHERE dept_no = "d010";

SELECT COUNT(DISTINCT dept_no)
FROM employees.dept_emp;

SELECT SUM(salary) AS total_salary 
FROM employees.salaries
WHERE
from_date > "1997-01-01";
	
SELECT * FROM employees.employees;

SELECT DISTINCT substring(first_name, 1, 3) FROM employees.employees
ORDER BY first_name;

SELECT MIN(emp_no) FROM employees.employees;

SELECT ROUND(AVG(salary),2) FROM employees.salaries
WHERE from_date > "1997-01-01";

SELECT SUM(salary) AS total_salary
FROM employees.salaries
WHERE
from_date > "1997-01-01";

SELECT * from employees.salaries;

SELECT ROUND(AVG(salary),2)
FROM employees.salaries
WHERE from_date > "1997-01-01";

USE employees;
DROP TABLE departments_dup;
CREATE TABLE departments_dup
(	
	dept_no CHAR(4) NULL,
    dept_name VARCHAR(40)  
);
DROP TABLE departments_dup;
SELECT * FROM departments_dup;

INSERT INTO departments_dup
SELECT * FROM employees.departments
ORDER BY dept_no;

INSERT INTO departments_dup(dept_no, dept_name)
VALUES ("d011", NULL ),
("d012", "ChauMinh"),
(NULL, "NghiaNguyen");

SELECT dept_no , IFNULL(dept_name, "Department name not registered") AS registered_name
FROM departments_dup
ORDER BY dept_no DESC;

SELECT dept_no, COALESCE( dept_name, "N/A")
FROM departments_dup;

ALTER TABLE departments_dup
ADD COLUMN dept_manager VARCHAR(40) AFTER dept_name;
SELECT * FROM departments_dup;

# to substitute value in one column by another when the first one is NULL.

SELECT dept_no, coalesce(dept_manager, dept_no, "N/A")
FROM departments_dup;

SELECT dept_no,  dept_name, coalesce(dept_manager, dept_name, "N/A") AS dept_registered
FROM departments_dup;

SELECT * FROM departments_dup;

SELECT *, COALESCE(dept_manager, dept_name, dept_no, "N/A")
FROM departments_dup;
# all this above to practice COALESCE

SELECT *, COALESCE("Coalesce 1 argument example") #this is for when you need like a hypothetical result column
FROM departments_dup;

#Ex1: Select the department number and name from the ‘departments_dup’ table and add a third column where you name the department number (‘dept_no’) as ‘dept_info’. 
#If ‘dept_no’ does not have a value, use ‘dept_name’.

SELECT dept_no, dept_name, COALESCE(dept_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dept_no ASC;

#Ex2:Modify the code obtained from the previous exercise in the following way. 
#Apply the IFNULL() function to the values from the first and second column, 
#so that ‘N/A’ is displayed whenever a department number has no value, and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.

SELECT IFNULL(dept_no, "N/A") AS dept_no, IFNULL(dept_name, "Department name not provided") AS dept_name,
COALESCE(dept_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dept_no ASC;

ALTER TABLE departments_dup
ADD COLUMN dept_manager VARCHAR(40) AFTER dept_name;
SELECT * FROM departments_dup; 

SELECT * FROM employees.departments_dup
ORDER BY dept_no DESC;
USE employees;
COMMIT; 
ALTER TABLE departments_dup
DROP COLUMN dept_manager;
ROLLBACK;

UPDATE departments_dup
SET dept_no = ""
WHERE dept_no IS NULL;

ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NOT NULL;

COMMIT;
DROP TABLE departments_dup;
ROLLBACK;
USE employees;
CREATE TABLE depart_dup
(
	dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

INSERT INTO depart_dup 
SELECT * FROM employees.departments;

SELECT * FROM employees.departments_dup;

RENAME TABLE depart_dup TO departments_dup;

ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

INSERT INTO departments_dup(dept_name)
VALUES ('Public Relations');

DELETE FROM departments_dup
WHERE dept_no = 'd002';

INSERT INTO departments_dup(dept_no)
VALUES ('d010'), ('d011');

DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup
(
	emp_no INT NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);
INSERT INTO dept_manager_dup
SELECT * FROM dept_manager;
SELECT * FROM dept_manager_dup;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES      
(999904, '2017-01-01'),
(999905, '2017-01-01'),
(9906, '2017-01-01'),
(999907, '2017-01-01');

UPDATE dept_manager_dup
SET 
emp_no = "999906"
WHERE emp_no = "9906";
COMMIT;
DELETE FROM dept_manager_dup
WHERE dept_no = "d001";
ROLLBACK;

SELECT * FROM departments_dup;
SELECT * FROM dept_manager;
SELECT * FROM dept_manager_dup;
SELECT * FROM departments_dup;
SELECT * FROM employees;
SELECT * FROM dept_manager;
COMMIT;

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, dm.dept_no
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no;

SELECT * FROM dept_manager_dup dm 
INNER JOIN departments_dup dd ON dm.dept_no = dd.dept_no
ORDER BY dm.dept_no; /*dm.dept_no or dd.dept_no or just dept_no*/ 
ROLLBACK;

USE employees;
SELECT * FROM dept_manager_dup
ORDER BY emp_no;

SELECT * FROM departments_dup;

INSERT INTO dept_manager_dup
VALUES ("110228", "d003", "1992-03-21" , "9999-01-01");

INSERT INTO departments_dup
VALUES ( "d009", "Customer Service");

SELECT  * FROM departments_dup
ORDER BY dept_no DESC;


SELECT * FROM dept_manager_dup
WHERE emp_no = "110228";

SELECT *, COUNT(*) FROM dept_manager_dup 
GROUP BY emp_no
HAVING COUNT(*) >1;

SELECT d.dept_no, d.dept_name, dm.emp_no
FROM departments_dup d
INNER JOIN dept_manager_dup dm ON d.dept_no = dm.dept_no
ORDER BY emp_no;

SELECT d.dept_no, d.dept_name, dm.emp_no
FROM departments_dup d
INNER JOIN dept_manager_dup dm ON d.dept_no = dm.dept_no
GROUP BY dm.emp_no # this group by is to DELETE DUPLICATES ROWS/VALUES 
# because GROUP BY clause summarizes
ORDER BY emp_no;

SELECT * FROM departments_dup
ORDER BY dept_no DESC;

# Testing Subqueries
SELECT * FROM salaries;
SELECT *, AVG(salary) FROM salaries GROUP BY emp_no;
SELECT emp_no, salary FROM ( SELECT AVG(salary) FROM salaries GROUP BY emp_no); # code:1248 #every derived table must have its own alias

-- Subqueries through SELECT 
SELECT emp_no, salary, (SELECT(AVG(salary)) FROM salaries)
FROM salaries
GROUP BY emp_no;

-- Subqueries through FROM	
SELECT * FROM titles;
SELECT emp_no, title, AVG(jobs_title) FROM
	(SELECT DISTINCT emp_no, title, COUNT(title) AS jobs_title
	FROM titles
	GROUP BY title) jobs_title_count
GROUP BY emp_no, title;

SELECT *, COUNT(title) AS jobs_title
FROM titles
GROUP BY title;

-- Subqueries through WHERE
SELECT * FROM dept_emp;
SELECT * FROM dept_emp
WHERE emp_no IN (SELECT * FROM employees WHERE from_date >= "1980-01-01");

# This code below is to delete duplicate d009 rows
COMMIT;
-- THE GOAL IS TO DELETE DUPLICATES ROWS 
SELECT * FROM departments_dup ORDER BY dept_no DESC;
SELECT * FROM dept_manager_dup ORDER BY emp_no;

CREATE VIEW drop_dup AS # this shows a code 1060: duplicate column name 'dept_no'
# which means VIEW cannot be created when there's duplicate values
SELECT departments_dup.dept_no, departments_dup.dept_name, 
dept_manager_dup.emp_no, dept_manager_dup.dept_no
	FROM departments_dup  INNER JOIN dept_manager_dup 
	WHERE departments_dup.dept_no = dept_manager_dup.dept_no;

# SUCCESSFUL
CREATE VIEW drop_dup AS
SELECT d.dept_no AS name1, d.dept_name, dm.emp_no, dm.dept_no AS name2
FROM departments_dup AS d
INNER JOIN dept_manager_dup AS dm
WHERE d.dept_no = dm.dept_no;
# SUCCESSFUL

SELECT * FROM drop_dup;

WITH drop_CTE AS 
(SELECT name1, dept_name,
ROW_NUMBER() OVER (PARTITION BY name1) AS row_no
FROM drop_dup) 
DELETE FROM departments_dup 
USING department_dups d JOIN departments_dup_CTE dcte ON d.dept_no = dcte.dept_no
WHERE dcte.row_no > 1 ;

SELECT *, ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY name1 DESC) AS rowno FROM drop_dup;
ALTER TABLE drop_dup;


DELETE drop_dup FROM (
	SELECT *, ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY name1 DESC) AS rowno 
    FROM drop_dup) drop_dup
WHERE rownon > 1;

DROP VIEW drop_dup;
    
SELECT departments_dup.dept_no, departments_dup.dept_name, 
dept_manager_dup.emp_no, dept_manager_dup.dept_no
	FROM departments_dup  INNER JOIN dept_manager_dup 
	WHERE departments_dup.dept_no = dept_manager_dup.dept_no;

DELETE FROM
(	SELECT * , ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY dept_no DESC))
    FROM delete_dup;
    
SELECT d.dept_no, d.dept_name, dm.emp_no
FROM departments_dup d
INNER JOIN dept_manager_dup dm ON d.dept_no = dm.dept_no
GROUP BY dm.emp_no # this group by is to DELETE DUPLICATES ROWS/VALUES 
# because GROUP BY clause summarizes
ORDER BY emp_no;

SELECT dept_emp.employees;

USE employees;
SELECT * FROM employees;

SELECT employees.departments_dup;
SELECT * FROM employees.departments;

SELECT * FROM employees.salaries;

SELECT * FROM employees.departments_dup;
COMMIT;

SELECT *, IFNULL(dept_name, "Department name not provided") AS null_dept
FROM employees.departments_dup;

SELECT *, coalesce(dept_no, dept_name, "N/A") AS dept_manager
FROM employees.departments_dup;

INSERT INTO employees.departments_dup(dept_no, dept_name)
VALUES (NULL, NULL);

DELETE FROM employees.departments_dup
WHERE dept_no = "" AND dept_name = "";

SELECT * FROM employees.departments_dup;

SELECT *, IFNULL(dept_no, "N/A"), IFNULL(dept_name, "Department name not provided"), 
COALESCE(dept_no, dept_name, "None")
FROM employees.departments_dup;

ROLLBACK;
SELECT * FROM employees.departments_dup;

SELECT * FROM employees.departments;
DROP TABLE employees.departments_dup;

USE employees;
CREATE TABLE departments_dup 
(
	dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

INSERT INTO employees.departments_dup(dept_no, dept_name)
SELECT * FROM employees.departments;

SELECT * FROM departments_dup;
SELECT * FROM dept_manager_dup;

INSERT INTO employees.departments_dup(dept_name)
VALUE ("Public Relations");

DELETE FROM departments_dup
WHERE dept_no = "d002";

INSERT INTO departments_dup(dept_no)
VALUES("d010"), ("d011");

DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup 
(
	emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

INSERT INTO dept_manager_dup
SELECT * FROM dept_manager;

INSERT INTO dept_manager_dup(emp_no, from_date)
VALUES (999904, "2017-01-01"), (999905, "2017-01-01"),
(999906, "2017-01-01"), (999907, "2017-01-01");

DELETE FROM dept_manager_dup
WHERE dept_no = "d001";

# Now let's join the dept_manager_dup and the departments_dup TABLES
#INNERJOIN, = JOIN, joins matching records, the non-matching values/records will not appear

SELECT * FROM dept_manager_dup
ORDER BY dept_no;
    
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
JOIN departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no; # Null values in either of tables are not displayed.

#LEFTJOIN = LEFT OUTER JOIN
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
LEFT JOIN departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

SELECT * FROM employees.employees;
SELECT * FROM employees.dept_manager;

SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
FROM employees e
LEFT JOIN dept_manager dm ON e.emp_no = dm.emp_no
WHERE e.last_name = "Markovitch"
ORDER BY dm.dept_no DESC, e.emp_no;

#WHERE Clause for joining

#manager's emp_no, first, last, dept_no, hire_date

SELECT * FROM employees.dept_manager_dup;
SELECT * FROM employees.employees;

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, m.emp_no, m.dept_no
FROM dept_manager_dup m, employees e
WHERE e.emp_no = m.emp_no;

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, m.emp_no, m.dept_no
FROM dept_manager_dup m
JOIN employees e ON e.emp_no = m.emp_no
GROUP BY e.emp_no, m.emp_no; # this GROUP BY is unneccsary

#PREVENT ERROR CODE:1055
SELECT @@global.sql_mode;

SET @@global.sql_mode := REPLACE(@@global.sql_mode, "ONLY_FULL_GROUP_BY", "");
# This is to prevent Error code:1055. The latter signifies the problem of listing fields in the SELECT statement that are not included in the GROUP BY clause
# This is to prevent that, REPLACE() will remove
# In case to disallow this: execute: set @@global.sql_mode := concat("only_full_group_by,", @@global.sql_mode)

# JOIN & WHERE at the same time, where acts as a condition

SELECT * FROM employees.titles;
SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM employees e 
JOIN titles t ON e.emp_no = t.emp_no
WHERE e.first_name = "Margareta" AND e.last_name = "Markovitch"
ORDER BY e.emp_no;

#CROSSJOIN
SELECT * FROM employees.dept_manager;
SELECT * FROM employees.departments;

SELECT dm.*, d.*
FROM departments d CROSS JOIN dept_manager dm
WHERE d.dept_no = "d009"
ORDER BY d.dept_no;

SELECT * FROM employees.employees;
# Find the first 10 employees that are part of different departments

SELECT e.*, d.*
FROM employees e CROSS JOIN  departments d
WHERE e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;

SELECT de.*, d.*
FROM departments d
CROSS JOIN dept_emp de
WHERE d.dept_no != de.dept_no
ORDER BY de.emp_no, d.dept_no;

#Find the average salary for male and female
SELECT * FROM employees.employees;
SELECT * FROM employees.salaries;

SELECT e.gender, AVG(salary) AS avg_salary 
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender;

## JOIN MORE THAN 2 TABLES
# Wants to know 1 (first_name, last_name, hire_date) = employees table
# from_date = dept_manager table, dept_name = departments table
# table employees links with dept_manager through emp_no
# table dept_manager links with departments table through dept_no

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    dm.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    departments d ON dm.dept_no = d.dept_no;
 # the orders does not matter on each join
 
 # Select all manager's first and last name, hire, job title, start, dept_name
 
 # How many male and female managers do w have in the "employees" database
SELECT * FROM employees.dept_manager;
SELECT * FROM employees.employees;
# link by emp_no
SELECT COUNT(title), title
FROM employees.titles
WHERE title = "Manager"; #Output is 24 count

SELECT COUNT(e.gender) AS gender_count, e.gender
FROM employees e 
JOIN dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY e.gender;

#UNION vs UNION ALL

SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' 	UNION SELECT 
		NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY -a.emp_no DESC;

#Subqueries: IN
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01'
                AND '1995-01-01');
                
SELECT e.first_name, e.last_name
FROM employees e
WHERE EXISTS ( SELECT *
FROM dept_manager dm
WHERE dm.emp_no = e.emp_no); 

SELECT *
FROM dept_manager;
#Subqueries: EXISTS
#Select the entire information for all employees whose job title is “Assistant Engineer”. Use the employees table

SELECT * FROM employees;
SELECT * FROM titles WHERE title = "Assistant Engineer"; #15128


SELECT * FROM employees e
WHERE EXISTS (
SELECT title FROM titles t
WHERE t.emp_no = e.emp_no
AND title = "Assistant Engineer" );

SELECT * FROM employees;
SELECT * FROM titles;
#NULL AS birth_date, NULL AS first_name, NULL AS last_name,NULL AS gender, NULL AS hire_date
#NULL AS title, NULL AS from_date, NULL AS to_date

SELECT * FROM(
SELECT e.emp_no, NULL AS title, NULL AS from_date, NULL AS to_date
FROM employees e
UNION SELECT t.emp_no, t.title, NULL AS first_name, NULL AS last_name
FROM titles t WHERE title = "Assistant Engineer") AS a
ORDER BY a.emp_no;

# Assign emp num 110022 as a manager to all emp from 10001 to 10020,
# and emp number 110039 as a manager to all emp from 10021 to 10040.
# => emp from 1-20 will be assigned under the manager of 110022
# => emp from 21-40 will be assigned under the manager of 110039
# tables: employees and dept_manager. Link between through emp_no
# outcome to have : emp_ID, dept_code, manager_ID

SELECT * FROM employees;
SELECT * FROM dept_manager;

SELECT A.* FROM(
SELECT e.emp_no AS employee_ID,
MIN(de.dept_no) AS dept_code, # to use only 1 value of the emp's dept_no
( SELECT emp_no FROM dept_manager de
WHERE emp_no = " 110022 " ) AS manager_ID 
FROM employees e
JOIN 
WHERE emp_no BETWEEN "10001" AND "10020") AS A
GROUP BY A.emp_no
ORDER BY A.emp_no;

SELECT A.* FROM
(SELECT e.emp_no AS emp_ID,
( SELECT emp_no FROM dept_manager dm
WHERE emp_no = "110022") AS manager_ID
FROM employees e 
WHERE e.emp_no <= "10020") AS A;
 # This is correct but it doesn't yet show the dept_no of the emp
 
 
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS emp_ID,
            MIN(de.dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager dm
                WHERE
                    emp_no = '110022') AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= '10020'
        GROUP BY e.emp_no
        ORDER BY e.emp_no) AS A
 UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS emp_ID,
            MIN(de.dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager dm
                WHERE
                    emp_no = '110039') AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no >= '10021'
        GROUP BY e.emp_no
        ORDER BY e.emp_no
        LIMIT 20) AS B;
	
    # Subqueries exercise
    #Starting your code with “DROP TABLE”, 
    #create a table called “emp_manager” (emp_no – integer of 11, not null; dept_no – CHAR of 4, null; manager_no – integer of 11, not null). 
    
    DROP TABLE IF EXISTS emp_manager;
    CREATE TABLE emp_manager 
    (
		emp_no INT(11) NOT NULL,
        dept_no CHAR(4) NULL,
        manager_no INT(11) NOT NULL
	);
    
    #assign employee number 110039 as a manager to employee 110022. Subset B will be manager to Subset A. This will be in the subset C
    SELECT * FROM employees.dept_emp;
    SELECT * FROM employees.dept_manager; # union dept manager vs dept manager 

INSERT INTO employees.emp_manager
SELECT 
    U.*
FROM
    (SELECT 
        A.*
    FROM
        (SELECT 
        e.emp_no AS emp_ID,
            MIN(de.dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager dm
                WHERE
                    emp_no = '110022') AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= '10020'
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A UNION SELECT 
        B.*
    FROM
        (SELECT 
        e.emp_no AS emp_ID,
            MIN(de.dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager dm
                WHERE
                    emp_no = '110039') AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no >= '10021'
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B UNION SELECT 
        C.*
    FROM
        (SELECT 
        e.emp_no AS emp_ID,
            MIN(dm.dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager dm
                WHERE
                    emp_no = '110039') AS manager_ID
    FROM
        employees e
    JOIN dept_manager dm ON dm.emp_no = e.emp_no
    WHERE
        e.emp_no = '110022'
    GROUP BY e.emp_no) AS C) AS U; # This is my solution, it is correct
    
   INSERT INTO employees.emp_manager
   SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u; #This is the provided solution
    
    SELECT * FROM emp_manager;
    DELETE FROM emp_manager;

#SELF JOIN
# From the emp_manager table, extract the record data only of those employees who are managers as well

SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager);

#Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.
SELECT * FROM salaries;
SELECT * FROM dept_manager;

CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT 
        ROUND(AVG(s.salary), 2) AS avg_salary
    FROM
        salaries s
            JOIN
        dept_manager dm ON dm.emp_no = s.emp_no; 

#STORED PROCEDURES
# procedure that returns the first 1000 rows from the employees table

USE employees; # First indicate the database that will be used
DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
	SELECT * FROM employees
    LIMIT 1000;
END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
	SELECT AVG(salary) AS avg_salary 
    FROM employees.salaries;
END $$
DELIMITER ;

CALL avg_salary();
#Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.

SELECT * FROM employees;
USE employees;

DROP PROCEDURE IF EXISTS emp_info;
DELIMITER $$
CREATE PROCEDURE emp_info (IN p_first_name VARCHAR(255), IN p_last_name VARCHAR(255), OUT p_emp_no INT)
BEGIN
	SELECT e.emp_no
    INTO p_emp_no FROM employees e 
    WHERE e.first_name = p_first_name # input
    AND e.last_name = p_last_name; # input
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS emp_salary_info;
DELIMITER $$
CREATE PROCEDURE emp_salary_info (IN p_first_name VARCHAR(255), IN p_last_name VARCHAR(255))
BEGIN
	SELECT e.emp_no, e.first_name, e.last_name
    FROM employees e
    JOIN salaries s ON s.emp_no = e.emp_no
    WHERE e.first_name = p_first_name
    AND e.last_name = p_last_name;
END $$
DELIMITER ;

#VARIABLES
SET @v_emp_no = 0; #initialize so that at the beginning it has a value to start:0, then after calculation can be different
CALL emp_info ("Aruna", "Journel", @v_emp_no);
SELECT @v_emp_no;

#Create a FUNCTION called ‘emp_info’ that takes for parameters the first and last name of an employee, 
# and returns the salary from the newest contract of that employee.
#Hint: In the BEGIN-END block of this program
#you need to declare and use two variables – v_max_from_date that will be of the DATE type, and v_salary, that will be of the DECIMAL (10,2) type.

DELIMITER $$
CREATE FUNCTION emp_info (p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
DECLARE v_max_from_date DATE;
DECLARE v_salary DECIMAL(10,2);
	SELECT 
    MAX(from_date) INTO v_max_from_date FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.first_name = p_first_name AND
    e.last_name = p_last_name; 
    
    SELECT s.salary INTO v_salary FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
	WHERE e.first_name = p_first_name AND
    e.last_name = p_last_name AND
    s.from_date = v_max_from_date;
    
RETURN v_salary;
END $$
DELIMITER ;

SELECT emp_info("Aruna","Journel");

# TRIGGERS
# An emp has been promoted to a manager
# current highest salary should be increased by 20,000. 
# a new record in the dept_manager table
# the start data for that contract should be updated as well
USE employees;

DELIMITER $$
CREATE TRIGGER trig_ins_dept_mng
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
	DECLARE v_curr_salary INT;
    SELECT MAX(salary)
    INTO v_curr_salary 
    FROM salaries
	WHERE emp_no = NEW.emp_no;
    
    IF v_curr_salary IS NOT NULL THEN 
    UPDATE salaries
    SET 
		to_date = SYSDATE()
	WHERE emp_no = NEW.emp_no AND to_date = NEW.to_date;
    
    INSERT INTO salaries
    VALUES (NEW.emp_no, v_curr_salary + 20000, NEW.from_date, NEW.to_date);
	END IF;
END $$
DELIMITER ;

INSERT INTO dept_manager
VALUES ("111534", "d009", date_format(SYSDATE(), "%Y-%m-%d"), "9999-01-01");

SELECT * FROM dept_manager;

SELECT * FROM salaries
WHERE emp_no = "111534"
UNION SELECT  * FROM dept_manager
WHERE emp_no = "111534";

COMMIT;

#Create a trigger that checks 
#if the hire date of an employee is higher than the current date. 
# If true, set this date to be the current date. Format the output appropriately (YY-MM-DD).
SELECT * FROM employees;

DELIMITER $$
CREATE TRIGGER trig_hire_date
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN 
	IF NEW.hire_date > date_format(SYSDATE(), "YY-MM-DD")
    THEN SET NEW.hire_date = date_format(SYSDATE(), "YY-MM-DD");
	END IF;
END $$
DELIMITER ;
    
# DELIMITER $$
# CREATE PROCEDURE emp_info_1000()
# BEGIN
# 	SELECT * FROM employees
#     LIMIT 1000;
# END$$
# DELIMITER ; to comment a block of query, shortcu: Ctrl + /

# CALL employees.emp_info_1000();
# CALL emp_info_1000();
# Create a procedure that will provide the average salary of all employees.

DELIMITER $$
CREATE PROCEDURE avg_salary_prac()
BEGIN
	SELECT *, AVG(salary)
    OVER(PARTITION BY emp_no) AS avg_sala
    FROM salaries;
END $$ 
DELIMITER ;

CALL avg_salary_prac();

DROP PROCEDURE IF EXISTS avg_salary_prac; 

#Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.

DROP PROCEDURE IF EXISTS emp_info_prac;
# DELIMITER $$
# CREATE PROCEDURE emp_info_prac(in p_first_name VARCHAR(255), IN p_last_name VARCHAR(255), out p_emp_no INT)
# BEGIN
# 	SELECT e.emp_no INTO p_emp_no
#     FROM employees e
#     WHERE e.first_name = p_first_name
#     AND e.last_name = p_last_name
#     LIMIT 1;
# END $$
# DELIMITER ; 
    
SELECT * FROM employees;
DROP PROCEDURE IF EXISTS emp_info;

# Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.
DELIMITER $$
CREATE PROCEDURE emp_info (in p_first_name VARCHAR(255), in p_last_name VARCHAR(255), out p_emp_no INT)
BEGIN
	SELECT e.emp_no INTO p_emp_no
    FROM employees e
    WHERE e.first_name = p_first_name
    AND e.last_name = p_last_name
    LIMIT 1;
END $$
DELIMITER ;

# Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.
# Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.
# Finally, select the obtained output.
    
SET @v_emp_no = 0;
CALL employees.emp_info ("Aruna", "Journel", @v_emp_no);
SELECT @v_emp_no;

# Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, 
# and returns the salary from the newest contract of that employee.
# Hint: In the BEGIN-END block of this program, you need to declare and use two variables – v_max_from_date that will be of the DATE type, 
# and v_salary, that will be of the DECIMAL (10,2) type.
# Finally, select this function.


DROP FUNCTION IF EXISTS emp_info;
USE employees;
SELECT * FROM employees;

DELIMITER $$
CREATE FUNCTION emp_info (p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10,2)
DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE v_salary DECIMAL (10,2);
    DECLARE v_max_from_date DATE;
    
    SELECT MAX(from_date) INTO v_max_from_date 
    FROM employees e JOIN salaries s ON e.emp_no = s.emp_no 
	WHERE e.first_name = p_first_name
    AND e.last_name = p_last_name;
    
	SELECT s.salary INTO v_salary
    FROM salaries s JOIN employees e
    ON s.emp_no = e.emp_no
    WHERE e.first_name = p_first_name
    AND e.last_name = p_last_name
    AND s.from_date = v_max_from_date;
RETURN v_salary;
END $$
DELIMITER ; 
    
SELECT * FROM salaries 
WHERE first_name = "Georgi";
SELECT * FROM employees WHERE first_name = "Georgi" AND last_name = "Facello";

SELECT * FROM salaries
WHERE emp_no = "10001" OR emp_no = "55649"
ORDER BY salary DESC;

USE employees;
## TRIGGERS
# A new employee has been promoted to a manager
# annualy salary should automatically becomes 20,000 dollars more than the highest annual salary up till then
# a new record in the department manager
# update hire_date 
# modifications to salaries table


SELECT * FROM salaries;

SELECT * FROM dept_manager;
COMMIT;

# DROP TRIGGER IF EXISTS 
# DELIMITER $$
# CREATE TRIGGER mg_promotion
# BEFORE UPDATE ON 
# FOR EACH ROW
# BEGIN
# 	DECLARE v_curr_salary INT;
#     
# 	SELECT MAX(salary) INTO v_curr_salary
#     FROM salaries s
#     WHERE emp_no = NEW.emp_no; 
#     
#     IF v_curr_salary IS NOT NULL THEN
#     UPDATE salaries
#     SET to_date = SYSDATE()
#     
#     
#     (NEW.salaries = MAX(salary) + 20000) 
#     (NEW.hire_date = SYSDATE()) 

DROP TRIGGER IF EXISTS trig_hire_date;
# Create a trigger that checks if the hire date of an employee is higher than the current date. 
# If true, set this date to be the current date. Format the output appropriately (YY-MM-DD).

SELECT * FROM employees;
COMMIT;

DELIMITER $$
CREATE TRIGGER trig_hire_date
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	IF NEW.hire_date > date_format(SYSDATE(), "%Y-%M-%D")
    THEN SET 
    NEW.hire_date = date_format(SYSDATE(), "%Y-%M-%D");
    
END IF;
END $$
DELIMITER ;

INSERT INTO employees
VALUES( '999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01'); 

DELETE FROM employees
WHERE emp_no = "999904";

SELECT * FROM employees
ORDER BY emp_no DESC;

SELECT * FROM employees
ORDER BY emp_no DESC;
DROP TRIGGER IF EXISTS trig_hire_date;

DELIMITER $$
CREATE TRIGGER trig_hire_date
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	IF NEW.hire_date > date_format(SYSDATE(), "%Y-%m-%d")
    THEN SET 
    NEW.hire_date = date_format(SYSDATE(), "%Y-%m-%d");
    
	END IF;
END $$
DELIMITER ;

ALTER TABLE employees
DROP INDEX i_hire_date;

# Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.
# Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.

CREATE INDEX i_salary
ON salaries (salary);

SELECT
    *
FROM
    salaries
WHERE
    salary > 89000;
    
# CASE Statement

# obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990. 
# Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee. 

SELECT e.emp_no, e.first_name, e.last_name,
CASE 
	WHEN dm.emp_no IS NOT NULL THEN "Manager"
    ELSE "Employee"
    END AS position 
FROM employees e
LEFT JOIN dept_manager dm ON e.emp_no = dm.emp_no
WHERE e.emp_no > 109990;

# Extract a dataset containing the following information about the managers: employee number, first name, and last name. 
# Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, 
# and another one saying whether this salary raise was higher than $30,000 or NOT.
# If possible, provide more than one solution.

SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_manager;

SELECT * FROM dept_manager dm LEFT JOIN employees e ON dm.emp_no = e.emp_no;

SELECT dm.emp_no, e.first_name, e.last_name, MAX(s.salary) AS highest_salary, MIN(s.salary) AS lowest_salary, 
MAX(s.salary) - MIN(s.salary) AS salary_difference,
CASE 
	WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN "Salary was raised by more than $30000"
    ELSE "Salary was NOT raised by more than $30000"
	END AS salary_raise
FROM dept_manager dm LEFT JOIN employees e ON dm.emp_no = e.emp_no
JOIN salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;

# Extract the employee number, first name, and last name of the first 100 employees, 
# and add a fourth column, called “current_employee” saying “Is still employed” if the employee is still working in the company, 
# or “Not an employee anymore” if they aren’t.
# Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise.

SELECT * FROM dept_emp; # from_date, to_date, emp_no
SELECT * FROM employees LIMIT 10; #emp_no, first and last,hire_date?

SELECT e.emp_no, e.first_name, e.last_name, de.to_date, 
CASE 
	WHEN MAX(de.to_date) > SYSDATE() THEN "Is still Employed"
    ELSE "No longer Employed"
    END AS employee_status
FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no
GROUP BY de.emp_no
LIMIT 100;

# TABLEAU
# TASK 1
# Create a visualization that provides a breakdown between the male and female employees working in the company each year, starting from 1990. 

USE employees_mod;

SELECT * FROM employees_mod.t_employees LIMIT 10; # Gender, hire_date
SELECT * FROM employees_mod.t_dept_emp LIMIT 10;

SELECT te.gender, COUNT(te.emp_no) AS num_emp, tde.from_date, YEAR(tde.from_date) AS calendar_year

FROM t_employees te JOIN t_dept_emp tde ON tde.emp_no = te.emp_no
GROUP BY te.emp_no, calendar_year
HAVING calendar_year >= 1990;

# TASK 2
# Compare the number of male managers to the number of female managers from 
# different departments # for each year, 
# starting from 1990.

SELECT * FROM t_dept_manager LIMIT 100; #fromdate, dept_no, emp_no to left join 
SELECT * FROM t_employees LIMIT 100; #gender, emp_no
SELECT * FROM t_departments LIMIT 100;

# MY ANSWER
SELECT 
    dm.emp_no,
    d.dept_name,
    dm.from_date,
    dm.to_date,
    e.gender,
    COUNT(e.gender) AS gender_count,
    YEAR(dm.from_date) AS calendar_year
FROM
    t_dept_manager dm
		LEFT JOIN
    t_employees e ON dm.emp_no = e.emp_no
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
GROUP BY e.gender  , d.dept_name , calendar_year
HAVING calendar_year >= 1990
ORDER BY calendar_year;

# UDEMY ANSWER
SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
        WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
        JOIN 
    t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no, calendar_year;



#SOMEONE'S ANSWER = MINE
SELECT 
    e.gender,
    YEAR(dm.from_date) AS calender_year,
    COUNT(e.gender) AS count,
    d.dept_name
FROM
    t_employees e
        JOIN
    t_dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
GROUP BY calender_year , e.gender , d.dept_name

ORDER BY calender_year;

# TABLEAU 
# TASK 3
# Compare the average salary of female versus male employees in the entire company until year 2002, 
# and add a filter allowing you to see that per each department.

SELECT * FROM t_employees LIMIT 100; #gender
SELECT * FROM t_salaries LIMIT 100; #salary, to_date
SELECT * FROM t_departments LIMIT 100; #deptname and deptno
SELECT * FROM t_dept_emp LIMIT 100; # deptno empno, todate

#MYANSWER = CORRECT

SELECT 
    e.emp_no,
    e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS avg_salary,
    YEAR(s.from_date) AS calendar_year
FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = s.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY e.gender , calendar_year , d.dept_no
HAVING calendar_year <= 2002
ORDER BY calendar_year;

# UDEMY ANSWER
SELECT 
    e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS salary,
    YEAR(s.from_date) AS calendar_year
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no , e.gender , calendar_year
HAVING calendar_year <= 2002
ORDER BY d.dept_no;

#TASK 4
# Create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain salary range.
# Let this range be defined by two values the user can insert when calling the procedure.
# Finally, visualize the obtained result-set in Tableau as a double bar chart. 

# call filter_salary
USE employees_mod;
DROP PROCEDURE IF EXISTS filter_salary;


SELECT * FROM t_salaries LIMIT 100; #fromdate, dept_no, emp_no to left join 
SELECT * FROM t_employees LIMIT 100; #gender, emp_no
SELECT * FROM t_dept_emp; #deptno, emp_no
SELECT * FROM t_departments LIMIT 100; # dept_no, dept_name

# Basically to find the avg salary of each gender that is within the input range. 

DELIMITER $$
CREATE PROCEDURE filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
	SELECT e.gender, AVG(s.salary) AS avg_salary, d.dept_name
    FROM t_employees e JOIN t_salaries s ON e.emp_no = s.emp_no
    JOIN t_dept_emp de ON de.emp_no = e.emp_no
    JOIN t_departments d ON d.dept_no = de.dept_no
    WHERE s.salary BETWEEN p_min_salary AND p_max_salary
    GROUP BY d.dept_no, e.gender
    ORDER BY avg_salary;
    
END$$	
DELIMITER ; 
    
CALL filter_salary(50000, 90000);

# UDEMY ANSWER

DROP PROCEDURE IF EXISTS filter_salary_udemy;
DELIMITER $$
CREATE PROCEDURE filter_salary_udemy (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
SELECT 
    e.gender, d.dept_name, AVG(s.salary) as avg_salary
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
    WHERE s.salary BETWEEN p_min_salary AND p_max_salary
GROUP BY d.dept_no, e.gender
ORDER BY avg_salary;
END$$

DELIMITER ;
CALL filter_salary_udemy(50000, 90000);


##### 10 FINAL QUERY PRACTICE QUESTIONS
USE employees;
# QUESTION 1: Find the average salary of the male and female employees in each department.

SELECT * FROM employees LIMIT 100;
SELECT * FROM salaries LIMIT 100;
SELECT * FROM dept_emp LIMIT 100; #dept_no, emp_no
SELECT * FROM departments LIMIT 100; #dept_no, dept_name

SELECT e.gender, e.emp_no, d.dept_name, AVG(s.salary) AS avg_salary
FROM employees e JOIN salaries s ON e.emp_no = s.emp_no 
JOIN dept_emp de ON de.emp_no = s.emp_no
JOIN departments d ON d.dept_no = de.dept_no
GROUP BY e.gender, d.dept_name;

USE employees;
SELECT #solution
    d.dept_name, e.gender, AVG(salary)
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
        JOIN
    departments d ON d.dept_no = de.dept_no
GROUP BY de.dept_no , e.gender
ORDER BY de.dept_no;

# QUESTION 2: Find the lowest department number encountered in the 'dept_emp' table. 
# Then, find the highest department number.

SELECT * FROM dept_emp LIMIT 100;
SELECT MIN(dept_no) AS lowest_dept_no,
MAX(dept_no) AS max_dept_no
FROM dept_emp;

# QUESTION 4: Obtain a table containing the following three fields for all individuals whose 
# employee number is not greater than 10040
# - Employee number
# - the lowest department number among the departments where the employee has worked in
# - assign '110022' as 'manager' to all individuals whose employee number is lower than or equal to 10020,
# and '110039' to those whose number is between 10021 and 10040 inclusive

USE employees;

SELECT * FROM dept_emp LIMIT 100; #emp_no, dept_no, besides: from_date, to_date
SELECT * FROM employees LIMIT 100;
SELECT * FROM dept_manager LIMIT 100;
# ~~ ATTEMPT 2: SUCCESS

SELECT 
    emp_no,
    MIN(dept_no) AS mindept_workedin,
    CASE
        WHEN emp_no <= '10020' THEN '110022'
        ELSE '110039' # IF I USE CASE HERE FOR BETWEENK, THEN THE REST OF THE EMP_NO THAT HAS BEEN NOT BEEN MENTIONED WILL STILL APPEAR, BUT NULL VALUES, NOT MANAGER
    END AS Manager
FROM
    dept_emp
WHERE
    emp_no <= 10040
GROUP BY emp_no
ORDER BY emp_no;




SELECT
    emp_no,
    (SELECT
            MIN(dept_no)
        FROM
            dept_emp de
        WHERE
            e.emp_no = de.emp_no) dept_no,
    CASE
        WHEN emp_no <= 10020 THEN '110022'
        ELSE '110039'
    END AS manager
FROM
    employees e
WHERE
    emp_no <= 10040
    ORDER BY emp_no; 

 



# ~~ ATTEMPT 1: FAILED
# USE UNION TO COMBINE
# SELECT A.* FROM 
# (SELECT emp_no, 
# MIN(dept_no) OVER (PARTITION BY emp_no) AS mindept_workedin FROM dept_emp) AS A 
# UNION SELECT B.* FROM
# ((SELECT emp_no FROM dept_manager 
# WHERE emp_no = "110022") AS Manager_ID 
# FROM employees e JOIN dept_emp de ON 
# de.emp_no = e.emp_no 
# WHERE
#  e.emp_no <= "10020"
# GROUP BY e.emp_no
# ORDER BY e.emp_no) AS B
# UNION SELECT C.*, 
# ((SELECT emp_no FROM dept_manager 
# WHERE emp_no = "110039") AS Manager_ID
# FROM employees e JOIN dept_emp de ON 
# de.emp_no = e.emp_no 
# WHERE
# e.emp_no BETWEEN 10021 AND 10040
# GROUP BY e.emp_no
# ORDER BY e.emp_no) AS C; ### ATTEMPT 1 FAILED, I'LL TRY DIFFERENT METHODS

# QUESTION 5: Obtain a table containing the following three fields for all individuals whose 
# Retrieve a list of all employees from the ‘titles’ table who are engineers. 
# Repeat the exercise, this time retrieving a list of all employees from the ‘titles’ table who are senior 
# engineers. 
# After LIKE, you could indicate what you are looking for with or without using parentheses. Both options are 
# correct and will deliver the same output. We think using parentheses is better for legibility and that’s why 
# it is the first option we’ve suggested.

# THESE ARE JUST A BIT HARDER THAN THE QUESTION
SELECT * FROM titles LIMIT 100;
SELECT * FROM titles
WHERE title IN ( SELECT title FROM titles WHERE title LIKE "E%") OR title LIKE "%Senior Engineer%"
ORDER BY emp_no;

SELECT * FROM titles
WHERE title LIKE "E%" OR title LIKE "%Senior Engineer%"
ORDER BY emp_no;

# QUESTION 6: Create a procedure that asks you to insert an employee number and that will obtain an output containing 
# the same number, as well as the number and name of the last department the employee has worked in. 
# Finally, call the procedure for employee number 10010. 
# If you've worked correctly, you should see that employee number 10010 has worked for department 
# number 6 - "Quality Management". 
SELECT * FROM dept_emp LIMIT 100; # emp_no, dept_no
SELECT * FROM departments LIMIT 100; #dept_no dept name
DROP PROCEDURE IF EXISTS last_dept;

DELIMITER $$
CREATE PROCEDURE last_dept (IN p_emp_no INT)
BEGIN
	SELECT e.emp_no, de.dept_no, d.dept_name, de.from_date
	FROM dept_emp de JOIN departments d ON de.dept_no = d.dept_no
    JOIN employees e ON e.emp_no = de.emp_no
    WHERE e.emp_no = p_emp_no 
    AND de.from_date = (SELECT MAX(de.from_date) FROM dept_emp de 
    WHERE emp_no = p_emp_no);
END $$
DELIMITER ; 
   
CALL last_dept(10010);
    
# QUESTION 7: 
# How many contracts have been registered in the ‘salaries’ table 
# with duration of more than one year and 
# of value higher than or equal to $100,000?
# Hint: You may wish to compare the difference between the start and end date of the salaries contracts.

SELECT * FROM salaries WHERE salary >= 100000; #empno, salary, fromdate, to date, 32207 rows witj salary >= 100k

SELECT COUNT(*) FROM salaries
WHERE salary >= 100000
AND DATEDIFF(to_date, from_date) > 365;

SELECT *,
CASE
	WHEN DATEDIFF(to_date, from_date) > 365 THEN "More than 1 year contract"
    ELSE "Less than 1 year contract"
END AS Term
FROM salaries
WHERE salary >= 100000;

# SELECT *,MAX(to_date), MIN(from_date), date_format(MAX(to_date) - MIN(from_date) , "%Y-%m-%d" )
# FROM salaries
# GROUP BY emp_no;
# SELECT *,MAX(to_date), MIN(from_date), YEAR(max(to_date)) - year(min(from_date))
# FROM salaries
# GROUP BY emp_no;

# QUESTION 8: Create a trigger that checks if the hire date of an employee is higher than the current date. 
# If true, set the hire date to equal the current date. Format the output appropriately (YY-mm-dd). 
# Extra challenge: You can try to declare a new variable called 'today' which stores today's data, 
# and then use it in your trigger! 
# After creating the trigger, execute the following code to see if it's working properly
 # SUCCESSFUL BUT MYSQL SEEMS TO HAVE A PROBLEM WITH TRIGGER, ERROR CODE: 2014
USE employees;
SELECT * FROM employees LIMIT 10; # HIRE_DATE

DROP TRIGGER IF EXISTS tr_hire_date_check;

# DELIMITER //
# CREATE TRIGGER tr_hire_date_check
# BEFORE INSERT ON employees
# FOR EACH ROW
# BEGIN
# 	IF NEW.hire_date > date_format(SYSDATE(), "%Y-%m-%d") THEN
#     SET NEW.hire_date = NEW.date_format(SYSDATE(), "%Y-%m-%d");
# END IF;
# END //
# DELIMITER ;  #SUCCESSFUL

# USE employees;

# DROP TRIGGER IF EXISTS tr_hire_date_check_extra;

# DELETE FROM employees
# WHERE emp_no = "999903";

# USE employees;

USE employees;

# QUESTION 9: 
# Define a function that retrieves the largest contract salary value of an employee. Apply it to employee number 11356. 
# In addition, what is the lowest contract salary value of the same employee? You may want to create a new 
# function that to obtain the result.
# QUESTION 10: 
# Based on the previous exercise, you can now try to create a third function that also 
# accepts a second parameter. Let this parameter be a character sequence. Evaluate if its value is 'min' or 'max' and based on 
# that retrieve either the lowest or the highest salary, respectively (using the same logic and code structure 
# from Exercise 9). If the inserted value is any string value different from ‘min’ or ‘max’, let the function 
# return the difference between the highest and the lowest salary of that employee. 

DROP FUNCTION IF EXISTS f_salary;
SELECT * FROM salaries LIMIT 10;

DELIMITER $$
CREATE FUNCTION f_salary(p_emp_no INT, p_min_or_max VARCHAR(10)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE v_sala_info DECIMAL(10,2);
SELECT 
    CASE
        WHEN p_min_or_max = 'Min' THEN MIN(s.salary)
        WHEN p_min_or_max = 'Max' THEN MAX(s.salary)
        ELSE MAX(s.salary) - MIN(s.salary)
    END AS SalaryInfo
INTO v_sala_info FROM
    employees e
        JOIN
    salaries s ON s.emp_no = e.emp_no
WHERE
    e.emp_no = p_emp_no;
    RETURN v_sala_info ;
END $$
DELIMITER ;

SELECT * FROM salaries WHERE emp_no = 11356
ORDER BY salary DESC;
SELECT *, f_salary_solution(11356, "Max") FROM salaries;
		
        
DELIMITER $$
CREATE FUNCTION f_salary_solution (p_emp_no INTEGER, p_min_or_max varchar(10)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN

DECLARE v_salary_info DECIMAL(10,2);

SELECT
    CASE
        WHEN p_min_or_max = 'max' THEN MAX(s.salary)
        WHEN p_min_or_max = 'min' THEN MIN(s.salary)
        ELSE MAX(s.salary) - MIN(s.salary)
    END AS salary_info
INTO v_salary_info FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;

RETURN v_salary_info;
END$$


select employees.f_salary_solution(11356, 'min');
select employees.f_salary(11356, 'Min');

