---------------!LIKE---------------
-- Used for better searching
-- like comes in conjection with WHERE clause
-- WHERE specifciy the column on which LIKE Condition is applied
--   % (or) _  ==> WILD-CARDS
-- **These are -> CASE INCENSITIVE


-----------!WILDCARD (%)---------------
-- % Wildcards means, any number of character(s) / no character
-- If we dont want character by character match use %


SELECT *
FROM books
WHERE author_fname
LIKE '%da%';

-- author fname can start with any number of characters or end with any number of characters
-- but there should be 'da' substring
-- Thus 'da' substring can be at start, or at end, or at any where



-- !But if want to match exactly starting with 'da' substring 
SELECT *
FROM books
WHERE author_fname
LIKE 'da%';
-- Author first name should/must start with 'da'


SELECT *
FROM books
WHERE title
LIKE 'The';
-- projecting book name which is exactly 'the'


-- !If want to match exactly ends with 'da' substring
SELECT *
FROM books
WHERE author_fname
LIKE '%da';


-----------!WILDCARD (_)---------------
-- _ (underscord) wild card tells the number of characters/digits to match for


SELECT *
FROM books
WHERE stock_quantity 
LIKE '____';
-- the stock_quantiy column should exactly have 4 digits


SELECT *
FROM books
WHERE stock_quantity 
LIKE '__';
-- the stock_quantiy column should exactly have 2 digits


SELECT *
FROM books
WHERE author_fname 
LIKE '____';
-- the stock_quantiy column should exactly have 4 characters


-- But what if I'm searching for a book with has '$' in it ?
-- Ans: Use escape characters \

-- !If string to search itself has '%' character in it, then to use % wildcard ->
SELECT *
FROM books
WHERE title 
LIKE '%\%%';


SELECT *
FROM books
WHERE title 
LIKE '%%%%';-- Give everthing, basically ur telling anything 3 times


-- !If string to search itself has '_' character in it, then to use _ wildcard ->
SELECT *
FROM books
WHERE title 
LIKE '%\_%';