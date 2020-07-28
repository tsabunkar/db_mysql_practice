-------------------------------------------------
--------------!Database Object Sizes -------------
select
    pg_relation_size('actor');

-- ? much more readable size of table
SELECT
    pg_size_pretty (pg_relation_size('actor'));

SELECT
    pg_size_pretty (pg_total_relation_size ('actor'));

-- ? to get size of whole db
SELECT
    pg_size_pretty (pg_database_size ('dvdrental'));

-- ? To get the size of each database in the current database server
SELECT
    pg_database.datname,
    pg_size_pretty(pg_database_size(pg_database.datname)) AS size
FROM
    pg_database;

-- ? to get total size of all indexes attached to the actor table
SELECT
    pg_size_pretty (pg_indexes_size('actor'));

-- ? tablespace size of pg_default
SELECT
    pg_size_pretty (pg_tablespace_size ('pg_default'));

-- ? space that needs to store a specific value
select
    pg_column_size(5 :: smallint);

-------------------------------------------------
--------------------! SELECT INTO-------------------
--? creating film_r table from film with specific columns and conditions
SELECT
    film_id,
    title,
    rental_rate INTO TABLE film_r
FROM
    film
WHERE
    rating = 'R'
    AND rental_duration = 5
ORDER BY
    title;

SELECT
    *
FROM
    film_r;

--? creating short_film Temporary table from film 
SELECT
    film_id,
    title,
    length INTO TEMP TABLE short_film
FROM
    film
WHERE
    length < 60
ORDER BY
    title;

--? This short_film Temporary table  exist for above projection only
SELECT
    *
FROM
    short_film;

-------------------------------------------------
--------------------! CREATE TABLE AS-------------------
-- ? creating action_film table from Inner join of -> film and film_category
CREATE TABLE action_film AS
SELECT
    film_id,
    title,
    release_year,
    length,
    rating
FROM
    film
    INNER JOIN film_category USING (film_id)
WHERE
    category_id = 1;

SELECT
    *
FROM
    action_film
ORDER BY
    title;

-- ? creating film_rating table from film  (Changeing Column name in new table)
CREATE TABLE IF NOT EXISTS film_rating (rating, film_count) AS
SELECT
    rating,
    COUNT (film_id)
FROM
    film
GROUP BY
    rating;

SELECT
    *
FROM
    film_rating;