-----------!SUM------------
-- sums together all data/records value
-- Applied to column caluse before FROM

--- Problem : Sum all pages in the entier database
SELECT SUM(pages) AS 'Sum of All Pages'
FROM books;

----------- !SUM with GROUP By------------

-- Problem : Sum all pages each author has written
SELECT CONCAT(author_fname, ' ', author_lname), SUM(pages)
FROM books
GROUP BY author_lname, author_fname;