---------------!LIMIT---------------
-- Restrict number of records
-- Used mainly in pagination

/* 

SELECT *
FROM books
LIMIT 3; 

*/

/* 

SELECT *
FROM books
LIMIT 100; 

*/
-- if limit is more than the number of records, then we will only get number of records

/* 

SELECT *
FROM books
ORDER BY released_year DESC
LIMIT 5; 

*/

-- !ORDER BY comes first then LIMT
-- limit is the last clause in the selection query

/* 

SELECT *
FROM books
ORDER BY released_year DESC
LIMIT 0,5; 

 */

-- With Limit we can specifiy the range-> Starting Point and the number of records to Project
-- !LIMIT startingPoint, NumberOfRecordsToProject
-- StartingPoint -> Starts with 0 (which is the first record)


/* 

SELECT *
FROM books
LIMIT 3,2;

*/
-- Project 4th and 5th records

/* 

SELECT *
FROM books
LIMIT 3, 684768465411875454; 

*/
-- Gives all the records from the 4th record