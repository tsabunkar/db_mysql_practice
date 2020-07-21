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

SELECT
	film_id,
	title,
	release_year
FROM
	film
ORDER BY
	film_id
LIMIT 5 ;

SELECT
	film_id,
	title,
	release_year
FROM
	film
ORDER BY
	film_id
LIMIT 5 OFFSET 2;

-- Query to select botton N rows


SELECT
	film_id,
	title,
	release_year
FROM
	film
ORDER BY
	film_id DESC
LIMIT 5 ;

----------------------------------------------------------------
---------------------- ! FETCH-------------------------------------

SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title 
FETCH FIRST ROW ONLY;

-- by default row_count = 1

SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title 
FETCH FIRST 1 ROW ONLY;


SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title 
FETCH FIRST 5 ROW ONLY;


--? first OFFSET and then FETCH

SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title 
OFFSET 2 ROWS 
FETCH FIRST 5 ROW ONLY; 


----------------------------------------------------------------
---------------------- ! IN-------------------------------------


SELECT customer_id,
	rental_id,
	return_date
FROM
	rental
WHERE
	customer_id IN (1, 2)
ORDER BY
	return_date DESC;



SELECT
	customer_id,
	rental_id,
	return_date
FROM
	rental
WHERE
	customer_id NOT IN (1, 2);

-- ? Above query can also be writtern using -> not equal (<>) and AND operators 

SELECT
	customer_id,
	rental_id,
	return_date
FROM
	rental
WHERE
	customer_id <> 1 AND
	customer_id <> 2;

SELECT customer_id
FROM rental
WHERE CAST (return_date AS DATE) = '2005-05-27'
ORDER BY customer_id;

-- ? using customer_id of rental table in cutomer table as SubQuery

SELECT
	customer_id,
	first_name,
	last_name
FROM
	customer
WHERE
	customer_id IN (
		SELECT customer_id
		FROM rental
		WHERE CAST (return_date AS DATE) = '2005-05-27'
	)
ORDER BY customer_id;

----------------------------------------------------------------
---------------------- ! BETWEEN-------------------------------------

SELECT
	customer_id,
	payment_id,
	amount
FROM
	payment
WHERE
	amount BETWEEN 8 AND 9;



SELECT
	customer_id,
	payment_id,
	amount
FROM
	payment
WHERE
	amount NOT BETWEEN 8 AND 9;


SELECT
	customer_id,
	payment_id,
	amount,
 payment_date
FROM
	payment
WHERE
	payment_date BETWEEN '2007-02-07' AND '2007-02-15';



----------------------------------------------------------------
---------------------- ! LIKE-------------------------------------

SELECT
	first_name,
        last_name
FROM
	customer
WHERE
	first_name LIKE 'Jen%';


SELECT
	'foo' LIKE 'foo', -- true
	'foo' LIKE 'f%', -- true
	'foo' LIKE '_o_', -- true
	'bar' LIKE 'b_'; -- false

-- ? LIKE ==> ~~

SELECT
	first_name,
        last_name
FROM
	customer
WHERE
	first_name  ~~ 'Jen%';


-- ? ILIKE ==> ~~* (Same as LIKE but case insensitively)


SELECT
	first_name,
    last_name
FROM
	customer
WHERE
	first_name ~~* 'jEn%';


-- ? NOT LIKE ==> !~~

SELECT COUNT(*)
FROM
	customer
WHERE
	first_name !~~ 'Jen%';


-- ? ILIKE ==> !~~*

SELECT COUNT(*)
FROM
	customer
WHERE
	first_name !~~* 'jEn%';


----------------------------------------------------------------
---------------------- ! ISNULL-------------------------------------

-- ? Comparsion of null value
SELECT NULL = NULL

-- ? Wrong way of comparsion
-- ? Always gives false bcoz - NULL is not equal to any value or not even itself
SELECT * FROM film
WHERE rating = NULL 

-- ? Correct way of comparsion
SELECT * FROM film
WHERE rating IS NULL 

