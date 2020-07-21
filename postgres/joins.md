# Joins

## Join

- PostgreSQL join is used to combine columns from one (self-join) or more tables based on the values of the common columns between related tables. - The common columns are typically the primary key columns of the first table and foreign key columns of the second table.
- INNER JOIN
  - The inner join examines each row in the first table (basket_a). It compares the value in the fruit_a column with the value in the fruit_b column of each row in the second table (basket_b).
  - If these values are equal, the inner join creates a new row that contains columns from both tables and adds this new row the result set.
- LEFT JOIN
  - The first table is called the left table and the second table is called the right table.
  - The left join starts selecting data from the left table. It compares values in the fruit_a column with the values in the fruit_b column in the basket_b table.
  - If these values are equal, the left join creates a new row that contains -> only records of left table + Common b/w two tables
  - NOTE: LEFT JOIN <==> LEFT OUTER JOIN
  - We can also write Left Inner Join by expictly mentioning - WHERE Clause with IS NULL thus, query which will project -> only records of left table - Common b/w two tables
  - Left Inner Join is ONLY rows from the left table
- RIGHT JOIN
  - The right join is a reversed version of the left join. The right join starts selecting data from the right table and compare it with left table.
  - NOTE: RIGHT JOIN <==> RIGHT OUTER JOIN
  - Right join -> only records of right table + Common b/w two tables
  - We can also write Right Inner Join by expictly mentioning : WHERE Clause with IS NULL thus, query which will project -> only records of right table - Common b/w two tables
  - Right Inner Join is ONLY rows from the right table
- FULL JOIN
  - contains all rows from both left and right tables, with the matching rows from both sides if available. In case there is no match, the columns of the table will be filled with NULL.
  - NOTE: FULL JOIN <==> FULL OUTER JOIN
  - Full join = only records of left table + Common b/w two tables + only records of right table
  - We can also write full Inner Join by expictly mentioning : WHERE Clause with IS NULL thus, query which will project -> only records of left table + only records of right table - Common b/w two tables
  - full Inner Join is ONLY rows from the left table & right table
- [.assets/PostgreSQL-Joins.png]
