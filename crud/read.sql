
------------------------------------

DROP TABLE practice.cats;
/* 

CREATE TABLE cats 
(
    cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR (100),
    breed VARCHAR (100),
    age INT
); 

*/

INSERT INTO cats
    (name, breed, age)
VALUES
    ('Ringo', 'Tabby', 4),
    ('Cindy', 'Maine Coon', 10),
    ('Dumbledore', 'Maine Coon', 11),
    ('Egg', 'Persian', 4),
    ('Misty', 'Tabby', 13),
    ('George Michael', 'Ragdoll', 9),
    ('Jackson', 'Sphynx', 7);

----------------Read CMD--------------------

SELECT *
FROM cats;
-- here * -> means 'Gives all the columns'



-- SELECT Expression

SELECT name
FROM cats;

SELECT age, name
FROM cats;

SELECT age, name, 'Tejas'
FROM cats;
-- Gives the 3rd columns as Column name : Tejas and Value as : Tejas

SELECT age, name, 1
FROM cats;

SELECT *
FROM cats
WHERE age =4;

--! WHERE CLAUSE VALUE is case incensitive
SELECT *
FROM cats
WHERE name ='EGG';

SELECT *
FROM cats
WHERE name ='egg';

SELECT *
FROM cats
WHERE name ='EgG';

--- !Problem:
/* 
- Select only cat_id column
- Select only name and breed column
- Select name and age and breed = tabby/Shorthairs
- Select cat_id as same as age
 */

SELECT cat_id
FROM cats;

SELECT name, breed
FROM cats;

SELECT name, age, breed
FROM cats
WHERE breed="Shorthairs";


SELECT cat_id, age
FROM cats
WHERE cat_id = age;
-- In WHERE caluse can have left and right operands as column name also :)


--- Alias

SELECT cat_id AS ID, name
FROM cats;

SELECT cat_id AS 'ID', name
FROM cats;

-- Alias name can be in single quotes as well

SELECT cat_id AS ID, name, 1 as One
FROM cats;