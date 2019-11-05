---------------NULL CMD------------------

CREATE TABLE cat2
(
    name VARCHAR (100) NOT NULL
);

-- INSERT INTO cat2() VALUES();


---------------DEFAULT CMD------------------


-- Set the default values/ fallback values
CREATE TABLE cat3
(
    name VARCHAR (100) DEFAULT 'unnamed',
    age INT DEFAULT 99
);

-- INSERT INTO cat3() VALUES();



CREATE TABLE cat4
(
    name VARCHAR (100) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
);



INSERT INTO cat3
    (name, age)
VALUES
    ('Gosh', NULL)