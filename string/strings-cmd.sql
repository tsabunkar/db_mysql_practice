-----------String functions------------

----------------!CONCAT----------------
-- CONCAT : Combine Data for cleaner output
-- CONCAT (x,y,z) or CONCAT(column_name, another_column_name)

SELECT CONCAT ('Hello', '....', 'World');

SELECT author_fname, author_lname
FROM books;

SELECT CONCAT (author_fname,author_lname )
FROM books;

SELECT CONCAT (author_fname,' ',author_lname ) AS fullName
FROM books;

-- Select are only projection/view its will not modifiy the exisiting data
-- Functions will be run on SELECT

SELECT author_fname AS firstName, author_lname AS lastName,
    CONCAT (author_fname,' ',author_lname ) AS fullName
FROM books;


-- CONCAT_WS :- Concat with Separator

SELECT CONCAT_WS ('-','Hello','World');

SELECT CONCAT(title, '-',author_fname,'-' ,author_lname )
FROM books;

-- Above sql cmd can be written as:

SELECT CONCAT_WS ('-',title, author_fname,author_lname )
FROM books;

----------------!SUBSTRING----------------

-- SUBSTRING : Works with parts of strings

SELECT SUBSTRING('Hello World', 1,4);
-- o/p : Hell
-- SUBSTRING(input_string, start, length);
-- In MySQL index start with 1, not like programming langu with start with 0

SELECT SUBSTRING('Hello World', 7);
-- o/p : World
-- From 7th character upto the last character

SELECT SUBSTRING('Hello World', -3);
--o/p : rld
-- Starts from the backside of string -1 -> d, -2 -> l, -3 -> r

SELECT SUBSTRING('Hello World', -5);

SELECT title
FROM books;

-- To limit the book titles
SELECT SUBSTRING(title, 1, 10) AS 'short titles'
FROM books;

-- SUBSTRING() -> SUBSTR()  [Shortcuts of this function]
SELECT SUBSTR(title, 1, 10) AS 'short titles'
FROM books;

-- We canm combine the sql functions
SELECT CONCAT(
    SUBSTR(title, 1, 10),
    '...') AS 'short titles'
FROM books;


----------------!REPLACE----------------
-- REPLACE : Replace parts of strings

SELECT REPLACE('Hello World', 'Hell', 'Heaven');

-- SELECT REPLACE('mainstring', 'substring', 'replacedby');
-- mainstring -> the given string, substring -> the sub string in the main string which will be 
-- replaced and replacedby -> the string which gone be replaced by

-- !Characters are CASE SENSITIVE
SELECT REPLACE('Hello WOrld', 'o', '*');

SELECT REPLACE(title, 'e', 'E')
FROM books;

-- title only 10 characters and then replace e->E 
SELECT REPLACE(SUBSTRING(title, 1, 10), 'e', 'E')
  AS 'short titles'
FROM books;

-- replace title e->E and then limit 10 characters only
SELECT SUBSTRING(REPLACE(title, 'e', 'E'), 1, 10)
  AS 'short titles'
FROM books;


----------------!REVERSE----------------
-- Reverse: reverse the string
SELECT REVERSE('Tejas');

SELECT REVERSE(title)
FROM books;

-- plaindrome
SELECT CONCAT('foo', REVERSE('foo'));

SELECT CONCAT(author_fname, REVERSE(author_fname))
FROM books;

----------------!CHAR_LENGTH----------------

-- Length of number of characters
SELECT CHAR_LENGTH('tejas');

SELECT author_lname, CHAR_LENGTH(author_lname) AS length
FROM books;

-- first name -> 'Eggers is 6 character long'

SELECT CONCAT( author_fname, ' is ', CHAR_LENGTH(author_fname), ' character long')
FROM books;

----------------!UPPER and LOWER----------------
-- Changing cases to upper and lower case

SELECT UPPER('tejas');
SELECT LOWER('SAbunkar');

SELECT CONCAT('My Favorite book is : ',  UPPER(title))
FROM books;

