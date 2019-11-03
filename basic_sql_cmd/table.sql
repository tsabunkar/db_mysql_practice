----------------TABLES CMD---------------------

-- Challenge Problem :
/*  
Create a tweets table which has columns as 
 - A username (max 15 chars)
 - The tweet content (max 140 chars)
 - Number of favorited
 */

CREATE DATABASE practice;
USE practice;

/* CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
); */

-- Create the table in the specified schema
CREATE TABLE practice.tweets
(
    username VARCHAR (15) NOT NULL,
    tweet VARCHAR (140) NOT NULL,
    favorited INT
);


/* INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...); */


-- Insert rows into table 'TableName'
INSERT INTO tweets
    ( -- columns to insert data into
    username, tweet, favorited
    )
VALUES
    ( -- first row: values for the columns in the list above
        'Tejas', 'Hello SQL', 24
),
    ( -- second row: values for the columns in the list above
        'Usha', 'I am new to programming', 2
);

SELECT *
FROM tweets;


--------------

-- !SHOW TABLES;
-- Shows all the tables in that db

-- !SHOW COLUMNS FROM <table_name>
-- List all the columns name and its datatype for the mentioned table
-- ex - SHOW COLUMNS FROM tweets;
-- or ==> DESC <table_name>   (Describe table)

-- !DROP TABLE <table_name>
-- Delete the particular table
DROP TABLE tweets;


--------------


-- Challenge Problem :
/*  
Create a pastries table
 - It should include 2 columns: name and quantity. Name is 50 characters max.
 - Inspect you table/columns in the CLI
 - Delete your table
 */

CREATE TABLE pastries
(
    name VARCHAR (140) NOT NULL,
    quantity INT
);

-- DESC pastries;

DROP TABLE  pastries;