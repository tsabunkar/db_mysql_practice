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