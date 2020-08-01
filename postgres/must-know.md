# SQL COMMANDS

- SQL COMMANDS:
  - DDL (Data Definition Language)
    - CREATE
    - ALTER
    - DROP
    - RENAME
    - TRUNCATE
    - COMMENT
  - DML (Data Manipulation Language)
    - SELECT
    - INSERT
    - UPDATE
    - MERGE
    - CALL
    - EXPLAIN PLAN
    - LOCK TABLE
  - DCL (Data Control Language)
    - GRANT
    - REVOKE
  - TCL (Transaction Control Language)
    - COMMIT
    - ROLLBACK
    - SAVEPOINT
    - SET TRANSACTION
- [.assets/sql-commands.jpg]

---

# Modifying Data

## INSERT

- INSERT statement to insert a new row into a table.
- SYNTAX:

```
INSERT INTO table_name(column1, column2, …)
VALUES (value1, value2, …);
```

- INSERT statement returns a command tag with the following form: INSERT oid count
  - OID is an object identifier. PostgreSQL used the OID internally as a primary key for its tables.
  - INSERT statement returns OID with value 0. The count is the number of rows that the INSERT statement inserted successfully.
- RETURNING clause
  - INSERT statement also has an optional RETURNING clause that returns the information of the inserted row.
  - If you want to return the entire inserted row, you use an asterisk (\*)
  - SYNTAX:
  ```
  INSERT INTO table_name(column1, column2, …)
  VALUES (value1, value2, …)
  RETURNING *;
  ```
  - you can also specify one or more columns after the RETURNING clause to return verify specific information.
- INSERT Multiple Rows
  - SYNTAX:
  ```
  INSERT INTO table_name (column_list)
  VALUES
      (value_list_1),
      (value_list_2),
      ...
      (value_list_n);
  RETURNING * | output_expression;
  ```
  - RETURNING clause to return all the inserted rows.

## UPDATE

- UPDATE statement to update existing data/row in a table.
- SYNTAX:

```
UPDATE table_name
SET column1 = value1,
    column2 = value2,
    ...
WHERE condition;
```

- The WHERE clause is optional. If you omit the WHERE clause, the UPDATE statement will update all rows in the table.
- UPDATE statement is executed successfully, it returns the following command tag: UPDATE count
- Returning updated rows
  - UPDATE statement has an optional RETURNING clause
  - SYNTAX:
  ```
  UPDATE table_name
  SET column1 = value1,
      column2 = value2,
      ...
  WHERE condition
  RETURNING * | output_expression AS output_name;
  ```
  - UPDATE Join
    - UPDATE join syntax to update data in a table based on values in another table.
    - SYNTAX:
    ```
    UPDATE t1
    SET t1.c1 = new_value
    FROM t2
    WHERE t1.c2 = t2.c2;
    ```
    - updates the value in the c1 column of the table t1

## DELETE

- DELETE statement to delete data from a table.
- SYNTAX:

```
DELETE FROM table_name
WHERE condition;
```

- WHERE clause is optional. If you omit the WHERE clause, the DELETE statement will delete all rows in the table.
- DELETE statement returns the number of rows deleted. It returns zero if the DELETE statement did not delete any row.
- with RETURNING clause:
  - SYNTAX:
  ```
  DELETE FROM table_name
  WHERE condition
  RETURNING (select_list | *)
  ```
  - asterisk (\*) allows you to return all columns of the deleted row from the table_name

## UPSERT

- upsert feature to insert or update data
- term upsert is referred to as merge.
- when you insert a new row into the table, will update the row if it already exists, otherwise, it will insert the new row.
- SYNTAX:

```
INSERT INTO table_name(column_list)
VALUES(value_list)
ON CONFLICT target action;
```

- Basically using ON CONFLICT target action clause to the INSERT statement to support the upsert feature.
- the target can be one of the following:
  - (column_name) – a column name.
  - ON CONSTRAINT constraint_name – where the constraint name could be the name of the UNIQUE constraint.
  - WHERE predicate – a WHERE clause with a predicate.
- the action can be one of the following:
  - DO NOTHING – means do nothing if the row already exists in the table.
  - DO UPDATE SET column_1 = value_1, .. WHERE condition – update some fields in the table.
- NOTE: ON CONFLICT clause is only available from PostgreSQL 9.5.

---

# Managing Databases

