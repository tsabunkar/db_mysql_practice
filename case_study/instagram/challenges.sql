/*
Problem 1:
We want to reward our users who have been around the longest.
Find the 5 oldest users.
*/

/* 

SELECT *
FROM users
ORDER BY created_at
LIMIT 5;

*/

----------------------------

/*
Problem 2:
What day of the week do most users register on ?
We need to figure out when to schedule an ad campgain
*/

SELECT DAYNAME(created_at) AS dayname, DAYOFWEEK(created_at) AS 'Day of Week'
FROM users;

SELECT DAYNAME(created_at) AS dayname, DAYOFWEEK(created_at) AS 'Day of Week', COUNT(*)
FROM users
GROUP BY dayname;

SELECT DAYNAME(created_at) AS dayname, DAYOFWEEK(created_at) AS 'Day of Week', COUNT(*) AS count
FROM users
GROUP BY dayname
ORDER BY count DESC;

/* 

SELECT DAYNAME(created_at) AS dayname, COUNT(*) AS count
FROM users
GROUP BY dayname
ORDER BY count DESC
LIMIT 2; 

*/

----------------------------

/*
Problem 3: 
We want to target our inactive users with an email campaign.
Find the users who have never posted a photo
*/

/* 

DESC users;
DESC photos; 

*/

SELECT *
FROM users u LEFT JOIN photos p
    ON u.uid = p.user_id;


SELECT *
FROM users u LEFT JOIN photos p
    ON u.uid = p.user_id
WHERE p.pid IS NULL;


SELECT username
FROM users u LEFT JOIN photos p
    ON u.uid = p.user_id
WHERE p.pid IS NULL;