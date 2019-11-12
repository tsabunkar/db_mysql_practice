# Database

- DB is a colllection of data (ex - phonebook) but DB Should also provide methods for accessing and manipulating that data
- The data relating to each other by nature, e.g., a product belonged to a product category and associated with multiple tags. Therefore, we use the term relational database.
- DBMS ( Database Management System) :-

  Web Application ----> DBMS ----> Database

- Generally our application talks/Give commands/queries to DBMS, which in-turn queries to Database
- Commonly, Database is referred as both DBMS and Actual DB
- PostgreSQL, Oracle database, MySQL, SQLite, etc are not technically DB, but its actually Database Management System DBMS but in common we refer it as Database
- Thus a database is a structured set of computerized data with an accessible interface

---

# MySQL v/s SQL

- SQL : Structured Query Language
  - SQL is the 'Language' we use to 'talk' to our database
  - It is the way we interact or access, update or delete the data from the DB

ex- Find all users, Find all users who are 18 years old, Add a new user with username 'Tejas', Delete every single user

- MySQL : is the 3rd party RDBMS vendor which provides the Database management system, This data can be accessed using SQL language
- Working with MySQL is primarly working with SQL
- SELECT \* FROM Users WHERE Age >= 18 ----> MySQL Database
  SELECT \* FROM Users WHERE Age >= 18 ----> PostgreSQL Database
- SQL have standards, where all the DBMS vendor should follow. Thus we can think SQL as Theory/standards where as, MySQL is DBMS Vendor which implement SQL Standards

---

NOTE

- Onces learned SQL its pretty easy to switch from one DB to another DB that uses SQL
- What makes DBMS Unique are the features they offer, not the Language (i.e- SQL)
- MySQL is open source software backed by Oracle.

---

# SQL

- SQL – the language of the relational database
- SQL is the standardized language used to access the database.
- ANSI/SQL defines the SQL standard.

- SQL contains 3 parts:

  - Data definition language includes statements that help you define the database and its objects, e.g., tables, views, triggers, stored procedures, etc.
  - Data manipulation language contains statements that allow you to update and query data.
  - Data control language allows you to grant the permissions to a user to access specific data in the database.

---

# DB Server :

- One database server can have multiple databases- for ex- In mysql db server we can have sys db, practice db, company db, etc

---

# TABLES

- DB is just bunch of tables (In relational databases)
- Tables : A collection of related data held in a structured format within a db
- Tables consist of rows and column:
  - Column : headers/Meta-data [Information of Data]
  - Rows : The actual data (Each object)
- Table name should be plural not singular, for ex - employees, tweets, etc

---

# DataTypes

- Numeric Type :
  - INT
  - SMALLINT
  - TINYINT
  - MEDIUMINT
  - BIGINT
  - DECIMAL
  - NUMERIC
  - FLOAT
  - DOUBLE
  - BIT
- String Type :
  - CHAR
  - VARCHAR (A Variable length String)
  - BINARY
  - VARBINARY
  - BLOB
  - TINYBLOB
  - MEDIUMBLOB
  - LONGBLOB
  - TEXT
  - TINYTEXT
  - MEDIUMTEXT
  - LONGTEXT
  - ENUM
- Date Types :
  - DATE
  - DATETIME
  - TIMESTAMP
  - TIME
  - YEAR
- varchar(100) : If we specifiy the column with datatype as varchar(100) which means limiting the number of characters to be 100, if we go beyond the 100 chars then only from 1st character to 100th character string would be stored
- Difference betweeen VARCHAR v/s CHAR :

  - CHAR has a fixed length, if CHAR(5) then if no characters is more than it will truncate or if less then add spaces, Where as VARCHAR can be varying
  - The length of a CHAR column is fixed to the length that you declare when you create the table. The length can be any value from 0 to 255. When CHAR values are stored, they are right-padded with spaces to the specified length. When CHAR values are retrieved, tailing spaces are removed unless the PAD_CHAR_TO_FULL_LENGTH SQL moode is enabled.
  - CHAR is faster for fixed length text (for ex - Stat Abberavation(KA for karnataka), SEX m/f, Yes/No flags)

- INT : is for WHOLE Numbers
- DECIMAL : DECIMAL(13,2) ==> 13 - max number of digits this column can have or Total number of digits and 2 - Digits comes after the decimal point. NOTE : DECIMAL(M,D) where M can range from 1 to 65 and D can range from 0 to 30
- DECMIAL data type is a fixed-point type and calculation is exact.
- FLOAT and DOUBLE data type are floating-point type and calculation are approximate.
- Thus, FLOAT and DOUBLE : can store larger numbers using less space but comes at the cost of precision
- Which data type to be used DECIMAL or FLOAT/DOUBLE ?
  - If we need precision of decimal points then use DECIMAL data type like finance, banking, stock market, otherwise you can use FLOAT or DOUBLE
- ## Dates and Times:
  - DATE : Stroes date value but not time, Format -> 'YYYY-MM-DD'
  - TIME : Stroes time valye but not date, Format -> 'HH:MM:SS'
  - DATETIME : Stores values with a data and time, Format -> 'YYYY-MM-DD HH:MM:SS'

---

# NULL

- NUll : The value is not known
- Null does not means zero
- INSERT INTO table_name() VALUES(); ==> Will insert NULL
- How to prevent NULL a particular column ?
  - We need to specifiy the column as NOT NULL
  - CREATE TABLE cat2
    (
    name VARCHAR (100) NOT NULL
    );
