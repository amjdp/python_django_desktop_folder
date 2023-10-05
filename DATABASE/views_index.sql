postgres=# create database views_index_example;
CREATE DATABASE

postgres=# \c views_index_example
You are now connected to database "views_index_example" as user "postgres".

CREATE TABLE student (
  id SERIAL PRIMARY KEY,
  student_name VARCHAR(50) NOT NULL,
  class VARCHAR(10) NOT NULL,
  section VARCHAR(10) NOT NULL
);

INSERT INTO student (student_name, class, section)
VALUES
  ('Jim', '10', 'A'),
  ('Reen', '9', 'B'),
  ('Arjun', '11', 'C'),
  ('Surya', '10', 'B'),
  ('Diya', '9', 'A'),
  ('Priya', '11', 'B'),
  ('Sneha', '10', 'C'),
  ('Sarah', '9', 'A'),
  ('Sam', '11', 'A'),
  ('April', '10', 'B');

  CREATE TABLE student_grade(
  id SERIAL PRIMARY KEY,
  student_id INTEGER REFERENCES student(id),
  subject VARCHAR(50) NOT NULL,
  grade VARCHAR(2) NOT NULL
);

ALTER TABLE student_grade ADD COLUMN marks FLOAT;

-- A: 90-100
-- B: 80-89
-- C: 70-79
-- D: 60-69
-- F: 0-59 (failed)

UPDATE student_grade
SET marks = 95
WHERE grade = 'A';

UPDATE student_grade
SET marks = 83
WHERE grade = 'B';

UPDATE student_grade
SET marks = 74
WHERE grade = 'C';

UPDATE student_grade
SET marks = 24
WHERE grade = 'F';


INSERT INTO student_grade(student_id, subject, grade)
VALUES
  (1, 'Chemistry', 'A'),
  (1, 'Physics', 'B'),
  (1, 'Biology', 'F'),
  (2, 'Chemistry', 'B'),
  (2, 'Physics', 'F'),
  (2, 'Biology', 'C'),
  (3, 'Chemistry', 'A'),
  (3, 'Physics', 'A'),
  (3, 'Biology', 'A'),
   (4, 'Chemistry', 'B'),
  (4, 'Physics', 'F'),
  (4, 'Biology', 'B'),
  (5, 'Chemistry', 'C'),
  (5, 'Physics', 'F'),
  (5, 'Biology', 'A'),
  (6, 'Chemistry', 'B'),
  (6, 'Physics', 'B'),
  (6, 'Biology', 'B'),
  (7, 'Chemistry', 'C'),
  (7, 'Physics', 'A'),
  (7, 'Biology', 'A'),
  (8, 'Chemistry', 'F'),
  (8, 'Physics', 'B'),
  (8, 'Biology', 'A'),
  (9, 'Chemistry', 'C'),
  (9, 'Physics', 'C'),
  (9, 'Biology', 'F'),
(10, 'Chemistry', 'F'),
  (10, 'Physics', 'A'),
  (10, 'Biology', 'B');

-- ******************************************************************************

CREATE VIEW Physics_Failed AS
SELECT student.student_name, student.class, student_grade.grade
FROM student
INNER JOIN student_grade ON student.id = student_grade.student_id
WHERE student_grade.subject = 'Physics' AND student_grade.grade = 'F';

SELECT * FROM Physics_Failed;

-- ******************************************************************************

-- Student Grades View:

-- This view combines data from both the "student" and "student_grade" tables to display student names along with 
-- their grades in different subjects.

CREATE VIEW student_grades_view AS
SELECT s.student_name, sg.subject, sg.grade
FROM student s
JOIN student_grade sg ON s.id = sg.student_id;

SELECT * FROM student_grades_view;

-- ******************************************************************************
-- Student Summary View:

-- This view provides a summary of each student's grades, including their average grade.

SELECT s.student_name, AVG(CASE WHEN sg.subject = 'Chemistry' THEN sg.marks END) AS chemistry_avg 
FROM student s
LEFT JOIN student_grade sg ON s.id = sg.student_id
GROUP BY s.id, s.student_name;

CREATE VIEW student_summary_view AS
SELECT s.student_name, s.class, s.section, AVG(CASE WHEN sg.subject = 'Chemistry' THEN sg.marks END) AS chemistry_avg,
       AVG(CASE WHEN sg.subject = 'Physics' THEN sg.marks END) AS physics_avg,
       AVG(CASE WHEN sg.subject = 'Biology' THEN sg.marks END) AS biology_avg,
       AVG(CASE WHEN sg.subject = 'Math' THEN sg.marks END) AS math_avg 
FROM student s
LEFT JOIN student_grade sg ON s.id = sg.student_id
GROUP BY s.id, s.student_name, s.class, s.section;

SELECT * FROM student_summary_view;

-- ******************************************************************************

-- Failed Students View:

-- This view identifies students who have failed at least one subject.

CREATE VIEW failed_students_view AS
SELECT DISTINCT s.student_name, s.class, s.section
FROM student s
JOIN student_grade sg ON s.id = sg.student_id
WHERE sg.grade = 'F';

SELECT * FROM failed_students_view;

-- ******************************************************************************

-- Top Performing Students View:

-- This view lists the top-performing students based on their average grades.

