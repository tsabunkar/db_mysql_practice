-----------------!DATE---------------------

CREATE TABLE people
(
    name VARCHAR(50),
    birth_date DATE,
    birth_time TIME,
    birth_dt DATETIME
);

INSERT INTO people
    (name, birth_date, birth_time, birth_dt )
VALUES
    ('Tejas', '1994-09-12', '20:00:00', '1994-09-12 20:00:00');

INSERT INTO people
    (name, birth_date, birth_time, birth_dt )
VALUES
    ('Usha', '1987-08-15', '10:00:00', '1987-08-15 10:00:00');


---------------

-- CURDATE() - gives current date
-- CURTIME() - gives current time
-- NOW() - gives current datetime

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();


INSERT INTO people
    (name, birth_date, birth_time, birth_dt )
VALUES
    ('Shailesh', CURDATE(), CURTIME(), NOW());

-- !Formatting DATES:
--DAY()
--DAYNAME()
--DAYOFWEEK()
--DAYOFYEAR()

SELECT name, birth_date, DAY(birth_date) AS day, DAYNAME(birth_date) AS 'Day name',
    DAYOFWEEK(birth_date) AS 'Day of Week', DAYOFYEAR(birth_date) AS 'Day of year'
FROM people;

-- We can do on DATETIME column also

SELECT name, birth_dt, DAY(birth_dt) AS day, DAYNAME(birth_dt) AS 'Day name',
    DAYOFWEEK(birth_dt) AS 'Day of Week', DAYOFYEAR(birth_dt) AS 'Day of year'
FROM people;


SELECT name, MONTH(birth_dt), MONTHNAME(birth_dt)
FROM people;

SELECT name, HOUR(birth_time), MINUTE(birth_time)
FROM people;

/*
Converte -> "2017-04-21"  to  "April 21st 2017"
*/

SELECT CONCAT(MONTHNAME('2017-04-21'), ' ',DAY('2017-04-21'),  'st ',  YEAR('2017-04-21') ) As 'my format';

-- or using

SELECT DATE_FORMAT('2017-04-21', '%M %D %Y') As 'my format';

--Also,

SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W %M %Y') AS 'my format';
-- %W -> Week specifier, %M -> Month Specifier, %Y -> Year specifier

SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W-%M-%Y') AS 'my format';


SELECT DATE_FORMAT(birth_date, 'Was Born on %W')
FROM people;



/*
Converte -> "2017-04-21"  to  "04/21/2017"
*/

SELECT DATE_FORMAT('2017-04-21', '%m/%d/%y') As 'my format';


SELECT birth_date, DATE_FORMAT(birth_date, '%m/%d/%y') As 'my format'
FROM people;


SELECT birth_date, DATE_FORMAT(birth_date, '%m/%d/%y at %h:%m') As 'my format'
FROM people;


------------------! DATE MATH--------------------

-- !DATEDIFF() -> Gives the difference between two dates, it gives o/p as number of days

SELECT birth_date, DATEDIFF(NOW(), birth_date) AS 'difference'
FROM people;


-- !DATE_ADD(date, INTERVAL expression unit)

/* 

SELECT birth_dt, DATE_ADD(birth_dt, INTERVAL
1 MONTH) FROM people; 

*/
-- Adds one month to the birth_dt column values


/* 

SELECT birth_dt, DATE_ADD(birth_dt, INTERVAL
10 SECOND) FROM people;  

*/

/* 

SELECT birth_dt, DATE_ADD(birth_dt, INTERVAL
3 QUARTER) FROM people;  

*/


--! date + INTERVAL expression unit
--! date - INTERVAL expression unit

/* 

SELECT birth_dt, birth_dt + INTERVAL 1 MONTH
FROM people; 

*/

/* 

SELECT birth_dt, birth_dt - INTERVAL 5 MONTH 
FROM people;  

*/

/* 

SELECT birth_dt, birth_dt - INTERVAL 15 MONTH + INTERVAL 10 HOUR
FROM people; 

*/

----------------! TIMESTAMPS -------------------------
-- Timestamp is datatype in MySQL
-- DATETIME and TIMESTAMP are 2 data types in sql which used to store both date and time,
--  but differences are- 
--      DATETIME support range '1000-01-01 00:00:00' to '9999-12-31 23:59:59'
--      TIMESTAMP support range '1970-01-01 00:00:00' UTC to '2038-12-31 03:14:07' UTC

CREATE TABLE comments
(
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO comments
    (content)
VALUES
    ('It is great to work in Google');

INSERT INTO comments
    (content)
VALUES
    ('What is this article about');

INSERT INTO comments
    (content)
VALUES
    ('Article was greate');

SELECT *
FROM comments
ORDER BY created_at DESC;

-- If particular row is upated then when we want to update the timestamp :-

/* 

CREATE TABLE comments2
(
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
); 

*/

INSERT INTO comments2
    (content)
VALUES
    ('Blockchain');

INSERT INTO comments2
    (content)
VALUES
    ('Aritifical Intelligence');

INSERT INTO comments2
    (content)
VALUES
    ('DATA Scientist');

/* 
+-------------------------+---------------------+
| content                 | changed_at          |
+-------------------------+---------------------+
| Blockchain              | 2019-11-10 01:03:51 |
| Aritifical Intelligence | 2019-11-10 01:03:52 |
| DATA Scientist          | 2019-11-10 01:04:20 | 
+-------------------------+---------------------+
 */


UPDATE comments2 SET content='Data Scientist' WHERE content='DATA Scientist';
/* 
+-------------------------+---------------------+
| content                 | changed_at          |
+-------------------------+---------------------+
| Blockchain              | 2019-11-10 01:03:51 |
| Aritifical Intelligence | 2019-11-10 01:03:52 |
| Data Scientist          | 2019-11-10 01:06:34 | <=== (Row value updated, Also automatically timestamp)
+-------------------------+---------------------+
*/