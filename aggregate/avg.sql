----------------!AVG----------------
-- Gives average of all the data


--- Problem: Calculate the average relased_year across all books

SELECT AVG(released_year)
FROM books;

-- Problem : Calculate the average stock quantity for books relased in the same year

SELECT title, released_year, AVG(stock_quantity)
FROM books
GROUP BY released_year;

SELECT title, released_year, AVG(stock_quantity)
FROM books
GROUP BY released_year
ORDER BY released_year;