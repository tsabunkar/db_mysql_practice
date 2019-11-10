------------! CASE STATEMENTS----------------
-- To use conditional statements in MySQL is provided by ===> CASE STATEMENTS


SELECT title, released_year,
    CASE 
        WHEN released_year >= 2000 THEN 'Modren List'
        ELSE 'Old School List'
    END AS 'genere list'
FROM books;

-- CASE Applied to column names
-- END AS 'genere list' <--- Alias name of that column 


SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 50 AND 100 THEN '**'
        ELSE '***'
    END AS 'Stock Rating'
FROM books;

-- or

SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS 'Stock Rating'
FROM books;


