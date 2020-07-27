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