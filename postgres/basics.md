# Query Data

## SELECT

- FROM ==> SELECT
- SELECT statement has the following clauses
  - Select distinct rows using DISTINCT operator.
  - Sort rows usingORDER BY clause.
  - Filter rows using WHERE clause.
  - Select a subset of rows from a table using LIMIT or FETCH clause.
  - Group rows into groups using GROUP BY clause.
  - Filter groups using HAVING clause.
  - Join with other tables using joins such as INNER JOIN, LEFT JOIN, FULL OUTER JOIN, CROSS JOIN clauses.
  - Perform set operations using UNION, INTERSECT, and EXCEPT.
- FROM clause is optional. If you do not query data from any table, you can omit the FROM clause in the SELECT statement.
- SQL keywords are case-insensitive - It means that SELECT is equivalent to select or Select
- SELECT \* FROM customer; --> The semicolon is not a part of the SQL statement. It is used to signal PostgreSQL the end of an SQL statement.
- It is not a good practice to use the asterisk (\*) in the SELECT statement when you embed SQL statements in the application code like Python, Java, Node.js, or PHP due to the following reasons:
  - Database performance -> Suppose you have a table with many columns and a lot of data, the SELECT statement with the asterisk (\*) shorthand will select data from all the columns of the table, which may not be necessary to the application. (In Postgres db Level)
  - Application performance. Retrieving unnecessary data from the database increases the traffic between the database server and application server. In consequence, your applications may be slower to respond and less scalable. (In Nodejs Level)
- Alias name on column -> AS optional
- Use double quotes (“) to surround a column alias that contains spaces.

---

## ORDER BY

- To sort the rows of the result set
- FROM ==> SELECT ==> ORDER BY
- If you want to sort the result set based on multiple columns or expressions, you need to place a comma (,) between two columns
- ASC by default.
- If you have a column alias in the SELECT clause, you can use it in the ORDER BY clause.
- ORDER BY clause and NULL
  - NULL is a marker that indicates the missing data or the data is unknown.
  - When you sort rows that contains NULL, you can specify the order of NULL with other non-null values by using the NULLS FIRST or NULLS LAST option of the ORDER BY clause:
    - SYNTAX: ORDER BY sort_expresssion [ASC | DESC][ nulls first | nulls last ]
  - Therefore -> Use NULLS FIRST and NULLS LAST options to explicitly specify the order of NULL with other non-null values

---

## DISTINCT

- this clause is used in the SELECT statement to remove duplicate rows from a result set
- DISTINCT clause keeps one row for each group of duplicates
- DISTINCT ON (expression) to keep the “first” row of each group of duplicates
- NOTE: It is a good practice to always use the ORDER BY clause with the DISTINCT ON(expression) to make the result set predictable.
- Please Make sure - DISTINCT ON expression must match the leftmost expression in the ORDER BY clause.
- NOTE: column name which are Projected with DISTINCT Clause should be at first or starting

---

---

# Filtering Data

## WHERE

- FROM ==> WHERE ==> SELECT ==> ORDER BY
- condition to filter the rows returned from the SELECT clause
- The condition must evaluate to true, false, or unknown. It can be a boolean expression or a combination of boolean expressions using the AND and OR operators.
- column aliases in the SELECT clause, you cannot use them in the WHERE clause.
- condition in the WHERE clause, you use comparison and logical operators like-> =, >, <, >=, <=, <> or !=, AND, OR, IN, BETWEEN, LIKE, IS NULL, NOT

---

## LIMIT

- LIMIT is an optional clause of the SELECT statement that constrains the number of rows returned by the query.
- ALWAYS write After ORDER BY Clause
