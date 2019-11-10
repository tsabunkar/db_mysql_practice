--------------! NOT LIKE -----------------
-- Opposite of like (pattern matching)

-- title starts with 'w'
SELECT title
FROM books
WHERE title 
LIKE 'W%';

-- title which not/don't starts with 'w'
SELECT title
FROM books
WHERE title 
NOT LIKE 'W%';

