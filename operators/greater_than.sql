--------------! GREATER THAN -----------------

SELECT *
FROM books
WHERE released_year > 2000;

--------------! GREATER THAN or EQUAL TO-----------------

SELECT *
FROM books
WHERE released_year >= 2000
ORDER BY released_year;

SELECT *
FROM books
WHERE stock_quantity>= 100
ORDER BY stock_quantity;




/* 

SELECT 99 > 1;

*/

/* 
+--------+
| 99 > 1 |
+--------+
|      1 |
+--------+
*/

-- !(99 > 1) which is true, In Sql it is represent by 1 for true and 0 for false
-- ! Thus In SQL : 1 ==> true  ::  0 ==> false

/*

SELECT 100 > 5; --1
SELECT -15 > 15; --0 
SELECT 9 > -10; --1
SELECT 1 > 1; --0
SELECT 1 >= 1; --1
SELECT 'a' > 'b'; -- 0
SELECT 'a' >= 'b'; -- 0
SELECT 'a' < 'b'; -- 1
SELECT 'A' > 'a'; -- 0
SELECT 'A' < 'a'; -- 0
SELECT 'A' >= 'a'; -- 1

*/

SELECT *
FROM books
WHERE author_lname ='Eggers';

SELECT *
FROM books
WHERE author_lname ='eGGerS';

-- WHERE Clause CASE INCENSITIVE