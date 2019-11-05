
-- Create the table in the specified schema
CREATE TABLE home_cats
(
    cat_id INT NOT NULL,
    name VARCHAR (100),
    age INT,
    PRIMARY KEY
    (cat_id)
);


INSERT INTO home_cats
    ( -- columns to insert data into
    cat_id, name, age
    )
VALUES
    (
        1, 'blue', 2
),
    (
        2, 'Kash', 3
);


-- but if we try to add data, with the same id (whichis pk)
INSERT INTO home_cats
    (
    cat_id, name, age
    )
VALUES
    (
        1, 'Fred', 5
);
-- GET ERROR: Duplicate entry '1' for key 'PRIMARY'


-- !AUTO_INCREMENT

/* CREATE TABLE outside_cats
(
    cat_id INT NOT NULL
    AUTO_INCREMENT,
    name VARCHAR
    (100),
    age INT,
    PRIMARY KEY
    (cat_id)
); */


INSERT INTO outside_cats
    (
    name, age
    )
VALUES
    (
        'Fred', 5
),
    ('Jef', 3);


-- Problem:
/* 
Define an Employee table, with the following fileds:
- id : number (automatically increments) primarykey,
- last_name : text, mandatory
- first_name : text, mandatory
- middle_name : text, not mandatory,
- age : number, mandatory,
- current_status : text, mandatory, default to 'employeed'
 */

/* CREATE TABLE employee_prac
(
    eid INT NOT NULL AUTO_INCREMENT,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50) NULL,
    age INT NOT NULL,
    current_status VARCHAR(20) NOT NULL DEFAULT 'employeed',
    PRIMARY KEY (eid)
); */

INSERT INTO employee_prac
    (
    first_name, middle_name, last_name, age
    )
VALUES
    (
        'Tejas', 'Shailesh', 'Sabunkar', 25
);