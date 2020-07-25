---------------------------------------------------------
--------------------! UNION -----------------------------
-- ? NOTE: each UNION query must have the same number of columns
SELECT
    *
FROM
    category
UNION
SELECT
    *
FROM
    language;

-- ? UNION ALL
-- ? Using UNION ALL operator - duplicate row is also retained in the result set
SELECT
    *
FROM
    category
UNION
ALL
SELECT
    *
FROM
    language;

---------------------------------------------------------
--------------------! INTERSECT -----------------------------
SELECT
    *
FROM
    category
INTERSECT
SELECT
    *
FROM
    language;

---------------------------------------------------------
--------------------! EXCEPT -----------------------------
SELECT
    *
FROM
    category
EXCEPT
SELECT
    *
FROM
    language;

---------------------------------------------------------
--------------------! GROUPING SETS -----------------------------
SELECT
    rating,
    length
FROM
    film
GROUP BY
    (rating, length);

SELECT
    GROUPING(rating) as grouping_rating,
    GROUPING(length) as grouping_length,
    rating,
    length
FROM
    film
GROUP BY
    GROUPING SETS((rating), (length));

---------------------------------------------------------
--------------------! CUBE-----------------------------
SELECT
    GROUPING(rating) as grouping_rating,
    GROUPING(length) as grouping_length,
    rating,
    length
FROM
    film
GROUP BY
    CUBE((rating), (length));

---------------------------------------------------------
--------------------! ROLLUP-----------------------------
SELECT
    EXTRACT (
        YEAR
        FROM
            rental_date
    ) y,
    EXTRACT (
        MONTH
        FROM
            rental_date
    ) M,
    EXTRACT (
        DAY
        FROM
            rental_date
    ) d,
    COUNT (rental_id)
FROM
    rental
GROUP BY
    ROLLUP (
        EXTRACT (
            YEAR
            FROM
                rental_date
        ),
        EXTRACT (
            MONTH
            FROM
                rental_date
        ),
        EXTRACT (
            DAY
            FROM
                rental_date
        )
    );

---------------------------------------------------------
--------------------! SUB_QUERY-----------------------------
-- ? find the films whose rental rate is higher than the average 
-- ? rental rate
SELECT
    rental_rate
FROM
    film
GROUP BY
    rental_rate;

SELECT
    AVG (rental_rate)
FROM
    film;

-- 2.9800000000000000
SELECT
    COUNT(*)
FROM
    film
WHERE
    rental_rate > 2.9800000000000000;

-- if you don't want to hardcode
SELECT
    COUNT (*)
FROM
    film
WHERE
    rental_rate > (
        --  !query inside the brackets is called a subquery or an inner query
        SELECT
            AVG (rental_rate)
        FROM
            film
    );

-- ? subquery with IN operator
-- 1:1 (b/w inventory and rental)
SELECT
    inventory.film_id
FROM
    rental
    INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE
    return_date BETWEEN '2005-05-29'
    AND '2005-05-30';

SELECT
    film_id,
    title
FROM
    film
WHERE
    film_id IN (
        SELECT
            inventory.film_id
        FROM
            rental
            INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
        WHERE
            return_date BETWEEN '2005-05-29'
            AND '2005-05-30'
    );

-- ? subquery with EXISTS operator
-- check if customer_id exist in payment table, if so then then project that row
SELECT
    first_name,
    last_name
FROM
    customer
WHERE
    EXISTS (
        SELECT
            1
        FROM
            payment
        WHERE
            payment.customer_id = customer.customer_id
    );

---------------------------------------------------------
--------------------! ANY -----------------------------
SELECT
    MAX(length)
FROM
    film
    INNER JOIN film_category USING(film_id)
GROUP BY
    category_id;

-- ? finds the films whose lengths are greater than or equal to the
-- ? maximum length of any film category
SELECT
    title
FROM
    film
WHERE
    length >= ANY(
        SELECT
            MAX(length)
        FROM
            film
            INNER JOIN film_category USING(film_id)
        GROUP BY
            category_id
    );

-- ? ANY vs. IN
SELECT
    title,
    category_id
FROM
    film
    INNER JOIN film_category USING(film_id)
WHERE
    category_id = ANY(
        SELECT
            category_id
        FROM
            category
        WHERE
            NAME = 'Action'
            OR NAME = 'Drama'
    );

-- same result using IN operator
SELECT
    title,
    category_id
FROM
    film
    INNER JOIN film_category USING(film_id)
WHERE
    category_id IN (
        SELECT
            category_id
        FROM
            category
        WHERE
            NAME = 'Action'
            OR NAME = 'Drama'
    );

---------------------------------------------------------
--------------------! ALL -----------------------------
-- ?  average lengths of all films grouped by film rating
SELECT
    ROUND(AVG(length), 2) avg_length
FROM
    film
GROUP BY
    rating
ORDER BY
    avg_length DESC;

-- ? find all films whose lengths are greater than the list of the average lengths
SELECT
    film_id,
    title,
    length
FROM
    film
WHERE
    length > ALL (
        SELECT
            ROUND(AVG (length), 2)
        FROM
            film
        GROUP BY
            rating
    )
ORDER BY
    length;

---------------------------------------------------------
--------------------! EXISTS -----------------------------
-- ? Find customers who have at least one payment whose amount is greater than 11.
SELECT
    (c.first_name || ' ' || c.last_name) as name
FROM
    customer as c
    INNER JOIN payment as p USING (customer_id)
