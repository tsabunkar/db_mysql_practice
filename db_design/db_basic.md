# What is database

- Defined: A comprehensive collection of related data organized for convenient access, generally in a compouter
- Collection of data (when we ask queries to db, then it becomes information for us)
- Storage for large amount of data
- Tool for ad hoc retrievel (how many customer we have in asia)

# Different types of databases

- Flat File : Microsoft Excel
  - Ideal for small amounts of data
  - Tend to contain redundant data
- Relational : MySQL, PostgreSQL, etc
  - Logical Structure of data
  - Efficient
  - Reduces redndant data
- Non-Relational : MongoDB, DynamoDB, Redis

# Process of DB Design

- Determine the purpose of the db (what your db would track ?)
- Collect the previous exisiting Paper Forms, Report, etc (which was used before db)
- Meet with Current and Future Users
- Normalize the Data (Reducing/removing redundancy- so that we don't have gaint tables)
- Create the Database (Creating the columns- breakdown into lowest form, if we have name column- try to break first_name, last_name, etc)
- Review
