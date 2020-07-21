---------------------- ! SELECT-------------------------------------

SELECT * FROM customer;

SELECT first_name FROM customer;

-- ? FROM -> keyword is optional
SELECT 5 * 3;

SELECT 
   first_name || ' ' || last_name AS fullname,
   email
FROM 
   customer;

-- ? alias -> AS keyword is optional

SELECT 
   first_name || ' ' || last_name "full name",
   email
FROM 
   customer;


----------------------------------------------------------------
---------------------- ! ORDER BY-------------------------------------

SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC,last_name DESC;


-- PostgreSQL ORDER BY clause to sort rows by expressions

SELECT 
	first_name,
	LENGTH(first_name) len
FROM
	customer
ORDER BY 
	len DESC;

-- ORDER BY clause with NULL data

-- ! NULL data will be ordered last/end in descending order on last_name column

SELECT last_name
FROM customer
ORDER BY 
	last_name DESC NULLS LAST;

-- ! NULL data will be ordered first in descending order on last_name column

SELECT last_name
FROM customer
ORDER BY 
	last_name DESC NULLS FIRST;


----------------------------------------------------------------
---------------------- ! DISTINCT ON-------------------------------------

SELECT title,  release_year
FROM film
ORDER BY
   release_year DESC
LIMIT 10

-- ? NOTE: column name which are Projected with DISTINCT Clause should be at first or starting
SELECT  DISTINCT release_year, title
FROM film
ORDER BY
   release_year DESC
LIMIT 10


----------------------------------------------------------------
---------------------- ! WHERE-------------------------------------

-- OR

SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	last_name = 'Rodriguez' OR 
	first_name = 'Adam';

-- IN
-- ? If you want to match a string with any string in a list, you can use the IN operator.
SELECT
	first_name,
	last_name
FROM
	customer
WHERE 
	first_name IN ('Ann','Anne','Annie');


-- LIKE
-- ? To find a string that matches a specified pattern, you use the LIKE operator.

SELECT
	first_name,
	last_name
FROM
	customer
WHERE 
	first_name LIKE 'Ann%'


-- BETWEEN
-- ? BETWEEN operator returns true if a value is in a range of values.

SELECT
	first_name,
	LENGTH(first_name) name_length
FROM
	customer
WHERE 
	first_name LIKE 'A%' AND
	LENGTH(first_name) BETWEEN 3 AND 5
ORDER BY
	name_length;


-- <> or != not equal operator 

SELECT 
	first_name, 
	last_name
FROM 
	customer 
WHERE 
	first_name LIKE 'Bra%' AND 
	last_name <> 'Motley';

SELECT 
	first_name, 
	last_name
FROM 
	customer 
WHERE 
	first_name LIKE 'Bra%' AND 
	last_name != 'Motley';


----------------------------------------------------------------
---------------------- ! LIMIT-------------------------------------
