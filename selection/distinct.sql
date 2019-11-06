---------------!DISTICT---------------

-- Gives unique/distinct rows/data and remove the duplication
-- Applied to the column name
-- distinct removes the duplication of type : number and int


SELECT DISTINCT author_lname AS 'last name'
FROM books;

-- Distinct author last name

SELECT DISTINCT released_year AS 'years'
FROM books;

-- Distinct authors full name ?
SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) AS 'distinct full name'
FROM books;

-- or

SELECT DISTINCT author_fname, author_lname
FROM books;
-- Distinct is applied to both the columns and on that duplication records are removed