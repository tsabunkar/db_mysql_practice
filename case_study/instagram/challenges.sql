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


----------------------------

/*
Problem 5:
Our Investors want to know..
How many times does the average user post ?
*/

SELECT *
FROM users;

SELECT *
FROM photos;


SELECT *, COUNT(*)
FROM photos
GROUP BY user_id;


SELECT AVG(COUNT(*))
FROM photos
GROUP BY user_id;

-- !Above query will thorugh an error [ to query AVG(COUNT) can be done by ] :-

-- total number of photos / total number of users

SELECT COUNT(*)
FROM photos;

SELECT COUNT(*)
FROM users;

SELECT (
    (SELECT COUNT(*)
    FROM photos)
    /
    ( SELECT COUNT(*)
    FROM users) 
) AS 'Avg';


----------------------------

/*
Problem 6:
A brand wants to know which hashtags to use in a post
What are the top 5 most commonly used hashtags ?
*/

SELECT *
FROM tags;

SELECT *
FROM photo_tags;

/* DESC tags;
DESC photo_tags; */

SELECT *
FROM tags t INNER JOIN photo_tags pt
    ON t.tid = pt.tag_id;

SELECT *, COUNT(*)
FROM tags t INNER JOIN photo_tags pt
    ON t.tid = pt.tag_id
GROUP BY t.tid;

/* 

SELECT *, COUNT(*)
FROM tags t INNER JOIN photo_tags pt
    ON t.tid = pt.tag_id
GROUP BY t.tid
ORDER BY COUNT(*) DESC
LIMIT 5; 

*/


/* 

SELECT tag_name
FROM tags t INNER JOIN photo_tags pt
    ON t.tid = pt.tag_id
GROUP BY t.tid
ORDER BY COUNT(*) DESC
LIMIT 5; 

*/


----------------------------

/*
Problem 7:
We have a small problem with bots on our site ..
Find users who have liked every single photo on the site
*/

SELECT *
FROM likes l INNER JOIN photos p
    ON l.photo_id = p.pid
    INNER JOIN users u
    ON l.user_id = u.uid;

SELECT DISTINCT pid
FROM photos;

SELECT DISTINCT username
FROM likes l INNER JOIN photos p
    ON l.photo_id = p.pid
    INNER JOIN users u
    ON l.user_id = u.uid;
-- 77rows

SELECT username
FROM users;
-- 100 rows


SELECT DISTINCT username
FROM likes l INNER JOIN photos p
    ON l.photo_id = p.pid
    INNER JOIN users u
    ON l.user_id = u.uid
ORDER BY username;


---- Actual answer

SELECT username, COUNT(*) AS num_likes
FROM users u
    INNER JOIN likes l
    ON u.uid = l.user_id
GROUP BY l.user_id;

-- now Want all the users who has done all the likes i.e-257

/* SELECT username, COUNT(*) AS num_likes
FROM users u
    INNER JOIN likes l
    ON u.uid = l.user_id
GROUP BY l.user_id
WHERE num_likes = 257; */

-- !In above query where cannot be used to filter the grouped column, so we should use HAVING clause

SELECT username, COUNT(*) AS num_likes
FROM users u
    INNER JOIN likes l
    ON u.uid = l.user_id
GROUP BY l.user_id
HAVING num_likes = 257;

-- !not to hardcode 257, lets write sub-query

/* SELECT COUNT(*) AS num_likes
FROM users u
    INNER JOIN likes l
    ON u.uid = l.user_id
GROUP BY l.user_id
ORDER BY num_likes DESC
LIMIT 1;
 */

-- *or

SELECT COUNT(*)
FROM photos;


SELECT username, COUNT(*) AS num_likes
FROM users u
    INNER JOIN likes l
    ON u.uid = l.user_id
GROUP BY l.user_id
HAVING num_likes = (
SELECT COUNT(*)
FROM photos
);