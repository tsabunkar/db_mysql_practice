/*
# SQL JOIN PROBLEMS
https://www.w3resource.com/postgresql-exercises/join/
*/

--1
-- Write a query to find the addresses (location_id, street_address, city, state_province, 
--country_name) of all the departments.

SELECT * FROM departments;
SELECT * FROM locations;
SELECT * FROM countries;

SELECT country_name, country_id FROM countries;

SELECT location_id, state_province, city, street_address
FROM locations;

SELECT  l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM countries as c
INNER JOIN locations as l
ON l.country_id = c.country_id;


SELECT  l.location_id, l.street_address, l.city, l.state_province, c.country_name, d.department_name
FROM countries as c
INNER JOIN locations as l
ON l.country_id = c.country_id
INNER JOIN departments as d
ON d.location_id = l.location_id;

-- or

SELECT location_id, street_address, city, state_province, country_name,department_name
FROM locations
NATURAL JOIN countries
NATURAL JOIN departments;


-------------


--2
-- Write a query to make a join with employees and departments table to find the name of the employee, including 
-- first_name and last name, department ID and name of departments.

SELECT * FROM departments;
SELECT * FROM employees;

SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM departments as d
JOIN employees as e
ON d.department_id = e.department_id;

-- or

SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM departments as d
JOIN employees as e
USING (department_id);

---------------

--3
--Write a SQL query to make a join with three tables employees, departments and locations to find the name, 
--including first_name and last_name, jobs, department name and ID, of the employees working in London.

SELECT * FROM employees

SELECT * FROM locations
WHERE city = 'London';

SELECT * FROM departments
WHERE location_id = 2400

SELECT l.city, d.department_name, d.department_id
FROM locations as l 
JOIN departments as d 
ON d.location_id = l.location_id
WHERE l.city = 'London';

-- HR deprtment (1) ---> (N) employees

SELECT e.first_name, e.last_name, d.department_name, d.department_id
FROM departments as d
INNER JOIN employees as e
ON e.department_id = d.department_id
WHERE d.department_name = 'Human Resources'

SELECT * FROM employees 
WHERE department_id = 40;


SELECT e.first_name, e.last_name, d.department_name, d.department_id
FROM departments as d
INNER JOIN employees as e
ON e.department_id = d.department_id
INNER JOIN locations as l
ON l.location_id = d.location_id
WHERE l.city = 'London';


---------------

--4
--Write a query to make a join with two tables employees and itself to find the employee id, last_name as Employee along 
--with their manager_id and last name as Manager.



SELECT * FROM employees;

SELECT e.employee_id , e.first_name  || ' ' || e.last_name as "emp", m1.manager_id,  m1.first_name || ' ' || m1.last_name as "mgr"
FROM employees as e
JOIN employees as m1
ON e.employee_id = m1.manager_id



---------------

--5
-- Write a query to make a join with a table employees and itself to find the name, including first_name and last_name 
-- and hire date for those employees who were hired after the employee Jones.

SELECT * FROM employees
WHERE last_name ILIKE '%jones%' -- ignore case ILIKE

SELECT * FROM employees
WHERE hire_date > '1987-09-20'::date
ORDER BY hire_date; -- ::date

SELECT * FROM employees
WHERE hire_date > (SELECT hire_date FROM employees
				  WHERE last_name = 'Jones');

SELECT  e.first_name, e.last_name, e.hire_date
FROM employees as e
JOIN employees as e_cond
ON e.employee_id = e_cond.employee_id
WHERE e.hire_date > '1987-09-20'::date

SELECT  e.first_name, e.last_name, e.hire_date
FROM employees as e
INNER JOIN employees as e_cond
ON e.employee_id = e_cond.employee_id
WHERE e.hire_date > (SELECT hire_date FROM employees
				  WHERE last_name = 'Jones')
				  
-- below query is  quite sexy query

SELECT  e.first_name, e.last_name, e.hire_date
FROM employees as e
INNER JOIN employees as emp1
ON emp1.last_name = 'Jones'
WHERE  e.hire_date > emp1.hire_date

---------------

--6
--Write a query to make a join with two tables employees and departments to get the department name and number of
--employees working in each department.

SELECT * FROM departments;
SELECT employee_id, department_id FROM employees;

-- I want count of employees working for each department

SELECT COUNT(*) as "No_of_Emp", department_id FROM employees
GROUP BY department_id
ORDER BY department_id

SELECT COUNT(*) as "No_of_Emp", e.department_id, d.department_name
FROM employees as e
INNER JOIN departments as d
ON e.department_id = d.department_id
GROUP BY e.department_id, d.department_name
ORDER BY e.department_id

---------------

