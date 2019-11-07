/*
Problem - 1
- Print the number of books in the db
*/

SELECT COUNT(book_id) AS 'No of books'
FROM books;

--------------

/*
Problem - 2
- Print out how many books were released in each year
*/

SELECT released_year, COUNT(*)
FROM books
GROUP BY released_year
ORDER BY released_year ASC;

--------------

/*
Problem - 3
- Print out the total number of books in stock
*/

SELECT SUM(stock_quantity) AS 'Total No of books'
FROM books;

--------------

/*
Problem - 4
- Find the average released-year for each author
*/

SELECT CONCAT(author_fname, ' ', author_lname) AS 'full Name', AVG(released_year) AS 'Avg Released year'
FROM books
GROUP BY author_lname, author_fname;

--------------

/*
Problem - 5
- Find the full Name of the author who wrote the longest book
*/


SELECT CONCAT(author_fname, ' ', author_lname) AS 'full Name'
FROM books
WHERE pages = (
    SELECT MAX(pages)
FROM books
);


/* 

SELECT CONCAT(author_fname, ' ', author_lname) AS 'full Name', MAX(pages)
FROM books
GROUP BY author_lname, author_fname
ORDER BY pages DESC
LIMIT 1;

*/

--------------

/*
Problem - 6
- Print year, books and avg pages relased on that year
*/

SELECT released_year AS 'year', COUNT(*) AS '# books', AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year
ORDER BY released_year;