- If the column is null, then even though we dont provide the value: We get error - Field 'name' doesn't have a default value
  - INSERT INTO cat2() VALUES();

---

# DEFAULT

- Set the default values/ fallback values
- CREATE TABLE cat3
  (
  name VARCHAR (100) DEFAULT 'unnamed',
  age INT DEFAULT 99
  );

  INSERT INTO cat3() VALUES();

- CREATE TABLE cat4
  (
  name VARCHAR (100) NOT NULL DEFAULT 'unnamed',
  age INT NOT NULL DEFAULT 99
  ); ==> We are writing not null bcoz - We could still manually make a record as null by specifing explicitly NULL ex-
  INSERT INTO cat3 (name, age) VALUES ('Gosh', NULL)

---

# Key

- To remove the identical data, To make data unique ==> Column should be made as Primary Key
- For ex- emailID column, Mobile number, UUID, or some type of unique identifiers etc
- Primary Key ==> A unique identifier on ROW
- The PRIMARY KEY constraint uniquely identifies each record in a table.
- A table can have only ONE primary key; and in the table, this primary key can consist of single or multiple columns.
- Primary keys must contain UNIQUE values, and cannot contain NULL values.

- To Generate the ID Automatically:- AUTO_INCREMENT

---

# Read

- SELECT \* FROM table_name -> star means "Give me all columns"
- SELECT Expression : Specific columns we want to show/project

---

# Update

- Thumb rule : Try selecting data before you UPDATE
- There is no undo for update onces it is done, so it better to confirm/view before what we are updating

---

# WHERE

- The WHERE clause, is used to filter the row/data
- Thus WHERE is used to Get specific data
- ex- SELECT \* FROM cats WHERE age =4;
  SELECT \* FROM cats WHERE name ='Egg';
- By default WHERE caluse value is CASE INCENSITIVE, which means-

---

# AGGREGATE

Aggregate functions are builtin function in mysql which will allow us to aggregate/combine data
like avg, count, groupby, etc

---

# !IF your are getting Error :

Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column
'book_shop.books.title' which is not functionally dependent on columns in GROUP BY clause;
this is incompatible with sql_mode=only_full_group_by

- SET sql_mode = '';

---

# RELATIONSHIP AND JOINS

- Real world data is messy and inter-related to each other
- Book entity itself can have other dependentable entity like- Authors, Versions, Customers, Review, Genres, Orders, etc (This is Real World Examples)
- Thus we need to have different tables for these entities and relationship between these tables
- Above relationship between tables can be shown using- Schema Diagrams

- Types of Relationship :

  - One to One
  - One to Many (or) Many to One
  - Many to Many

- One to One Relationship :

  - One customer detail row (in details table) can be relate to one email row (in users table)
  - Student Id in Student Table relates to Contact Info table
  - Passport Id in Person table relates to Passport table

- One to Many Relationship :

  - One book can have many reviews, but A particular review belongs to only One book
  - One mother can have multiple childrens, but a children can have only one mother
  - An employee can have mutiple bank accounts, but a particular bank account belongs to only one employee

- Many to Many Relationship :
  - (book : author) -> One book can be written by multiple authors, An authors can write many books [ For ex- Design pattern book was written by Erich, Richard, Ralph, John (4 authors) where as Erich Gamma has written multiple books - Contributing to Eclipse, Design Pattern, Head first, etc ]
  - (Candidate : Interviewer) -> One Candidate can apply/schedule an interview with muliple inteviewer, whereas one interviewe can get potentially multiple candidates for an interview

---

# 1 : MANY

- (Customers : Orders) -> A customer can place many orders, but each order is authenticated to only one person/cutomer.
- We can create a big table, where the customers table itself have order details in it. but we will have lot of duplication data also a customer would not have place the order, then order details column would be NULL.
- Thus, having inside the same table can cause problem like - Duplication of data and having NULL in particular Columns record.
- ## PRIMARY KEY :
  - The PRIMARY KEY constraint uniquely identifies each record in a table.
  - A table can have only ONE primary key; and in the table, this primary key can consist of single or multiple columns.
  - Primary keys must contain UNIQUE values, and cannot contain NULL values.
  - (Customers : Orders) cutomer_id and order_id are primary key columns for these two tables respectively
- ## FOREGIN KEY :
  - Forgien Keys are references to another table from an given table
  - cutomer_id is FK in orders table, which refers to pk of customers table
  - A foreign key is a column or group of columns in a relational database table that provides a link between data in two tables.
  - It acts as a cross-reference between tables because it references the primary key of another table

---

# JOINS

- It take two tables and join them as projection/view only
- Different types of joins:
  - Cross Join
  - Inner Join
  - Left Join
  - Right Join
  - Outer Join

---

# Difference between Cross Join v/s Full Outer Join

- A cross join produces a cartesian product between the two tables, returning all possible combinations of all rows. It has no on clause because you're just joining everything to everything
- full outer join is a combination of a left outer and right outer join. It returns all rows in both tables that match the query's where clause, and in cases where the on condition can't be satisfied for those rows it puts null values in for the unpopulated fields.

---

# Many : Many

- Books <-> Authors
- Blog Post <-> Tags
- Students <-> Classes
- tv show reviewing application : Reviewer <-> Series (TV Show)
- Join Table/Union Table is used to relate between parent and child table
- Series Data <-----Reviews Data-----> Reviewers Data

---

# Instagram DB Case Study

- Entity we want to store : USERS, COMMENTS, LIKES, PHOTOS, HASHTAGS, FOLLOWERS
