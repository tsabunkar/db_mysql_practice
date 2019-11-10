-- find the orders made by George

SELECT *
FROM customers
WHERE last_name = 'George';

SELECT *
FROM orders
WHERE customer_id = 1;

-- !using sub-query

SELECT *
FROM orders
WHERE customer_id = (
    SELECT id
FROM customers
WHERE last_name = 'George'
);

-- How to see the same for all the records of both the tables as single project ?
-- Using JOINS

-------------------! CROSS JOIN ----------------------------
-- CROSS JOIN / CARTESIAN JOIN
-- Take every parent record and multiples with child records
-- does not give any useful data 

SELECT *
FROM customers, orders;

SELECT *
FROM orders, customers;

-- ORDER of writting the table matters!!

-------------------! INNER JOIN ----------------------------
-- Select all the records from A and B where the join condition is met

-- *IMPLICIT INNER JOIN

SELECT *
FROM customers, orders
WHERE customers.id = orders.customer_id;

-- or

SELECT *
FROM customers c, orders o
WHERE c.id = o.customer_id;
-- here, 'c' is alias name of customer table and 'o' is the alias name of orders table

-- or

SELECT *
FROM customers, orders
WHERE customers.id = customer_id;



-- *EXPLICIT INNER JOIN

SELECT *
FROM customers JOIN orders
    ON customers.id = orders.customer_id;

-- or 

SELECT *
FROM customers INNER JOIN orders
    ON customers.id = orders.customer_id;

/* 
customers
+----+------------+-----------+------------------+
| id | first_name | last_name | email            |
+----+------------+-----------+------------------+
|  1 | Boy        | George    | george@gmail.com |
|  2 | George     | Michael   | gm@gmail.com     |
|  3 | David      | Bowie     | david@gmail.com  |
|  4 | Blue       | Steele    | blue@gmail.com   |
|  5 | Bette      | Davis     | bette@aol.com    |
+----+------------+-----------+------------------+

orders
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
|  3 | 2014-12-12 | 800.67 |           2 |
|  4 | 2015-01-03 |  12.50 |           2 |
|  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+--------+-------------+

INNER JOIN
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+

*/

-- !ORDER of writting tables matter
SELECT *
FROM orders INNER JOIN customers
    ON customers.id = orders.customer_id;

/* 
+----+------------+--------+-------------+----+------------+-----------+------------------+
| id | order_date | amount | customer_id | id | first_name | last_name | email            |
+----+------------+--------+-------------+----+------------+-----------+------------------+
|  1 | 2016-02-10 |  99.99 |           1 |  1 | Boy        | George    | george@gmail.com |
|  2 | 2017-11-11 |  35.50 |           1 |  1 | Boy        | George    | george@gmail.com |
|  3 | 2014-12-12 | 800.67 |           2 |  2 | George     | Michael   | gm@gmail.com     |
|  4 | 2015-01-03 |  12.50 |           2 |  2 | George     | Michael   | gm@gmail.com     |
|  5 | 1999-04-11 | 450.25 |           5 |  5 | Bette      | Davis     | bette@aol.com    |
+----+------------+--------+-------------+----+------------+-----------+------------------+
*/

-- NOIE: If we do ARBITARAY JOIN - please don't do this (Joining by pk for both parent and child table)
SELECT *
FROM customers INNER JOIN orders
    ON customers.id = orders.id;

-- other example
SELECT *
FROM customers INNER JOIN orders
    ON customers.id = orders.customer_id
ORDER BY amount;

-- group all the orders who ordered them and get the total amount spent
SELECT *, SUM(amount), COUNT(*)
FROM customers INNER JOIN orders
    ON customers.id = orders.customer_id
GROUP BY email
ORDER BY amount;

SELECT *, SUM(amount) AS 'total spent', COUNT(*)
FROM customers INNER JOIN orders
    ON customers.id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY amount;

-------------------! LEFT JOIN ----------------------------
-- Select everything From A, along with any matching record in B

SELECT *
FROM customers LEFT JOIN orders
    ON customers.id = orders.customer_id;
-- All the records of customers table and also matching record (based on condition) from orders table
-- Customer table is on left and Orders table at right as per above query
-- ? LEFT JOIN = INNER JOIN + EVERY RECORD FROM LEFT TABLE