- CREATE DATABASE:
  - CREATE DATABASE statement provides you with various options when creating a new database :
  - SYNTAX:
    ```
    CREATE DATABASE db_name
    OWNER =  role_name
    TEMPLATE = template
    ENCODING = encoding
    LC_COLLATE = collate
    LC_CTYPE = ctype
    TABLESPACE = tablespace_name
    CONNECTION LIMIT = max_concurrent_connection
    ```
  - role_name: is the role name of the user who will own the new database
  - template: is the name of the database template from which the new database creates. (template1 is the default template database)
  - encoding: specifies the character set encoding for the new database.
  - collate: specifies a collation for the new database. The collation specifies the sort order of strings that affect the result of the ORDER BY clause in the SELECT statement.
  - ctype: specifies the character classification for the new database.
  - tablespace_name: specifies the tablespace name for the new database
  - max_concurrent_connection: specifies the maximum concurrent connections to the new database. The default is -1 i.e., unlimited.
  - EXAMPLE:
    ```
    CREATE DATABASE hrdb
    WITH ENCODING='UTF8'
    OWNER=hr
    CONNECTION LIMIT=25;
    ```
- ALTER DATABASE:
  - modify existing databases
  - SYNTAX:
  ```
  ALTER DATABASE target_database action;
  ```
  - EXAMPLE:
    - Rename database: ALTER DATABASE target_database RENAME TO new_database;
    - Change owner: ALTER DATABASE target_database OWNER TO new_onwer;
    - Change tablespace: ALTER DATABASE target_database SET TABLESPACE new_tablespace;
    - run-time configuration variables: ALTER DATABASE target_database SET configuration_parameter = value;
