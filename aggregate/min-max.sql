-----------!MIN_MAX-----------------
-- helps to identifiy min or max values in the table
-- Applied to column clause before FROM 


-- find the minimum released_year
SELECT MIN(released_year)
FROM books;

SELECT MAX(pages)
FROM books;


-- Find title of the longest book ? 
SELECT MAX(pages), title
FROM books;

-- !Above query is WRONG
-- bcoz 'The Namesake' title has only 291 pages (Reason - MySQL is independently executing these cmds)

-- Solution 1: subquery (Running one query is anothe rquery)
SELECT title, pages
FROM books
WHERE pages = (SELECT MAX(pages)
FROM books);
-- first inner sub query will be executed first, then the outer query
-- SubQueries are generally -> slow 

--- Solution 2: 
/* 

SELECT *
FROM books
ORDER BY pages ASC
LIMIT 1;

 */



----------------------------! MIN/MAX with Group By-------------------------

----- Problem : Find the year when each author published their first book

SELECT author_fname, author_lname, released_year, COUNT(*)
FROM books
GROUP BY released_year;

-- In above query Raymond Carver published 2 books in 1981 and 1989 but problem statement states to 
-- show only the first published books which was on 1981

SELECT author_fname, author_lname, MIN(released_year), COUNT(*)
FROM books
GROUP BY author_lname, author_fname;

-- Sol:
SELECT author_fname, author_lname, MIN(released_year) AS 'First Relased on'
FROM books
GROUP BY author_lname, author_fname;


----- Problem : Find the longest page count for each author

SELECT author_fname, author_lname, pages, COUNT(*)
FROM books
GROUP BY pages;

-- Sol:
SELECT author_fname, author_lname, MAX(pages) AS 'longest page count'
FROM books
GROUP BY author_lname, author_fname;

SELECT author_fname, author_lname, MAX(pages) AS 'longest page count'
FROM books
GROUP BY author_lname, author_fname
ORDER BY pages;

SELECT CONCAT(author_fname,' ', author_lname) AS 'Authors', MAX(pages) AS 'longest page count'
FROM books
GROUP BY author_lname, author_fname
ORDER BY pages;
