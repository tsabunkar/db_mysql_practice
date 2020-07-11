/*
--! 1. Write a query to find the addresses (location_id, street_address, city, state_province,
--! country_name) of all the departments.
*/

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

----