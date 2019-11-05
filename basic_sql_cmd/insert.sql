-----------INSERT CMD-----------
/* INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...); */

-- NOTE: Insertion order matters

INSERT INTO cats
    (name, age)
VALUES
    ('Kash', 1);

INSERT INTO cats
    (age, name)
VALUES
    (2, 'Dolly');


SELECT *
FROM cats;

-- !Multiple Insert

/*
INSERT INTO table_name (column1, column2, column3, ...)
VALUES 
     (value1, value2, value3, ...),
     (value1, value2, value3, ...),
     (value1, value2, value3, ...);
*/

INSERT INTO cats
    (name,age)
VALUES
    ('peanut', 2),
    ('roy', 1);


--!SHOW WARNINGS;
-- Shows the warnings/errors happened

INSERT INTO cats
    (name,age)
VALUES
    ('If you are adding values for all the columns of the table', 1);

INSERT INTO cats
    (name,age)
VALUES
    ('Ram Sham', 'Sita');


-- Problem:
/*
Create a people table
 - first_name - 20 char limit
 - last_name - 20 char limit
 - age

 Insert the first person : Tina Belcher who is 13 years old
 Bob Belcher who is 18 years old

 Do multiple insert 
 Linda Belcher 45
 philip frond 38
 Calvin Fischoeder 70
*/

CREATE TABLE people
(
    first_name VARCHAR (20),
    last_name VARCHAR (20),
    age INT
);

INSERT INTO people
    (first_name, last_name, age)
VALUES
    ('
Tina', 'Belcher', 13);


INSERT INTO people
    (last_name, age, first_name )
VALUES
    ( 'Belcher', 18, 'Bob');



INSERT INTO people
    (first_name, last_name, age)
VALUES
    ( 'Linda', 'Belcher', 45),
    ( 'philip', 'frond', 38),
    ( 'Calvin', 'Fischoeder', 70);


SELECT *
FROM people;