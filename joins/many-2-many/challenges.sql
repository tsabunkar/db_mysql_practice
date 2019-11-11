/* 
DESC reviewers;
DESC series;
DESC reviews; 
*/

/*
Problem 1:
Join reviews table and series table, only show title and rating
*/

SELECT title, rating
FROM series INNER JOIN reviews
    ON series.s_id = reviews.series_id;

/*
Problem 2:
For above table find average ratings for each series title
*/

SELECT title, AVG(rating) AS 'avg_rating'
FROM series INNER JOIN reviews
    ON series.s_id = reviews.series_id
GROUP BY series.s_id
ORDER BY avg_rating;
-- grouping should be done by series id not on title, bcoz we can multiple series with same name(duplication)

/*
Problem 3:
Join reviews table and reviewers table, only show firstname, lastname and rating
*/
SELECT first_name, last_name, rating
FROM reviewers INNER JOIN reviews
    ON reviewers.r_id = reviews.reviewer_id;

/*
Problem 4:
list all the unreviewed series (There are some series which are not reviewed by any reviewer)
*/

SELECT title, rating
FROM series LEFT JOIN reviews
    ON series.s_id = reviews.series_id;
-- left join bcoz- in left table -> we want all the records of series table

SELECT title, rating
FROM series LEFT JOIN reviews
    ON series.s_id = reviews.series_id
WHERE reviews.rating IS NULL
GROUP BY series.s_id;


SELECT title AS 'unreviewed_series'
FROM series LEFT JOIN reviews
    ON series.s_id = reviews.series_id
WHERE reviews.rating IS NULL
GROUP BY series.s_id;

/*
Problem 5:
Compute the average rating for each of the genere
*/
SELECT genre, AVG(rating) AS 'avg_rating'
FROM series INNER JOIN reviews
    ON series.s_id = reviews.series_id
GROUP BY genre;

SELECT genre, ROUND(AVG(rating), 2) AS 'avg_rating'
FROM series INNER JOIN reviews
    ON series.s_id = reviews.series_id
GROUP BY genre;

/*
Problem 6:
Find statistics for each reviewer i.e.- firstname, lastname, count (no of reviews given), min (min 
review given by user), max (max review given by user), avg (average review given by user), status (
If review count of review given is 0 then status is inactive else active
)
*/

SELECT first_name, last_name, COUNT(rating) AS 'count', MIN(rating) AS 'min',
    MAX(rating) AS 'max', AVG(rating) AS 'avg',
    CASE
        WHEN COUNT(rating) = 0 THEN 'INACTIVE'
        ELSE 'ACTIVE'
    END AS 'status'
FROM reviewers LEFT JOIN reviews
    ON reviewers.r_id = reviews.reviewer_id
GROUP BY last_name, first_name;



SELECT first_name, last_name, COUNT(rating) AS 'count',
    IFNULL(MIN(rating), 0.0) AS 'min',
    IFNULL(MAX(rating), 0.0) AS 'max',
    IFNULL(AVG(rating), 0.00000) AS 'avg',
    CASE
        WHEN COUNT(rating) = 0 THEN 'INACTIVE'
        ELSE 'ACTIVE'
    END AS 'status'
FROM reviewers LEFT JOIN reviews
    ON reviewers.r_id = reviews.reviewer_id
GROUP BY last_name, first_name;

-- !NOTE: Do group by reviewers.r_id;

SELECT first_name, last_name, COUNT(rating) AS 'count',
    IFNULL(MIN(rating), 0) AS 'min',
    IFNULL(MAX(rating), 0) AS 'max',
    IFNULL(AVG(rating), 0) AS 'avg',
    CASE
        WHEN COUNT(rating) = 0 THEN 'INACTIVE'
        ELSE 'ACTIVE'
    END AS 'status'
FROM reviewers LEFT JOIN reviews
    ON reviewers.r_id = reviews.reviewer_id
GROUP BY reviewers.r_id;

-- !Using If else in MySQL
/* 

SELECT first_name, last_name, COUNT(rating) AS 'count',
    IFNULL(MIN(rating), 0) AS 'min',
    IFNULL(MAX(rating), 0) AS 'max',
    IFNULL(AVG(rating), 0) AS 'avg',
    IF(COUNT(rating) >= 1, 'ACTIVE', 'INACTIVE') AS 'status'
FROM reviewers LEFT JOIN reviews
    ON reviewers.r_id = reviews.reviewer_id
GROUP BY reviewers.r_id; 

*/


/*
Problem 7:
print out the title, rating, and reviewer who wrote that review
*/

SELECT title, rating
FROM series
    INNER JOIN reviews
    ON series.s_id = reviews.series_id;


SELECT CONCAT(first_name, ' ', last_name) AS 'reviewer', rating
FROM reviewers
    INNER JOIN reviews
    ON reviewers.r_id = reviews.reviewer_id;


SELECT CONCAT(first_name, ' ', last_name) AS 'reviewer', rating
FROM reviewers
    INNER JOIN reviews
    ON reviewers.r_id = reviews.reviewer_id
    INNER JOIN series
    ON series.s_id = reviews.series_id;


SELECT title, rating, CONCAT(first_name, ' ', last_name) AS 'reviewer'
FROM reviewers
    INNER JOIN reviews
    ON reviewers.r_id = reviews.reviewer_id
    INNER JOIN series
    ON series.s_id = reviews.series_id
ORDER BY title;