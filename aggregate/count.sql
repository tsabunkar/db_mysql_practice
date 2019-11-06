-----------!COUNT--------------
-- count the number of records/data
-- COUNT is written on the column clause


-- how many books are in the books
SELECT COUNT(*)
FROM books;

-- How many author_fname in the books
SELECT COUNT(author_fname)
FROM books;
-- but above query is giving duplicate records as well

-- to find the unique first name

SELECT DISTINCT author_fname
FROM books;

SELECT COUNT(DISTINCT author_fname)
FROM books;


-- how many unique authors in the books, (full name unique)
SELECT DISTINCT author_fname, author_lname
FROM books;

/* 

SELECT COUNT(DISTINCT author_fname, author_lname) AS fullName
FROM books; 

*/

-- how many titles contain 'the'

SELECT COUNT(title) AS 'title count'
FROM books
WHERE title
LIKE '%the%';