--------------! NOT EQUAL -----------------
-- != ==> not equal operators

SELECT *
FROM books
WHERE released_year = 2017;

SELECT *
FROM books
WHERE released_year != 2017;

SELECT *
FROM books
WHERE author_fname != 'Neil';