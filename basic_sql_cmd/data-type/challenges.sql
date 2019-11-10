/*
Problem 1
Print out the current time
*/

SELECT CURTIME();

/*
Problem 2
Print out the current Date
*/

SELECT CURDATE();

/*
Problem 3
Print out the current day of the week (Day Number)
*/

SELECT DAYOFWEEK(CURDATE());
-- or
SELECT DAYOFWEEK(NOW());
-- or
SELECT DATE_FORMAT(NOW(), '%w') + 1;


/*
Problem 4
Print out the current day of the week (Day Name)
*/

SELECT DAYNAME(CURDATE());
-- or
SELECT DATE_FORMAT(NOW(), '%W');
/*
Problem 5
Print out the current day and time using this format : mm/dd/yyyy
*/

SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');

/*
Problem 5
Print out the current day and time using this format : January 2nd at 3:15
*/

SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

/*
Problem 6 
Create a tweets table that stores:
- The tweet content
- A username
- Time it was create
*/
CREATE TABLE tweets
(
    tweets_content VARCHAR(100),
    username VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- or
CREATE TABLE tweets
(
    tweets_content VARCHAR(100),
    username VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW()
);


INSERT INTO tweets
    (tweets_content, username)
VALUES
    ('this is my first tweet', 'tsabunkar');

INSERT INTO tweets
    (tweets_content, username)
VALUES
    ('who are you ?', 'usha-sabunkar');