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