- DROP DATABASE:
  - to delete existing database
  - SYNTAX:
  ```
  DROP DATABASE [IF EXISTS] name;
  ```
  - IF EXISTS to prevent an error from removing a non-existent database.
  - DROP DATABASE statement deletes catalog entries and data directory permanently.
  - NOTE: This action cannot be undone so you have to use it with caution.
  - Only the database owner can execute the DROP DATABASE statement.
  - cannot execute the DROP DATABASE statement if there is any active connection to the database.
  - Delete a database that has active connections
    - To delete the database that still has active connections, you can follow the steps below:
      - First, find the activities that are taken place against the target database:
      ````
      SELECT
           *
       FROM
           pg_stat_activity
       WHERE
           datname = 'target_database';
           ```
      ````
      - Second, terminate the active connections by issuing the following query:
      ```
      SELECT
        pg_terminate_backend (pg_stat_activity.pid)
      FROM
        pg_stat_activity
      WHERE
        pg_stat_activity.datname = 'target_database';
      ```
      - Third, execute the DROP DATABASE statement:
      ```
      DROP DATABASE target_database;
      ```
- Copy Database:
  - PostgreSQL copy database within the same server:
    - SYNTAX:
      ```
      CREATE DATABASE targetdb
      WITH TEMPLATE sourcedb;
      ```
    - Above statement copies the sourcedb to the targetdb.
  - PostgreSQL copy database from a server to another:
    - There are several ways to copy a database between PostgreSQL database servers
    - If the size of the source database is big and the connection between the database servers is slow, you can dump the source database to a file, copy the file to the remote server, and restore it.
      - Steps for above technique:
        - pg_dump -U postgres -O sourcedb sourcedb.sql (dump the source database to a file)
        - (copy the dump file to the remote server)
        - CREATE DATABASE targetdb; (create new db in the remote server)
        - psql -U postgres -d targetdb -f sourcedb.sql; (restore the dump file on the remote server)
- Get Database Object Sizes in PostgreSQL:
  - pg_relation_size():
    - this function get the size of a specific table.
    - function returns the size of the table only, not included indexes or additional objects.
  - pg_total_relation_size():
    - function to find the size of biggest tables including indexes.
  - pg_database_size():
    - To get the size of the whole database.
  - pg_indexes_size():
    - To get total size of all indexes attached to a table
    - this function accepts the OID or table name as the argument and returns the total disk space used by all indexes attached of that table.
  - pg_tablespace_size():
    - this function accepts a tablespace name and returns the size in bytes.
  - pg_column_size():
    - To find how much space that needs to store a specific value.

---

# Managing Tables

## Data-types

- PostgreSQL supports following data-type:
  - Boolean
  - Character types such as char, varchar, and text.
  - Numeric types such as integer and floating-point number.
  - Temporal types such as date, time, timestamp, and interval
  - UUID for storing Universally Unique Identifiers
  - Array for storing array strings, numbers, etc.
  - JSON stores JSON data
  - hstore stores key-value pair
  - Special types such as network address and geometric data.
- Boolean
  - can hold one of three possible values: true, false or null.
  - use boolean or bool keyword to declare a column
  - When you insert data into a Boolean column, PostgreSQL converts it to a Boolean value:
    - 1, yes, y, t, true values are converted to true
    - 0, no, false, f values are converted to false
- Character
  - provides three character data types: CHAR(n), VARCHAR(n), and TEXT
  - CHAR(n):
    - is the fixed-length character with space padded.
    - If you insert a string that is shorter than the length of the column, PostgreSQL pads spaces.
    - If you insert a string that is longer than the length of the column, PostgreSQL will issue an error.
  - VARCHAR(n):
    - is the variable-length character string.
    - PostgreSQL does not pad spaces when the stored string is shorter than the length of the column.
  - TEXT:
    - is the variable-length character string.
    - Theoretically, text data is a character string with unlimited length.
- Numeric
  - Integer
    - three kinds of integers in PostgreSQL:
      - Small integer ( SMALLINT) is 2-byte signed integer
      - Integer ( INT) is a 4-byte integer
      - Serial is the same as integer except that PostgreSQL will automatically generate and populate values into the SERIAL column. ( This is similar to AUTO_INCREMENT column in MySQL, SQLite )
  - Floating-point number
    - three main types of floating-point numbers:
      - float(n) is a floating-point number
      - real or float8 is a 4-byte floating-point number.
      - numeric or numeric(p,s) is a real number with p digits with s number after the decimal point.
- Temporal
  - has five main temporal data types:
    - DATE stores the dates only
    - TIME stores the time of day values.
    - TIMESTAMP stores both date and time values.
    - TIMESTAMPTZ is a timezone-aware timestamp data type.
    - INTERVAL stores periods of time.
- Arrays
  - can store an array of strings, an array of integers, etc.
  - comes in handy for situations like- storing days of the week, months of the year.
- JSON
  - two JSON data types: JSON and JSONB for storing JSON data.
  - JSON data type stores plain JSON data that requires reparsing for each processing.
  - JSONB data type stores JSON data in a binary format which is faster to process but slower to insert.
  - JSONB also supports indexing.
- UUID
  - store Universal Unique Identifiers defined by RFC 4122
  - UUID values guarantee a better uniqueness than SERIAL
- Special data types
  - Besides the primitive data types, PostgreSQL also provides several special data types related to geometric and network.
    - box – a rectangular box.
    - line – a set of points.
    - point – a geometric pair of numbers.
    - lseg – a line segment.
    - polygon – a closed geometric.
    - inet – an IP4 address.
    - macaddr – a MAC address.

## CREATE TABLE

- statement to create new a new table.
- SYNTAX:

```
CREATE TABLE [IF NOT EXISTS] table_name (
   column1 datatype(length) column_contraint,
   column2 datatype(length) column_contraint,
   column3 datatype(length) column_contraint,
   table_constraints
);
```

- Use the IF NOT EXISTS option to create the new table only if that table does not exist.
- Constraints:
  - NOT NULL – ensures that values in a column cannot be NULL.
  - UNIQUE – ensures the values in a column unique across the rows within the same table.
  - PRIMARY KEY – a primary key column uniquely identify rows in a table. A table can have one and only one primary key.
  - FOREIGN KEY – ensures values in a column or a group of columns from a table exists in a column or group of columns in another table. Unlike the primary key, a table can have many foreign keys.
  - CHECK – a CHECK constraint ensures the data must satisfy a boolean expression.

## SELECT INTO

- statement to create a new table from the result set of a query.
- statement creates a new table and inserts data returned from a query into the table.
- new table will have columns with the names the same as columns of the result set of the query.
- SELECT INTO statement does not return a result to the client.
- SYNTAX:

```
SELECT
    select_list
INTO [ TEMPORARY | TEMP | UNLOGGED ] [ TABLE ] new_table_name
FROM
    table_name
WHERE
    search_condition;
```

- TEMP or TEMPORARY keyword is optional; it allows you to create a temporary table instead.
- UNLOGGED keyword if available will make the new table as an unlogged table.
- NOTE: that you cannot use the SELECT INTO statement in PL/pgSQL

## CREATE TABLE AS

- statement to create a new table from the result set of a query.
- SYNTAX:

```
CREATE [ TEMPORARY | TEMP | UNLOGGED ] TABLE new_table_name
AS query;
```

- TEMPORARY or TEMP keyword allows you to to create a temporary table
- UNLOGGED keyword allows the new table to be created as an unlogged table:
- The columns of the new table will have the names and data types associated with the output columns of the SELECT clause.
- If you want the table columns to have different names, you can specify the new table columns after the new table name:

```
CREATE TABLE [IF NOT EXISTS] new_table_name ( column_name_list)
AS query;
```

- IF NOT EXISTS -> If we want to avoid an error by creating a new table that already exists.
- NOTE: CREATE TABLE AS statement is similar to the SELECT INTO statement, but the CREATE TABLE AS statement is preferred because it is not confused with other uses of the SELECT INTO syntax in PL/pgSQL.

## SERIAL

- In PostgreSQL, a sequence is a special kind of database object that generates a sequence of integers.
- A sequence is often used as the primary key column in a table.
- SERIAL is used to add an auto-increment column to a table.
- While creating a new table, the sequence can be created through the SERIAL pseudo-type i.e- (SYNTAX)

```
CREATE TABLE table_name(
    id SERIAL
);
```

equivalent of above SERIAL

```
CREATE SEQUENCE table_name_id_seq;

