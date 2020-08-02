# Performing Set Operations

## UNION

- UNION operator combines result sets of two or more SELECT statements into a single result set.
- SYNTAX:
  <SELECT_QUERY> UNION <SELECT_QUERY>
- following rules should be incorprated while using UNION Operator:
  - The number and the order of the columns in the select list of both queries must be the same.
  - The data types must be compatible.
- NOTE: UNION operator removes all duplicate rows from the combined data set. To retain the duplicate rows, you use the the UNION ALL instead.
- Ven Diagram of UNION: [./assets/UNION-Ven-dig.png]
- We often use the UNION operator to combine data from similar tables, which are not perfectly normalized
- NOTE: If you place the ORDER BY clause at the end of each query, the combined result set will not be sorted as you expected.
  - Because when UNION operator combines the sorted result sets from each query, it does not guarantee the order of rows in the final result set.

## INTERSECT

- Like the UNION and EXCEPT operators, the PostgreSQL INTERSECT operator combines result sets of two or more SELECT statements into a single result set.
- INTERSECT operator returns any rows that are ONLY available in both result sets (i.e- common b/w two tables).
- SYNTAX:
  <SELECT_QUERY> INTERSECT <SELECT_QUERY>
- following rules should be incorprated while using UNION Operator:
  - number of columns and their order in the SELECT clauses must be the same.
  - data types of the columns must be compatible.
- Ven Diagram of INTERSECT:[.assets/INTERSECT-Ven-diag.png]

## EXCEPT

- Like the UNION and INTERSECT operators, the EXCEPT operator returns rows by comparing the result sets of two or more queries.
- EXCEPT operator returns distinct rows from the first (left) query that do not appear in the result-set/output of the second (right) query.
- SYNTAX:
  <SELECT_QUERY> EXCEPT <SELECT_QUERY>
- following rules should be incorprated while using UNION Operator:
  - number of columns and their order in the SELECT clauses must be the same.
  - data types of the columns must be compatible.
- Ven Diagram of EXCEPT:[./assets/EXCEPT-Ven-diag.png]

---

# Grouping sets, Cube, and Rollup

## GROUPING SETS

- A grouping set is a set of columns by which you group by using the GROUP BY clause.
- A grouping set is denoted by a comma-separated list of columns placed inside parentheses: (column1, column2, ...)
- Grouping function:
  - GROUPING() function accepts an argument which can be a column name or an expression
  - SYTNAX: GROUPING( column_name | expression)
  - column_name or expression must match with the one specified in the GROUP BY clause.
- GROUPING SET

## CUBE

- CUBE is a subclause of the GROUP BY clause
- CUBE allows you to generate multiple grouping sets.
- SYNTAX:

SELECT
c1,
c2,
c3,
aggregate (c4)
FROM
table_name
GROUP BY
CUBE (c1, c2, c3);

- CUBE subclause in the the GROUP BY clause of the SELECT statement
- In general, if the number of columns specified in the CUBE is n, then you will have 2^n combinations.

## ROLLUP

- ROLLUP to generate multiple grouping sets.
- Different from the CUBE subclause, ROLLUP does not generate all possible grouping sets based on the specified columns. It just makes a subset of those.

---

# Subquery

- allows us to construct complex queries.
- query inside the brackets is called a subquery or an inner query
- The query that contains the subquery is known as an outer query.
- PostgreSQL executes the query that contains a subquery in the following sequence:
  - First, executes the subquery.
  - Second, gets the result and passes it to the outer query.
  - Third, executes the outer query.
- A subquery can return zero or more rows (check IN operator usage).
- We can also use subquery with IN operator.
- We can also use subquery with EXISTS operator.
  - A subquery can be an input of the EXISTS operator.
  - If the subquery returns any row ==> the EXISTS operator returns true. - If the subquery returns no row ==> the result of EXISTS operator is false.
  - The EXISTS operator only cares about the number of rows returned from the subquery, not the content of the rows, therefore, the common coding convention of EXISTS operator is :
    - SYNTAX: EXISTS (SELECT 1 FROM tbl WHERE condition);

