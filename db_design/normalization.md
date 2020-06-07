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
    - Can one customer have more than one last name ? ==> 'No'
    - Can a customer have more than one telephone no ? ==> 'Yes' (Whenever the answer is -Yes, create another/separate table)
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

- OneToOne Relationship
  - 1 record in a Parent table relates to 1 and only 1 record in a child table (Second table)
  - Used primarily for security reasons.
  - [./1To1.png]

---
