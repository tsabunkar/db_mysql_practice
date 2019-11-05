-- !Challenge 
/*
- Create a new database : shirts_db
- Create a new table shirts 
    - shirt_id: int,not null, pk
    - article: text
    - color: text
    - shirt_size: text
    - last_worn: int
- insert all the data with single line
    ('t-shirt', 'white', 'S', 10),
    ('t-shirt', 'green', 'S', 200),
    ('polo shirt', 'black', 'M', 10),
    ('tank top', 'blue', 'S', 50),
    ('t-shirt', 'pink', 'S', 0),
    ('polo shirt', 'red', 'M', 5),
    ('tank top', 'white', 'S', 200),
    ('tank top', 'blue', 'M', 15);
- Add a new shirt : Purple polo shirt, size M, last worn 50 days ago
- Select all shirts but only print article and color
- Select all medium shirts print out everything but shirt_id
- Update all polo shirts, Change their size to L
- Update the shirt last worn 15days ago, Change last_worn to 0
- Update all white shirts, Change size to 'xs' and color to 'off white'
- Delete all old shirts, Last worn 200 days ago
- Delete all tank tops as articles
- Delete all shirts
- Drop the entier shirts table
*/


-- !Solution

-- SELECT database();

CREATE DATABASE shirts_db;

USE shirts_db;

/* 

CREATE TABLE shirts
(
    shirt_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    article VARCHAR(100),
    color VARCHAR(100),
    shirt_size VARCHAR(50),
    last_worn INT
);

 */

-- DESC shirts;

INSERT INTO shirts
    (article,color , shirt_size, last_worn)
VALUES
    ('t-shirt', 'white', 'S', 10),
    ('t-shirt', 'green', 'S', 200),
    ('polo shirt', 'black', 'M', 10),
    ('tank top', 'blue', 'S', 50),
    ('t-shirt', 'pink', 'S', 0),
    ('polo shirt', 'red', 'M', 5),
    ('tank top', 'white', 'S', 200),
    ('tank top', 'blue', 'M', 15);

-----

INSERT INTO shirts
    (article, color, shirt_size, last_worn)
VALUES('polo shirt', 'purple', 'M', 50);

-----

SELECT *
FROM shirts;

SELECT article, color
FROM shirts;

SELECT article, color , shirt_size, last_worn
FROM shirts
WHERE shirt_size='M';

-----

SELECT article, shirt_size
FROM shirts
WHERE 	
article = 'polo shirt';

UPDATE shirts
SET shirt_size = 'L'
WHERE 	
article = 'polo shirt';

-----

SELECT *
FROM shirts
WHERE 	
last_worn = 15;

UPDATE shirts
SET last_worn = 0
WHERE 	
last_worn = 15;

-----

SELECT *
FROM shirts
WHERE 	
color = 'white';

UPDATE shirts
SET shirt_size='xs', color = 'off white'
WHERE 	
color = 'white';

-----

SELECT *
FROM shirts
WHERE 	
last_worn = 200;

DELETE FROM shirts
WHERE 	
last_worn = 200;

-----

SELECT *
FROM shirts
WHERE 	
article = 'tank top';

DELETE FROM shirts
WHERE 	
article = 'tank top';

-----

DELETE FROM shirts;

-----

DROP TABLE shirts;

-----

