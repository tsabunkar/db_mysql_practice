---------------!ORDERBY---------------

-- Sorting Rows/data

SELECT author_fname
FROM books
ORDER BY author_fname;

SELECT *
FROM books
ORDER BY author_fname;
-- string get sorted asc in alphabetical order

SELECT *
FROM books
ORDER BY stock_quantity;
-- int get sorted asc in numeric order (lower to high)

SELECT *
FROM books
ORDER BY title ASC;
-- Ascending by default

SELECT *
FROM books
ORDER BY released_year DESC;

SELECT title, author_fname, author_lname
FROM books
ORDER BY 2;
-- 2 refers-> author_fname 
-- If we specificy particular column name, then 1 refers to first column specified, 2nd refers
-- to second coloumn specified, soon...

SELECT *
FROM books
ORDER BY 3;
-- If we specifiy on All, then 3rd refers to 3rd column in the table

SELECT *
FROM books
ORDER BY 99;
-- error :  Unknown column '99' in 'order clause'

SELECT *
FROM books
ORDER BY author_lname, author_fname;
-- !after sorting on last name (If there is same last names)then for that rows sort on first name