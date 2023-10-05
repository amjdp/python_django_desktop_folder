
-- create a database named school

-- create tables for storing the details of classes, subjects, students, teachers, examinations

-- classes table should contain the columns pk_class_id, class_name
-- subjects table should contain the columns pk_subject_id, subject
-- students table should contain the columns pk_student_id, s_name, date_of_birth, contact_number, name_of_guardian, fk_class_id
-- teachers table should contain the columns pk_teacher_id, t_name, fk_subject_id
-- examinations table should contain the columns pk_exam_id, exam_name, date, fk_subject_id 

-- Retrieve Students from a Specific Class
-- Retrieve Exams for a Specific Subject
-- Retrieve Teachers for a Specific Subject
-- Retrieve Students Born Before a Certain Date
-- Retrieve Exams After a Specific Date
-- Retrieve the first 3 students from the "students" table
-- Retrieve a list of distinct subjects from the "examinations" table
-- Retrieve Students Whose Guardian Names Start with "J"
-- Retrieve Students Whose Contact Number Start with "98"
-- Retrieve Students Whose Names End with "e"
-- Retrieve Teachers Whose Names Contain "****"
-- Retrieve Subjects That Start with "M" and End with "s"
-- Retrieve Exams with Names Containing "*****"
-- Retrieve Guardians Whose Names Are Exactly Three Characters Long

-- ------------------------------------------------

-- Create Database:
CREATE DATABASE school;

-- database_work_school_db;


-- Connect to Database:
\c school;

-- Create Tables:

-- Classes Table
CREATE TABLE classes (
    pk_class_id serial PRIMARY KEY,
    class_name VARCHAR(50)
);

-- Subjects Table
CREATE TABLE subjects (
    pk_subject_id serial PRIMARY KEY,
    subject_name VARCHAR(100)
);