CREATE VIEW top_performing_students_view AS
SELECT s.student_name, AVG(CASE WHEN sg.subject = 'Chemistry' THEN sg.marks END +
                          CASE WHEN sg.subject = 'Physics' THEN sg.marks END +
                          CASE WHEN sg.subject = 'Biology' THEN sg.marks END) AS average_marks
FROM student s
JOIN student_grade sg ON s.id = sg.student_id
GROUP BY s.id, s.student_name
ORDER BY average_marks DESC
LIMIT 5; -- You can adjust the number of top-performing students you want to display

SELECT * FROM top_performing_students_view;

CREATE VIEW chemistry_students_view AS
SELECT s.student_name, AVG(CASE WHEN sg.subject = 'Chemistry' THEN sg.marks END) AS average_marks
FROM student s
JOIN student_grade sg ON s.id = sg.student_id
GROUP BY s.id, s.student_name
ORDER BY average_marks DESC
LIMIT 5;

SELECT * FROM top_performing_chemistry_students_view;


CREATE VIEW top_students AS
SELECT s.student_name, sg.subject, AVG(sg.marks) AS overall_average_marks
FROM student s
JOIN student_grade sg ON s.id = sg.student_id
GROUP BY s.student_name, sg.subject
ORDER BY overall_average_marks DESC;


CREATE VIEW top_A AS
SELECT s.student_name, sg.subject, AVG(sg.marks) AS overall_average_marks
FROM student s
JOIN student_grade sg ON s.id = sg.student_id
WHERE sg.grade = 'A'
GROUP BY s.student_name, sg.subject
ORDER BY overall_average_marks DESC;

-- ******************************************************************************

-- To get a list of the top-performing students in all subjects, 
-- you can modify the SQL query to calculate the average marks for each subject and 
-- rank the students based on their performance in each subject. 
-- Here's a modified query that does this:

CREATE VIEW top_performing_students_view AS
SELECT s.student_name, sg.subject, AVG(sg.marks) AS average_marks
FROM student s
JOIN student_grade sg ON s.id = sg.student_id
GROUP BY s.student_name, sg.subject
ORDER BY s.student_name, average_marks DESC;

-- Now, you can use a common table expression (CTE) to rank the students for each subject
WITH ranked_students AS (
  SELECT
    student_name,
    subject,
    average_marks,
    ROW_NUMBER() OVER (PARTITION BY subject ORDER BY average_marks DESC) AS rank
  FROM top_performing_students_view
)

-- Finally, you can filter the CTE to get the top-performing students in each subject
SELECT student_name, subject, average_marks
FROM ranked_students
WHERE rank <= 5; -- You can adjust the number of top-performing students you want to display



CREATE VIEW top_sts_view AS
SELECT s.student_name, sg.subject, AVG(sg.marks) AS average_marks
FROM student s
JOIN student_grade sg ON s.id = sg.student_id
GROUP BY s.student_name, sg.subject
ORDER BY s.student_name, average_marks DESC;

WITH ranked_students AS (
  SELECT
    student_name,
    subject,
    average_marks,
    ROW_NUMBER() OVER (PARTITION BY subject ORDER BY average_marks DESC) AS rank
  FROM top_sts_view
)

SELECT student_name, subject, average_marks
FROM ranked_students
WHERE rank <= 5; 



-- ******************************************************************************

-- index--------------


CREATE TABLE employees(
    pk_emp_id SERIAL PRIMARY KEY,
    type VARCHAR(100),
    first_name VARCHAR(200), 
    last_name VARCHAR(200),
    email VARCHAR(200),
    phone VARCHAR(100),
    gender VARCHAR(20),
    dob DATE,
    place VARCHAR(100)
);

INSERT INTO employees VALUES (
    1,
    'Manager',
    'Jane',
    'Austen',
    'janeausten@gmail.com',
    '9965473569',
    'Female',
    '1775-12-16',
    'Steventon'
);

INSERT INTO employees VALUES (
    2,
    'Manager',
    'Agatha',
    'Christie',
    'agathachristie@gmail.com',
    '9965473569',
    'Female',
    '1890-09-15',
    'Torquay'
);


INSERT INTO employees VALUES (
     3,
    'Salesman',
    'Paul',
    'Addison',
    'pauladdison@gmail.com',
    '9966987469',
    'Male',
    '1886-06-18',
    'Norway'
);

INSERT INTO employees VALUES (
    4,
    'Salesman',
    'Michael',
    'Abbensetts',
    'michaelabbensetts@gmail.com',
    '9966989879',
    'Male',
    '1896-08-08',
    'London'
);

INSERT INTO employees VALUES (
    5,
    'Accounts',
    'Drishya',
    'K',
    'migtrdyetts@gmail.com',
    '9966989879',
    'Female',
    '1996-08-08',
    'London'
);

SELECT pk_emp_id, first_name, place FROM employees WHERE email = 'janeausten@gmail.com';

CREATE INDEX employees_email_idx ON employees(email);

-- ******************************************************************************************************

To see a list of views in a PostgreSQL database, you can use the following SQL query:

SELECT table_name
FROM information_schema.views
WHERE table_schema = 'public';

This query selects all view names from the information_schema.views table where the table_schema is 'public'. 
The 'public' schema is the default schema in PostgreSQL, but if your views are in a different schema, replace 
'public' with the appropriate schema name.
When you run this query, it will return a list of view names present in the specified schema.

SELECT table_name
FROM information_schema.tables
WHERE table_type = 'VIEW' AND table_schema = 'public';
