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