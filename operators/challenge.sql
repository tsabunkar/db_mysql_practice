/*
- Problem 1
Evaluate
 SELECT 10 != 10;
 SELECT 15 > 14 && 99 - 5 <= 94;
 SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;
*/

/* 

SELECT 10 != 10; -- 0
SELECT 15 > 14 && 99 - 5 <= 94; -- 1
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; -- 1

*/

------------------

/*
- Problem 2
Select All Books Written Before 1980 (inlusive 1980)
*/

SELECT *
FROM books
WHERE released_year BETWEEN 0 AND 1980 OR released_year = 1980;


SELECT *
FROM books
WHERE released_year <= 1980;

------------------

/*
- Problem 3
Select All books written by Eggers Or Chabon
*/

SELECT *
FROM books
WHERE author_lname IN ('Eggers','Chabon');


SELECT *
FROM books
WHERE author_lname='Eggers' OR author_lname='Chabon';

------------------

/*
- Problem 4
Select All books written by Lahiri, published after 2000
*/

SELECT *
FROM books
WHERE author_lname = 'Lahiri' AND released_year > 2000;

------------------

/*
- Problem 5
Select all books with page counts between 100 and 200
*/

SELECT *
FROM books
WHERE pages BETWEEN 100 AND 200
ORDER BY pages;

SELECT *
FROM books
WHERE pages >= 100 AND pages <= 200
ORDER BY pages;

------------------

/*
- Problem 6
Select all books where author_lname starts with 'C' or an 'S'
*/

SELECT *
FROM books
WHERE author_lname 
LIKE 'C%';

SELECT *
FROM books
WHERE author_lname 
LIKE 'S%';

SELECT *
FROM books
WHERE author_lname 
LIKE 'C%' OR author_lname LIKE 'S%';

-- !or

SELECT *
FROM books
WHERE SUBSTR(author_lname , 1, 1) = 'C' OR
    SUBSTR(author_lname , 1, 1) = 'S';

-- !or

SELECT *
FROM books
WHERE SUBSTR(author_lname , 1, 1) IN ('C','S');

------------------

/*
- Problem 7
If title contains 'stories' -> Short Stories
Just kids and A Heartbreaking Work -> Memoir
Everything else -> Novel
*/

SELECT title, author_lname,
    CASE
      WHEN title LIKE '%stories%' THEN 'Short Stories'
      WHEN title LIKE '%Just kids%' THEN 'Memoir'
      WHEN title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
      ELSE 'Novel'
    END AS 'TYPE'
FROM books;

SELECT title, author_lname,
    CASE
      WHEN title LIKE '%stories%' THEN 'Short Stories'
      WHEN title LIKE '%Just kids%' OR title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
      ELSE 'Novel'
    END AS 'TYPE'
FROM books;

------------------

/*
- Problem 8
*/

SELECT title, author_lname, COUNT(*) AS COUNT
FROM books
GROUP BY author_lname, author_fname
ORDER BY author_lname;


SELECT title, author_lname,
    CASE 
        WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*), ' book')
        ELSE CONCAT(COUNT(*), ' books')
    END AS 'Count'
FROM books
GROUP BY author_lname, author_fname
ORDER BY author_lname;