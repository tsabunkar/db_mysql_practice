/*
Problem 1
- Write the schema for students table and papers table
- students table
    - sid
    - first_name
- papers table
    - title
    - grade
    - student_id
- One student can have multiple papers but a paper belong to only one particular student
*/


/* 

CREATE TABLE students(
    sid INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50)
);

CREATE TABLE papers(
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(sid) ON DELETE CASCADE 
); 

DESC students;
DESC papers;

*/

INSERT INTO students
    (first_name)
VALUES
    ('Caleb'),
    ('Samantha'),
    ('Raj'),
    ('Carlos'),
    ('Lisa');

INSERT INTO papers
    (student_id, title, grade )
VALUES
    (1, 'My First Book Report', 60),
    (1, 'My Second Book Report', 75),
    (2, 'Russian Lit Through The Ages', 94),
    (2, 'De Montaigne and The Art of The Essay', 98),
    (4, 'Borges and Magical Realism', 89);

---------------------------------------------

/*
Print first_name, title and grade 
*/

SELECT first_name, title, grade
FROM students s INNER JOIN papers p
    ON s.sid = p.student_id
ORDER BY grade DESC;

---------------------------------------------

/*
Print all the students table and common of both the table 
*/
SELECT first_name, title, grade
FROM students s LEFT JOIN papers p
    ON s.sid = p.student_id;

-- For above query replace title with missing and grade with 0 if they have null

SELECT first_name,
    IFNULL(title, 'MISSING') AS 'title',
    IFNULL(grade, 0) AS 'grade'
FROM students s LEFT JOIN papers p
    ON s.sid = p.student_id;

---------------------------------------------

/*
Print average of each student average grade
*/
SELECT first_name,
    IFNULL(AVG(grade), 0) AS 'average'
FROM students s LEFT JOIN papers p
    ON s.sid = p.student_id
GROUP BY s.sid
ORDER BY average DESC;

-- above table add passing status column

SELECT first_name,
    IFNULL(AVG(grade), 0) AS 'average',
    CASE 
        WHEN AVG(grade) IS NULL THEN 'FAILING'
        WHEN AVG(grade) <= 75 THEN 'FAILING'
        ELSE 'PASSING'
    END AS 'passing_status'
FROM students s LEFT JOIN papers p
    ON s.sid = p.student_id
GROUP BY s.sid
ORDER BY average DESC;