-----------!GROUP BY--------------
-- 'Group By' -> summarizes or aggregates identical data into single rows
-- Group by -> behind the scene it creates a virtual projection/view of a table in which it groups the
--             records for the column specified 
--             and this grouped records are considered as one gaint super row/record

SELECT author_lname
FROM books
GROUP BY author_lname;
-- behind the scene virtual projection table is created in which all the records are grouped by author
-- last name


-- !Count how many books each author has written ?

SELECT author_lname, COUNT(*)
FROM books
GROUP BY author_lname;

-- each records of author_lname column is grouped into single gaint row, but count will give the 
-- number of rows/records that contains in that gaint record


---------------------------------------------
SELECT title, author_fname, author_lname
FROM books
GROUP BY author_lname;

-- !IF your are getting Error :
-- Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 
-- 'book_shop.books.title' which is not functionally dependent on columns in GROUP BY clause; 
-- this is incompatible with sql_mode=only_full_group_by

-- SET sql_mode = '';
---------------------------------------------

SELECT author_fname, author_lname, COUNT(*)
FROM books
GROUP BY author_lname;

SELECT author_fname, author_lname, COUNT(*)
FROM books
GROUP BY author_lname, author_fname;
-- Above query will group, when both fname and lname are unique.
-- virtual projection table will have grouped gaint records considering unique fname AND lname records.


SELECT released_year, COUNT(*) AS 'No of books relased on this year'
FROM books
GROUP BY released_year
ORDER BY released_year DESC;

SELECT CONCAT('In ', released_year,' ',COUNT(*), ' book was realsed') AS foo
FROM books
GROUP BY released_year;