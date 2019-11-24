-- !BEFORE : runs the trigger before running the actual modification to the table
-- below example is not a good place to validate the age, better place would be client side

CREATE DATABASE trigger_demo;

USE trigger_demo;

CREATE TABLE users
(
    username VARCHAR(100),
    age INT
);

INSERT INTO users
    (username,age)
VALUES
    ('tejas', 25);

SELECT *
FROM users;


-----------

/* 

DELIMITER $$

CREATE TRIGGER must_be_adult
    BEFORE INSERT ON users FOR EACH ROW
    BEGIN 
    IF NEW.age < 18
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Must be an adult';
        END IF;
    END;
$$

*/

-----------

INSERT INTO users
    (username,age)
VALUES
    ('usha', 15);

-- !Error :-
/*
ERROR 1644 (45000): Must be an adult
*/

-- DELIMITER -> bydefault sql thinks ; as end of query, so to change this delimiter of (;) we use DELIMITER $$, so that we can 
--              we can have multiple queries executed
-- NEW.age -> Refers to NEW data that is about to be inserted
-- SIGNAL SQLSTATE -> MySql Error has following strings : Numeric error code, SQL STATE value are hardcode/predefined value,
--                  message string (Textual description for error)

-- !ex for SQLSTATE :

SELECT *
FROM wdjhfiwjhfgiw;

-- ERROR 1146 (42S02): Table 'trigger_demo.wdjhfiwjhfgiw' doesn't exist

-- 1146 -> Numeric Error code
-- 42S02 -> SIGNAL SQLSTATE
-- Table 'trigger_demo.wdjhfiwjhfgiw' doesn't exist -> Error message string/text

-- 45000 -> (SIGNAL SQLSTATE) :- A generic state representing "unhandled user-defined exception"

-- Ex2 :-

/*

DELIMITER $$

CREATE TRIGGER prevent_self_follow
    BEFORE INSERT ON follows FOR EACH ROW
    BEGIN 
    IF NEW.follower_id = NEW.followee_id
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'You cannot follow yourself!';
        END IF;
    END;
$$

*/

-- ! Creating Loggers using Triggers

/*

DELIMITER $$

CREATE TRIGGER trigger_name
    trigger_time trigger_event ON table_name FOR EACH ROW
    BEGIN
    END;
$$

*/


/* 

DELIMITER $$

CREATE TRIGGER create_unfollow
    AFTER DELETE ON follows FOR EACH ROW 
BEGIN
    INSERT INTO unfollows
    SET follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
END$$

DELIMITER ;

 */


-- Listing Triggers
-- SHOW TRIGGERS;

-- Removing Triggers
DROP TRIGGER trigger_name;