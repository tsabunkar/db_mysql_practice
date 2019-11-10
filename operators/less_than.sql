--------------! LESS THAN -----------------
SELECT *
FROM books
WHERE released_year < 2000;

--------------! LESS THAN or EQUAL TO-----------------

SELECT *
FROM books
WHERE released_year <= 2000
ORDER BY released_year;

/*

SELECT 3 < 10; -- 1
SELECT -10 < -9; -- 1
SELECT 42 <= 42; -- 1
SELECT 'h' < 'p'; -- 1
SELECT 'Q' <= 'q'; -- 1

*/