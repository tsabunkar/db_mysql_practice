---------------!LIKE---------------
-- Used for better searching
-- If we dont want character by character match
--   %  ==> WILD-CARDS
-- Wildcards means, any number of character(s) / no character
-- **These are -> CASE INCENSITIVE

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