---------------!NUMBERS Datatype-------------

----------------!DECIMAL---------------------
CREATE TABLE items
(
    price DECIMAL(5,2)
);

INSERT INTO items
    (price)
VALUES(7);

INSERT INTO items
    (price)
VALUES(7984848);
-- Inserted value is much larger than '5' (i.e- max number of digits allowed), so check o/p

INSERT INTO items
    (price)
VALUES(34.88);


INSERT INTO items
    (price)
VALUES(299.9999999);

INSERT INTO items
    (price)
VALUES(1.9999);

SELECT *
FROM items;

/* 
+--------+
| price  |
+--------+
|   7.00 |
| 999.99 |
|  34.88 |
| 300.00 |
|   2.00 |
+--------+
 */


----------------!FLOAT and DOUBLE---------------------

-- DEMO to show inconsistence in FLOAT and DOUBLE

CREATE TABLE stocks
(
    price FLOAT
);

INSERT INTO stocks
    (price)
VALUES
    ( 88.45);


INSERT INTO stocks
    (price)
VALUES
    ( 88665577.45);

SELECT *
FROM stocks;

/* 
+----------+
| price    |
+----------+
|    88.45 |
| 88665600 |
+----------+
 */