/* 

CREATE TABLE cats
(
    cat_id NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    AGE INT,
    PRIMARY KEY(cat_id)
);

*/

-- !source <file_name>.sql
-- From the file we can write queries and execute it by above command

INSERT INTO cats
    (name, AGE)
VALUES
    ('Charle', 1);

INSERT INTO cats
    (name, AGE)
VALUES
    ('Connie', 10);

SELECT *
FROM cats;