--7
--Write a query to make a join to find the employee ID, job title and number of days an employee worked, for all the
--employees who worked in a department which ID is 90.

SELECT employee_id, hire_date, (NOW() - hire_date) as "worked_days" FROM employees;
select date_trunc('day', now() - hire_date::date) as "worked_days" FROM employees;
select extract('day' from date_trunc('day', now() - hire_date::date)) as "worked_days" FROM employees;

SELECT e.employee_id, j.job_title, date_trunc('day', now() - hire_date::date) as "worked_days" 
FROM employees as e 
INNER JOIN jobs as j
ON j.job_id = e.job_id

-- who worked in department_id = 90

SELECT e.employee_id, j.job_title, date_trunc('day', now() - hire_date::date) as "worked_days" 
FROM employees as e 
INNER JOIN jobs as j
ON j.job_id = e.job_id
INNER JOIN departments as d
ON d.department_id = e.department_id
WHERE d.department_id = 90;

-- or u could have use job_history table

SELECT employee_id, job_title, end_date - start_date Days 
FROM job_history 
NATURAL JOIN jobs 
WHERE department_id=90;


---------------

--8
--Write a query to make a join with two tables employees and departments to display the department ID, department name
--and the first name of the manager.

SELECT employee_id, first_name, manager_id FROM employees

-- to find each emp -> manager name & id
SELECT e2.employee_id as "empID",  e2.first_name as "emp_fname",  e1.first_name as "mgr_fname", e1.employee_id as "mgrID"
FROM employees as e1
INNER JOIN employees as e2
ON e1.employee_id = e2.manager_id




SELECT  e.employee_id as "empID",  e.first_name as "emp_fname",  d.department_id, d.department_name
FROM employees as e
INNER JOIN departments as d
ON (e.employee_id = d.manager_id )
ORDER BY e.employee_id

-----------

--9.
--Write a query to make a join with three tables departments, employees, and locations to display the department name,
--manager name, and city.

SELECT l.city, d.department_name
FROM locations as l
INNER JOIN departments as d
ON l.location_id = d.location_id
ORDER BY l.city



SELECT l.city, d.department_name, e.first_name || ' ' || e.last_name as "mgr"
FROM locations as l
INNER JOIN departments as d
ON l.location_id = d.location_id
INNER JOIN employees as e
ON e.employee_id = d.manager_id
ORDER BY l.city

--> USING instead of ON (when column names are same to match)

SELECT l.city, d.department_name, e.first_name || ' ' || e.last_name as "mgr"
FROM locations as l
INNER JOIN departments as d
-- ON l.location_id = d.location_id
USING (location_id)
INNER JOIN employees as e
ON e.employee_id = d.manager_id
ORDER BY l.city

---------------------

--10. Write a query to make a join with two tables employees and jobs to display the job title and average salary of employees.

SELECT AVG(salary) FROM employees


SELECT j.job_title,TRUNC(AVG( e.salary )) as "avgSal"
FROM jobs as j
INNER JOIN employees as e
USING (job_id)
GROUP BY j.job_title
ORDER BY 2 DESC


------------

--11
--Write a query to make a join with two tables employees and jobs to display the job title, employee name,
--and the difference between salary and the minimum salary of the employees.


SELECT e.first_name || ' ' ||e.last_name, j.job_title, e.salary - j.min_salary
FROM employees as e
INNER JOIN jobs as j
USING(job_id)


-----------

--12
-- Write a query to make a join with two tables job_history and employees to display the status of
-- employees who is currently drawing the salary above 10000.

-- Check how we can use * while projecting

SELECT e.first_name || ' ' ||e.last_name, jh.*
FROM employees as e
INNER JOIN job_history as jh
USING (employee_id)
WHERE e.salary > 10000


----------------

--13. Write a query to make a join with two tables employees and departments to display department name, 
--first_name and last_name, hire date and salary for all the managers who achieved a working experience is more than 15 years.

SELECT * FROM employees
WHERE hire_date < now() - '15 years'::interval;

-- converte to days to years
SELECT '1987-06-17'::date, now() - '1987-06-17'::date, DATE_PART('year', AGE(now() , '1987-06-17')) 

SELECT * FROM employees
WHERE DATE_PART('year', AGE(now() , hire_date))  > 15

SELECT employee_id,  DATE_PART('year', AGE(now() , hire_date)) FROM employees
WHERE DATE_PART('year', AGE(now() , hire_date))  > 15
 

SELECT d.department_id, d.department_name, e.first_name, e.last_name, e.hire_date, e.salary
FROM employees as e
INNER join departments as d
ON d.manager_id = e.employee_id
WHERE DATE_PART('year', AGE(now() , e.hire_date))  > 15

