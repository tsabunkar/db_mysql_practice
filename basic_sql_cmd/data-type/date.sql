-----------------!DATE---------------------

CREATE TABLE people
(
    name VARCHAR(50),
    birth_date DATE,
    birth_time TIME,
    birth_dt DATETIME
);

INSERT INTO people
    (name, birth_date, birth_time, birth_dt )
VALUES
    ('Tejas', '1994-09-12', '20:00:00', '1994-09-12 20:00:00');

INSERT INTO people
    (name, birth_date, birth_time, birth_dt )
VALUES
    ('Usha', '1987-08-15', '10:00:00', '1987-08-15 10:00:00');

