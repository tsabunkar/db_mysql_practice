----------------DATABASES CMD---------------------

SHOW DATABASES;
-- show databases ( show sql keyword can be caps or lower case but standard is caps)

--! CREATE DATABASE <name>; 
-- Can create a db in the db server

CREATE DATABASE soap_store;
-- (Valid DB name)
CREATE DATABASE DogApp;
-- (Naming Convention show up lower_case So, Invalid DB name)

CREATE DATABASE hello_world_db;

--! DROP DATABASE <name>;
-- Can delete an exisiting db in the db server

DROP DATABASE hello_world_db;

-- *If db doesnot exit and still we try to delete the db, we get error :-
--  "Can't drop database 'hello_world_db'; database doesn't exist"

-- ! USE <db_name>
-- Tells db server, which db the user wants to work with

USE sys;

-- To know which db we are currently using
-- ! SELECT database();

--**************************************
-- Exerices : 
CREATE DATABASE hello_world;
USE hello_world;
DROP DATABASE hello_world;
-- Now what will happend when we execute SELECT database(); ?
-- Ans : NULL (bcoz - we are not using any db)

--**************************************

