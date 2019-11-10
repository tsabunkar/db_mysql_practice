--------------! BETWEEN -----------------
-- projects all the rows whose values is in between min and max range
-- AND Operator is always paired with BETWEEN operator
-- Between is considering the min value and also considering the max value (INCLUSIVE)

-- Select all books published between 2004 and 2015

SELECT *
FROM books
WHERE released_year >= 2004 AND released_year <= 2015
ORDER BY released_year ASC;


SELECT *
FROM books
WHERE released_year BETWEEN 2004 AND 2015
ORDER BY released_year ASC;


--- !NOT BETWEEN (opposite of BETWEEN)

SELECT *
FROM books
WHERE released_year NOT BETWEEN 2004 AND 2015
ORDER BY released_year ASC;

-- Comparing Dates:- 

-- Casting (Converting) datatype from one data type to another datatype 
SELECT CAST('2017-05-02' AS DATETIME);
-- Above example - text data-type is converted to Date type 


USE datatype_db;

SELECT *
FROM people
WHERE birth_dt
BETWEEN '1980-01-01' AND '2000-01-01';

-- above query still works, but to make sure work consistently, Thus we will cast the text to DATETIME 
-- datatype

SELECT *
FROM people
WHERE birth_dt
BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01'AS DATETIME);