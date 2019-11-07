---------------!STRING Datatype-------------
CREATE DATABASE datatype_db;

USE datatype_db;

CREATE TABLE dogs
(
    name CHAR(5),
    breed VARCHAR(10)
);

INSERT INTO dogs
    (name, breed)
VALUES
    ('bob', 'beagle');


INSERT INTO dogs
    (name, breed)
VALUES
    ('robby', 'corgi');

INSERT INTO dogs
    (name, breed)
VALUES
    ('princess jane', 'Retriever');
-- For above insert we get WARNING (this is bcoz- 'princess jane' exceeds the no of characters specified in the char )


SELECT *
FROM dogs; 

-- !output-
/* 
+-------+-----------+
| name  | breed     |
+-------+-----------+
| bob   | beagle    |
| robby | corgi     |
| princ | Retriever |
+-------+-----------+
*/