WHERE
    p.amount > 11
ORDER BY
    name;

SELECT
    (c.first_name || ' ' || c.last_name) as name
FROM
    customer as c
WHERE
    EXISTS (
        SELECT
            1
        FROM
            payment as p
        WHERE
            amount > 11
            AND c.customer_id = p.customer_id
    )
ORDER BY
    name;

-- ? NOT EXISTS is opposite to EXISTS
SELECT
    (c.first_name || ' ' || c.last_name) as name
FROM
    customer as c
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            payment as p
        WHERE
            amount > 11
            AND c.customer_id = p.customer_id
    )
ORDER BY
    name;

-- ? EXISTS and NULL
-- ? Technique to Check not null  values exist in the row
SELECT
    (c.first_name || ' ' || c.last_name) as name
FROM
    customer as c
WHERE
    NOT EXISTS (
        SELECT
            NULL
    )
ORDER BY
    name;

---------------------------------------------------------
--------------------! CTE -----------------------------
WITH cte_film AS (
    SELECT
        film_id,
        title,
        (
            CASE
                WHEN length < 30 THEN 'Short'
                WHEN length < 90 THEN 'Medium'
                ELSE 'Long'
            END
        ) length
    FROM
        film
)
SELECT
    film_id,
    title,
    length
FROM
    cte_film
WHERE
    length = 'Long'
ORDER BY
    title;

-- ? Joining a CTE with a table
WITH cte_rental AS (
    SELECT
        staff_id,
        COUNT(rental_id) rental_count
    FROM
        rental
    GROUP BY
        staff_id
)
SELECT
    s.staff_id,
    first_name,
    last_name,
    rental_count
FROM
    staff s
    INNER JOIN cte_rental USING (staff_id);

-- ?  CTE with a window function
WITH cte_film AS (
    SELECT
        film_id,
        title,
        rating,
        length,
        RANK() OVER (
            PARTITION BY rating
            ORDER BY
                length DESC
        ) length_rank
    FROM
        film
)
SELECT
    *
FROM
    cte_film
WHERE
    length_rank = 1;

---------------------------------------------------------
--------------------! recursive query ----------------------
-- https://www.postgresqltutorial.com/postgresql-recursive-query/
SELECT
    *
FROM
    employees;

WITH RECURSIVE subordinates AS (
    SELECT
        employee_id,
        manager_id,
        full_name
    FROM
        employees
    WHERE
        employee_id = 2
    UNION
    SELECT
        e.employee_id,
        e.manager_id,
        e.full_name
    FROM
        employees e
        INNER JOIN subordinates s ON s.employee_id = e.manager_id
)
SELECT
    *
FROM
    subordinates;

---------------------------------------------------------
--------------------! db transaction ----------------------
-- Create accounts table
-- DROP TABLE accounts IF EXISTS;
CREATE TABLE accounts (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    balance DEC(15, 2) NOT NULL,
    PRIMARY KEY(id)
);

-- ? Begin a transaction
BEGIN;

-- BEGIN TRANSACTION; or BEGIN WORK; or BEGIN;
-- To start a transaction explicitly
INSERT INTO
    accounts(name, balance)
VALUES
    ('Bob', 10000);

-- ? Check if the Transaction is inserted into accounts table ?
SELECT
    id,
    name,
    balance
FROM
    accounts;

-- ? Commit a transaction
-- ! Inorder To make above insertion visible, you need to commit the 
-- ! transaction by using the COMMIT WORK statement:
BEGIN;

INSERT INTO
    accounts(name, balance)
VALUES
    ('Bob', 10000);

COMMIT;

--COMMIT TRANSACTION; or COMMIT WORK; or  COMMIT;
-- ? Now check if the above transcation is inserted ;)
SELECT
    id,
    name,
    balance
FROM
    accounts;

-- ? Another Example: 
-- start a transaction
BEGIN;

-- insert a new row into the accounts table
INSERT INTO
    accounts(name, balance)
VALUES
    ('Alice', 10000);

-- commit the change (or roll it back later)
COMMIT;

SELECT
    id,
    name,
    balance
FROM
    accounts;

-- ? Another example with UPDATE
-- start a transaction
BEGIN;

-- deduct 1000 from account 1
UPDATE
    accounts
SET
    balance = balance - 1000
WHERE
    id = 1;

-- add 1000 to account 2
UPDATE
    accounts
SET
    balance = balance + 1000
WHERE
    id = 2;

-- commit the transaction
COMMIT;

-- select the data from accounts
SELECT
    id,
    name,
    balance
FROM
    accounts;

-- ? Rolling back a transaction
-- ROLLBACK TRANSACTION; or ROLLBACK WORK; or ROLLBACK;
-- ?example for rollback scenario
INSERT INTO
    accounts(name, balance)
VALUES
    ('Jack', 0);

-- !Now suppose Bob wants to send 1500 to Alice but by mistake he send to Jack
BEGIN;

-- subtract an amount from Bob’s account
UPDATE
    accounts
SET
    balance = balance - 1500
WHERE
    id = 1;

-- Assuming that- adding the same amount to Alice’s account, 
-- but by mistake added to Jack account id = 3
UPDATE
    accounts
SET
    balance = balance + 1500
WHERE
    id = 3;

-- To undo the change, you execute the ROLLBACK statement:
ROLLBACK;

-- !NOTE: You were able to rollback bcoz- the Transaction was NOT COMMIT
-- Check all bank balance
SELECT
    id,
    name,
    balance
FROM
    accounts;