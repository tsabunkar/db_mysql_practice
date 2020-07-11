-- Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.

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

SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
JOIN employees as e_cond
ON e.employee_id = e_cond.employee_id
WHERE e_cond.hire_date = (
	SELECT e.hire_date FROM employees WHERE e.last_name = 'Jones' 
)




