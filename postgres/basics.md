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
- if in case you want to skip a number of rows before returning the row_count rows, you use OFFSET clause placed after the LIMIT clause
- SYTNAX:
  SELECT select_list
  FROM table_name
  ORDER BY sort_expression
  LIMIT row_count OFFSET row_to_skip;
- If row_to_skim is zero, the statement will work like it doesn’t have the OFFSET clause.
- RECOMMENDED -> when you use the LIMIT clause, you should always use the ORDER BY clause to control the row order. If you don’t use the ORDER BY clause, you may get a result set with the unspecified order of rows.

---

## FETCH

- The LIMIT clause is widely used by many RDMBS vendors like - MySQL, H2, and HSQLDB. but, LIMIT clause is not a SQL-standard.
- So Inorder to conform with the SQL standard, PostgreSQL supports the FETCH clause to retrieve a number of rows returned by a query.
- SYNTAX:
  OFFSET start { ROW | ROWS }
  FETCH { FIRST | NEXT } [ row_count ] { ROW | ROWS } ONLY
- for above ex-
  - ROW is the synonym for ROWS, FIRST is the synonym for NEXT
  - The start is an integer that must be zero or positive. By default, it is zero if the OFFSET clause is not specified.
  - In case the start is greater than the number of rows in the result set, no rows are returned.
  - The row_count is 1 or greater. By default, the default value of row_count is 1 if not specify it explicitly.
- Note: that the OFFSET clause must come before the FETCH clause in SQL:2008. However, OFFSET and FETCH clauses can appear in any order in PostgreSQL.
- FETCH vs. LIMIT :
  - FETCH clause is functionally equivalent to the LIMIT clause
  - If you plan to make your application compatible with other database systems, you should use the FETCH clause as it is SQL standard

---

## IN

- use IN operator in the WHERE clause to check if a value matches any value in a list of values.
- The list of values can be a list of literal values such as numbers, strings or a result of a SELECT statement

---

## BETWEEN

- use the BETWEEN operator in the WHERE clause of a SELECT, INSERT, UPDATE or DELETE statement.
- BETWEEN operator to match a value against a range of values
- SYTNAX: value BETWEEN low AND high;
- BETWEEN operator can be written by using logical operators -> (value >= low AND value <= high)
- If you want to check if a value is out of a range, you combine the NOT operator with the BETWEEN operator
  - value NOT BETWEEN low AND high; or (value < low OR value > high)

---

## LIKE

- LIKE and ILIKE operators to query data using pattern matchings
- PostgreSQL provides you with two wildcards:
  - Percent sign ( %) matches any sequence of zero or more characters
  - Underscore sign ( \_ ) matches any single character
- SYNTAX:
  - value LIKE pattern
  - value NOT LIKE pattern
- NOTE: If the pattern does not contain any wildcard character, the LIKE operator behaves like the equal ( =) operator.
- ILIKE -> PostgreSQL supports the ILIKE operator that works like the LIKE operator. In addition, the ILIKE operator matches value case-insensitively.
- PostgreSQL also provides some operators that act like the LIKE, NOT LIKE, ILIKE and NOT ILIKE operator
  - LIKE ==> ~~
  - ILIKE ==> ~~\*
  - NOT LIKE ==> !~~
  - NOT ILIKE ==> !~~\*

---

## ISNULL

- IS NULL operator to check if a VALUE is NULL or not.
- In the database world, NULL means missing information or not applicable.
- Please understand - NULL is not a value, therefore, we cannot compare it with any other values as we do for numbers or strings
- The comparison of NULL with a value will always result in NULL, which means an unknown result.
- In order to check whether a value is NULL or not, you use the IS NULL operator instead: SYNTAX: value IS NULL;
