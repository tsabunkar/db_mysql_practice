# Normalization

- What is Normalization
- Basic Steps of Normalization

---

# What is Normalization

- Defined: The process of grouping common data into tables to produce the following results
  - Eliminate redundancy
  - Organizes data efficiently
  - Improves data consistency
- Breaking the large/gaint tables into logical tables which are related to each other, thus removing the redundancy
- Boyce-Codd Normal Form (Five Normal Forms)

---

# Basic Steps of Normaization

- Brainstorm
- Oragnize
- Eliminate Repetition
- Assign Relationships
- Test

1. Bainstorm

- Add any piece of data
- Think outside the box
- Don't worry if the data does not relate

2. Oragnize

- Group fields into tables
- Are the obvious themes ? (Purpose of db)
- Every table must have a Primary Key (dont use customer mobile no as PK, etc -> Let Computer assign the PK[Unique Identifier] )
- Table do not have to be perfect at this point

3. Eliminate Repetition

- This step you - Try Normaizing your db
- Most Critical and Most Difficult question: "Can one ** have more than one ** ?"
  - ex:
    - Can one customerID have more than one last name ? ==> 'No'
    - Can one customerID have more than one telephone no ? ==> 'Yes' (Whenever the answer is -Yes, create another/separate table)
    - Can one EmployeeID have more than one Job Title ? ==> 'Yes' (Job Title--> will be another table)
    - Can one CompanyId have more than one Company Name ? ==> 'No'
    - Can one companyName have more than one Street_address ? ==> 'Yes' (create separate Company Address table)
- Example: [./normalize-ex]

4. Assign Relationships

- Three type of Relations:
  - OneToOne
  - OneToMany
  - ManyToMany (Note: Avoid this relation b/w tables)

---

## OneToOne Relationship

- 1 record in a Parent table relates to 1 and only 1 record in a child table (Second table)
- Used primarily for security reasons.
- [./one2one/1To1.png] ==> Emplyees Table has EmployeeId is PK and also EmployeeDetails has EmployeeId is PK
- [./one2one/1To1-Employee-Salary.png] ==> Emplyees Table has EmployeeId is PK and also Salary has EmployeeId is PK (Even though hacker got the access of Salary table, he will never get to know whoes salary belongs which employee untill he get the access of Employee table --> Thus Security is Enhanced)

---

## OneToMany Relationship

- 1 record in a Parent table relates to 1 or more records in a Child table (second table)
- Most Commonly used
- ex:
  - 1 person can have more mobile product
  - 1 person can have multiple pair of shoes
- [./one2many/cruise-flat.png] ==> Flat/Gaint table which had been normalized to Ships table and Departures table
- [./one2many/ships.png] ==> Ships table (ShipNumber is PK)
- [./one2many/departures.png] ==> Departures table (DepartureID is PK)

---

## ManyToMany Relationship

- 1 or more records in a Parent table relates to 1 or more records in a child table (second table)
- Not recommended
- Creates Cartesian Join
- Returned datasets are typically unusable and inflated
- BAD Practice / Not recommended to have this relationship, If you try to join these two table you will get -> Cartesian Join (if Table 'A' ha 100 reocrds, Table 'B' has 100 records then if I join total records = 10k records, bcoz - Table 'A' first record will join to all the 100 records of Table 'B', Table 'A' second record will join to all the 100 records of Table 'B' soon....)
- Example:
  - Consider 3 table Customers, Orders and Products Table
  - Customers (CustomerID - PK) {1}------>{∞} Orders (OrderID - PK) [One Customer can place many orders]
  - Products (ID - PK) {∞} -----> {∞} Orders (OrderID - PK) [Many Product can have Many Orders ]
  - [./many2many/many2many.png]
  - To Remove Many2Many Relationship Trick:
    - Create a normalize table (intermediate) between Products table and Orders table
    - Creating normalize table -> Order Details Table between Orders table and Products table ==> [./many2many/remove-Many2Many.png]

---

- Relating Company Table
  - For Company Table which was normalized : we can relates (put relationship) ==> [./normalize-ex/normalize-relation-final-table.png]

---

# BAD DESIGN

- Table which are wide is bad designed rather we should have table which are long -> means : Table which have more number of columns are bad designed rather we should have multiple normalized table with less number of columns and more number of records
  - Example :