CREATE TABLE table_name (
    id integer NOT NULL DEFAULT nextval('table_name_id_seq')
);

ALTER SEQUENCE table_name_id_seq
OWNED BY table_name.id;
```

- PostgreSQL provides three serial pseudo-types:
  - SMALLSERIAL (2 bytes)
  - SERIAL (4 bytes)
  - BIGSERIAL (8 bytes)
- NOTE: SERIAL does not implicitly create an index on the column or make the column as the primary key column. (but this can be done easily by specifying the PRIMARY KEY constraint for the SERIAL column)
- pg_get_serial_sequence() - To get the sequence name of a SERIAL column in a table
  - SYNTAX: pg_get_serial_sequence('table_name','column_name')
- currval() - to get the recent value generated by the sequence
- If you want to get the value generated by the sequence when you insert a new row into the table, you use the RETURNING id clause in the INSERT statement.
- The sequence generator operation is not transaction-safe.

## Sequences

- sequence is a ordered list of integers.
- A sequence in PostgreSQL is a user-defined schema-bound object that generates a sequence of integers based on specification
- CREATE SEQUENCE SYNTAX:

```
CREATE SEQUENCE [ IF NOT EXISTS ] sequence_name
    [ AS { SMALLINT | INT | BIGINT } ]
    [ INCREMENT [ BY ] increment ]
    [ MINVALUE minvalue | NO MINVALUE ]
    [ MAXVALUE maxvalue | NO MAXVALUE ]
    [ START [ WITH ] start ]
    [ CACHE cache ]
    [ [ NO ] CYCLE ]
    [ OWNED BY { table_name.column_name | NONE } ]
```

- sequence_name
  - sequence name must be distinct from any other sequences, tables, indexes, views, or foreign tables in the same schema.
- [ AS { SMALLINT | INT | BIGINT } ]
  - Specify the data type of the sequence. The valid data type is SMALLINT, INT, and BIGINT.
  - default data type is BIGINT
  - it determines the sequence’s minimum and maximum values.
- [ INCREMENT [ BY ] increment ]
  - increment specifies which value to be added to the current sequence
  - positive number will make an ascending sequence while a negative number will form a descending sequence.
  - default increment value is 1.
- [ MINVALUE minvalue | NO MINVALUE ] and [ MAXVALUE maxvalue | NO MAXVALUE ]
  - Define the minimum value and maximum value of the sequence
  - If you use NO MINVALUEand NO MAXVALUE, the sequence will use the default value.
  - For an ascending sequence, the default maximum value is the maximum value of the data type of the sequence and the default minimum value is 1.
  - For a descending sequence, the default maximum value is -1 and the default minimum value is the minimum value of the data type of the sequence.
- [ START [ WITH ] start ]
  - START clause specifies the starting value of the sequence.
  - default starting value is minvalue for ascending sequences & maxvalue for descending.
- CACHE
  - determines how many sequence numbers are preallocated and stored in memory for faster access
  - By default- no cache.
- CYCLE | NO CYCLE
  - CYCLE allows you to restart the value if the limit is reached.
  - For NO CYCLE- when the limit is reached, attempting to get the next value will result in an error.
  - By default- NO CYCLE
- OWNED BY table_name.column_name
  - OWNED BY clause allows you to associate the table column with the sequence so that, when you drop the column or table, PostgreSQL will automatically drop the associated sequence.
- Deleting Sequence
  - If a sequence is associated with a table column, it will be automatically dropped once the table column is removed or the table is dropped.
  - If we want to remove a sequence manually, SYNTAX:
  ```
  DROP SEQUENCE [ IF EXISTS ] sequence_name [, ...]
  [ CASCADE | RESTRICT ];
  ```

## Identity Column

- PostgreSQL version 10 introduced a new constraint GENERATED AS IDENTITY
- it allows us to automatically assign a unique number to a column.

---
