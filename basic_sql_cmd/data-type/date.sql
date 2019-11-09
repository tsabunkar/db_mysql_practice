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