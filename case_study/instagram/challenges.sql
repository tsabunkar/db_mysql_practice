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

----------------------------

/*
Problem 4:
We're running a new contest to see who can get the most likes on a single photo.
WHO WON ??
*/

SELECT *
FROM likes;

-- I need to know user who has got most likes on a single photo


-- subtask-1: find most number of likes on a single photo

SELECT *, COUNT(*)
FROM likes
GROUP BY photo_id;

SELECT *, COUNT(*)
FROM likes
GROUP BY photo_id;


SELECT *, COUNT(*) count
FROM likes
GROUP BY photo_id
ORDER BY count DESC;

-- !NOTE : The above userId is not the actual user id which has maximum number of likes for its photo
-- !bcoz : when we run below query, we have 48 uid for this pid = 145

SELECT *
FROM likes
WHERE photo_id = 145;

-- NOW we need to find which uid has max no of likes in pid=145

SELECT *
FROM photos
WHERE pid =145;

-- from above query we know that its uid is 52;

SELECT *
FROM users
WHERE uid = 52;

/* 

SELECT *, COUNT(*) count
FROM likes
GROUP BY photo_id
ORDER BY count DESC
LIMIT 1;

*/


------Next try


SELECT *, COUNT(*)
FROM likes l INNER JOIN photos p
    ON l.photo_id = p.pid
GROUP BY pid;

SELECT *, COUNT(*)
FROM likes l INNER JOIN photos p
    ON l.photo_id = p.pid
GROUP BY pid
ORDER BY COUNT(*) DESC;

SELECT *, COUNT(*)
FROM likes l INNER JOIN photos p
    ON l.photo_id = p.pid
    INNER JOIN users u
    ON p.user_id = u.uid
GROUP BY pid
ORDER BY COUNT(*) DESC;

/* 

SELECT username
FROM likes l INNER JOIN photos p
    ON l.photo_id = p.pid
    INNER JOIN users u
    ON p.user_id = u.uid
GROUP BY pid
ORDER BY COUNT(*) DESC
LIMIT 1; 

*/