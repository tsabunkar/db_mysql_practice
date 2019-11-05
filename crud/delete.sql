---------------DELETE CMD----------------

DELETE FROM cats WHERE name='Egg';
-- Before deleting make sure your deleting the correct record, bcoz we cannot undo

SELECT *
FROM cats
WHERE name='Egg';

-- !NOTE:
-- Id which was generated using AUTO_INCREMENT will not be re-order/re-calculated
-- for ex- Above delete record had id as - 4, when deleted the below rows will not be reordered

SELECT *
FROM cats
WHERE cat_id =4;


DELETE FROM cats;
-- It will delete all the data/rows, but the table would be still there

DROP TABLE cats;
-- It will delete all the data/rows and also the meta-data/column names


---- Problem
/*
- Delete all cats with 4years old
- Delete cats whose age is the same as their cat_id
- Delete all cats
*/

DELETE FROM cats WHERE age=4;

DELETE FROM cats WHERE age = cat_id;

DELETE FROM cats;