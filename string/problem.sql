/*
Problem :1
- Reverse and Uppercase the following sentence -> "Why does my cat look at me with such hatred?"
*/

SELECT UPPER(REVERSE("Why does my cat look at me with such hatred?"));

/*
Problem :2
What will below line print out ?
SELECT 
    REPLACE
    (
        CONCAT('I', ' ', 'like', ' ', 'cats'), ' ','_'
    )
*/
-- !Ans : I_like_cats

/*
Problem :3
Replace spaces in title with ->
*/

SELECT REPLACE(title, ' ', '->') AS title
FROM books;

/*
Problem :4
Print : authorfirstname in forwards and backwards column
*/

SELECT author_fname AS forwards, REVERSE(author_fname) AS backwards
FROM books;

/*
Problem :5
Print full authors name in caps
*/

SELECT UPPER(CONCAT(author_fname,' ', author_lname)) AS 'full name in caps'
FROM books;

/*
Problem :6
- $(title) was relased in $(yearofrealsed)
*/

SELECT CONCAT( title, ' was relased in ', released_year) AS foo
FROM books;

/*
Problem :7
Print books title and length of each title
*/

SELECT title, CHAR_LENGTH(title) AS 'character count'
FROM books;

/*
Problem :8
first 10 character of title, author fname and lname separated by comma and quality 'in stock'
*/

SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
    CONCAT(author_lname,',',author_fname) AS author,
    CONCAT(stock_quantity,' in stock') AS quantity
FROM books;