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
