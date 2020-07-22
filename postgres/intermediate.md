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
-
