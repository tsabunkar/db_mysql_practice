--------------! IN  -----------------
-- Allows us to provide a set of values, and check a given column is in that set

-- Select all books written by carver or lahiri or smith 

SELECT *
FROM books
WHERE author_lname = 'carver' OR author_lname = 'lahiri' OR author_lname = 'smith';

-- both the queries are same

SELECT *
FROM books
WHERE author_lname IN ('carver', 'lahiri', 'smith');


SELECT *
FROM books
WHERE released_year IN (2017, 1985);


--------------! NOT IN  -----------------


SELECT *
FROM books
WHERE released_year NOT IN (2017, 1985);

-- SELECT All books not publised in even numbers;

SELECT *
FROM books
WHERE released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016) AND
    released_year >= 2000
ORDER BY released_year;


SELECT *
FROM books
WHERE released_year >= 2000 AND released_year % 2 != 0
ORDER BY released_year;


-- NOTE : NOT IN, IN has performance issues bcoz each value need to be check with the total
--  number of records present in the db
