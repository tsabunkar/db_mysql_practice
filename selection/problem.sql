/*
Problem 1;
- Select All stories collections, (titles that contain stories)
*/

SELECT title
FROM books
WHERE title 
LIKE '%stories%';

-------------

/*
Problem 2
Find the longest book name
(print out the title and page count)
*/

/* 

SELECT title, pages
FROM books
ORDER BY pages DESC
LIMIT 1;

*/

-------------

/*
Problem 3
Print a summary containing the title and year, for the 3 most recent books
*/

/* 

SELECT CONCAT(title, ' - ', released_year) AS 'summary'
FROM books
ORDER BY released_year DESC
LIMIT 3; 

*/

-------------

/*
Problem 4
Find all books with an author_lname that contains a space('')
*/

SELECT title, author_lname
FROM books
WHERE author_lname
LIKE '% %';

-------------

/*
Problem 5
Find the 3 books with the lowest stock- Select title, year and stock
if same stocks exist then sort released year in descending order
*/

/* 

SELECT title, released_year, stock_quantity
FROM books
ORDER BY stock_quantity ASC, released_year DESC
LIMIT 3; 

*/

-------------

/*
Problem 6
Print title and author_lname, sorted first by author_lname and then by title
*/

SELECT title, author_lname
FROM books
ORDER BY author_lname, title;

-------------

/*
Problem 7
Sorted Alphabetically by last name
*/

SELECT UPPER(
    CONCAT('my favorite author is ', author_fname,' ', author_lname, '!')
 ) AS yell
FROM books
ORDER BY author_lname;

-------------