# Database

- DB is a colllection of data (ex - phonebook) but DB Should also provide methods for accessing and manipulating that data
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

---
