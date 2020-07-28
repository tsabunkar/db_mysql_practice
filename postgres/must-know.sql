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

-------------------------------------------------
--------------------! SEQUENCE -------------------
-- ? ascending sequence starting from 100 with an increment of 5
CREATE SEQUENCE mysequence INCREMENT 5 START 100;

-- ? To get the next value from the sequence 
SELECT
    nextval('mysequence');

-- ? descending sequence from 3 to 1 with the cycle
CREATE SEQUENCE three INCREMENT -1 MINVALUE 1 MAXVALUE 3 START 3 CYCLE;

SELECT
    nextval('three');

-- ? sequence associated with a table column
-- Creating table
CREATE TABLE order_details(
    order_id SERIAL,
    -- Auto increment column, on which will apply custom sequence
    item_id INT NOT NULL,
    item_text VARCHAR NOT NULL,
    price DEC(10, 2) NOT NULL,
    PRIMARY KEY(order_id, item_id)
);

-- create new sequence and assigning it to particular column of a table
CREATE SEQUENCE order_item_id START 10 INCREMENT 10 MINVALUE 10 OWNED BY order_details.item_id;

-- insert sampe dataset to table without specifiying value of auto-incremnt column
INSERT INTO
    order_details(order_id, item_id, item_text, price)
VALUES
    (100, nextval('order_item_id'), 'DVD Player', 100),
    (100, nextval('order_item_id'), 'Android TV', 550),
    (100, nextval('order_item_id'), 'Speaker', 250);

-- project table
SELECT
    order_id,
    item_id,
    item_text,
    price
FROM
    order_details;

--  ?Listing all sequences in a database
SELECT
    relname sequence_name
FROM
    pg_class
WHERE
    relkind = 'S';