-- Students Table
CREATE TABLE students (
    pk_student_id serial PRIMARY KEY,
    s_name VARCHAR(200),
    date_of_birth date,
    contact_number VARCHAR(20),
    name_of_guardian VARCHAR(100),
    fk_class_id INT,
    FOREIGN KEY(fk_class_id) REFERENCES classes(pk_class_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Teachers Table
CREATE TABLE teachers (
    pk_teacher_id serial PRIMARY KEY,
    t_name VARCHAR(200),
    fk_subject_id INT,
    FOREIGN KEY(fk_subject_id) REFERENCES subjects(pk_subject_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Examinations Table
CREATE TABLE examinations (
    pk_exam_id serial PRIMARY KEY,
    exam_name VARCHAR(200),
    date date,
    fk_subject_id INT,
    FOREIGN KEY(fk_subject_id) REFERENCES subjects(pk_subject_id) ON DELETE CASCADE ON UPDATE CASCADE
);



-- Example of inserting data into the tables:

-- Insert Data into Classes Table:

INSERT INTO classes (class_name)
VALUES
    ('Grade 9'),
    ('Grade 10'),
    ('Grade 8');

-- Insert Data into Subjects Table:

INSERT INTO subjects (subject_name)
VALUES
    ('Mathematics'),
    ('Science'),
    ('History'),
    ('English');

-- Insert Data into Students Table:

INSERT INTO students (s_name, date_of_birth, contact_number, name_of_guardian, fk_class_id)
VALUES
    ('Alice', '2005-05-10', '123-456-7890', 'John Doe', 1),
    ('Bob', '2004-09-15', '987-654-3210', 'Jane Smith', 2),
    ('Charlie', '2006-03-22', '555-123-4567', 'David Johnson', 3);

-- Insert Data into Teachers Table:

INSERT INTO teachers (t_name, fk_subject_id)
VALUES
    ('Breezni', 1),
    ('Mariamma', 2),
    ('Baby', 1),
    ('Rosa', 4),
    ('Valasala', 3),
    ('Salini', 4),
    ('Sija', 2);

-- Insert Data into Examinations Table:

INSERT INTO examinations (exam_name, date, fk_subject_id)
VALUES
    ('Midterm Exam', '2023-09-15', 1),
    ('Science Quiz', '2023-10-05', 2),
    ('History Final', '2023-11-20', 3);

-- Retrieve tables

SELECT * FROM classes;
SELECT * FROM subjects;
SELECT * FROM students;
SELECT * FROM teachers;
SELECT * FROM examinations;

-- Retrieve Students from a Specific Class:

SELECT s_name, date_of_birth
FROM students
WHERE fk_class_id = 1;

-- Retrieve Exams for a Specific Subject

SELECT exam_name, date
FROM examinations
WHERE fk_subject_id = 2;

-- Retrieve Teachers for a Specific Subject

SELECT t_name
FROM teachers
WHERE fk_subject_id = 3;

-- Retrieve Students Born Before a Certain Date

SELECT s_name, date_of_birth
FROM students
WHERE date_of_birth < '2006-01-01';

-- Retrieve Exams After a Specific Date

SELECT exam_name, date
FROM examinations
WHERE date > '2023-09-01';

-- Retrieve the first 3 students from the "students" table

SELECT s_name, date_of_birth
FROM students
LIMIT 3;

-- Retrieve a list of distinct subjects from the "examinations" table

SELECT DISTINCT fk_subject_id
FROM examinations;

-- In this case, you might want to join with the "subjects" table to get the actual subject_names:

SELECT DISTINCT s.subject_name
FROM examinations e
JOIN subjects s ON e.fk_subject_id = s.pk_subject_id;


-- Retrieve Students Whose Guardian Names Start with "J"

SELECT s_name, name_of_guardian
FROM students
WHERE name_of_guardian LIKE 'J%';

-- Retrieve Students Whose Contact Number Start with "98"

SELECT s_name, contact_number
FROM students
WHERE contact_number LIKE '98__________';

-- Retrieve Students Whose Names End with "e"

SELECT s_name, name_of_guardian
FROM students
WHERE s_name LIKE '%e';

-- Retrieve Teachers Whose Names Contain "Smith"

SELECT t_name
FROM teachers
WHERE t_name LIKE '%al%';


-- Retrieve Subjects That Start with "M" and End with "s"

SELECT subject_name
FROM subjects
WHERE subject_name LIKE 'M%s';

-- Retrieve Exams with Names Containing "Quiz"

SELECT exam_name, date
FROM examinations
WHERE exam_name LIKE '%Quiz%';

-- Retrieve Guardians Whose Names Are Exactly Three Characters Long

SELECT s_name, name_of_guardian
FROM students
WHERE LENGTH(name_of_guardian) = 8;



-- Retrieve Teachers and Their Respective Subjects:

SELECT t.t_name, s.subject_name
FROM teachers t
JOIN subjects s ON t.fk_subject_id = s.pk_subject_id;



-- in the above example create a table for storing marks of students 
-- student_marks table should contain the columns pk_mark_id, fk_student_id, fk_exam_id, marks_obtained

CREATE TABLE student_marks (
    pk_mark_id serial PRIMARY KEY,
    fk_student_id INT,
    fk_exam_id INT,
    marks_obtained FLOAT,
    FOREIGN KEY(fk_student_id) REFERENCES students(pk_student_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(fk_exam_id) REFERENCES examinations(pk_exam_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO student_marks (fk_student_id, fk_exam_id, marks_obtained)
VALUES
    (1, 1, 85),
    (2, 1, 75),
    (3, 1, 90),
    (1, 2, 95),
    (2, 2, 80),
    (3, 2, 88);


-- Using SUM to Calculate Total Marks for Each Student:

SELECT
    fk_student_id AS student_id,
    (SELECT s_name FROM students WHERE pk_student_id = fk_student_id) AS student_name,
    SUM(marks_obtained) AS total_marks
FROM
    student_marks
GROUP BY
    fk_student_id
ORDER BY
    total_marks DESC;


-- Using AVG to Calculate Average Marks for Each Exam:

SELECT
    fk_exam_id AS exam_id,
    (SELECT exam_name FROM examinations WHERE pk_exam_id = fk_exam_id) AS exam_name,
    AVG(marks_obtained) AS average_marks
FROM
    student_marks
GROUP BY
    fk_exam_id
ORDER BY
    exam_id;

-- Using COUNT to Count Students in Each Class:

SELECT
    fk_class_id AS class_id,
    (SELECT class_name FROM classes WHERE pk_class_id = fk_class_id) AS class_name,
    COUNT(*) AS student_count
FROM
    students
GROUP BY
    fk_class_id
ORDER BY
    class_id;


-- Using GROUP BY and SUM to Calculate Total Marks for Each Student:

SELECT
    fk_student_id AS student_id,
    (SELECT s_name FROM students WHERE pk_student_id = fk_student_id) AS student_name,
    SUM(marks_obtained) AS total_marks
FROM
    student_marks
GROUP BY
    fk_student_id
ORDER BY
    total_marks DESC;

-- Using HAVING to Filter Students with Total Marks Above 200:

SELECT
    fk_student_id AS student_id,
    (SELECT s_name FROM students WHERE pk_student_id = fk_student_id) AS student_name,
    SUM(marks_obtained) AS total_marks
FROM
    student_marks
GROUP BY
    fk_student_id
HAVING
    SUM(marks_obtained) > 150
ORDER BY
    total_marks DESC;

-- Using GROUP BY and ORDER BY to Display Total Marks for Each student in each exam

SELECT
    sm.fk_student_id AS student_id,
    (SELECT s_name FROM students WHERE pk_student_id = sm.fk_student_id) AS student_name,
    sm.fk_exam_id AS exam_id,
    (SELECT exam_name FROM examinations WHERE pk_exam_id = sm.fk_exam_id) AS exam_name,
    SUM(sm.marks_obtained) AS total_marks
FROM
    student_marks sm
GROUP BY
    sm.fk_student_id,
    sm.fk_exam_id
ORDER BY
    student_id,
    exam_id;

 student_id | student_name | exam_id |   exam_name   | total_marks
------------+--------------+---------+---------------+-------------
          1 | Alice        |       1 | Midterm Exam  |          85
          1 | Alice        |       2 | Science Quiz  |          95
          1 | Alice        |       3 | History Final |           0
          2 | Bob          |       1 | Midterm Exam  |          75
          2 | Bob          |       2 | Science Quiz  |          80
          2 | Bob          |       3 | History Final |           0
          3 | Charlie      |       1 | Midterm Exam  |          90
          3 | Charlie      |       2 | Science Quiz  |          88
(8 rows)


-- Using GROUP BY and ORDER BY to Display Total Marks for Each student in each subject 

SELECT
    sm.fk_student_id AS student_id,
    (SELECT s_name FROM students WHERE pk_student_id = sm.fk_student_id) AS student_name,
    e.fk_subject_id AS subject_id,
    (SELECT subject_name FROM subjects WHERE pk_subject_id = e.fk_subject_id),
    SUM(sm.marks_obtained) AS total_marks
FROM
    student_marks sm, examinations e
WHERE
    sm.fk_exam_id = e.pk_exam_id
GROUP BY
    sm.fk_student_id,
    e.fk_subject_id
ORDER BY
    student_id,
    subject_id;


 student_id | student_name | subject_id | subject_name | total_marks
------------+--------------+------------+--------------+-------------
          1 | Alice        |          1 | Mathematics  |          85
          1 | Alice        |          2 | Science      |          95
          1 | Alice        |          3 | History      |           0
          2 | Bob          |          1 | Mathematics  |          75
          2 | Bob          |          2 | Science      |          80
          2 | Bob          |          3 | History      |           0
          3 | Charlie      |          1 | Mathematics  |          90
          3 | Charlie      |          2 | Science      |          88
(8 rows)



-- To find the sum of marks of each student in each subject_name for each exam

SELECT
    s.pk_student_id,
    s.s_name AS student_name,
    e.pk_exam_id,
    e.exam_name,
    sub.subject_name,
    SUM(sm.marks_obtained) AS total_marks
FROM
    student_marks sm
JOIN students s ON sm.fk_student_id = s.pk_student_id
JOIN examinations e ON sm.fk_exam_id = e.pk_exam_id
JOIN subjects sub ON e.fk_subject_id = sub.pk_subject_id
GROUP BY
    s.pk_student_id,
    s.s_name,
    e.pk_exam_id,
    e.exam_name,
    sub.subject_name
ORDER BY
    s.pk_student_id,
    e.pk_exam_id;

-- Using GROUP BY and ORDER BY to Display Total Marks for Each student in Each Exam for a particular subject:

SELECT
    sm.fk_student_id AS student_id,
    (SELECT s_name FROM students WHERE pk_student_id = sm.fk_student_id) AS student_name,
    sm.fk_exam_id AS exam_id,
    (SELECT exam_name FROM examinations WHERE pk_exam_id = sm.fk_exam_id) AS exam_name,
    SUM(sm.marks_obtained) AS total_marks
FROM
    student_marks sm
JOIN examinations e ON sm.fk_exam_id = e.pk_exam_id
WHERE
    e.fk_subject_id = 2 
GROUP BY
    sm.fk_student_id,
    sm.fk_exam_id
ORDER BY
    student_id,
    exam_id;

 pk_student_id | student_name | pk_exam_id |   exam_name   | subject_name | total_marks
---------------+--------------+------------+---------------+--------------+-------------
             1 | Alice        |          1 | Midterm Exam  | Mathematics  |          85
             1 | Alice        |          2 | Science Quiz  | Science      |          95
             1 | Alice        |          3 | History Final | History      |           0
             2 | Bob          |          1 | Midterm Exam  | Mathematics  |          75
             2 | Bob          |          2 | Science Quiz  | Science      |          80
             2 | Bob          |          3 | History Final | History      |           0
             3 | Charlie      |          1 | Midterm Exam  | Mathematics  |          90
             3 | Charlie      |          2 | Science Quiz  | Science      |          88
(8 rows)




-- JOINS & SUBQUERIES


-- Retrieve Student Names and Their Respective Class Names:

SELECT s.s_name AS student_name, c.class_name
FROM students s
INNER JOIN classes c ON s.fk_class_id = c.pk_class_id;

 student_name | class_name
--------------+------------
 Alice        | Grade 9
 Bob          | Grade 10
 Charlie      | Grade 8
(3 rows)

-- Retrieve Teachers' Names and Their Respective Subject Names:

SELECT t.t_name AS teacher_name, sub.subject_name
FROM teachers t
INNER JOIN subjects sub ON t.fk_subject_id = sub.pk_subject_id;

 teacher_name | subject_name
--------------+--------------
 Breezni      | Mathematics
 Mariamma     | Science
 Baby         | Mathematics
 Rosa         | English
 Valasala     | History
 Salini       | English
 Sija         | Science
(7 rows)

--  Retrieve Students and Their Marks in a Specific Exam:

SELECT s.s_name AS student_name, sm.marks_obtained
FROM students s
INNER JOIN student_marks sm ON s.pk_student_id = sm.fk_student_id
WHERE sm.fk_exam_id = 1;  

 student_name | marks_obtained
--------------+----------------
 Alice        |             85
 Bob          |             75
 Charlie      |             90
(3 rows)


-- Retrieve Teachers Who Are Not Teaching Any Subjects:

SELECT t.t_name AS teacher_name
FROM teachers t
LEFT JOIN subjects sub ON t.fk_subject_id = sub.pk_subject_id
WHERE sub.pk_subject_id IS NULL;

 teacher_name
--------------
 Maxi
(1 row)

 pk_teacher_id |  t_name  | fk_subject_id
---------------+----------+---------------
             6 | Breezni  |             1
             7 | Mariamma |             2
             8 | Baby     |             1
             9 | Rosa     |             4
            10 | Valasala |             3
            11 | Salini   |             4
            12 | Sija     |             2
            13 | Maxi     |
(8 rows)

database_work_school_db=# select * from students;
 pk_student_id | s_name  | date_of_birth | contact_number | name_of_guardian | fk_class_id
---------------+---------+---------------+----------------+------------------+-------------
             1 | Alice   | 2005-05-10    | 123-456-7890   | John Doe         |           1
             2 | Bob     | 2004-09-15    | 987-654-3210   | Jane Smith       |           2
             3 | Charlie | 2006-03-22    | 555-123-4567   | David Johnson    |           3
(3 rows)

database_work_school_db=# select * from subjects;
 pk_subject_id | subject_name
---------------+--------------
             1 | Mathematics
             2 | Science
             3 | History
             4 | English
(4 rows)


-- Retrieve Students Who Scored Higher Than the Class Average:

SELECT s.s_name AS student_name, sm.marks_obtained
FROM students s
JOIN student_marks sm ON s.pk_student_id = sm.fk_student_id
WHERE sm.marks_obtained > (
    SELECT AVG(marks_obtained)
    FROM student_marks
    WHERE fk_class_id = s.fk_class_id
);

 student_name | marks_obtained
--------------+----------------
 Alice        |             85
 Bob          |             75
 Charlie      |             90
 Alice        |             95
 Bob          |             80
 Charlie      |             88
(6 rows)

database_work_school_db=#  SELECT AVG(marks_obtained)
database_work_school_db-#     FROM student_marks;
  avg
--------
 64.125
(1 row)


-- Retrieve Students Who Scored the Highest Marks in Each Exam:

SELECT e.exam_name, s.s_name AS top_student, sm.marks_obtained
FROM examinations e
JOIN (
    SELECT fk_exam_id, MAX(marks_obtained) AS max_marks
    FROM student_marks
    GROUP BY fk_exam_id
) max_marks ON e.pk_exam_id = max_marks.fk_exam_id
JOIN student_marks sm ON max_marks.fk_exam_id = sm.fk_exam_id AND max_marks.max_marks = sm.marks_obtained
JOIN students s ON sm.fk_student_id = s.pk_student_id;

   exam_name   | top_student | marks_obtained
---------------+-------------+----------------
 Midterm Exam  | Charlie     |             90
 Science Quiz  | Alice       |             95
 History Final | Alice       |              0
 History Final | Bob         |              0
(4 rows)

-- Retrieve Exams Where Students Averaged Over 80 Marks:

SELECT e.exam_name, AVG(sm.marks_obtained) AS average_marks
FROM examinations e
JOIN student_marks sm ON e.pk_exam_id = sm.fk_exam_id
GROUP BY e.pk_exam_id, e.exam_name
HAVING AVG(sm.marks_obtained) > 80;

  exam_name   |   average_marks
--------------+-------------------
 Science Quiz | 87.66666666666667
 Midterm Exam | 83.33333333333333
(2 rows)


-- Retrieve Students Who Have Not Taken Exams in a Particular Subject:

SELECT s.s_name AS student_name
FROM students s
WHERE s.pk_student_id NOT IN (
    SELECT DISTINCT sm.fk_student_id
    FROM student_marks sm
    JOIN examinations e ON sm.fk_exam_id = e.pk_exam_id
    WHERE e.fk_subject_id = 3 
);

 student_name
--------------
 Charlie
(1 row)



INSERT INTO student_marks (fk_student_id, fk_exam_id, marks_obtained)
VALUES
    (1, 3, 0),
    (2, 3, 0);


-- Retrieve Students Who Have Taken Exams for a Specific Subject:

SELECT s.s_name AS student_name
FROM students s
WHERE s.pk_student_id IN (
    SELECT DISTINCT sm.fk_student_id
    FROM student_marks sm
    JOIN examinations e ON sm.fk_exam_id = e.pk_exam_id
    WHERE e.fk_subject_id = 2  
);

 student_name
--------------
 Alice
 Bob
 Charlie
(3 rows)


--  Retrieve Students Who Share the Same Guardian:

SELECT s1.s_name AS student1, s2.s_name AS student2, s1.name_of_guardian
FROM students s1
JOIN students s2 ON s1.name_of_guardian = s2.name_of_guardian
WHERE s1.pk_student_id < s2.pk_student_id;  

 student1 | student2 | name_of_guardian
----------+----------+------------------
(0 rows)




-- To avoid duplicate pairs and self-pairs

CREATE TABLE classes (
    pk_c_id serial PRIMARY KEY,
    fk_class_id INT 
);


ALTER TABLE classes
ADD CONSTRAINT fk_class_id_constraint
FOREIGN KEY (fk_class_id) REFERENCES classes(pk_class_id)  ON DELETE CASCADE ON UPDATE CASCADE;