/* 
customers
+----+------------+-----------+------------------+
| id | first_name | last_name | email            |
+----+------------+-----------+------------------+
|  1 | Boy        | George    | george@gmail.com |
|  2 | George     | Michael   | gm@gmail.com     |
|  3 | David      | Bowie     | david@gmail.com  |
|  4 | Blue       | Steele    | blue@gmail.com   |
|  5 | Bette      | Davis     | bette@aol.com    |
+----+------------+-----------+------------------+

orders
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
|  3 | 2014-12-12 | 800.67 |           2 |
|  4 | 2015-01-03 |  12.50 |           2 |
|  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+--------+-------------+


Left join
+----+------------+-----------+------------------+------+------------+--------+-------------+
| id | first_name | last_name | email            | id   | order_date | amount | customer_id |
+----+------------+-----------+------------------+------+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |    1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |    2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |    3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |    4 | 2015-01-03 |  12.50 |           2 |
|  3 | David      | Bowie     | david@gmail.com  | NULL | NULL       |   NULL |        NULL |
|  4 | Blue       | Steele    | blue@gmail.com   | NULL | NULL       |   NULL |        NULL |
|  5 | Bette      | Davis     | bette@aol.com    |    5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+------+------------+--------+-------------+
*/

-- Problem : Find out how much each of the customer has spent, if they have no spent anything then Show text
-- as 'COUPON'

SELECT first_name, last_name, amount
FROM customers
    LEFT JOIN orders
    ON customers.id = orders.customer_id;


SELECT first_name, last_name, amount,
    CASE
        WHEN amount IS NULL THEN 'Yes, Coupon Required'
        ELSE 'Not Required'
    END AS 'Do you require Coupon ?'
FROM customers
    LEFT JOIN orders
    ON customers.id = orders.customer_id;


SELECT first_name, last_name, amount,
    CASE
        WHEN amount IS NULL THEN 'Yes, Coupon Required'
        ELSE 'Not Required'
    END AS 'Do you require Coupon ?'
FROM customers
    LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id;


SELECT first_name, last_name, amount, SUM(amount),
    CASE
        WHEN SUM(amount) IS NULL THEN 'Yes, Coupon Required'
        ELSE 'Not Required'
    END AS 'Do you require Coupon ?'
FROM customers
    LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id;

-- or

SELECT first_name, last_name, amount, SUM(amount),
    IFNULL(SUM(amount), 'Yes, Coupon Required') AS 'Do you require Coupon ?'
FROM customers
    LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id;

-- ! IFNULL(firstArgs, secondArgs)
--  firstArgs is the column or condition to check weather its value is null ?
-- If its value is null then value to be replaced with is mentioned in secondArgs



-------------------! RIGHT JOIN ----------------------------
-- Select everything From B, along with any matching record in A

SELECT *
FROM customers RIGHT JOIN orders
    ON customers.id = orders.customer_id;
-- All the records of orders table and also matching record (based on condition) from customers table
-- Customer table is on left and Orders table at right as per above query
-- ? RIGHT JOIN = INNER JOIN + EVERY RECORD FROM RIGHT TABLE

/* 
customers
+----+------------+-----------+------------------+
| id | first_name | last_name | email            |
+----+------------+-----------+------------------+
|  1 | Boy        | George    | george@gmail.com |
|  2 | George     | Michael   | gm@gmail.com     |
|  3 | David      | Bowie     | david@gmail.com  |
|  4 | Blue       | Steele    | blue@gmail.com   |
|  5 | Bette      | Davis     | bette@aol.com    |
+----+------------+-----------+------------------+

orders
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
|  3 | 2014-12-12 | 800.67 |           2 |
|  4 | 2015-01-03 |  12.50 |           2 |
|  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+--------+-------------+

RIGHT JOIN
+------+------------+-----------+------------------+----+------------+--------+-------------+
| id   | first_name | last_name | email            | id | order_date | amount | customer_id |
+------+------------+-----------+------------------+----+------------+--------+-------------+
|    1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|    1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|    2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|    2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|    5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+------+------------+-----------+------------------+----+------------+--------+-------------+
*/



---!  ON DELETE CASCADE
-- If we delete parent record, we want also wants its child reference record to be deleted

/* 

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE CASCADE
);  

*/


-- !NOTE : Left Join is same as Right Join if order of table are swapped (Even true for vice-versa)

SELECT *
FROM customers LEFT JOIN orders
    ON customers.id = orders.customer_id;
-- Above left join is same as below right join, if order of the tables are shuffled
SELECT *
FROM orders RIGHT JOIN customers
    ON customers.id = orders.customer_id;



SELECT *
FROM customers RIGHT JOIN orders
    ON customers.id = orders.customer_id;
-- Above right join is same as below left join, if order of the tables are shuffled
SELECT *
FROM orders LEFT JOIN customers
    ON customers.id = orders.customer_id;