## ANY operator

- ANY operator compares a value to a set of values returned by a subquery.
- SYTNAX: expresion operator ANY(subquery)
  - NOTE for above syntax:
    - The subquery must return exactly one column.
    - The ANY operator must be preceded by one of the following comparison operator =, <=, >, <, > and <>
    - The ANY operator returns true if any value of the subquery meets the condition, otherwise, it returns false.
- NOTE: SOME is a synonym for ANY, meaning that you can substitute SOME for ANY in any SQL statement.
- = ANY is equivalent ==to==> IN operator.
- <> ANY is NOT equivalent ==to==> NOT IN operator. (X)

## ALL operator

- ALL operator allows you to query data by comparing a value with a list of values returned by a subquery.
- SYNTAX: comparison_operator ALL (subquery)
  - NOTE for above syntax:
    - The ALL operator must be preceded by a comparison operator =, <=, >, <, > and <>
    - ALL operator must be followed by a subquery which also must be surrounded by the parentheses.

## EXISTS operator

- EXISTS operator is used to test for existence of rows in a subquery.
- EXISTS accepts an argument which is a subquery.
- If the subquery returns at least one row, the result of EXISTS is true. In case the subquery returns no row, the result is of EXISTS is false.
- result of EXISTS depends on whether any row returned by the subquery, and not on the content of the rows. Therefore, the columns name that appear on the SELECT clause of the subquery are not important.

---

# CTE (common table expressions)

- CTE is a temporary result set which you can reference within another SQL statement including SELECT, INSERT, UPDATE or DELETE.
- CTEs are like temporary tables that only exist during the execution of the query.
- SYNTAX:

```
  WITH cte_name (column_list) AS (
  CTE_query_definition
  )
  statement;
```

- Syntax depict:
  - First, specify the name of the CTE following by an optional column list.
  - Second, inside the body of the WITH clause, specify a query that returns a result set. If you do not explicitly specify the column list after the CTE name, the select list of the CTE_query_definition will become the column list of the CTE.
  - Third, use the CTE like a table or view in the statement which can be a SELECT, INSERT, UPDATE, or DELETE.
- CTEs are typically used to simplify complex joins and subqueries
- CTE advantages:
  - Improve the readability of complex queries.
  - Ability to create recursive queries. Recursive queries are queries that reference themselves.
  - Use in conjunction with window functions.
    (You can use CTEs in conjunction with window functions to create an initial result set and use another select statement to further process this result set).

## recursive query

- A recursive query is a query that refers to a recursive CTE.
- SYNTAX :

```
WITH RECURSIVE cte_name AS(
    CTE_query_definition -- non-recursive term
    UNION [ALL]
    CTE_query definion  -- recursive term
) SELECT * FROM cte_name;
```

- Syntax depict:
  - Non-recursive term: the non-recursive term is a CTE query definition that forms the base result set of the CTE structure.
  - Recursive term: the recursive term is one or more CTE query definitions joined with the non-recursive term using the UNION or UNION ALL operator.
  - Termination check: the recursion stops when no rows are returned from the previous iteration.

---

# db transaction

- unit of work design pattern implementated in nestjs-typeorm project
- A database transaction is a single unit of work that consists of one or more operations.
- classical example of a transaction is a bank transfer from one account to another. A complete transaction must ensure a balance between the sender and receiver accounts. It means that if the sender account transfers X amount, the receiver receives X amount, no more or no less.
- A PostgreSQL transaction is atomic, consistent, isolated, and durable. (ACID)
  - Atomicity guarantees that the transaction completes in an all-or-nothing manner.
  - Consistency ensures the change to data written to the database must be valid and follow predefined rules.
  - Isolation determines how transaction integrity is visible to other transactions.
  - Durability makes sure that transactions that have been committed will be stored in the database permanently.

---
