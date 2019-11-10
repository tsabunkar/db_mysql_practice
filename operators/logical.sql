--------------! AND OPERATOR -----------------

/*
Select books written by Dave Eggers, published after the year 2010
*/

SELECT *
FROM books
WHERE author_fname='Dave' AND author_lname= 'Eggers' AND released_year >= 2010;

-- AND  <==> && (Same)

/* 

SELECT *
FROM books
WHERE author_fname='Dave' && author_lname= 'Eggers' && released_year >= 2010;

*/

/* 

SELECT 1 < 5 && 7 = 9; -- 0 
SELECT -10 > -20 && 0 <= 0; -- 1
SELECT -40 <= -0 && 10 > 40; -- 0
SELECT 54 <= 54 && 'a' = 'A'; -- 1

*/

SELECT *
FROM books
WHERE author_lname = 'Eggers' AND
    released_year > 2010 AND
    title LIKE '%novel%';

--------------! OR OPERATOR -----------------

SELECT *
FROM books
WHERE author_fname='Dave' OR author_lname= 'Eggers' OR released_year >= 2010;

-- OR  <==> || (Same)

/* 

SELECT *
FROM books
WHERE author_fname='Dave' || author_lname= 'Eggers' || released_year >= 2010; 

*/


/* 

SELECT 40 <= 100 || -2 > 0; --1
SELECT 10 > 5 || 5 = 5; -- 1
SELECT 'a'= 5 || 3000 > 2000; --1  

*/

