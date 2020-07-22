-------------------------------------------------
--------------!INNER JOIN------------------------
SELECT
    customer.customer_id,
    first_name,
    last_name,
    amount,
    payment_date
FROM
    customer
    INNER JOIN payment ON payment.customer_id = customer.customer_id
ORDER BY
    payment_date;

SELECT
    c.customer_id,
    c.first_name customer_first_name,
    c.last_name customer_last_name,
    s.first_name staff_first_name,
    s.last_name staff_last_name,
    amount,
    payment_date
FROM
    customer c
    INNER JOIN payment p ON p.customer_id = c.customer_id
    INNER JOIN staff s ON p.staff_id = s.staff_id
ORDER BY
    payment_date;

-- ? Instead of ON --> USING
SELECT
    c.customer_id,
    c.first_name customer_first_name,
    c.last_name customer_last_name,
    s.first_name staff_first_name,
    s.last_name staff_last_name,
    amount,
    payment_date
FROM
    customer c
    INNER JOIN payment p USING (customer_id)
    INNER JOIN staff s USING(staff_id)
ORDER BY
    payment_date;

-------------------------------------------------
--------------!LEFT JOIN------------------------
-- ?LEFT OUTER JOIN
SELECT
    film.film_id,
    title,
    inventory_id
FROM
    film
    LEFT JOIN inventory ON inventory.film_id = film.film_id
ORDER BY
    title;

-- ? LEFT INNER JOIN
SELECT
    film.film_id,
    title,
    inventory_id
FROM
    film
    LEFT JOIN inventory ON inventory.film_id = film.film_id
WHERE
    inventory.film_id IS NULL -- removing common b/w 2 tables
ORDER BY
    title;

-------------------------------------------------
--------------!SELF JOIN------------------------
SELECT
    title,
    length
FROM
    film;

-- ? finds all pair of films that have the same length
SELECT
    f1.title,
    f2.title,
    f1.length
FROM
    film f1
    INNER JOIN film f2 ON f1.film_id <> f2.film_id
    AND f1.length = f2.length;

-------------------------------------------------
--------------!CROSS JOIN------------------------
SELECT
    c.category_id,
    name,
    film_id
FROM
    category as c
    CROSS JOIN film_category;

-------------------------------------------------
--------------!NATURAL JOIN------------------------
SELECT
    c.category_id,
    name,
    film_id
FROM
    category as c NATURAL
    LEFT JOIN film_category as f;