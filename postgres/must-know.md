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
