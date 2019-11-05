-----------UPDATE CMD----------

-- Update/alter the existing data

-- Update rows in table 'TableName'
UPDATE cats
SET
   breed = 'Shorthairs'
    -- add more columns and values here
WHERE breed='Shorsthair'
/* add search conditions here */


SELECT *
FROM cats
WHERE name ='Misty';


UPDATE cats SET age=15
WHERE name='Misty';


--- Problem
/*
- Change Jackson name to jack
- Change Ringo's breed to British Shorthiar
- Update both Maine Coons ages to be 12
*/

SELECT *
FROM cats
WHERE name='Jackson';


UPDATE cats SET name='jack'
WHERE name='Jackson';

-----

SELECT *
FROM cats
WHERE name='Ringo';

UPDATE cats SET breed='British Shorthiar'
WHERE name='Ringo';

-----

SELECT *
FROM cats
WHERE breed='Maine Coon';

UPDATE cats SET age=12
WHERE breed='Maine Coon';