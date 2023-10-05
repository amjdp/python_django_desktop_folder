Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:
psql (14.5)
WARNING: Console code page (437) differs from Windows code page (1252)
         8-bit characters might not work correctly. See psql reference
         page "Notes for Windows users" for details.
Type "help" for help.

postgres=# \c views_index_example
You are now connected to database "views_index_example" as user "postgres".
views_index_example=# \dt
             List of relations
 Schema |     Name      | Type  |  Owner
--------+---------------+-------+----------
 public | employees     | table | postgres
 public | student       | table | postgres
 public | student_grade | table | postgres
(3 rows)


views_index_example=# select * from employees;
 pk_emp_id |   type   | first_name | last_name  |            email            |   phone    | gender |    dob     |   place
-----------+----------+------------+------------+-----------------------------+------------+--------+------------+-----------
         1 | Manager  | Jane       | Austen     | janeausten@gmail.com        | 9965473569 | Female | 1775-12-16 | Steventon
         2 | Manager  | Agatha     | Christie   | agathachristie@gmail.com    | 9965473569 | Female | 1890-09-15 | Torquay
         3 | Salesman | Paul       | Addison    | pauladdison@gmail.com       | 9966987469 | Male   | 1886-06-18 | Norway
         4 | Salesman | Michael    | Abbensetts | michaelabbensetts@gmail.com | 9966989879 | Male   | 1896-08-08 | London
         5 | Accounts | Drishya    | K          | migtrdyetts@gmail.com       | 9966989879 | Female | 1996-08-08 | London
(5 rows)


views_index_example=# CREATE VIEW Female_Employees AS
views_index_example-# SELECT first_name FROM employees WHERE gender = "Female;"
views_index_example-# SELECT * FROM Female_Employees;
ERROR:  syntax error at or near "SELECT"
LINE 3: SELECT * FROM Female_Employees;
        ^
views_index_example=# CREATE VIEW student_grades_view AS
views_index_example-# SELECT s.student_name, sg.subject, sg.grade
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id;
CREATE VIEW
views_index_example=# SELECT * FROM student_grades_view;
 student_name |  subject  | grade
--------------+-----------+-------
 Jim          | Chemistry | A
 Jim          | Physics   | B
 Jim          | Biology   | F
 Reen         | Chemistry | B
 Reen         | Physics   | F
 Reen         | Biology   | C
 Arjun        | Chemistry | A
 Arjun        | Physics   | A
 Arjun        | Biology   | A
 Surya        | Chemistry | B
 Surya        | Physics   | F
 Surya        | Biology   | B
 Diya         | Chemistry | C
 Diya         | Physics   | F
 Diya         | Biology   | A
 Priya        | Chemistry | B
 Priya        | Physics   | B
 Priya        | Biology   | B
 Sneha        | Chemistry | C
 Sneha        | Physics   | A
 Sneha        | Biology   | A
 Sarah        | Chemistry | F
 Sarah        | Physics   | B
 Sarah        | Biology   | A
 Sam          | Chemistry | C
 Sam          | Physics   | C
 Sam          | Biology   | F
 April        | Chemistry | F
 April        | Physics   | A
 April        | Biology   | B
(30 rows)


views_index_example=# CREATE VIEW student_summary_view AS
views_index_example-# SELECT s.student_name, s.class, s.section, AVG(CASE WHEN sg.subject = 'Chemistry' THEN sg.grade END) AS chemistry_avg,
views_index_example-#        AVG(CASE WHEN sg.subject = 'Physics' THEN sg.grade END) AS physics_avg,
views_index_example-#        AVG(CASE WHEN sg.subject = 'Biology' THEN sg.grade END) AS biology_avg,
views_index_example-#        AVG(CASE WHEN sg.subject = 'Math' THEN sg.grade END) AS math_avg -- You can add more subjects
views_index_example-# FROM student s
views_index_example-# LEFT JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.id, s.student_name, s.class, s.section;
ERROR:  function avg(character varying) does not exist
LINE 2: SELECT s.student_name, s.class, s.section, AVG(CASE WHEN sg....
                                                   ^
HINT:  No function matches the given name and argument types. You might need to add explicit type casts.
views_index_example=# SELECT s.student_name, AVG(CASE WHEN sg.subject = 'Chemistry' THEN sg.grade END) AS chemistry_avg
views_index_example-# FROM student s
views_index_example-# LEFT JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.id, s.student_name;
ERROR:  function avg(character varying) does not exist
LINE 1: SELECT s.student_name, AVG(CASE WHEN sg.subject = 'Chemistry...
                               ^
HINT:  No function matches the given name and argument types. You might need to add explicit type casts.
views_index_example=# ALTER TABLE student_grade ADD COLUMN marks FLOAT;
ALTER TABLE
views_index_example=# SELECT * FROM student_grade;
 id | student_id |  subject  | grade | marks
----+------------+-----------+-------+-------
  1 |          1 | Chemistry | A     |
  2 |          1 | Physics   | B     |
  3 |          1 | Biology   | F     |
  4 |          2 | Chemistry | B     |
  5 |          2 | Physics   | F     |
  6 |          2 | Biology   | C     |
  7 |          3 | Chemistry | A     |
  8 |          3 | Physics   | A     |
  9 |          3 | Biology   | A     |
 10 |          4 | Chemistry | B     |
 11 |          4 | Physics   | F     |
 12 |          4 | Biology   | B     |
 13 |          5 | Chemistry | C     |
 14 |          5 | Physics   | F     |
 15 |          5 | Biology   | A     |
 16 |          6 | Chemistry | B     |
 17 |          6 | Physics   | B     |
 18 |          6 | Biology   | B     |
 19 |          7 | Chemistry | C     |
 20 |          7 | Physics   | A     |
 21 |          7 | Biology   | A     |
 22 |          8 | Chemistry | F     |
 23 |          8 | Physics   | B     |
 24 |          8 | Biology   | A     |
 25 |          9 | Chemistry | C     |
 26 |          9 | Physics   | C     |
 27 |          9 | Biology   | F     |
 28 |         10 | Chemistry | F     |
 29 |         10 | Physics   | A     |
 30 |         10 | Biology   | B     |
(30 rows)


views_index_example=# UPDATE student_grade
views_index_example-# SET marks = 83
views_index_example-# WHERE id = 30;
UPDATE 1
views_index_example=# SELECT * FROM student_grade;
 id | student_id |  subject  | grade | marks
----+------------+-----------+-------+-------
  1 |          1 | Chemistry | A     |
  2 |          1 | Physics   | B     |
  3 |          1 | Biology   | F     |
  4 |          2 | Chemistry | B     |
  5 |          2 | Physics   | F     |
  6 |          2 | Biology   | C     |
  7 |          3 | Chemistry | A     |
  8 |          3 | Physics   | A     |
  9 |          3 | Biology   | A     |
 10 |          4 | Chemistry | B     |
 11 |          4 | Physics   | F     |
 12 |          4 | Biology   | B     |
 13 |          5 | Chemistry | C     |
 14 |          5 | Physics   | F     |
 15 |          5 | Biology   | A     |
 16 |          6 | Chemistry | B     |
 17 |          6 | Physics   | B     |
 18 |          6 | Biology   | B     |
 19 |          7 | Chemistry | C     |
 20 |          7 | Physics   | A     |
 21 |          7 | Biology   | A     |
 22 |          8 | Chemistry | F     |
 23 |          8 | Physics   | B     |
 24 |          8 | Biology   | A     |
 25 |          9 | Chemistry | C     |
 26 |          9 | Physics   | C     |
 27 |          9 | Biology   | F     |
 28 |         10 | Chemistry | F     |
 29 |         10 | Physics   | A     |
 30 |         10 | Biology   | B     |    83
(30 rows)


views_index_example=#
views_index_example=# SELECT * FROM student_grade WHERE grade = "A";
ERROR:  column "A" does not exist
LINE 1: SELECT * FROM student_grade WHERE grade = "A";
                                                  ^
views_index_example=# SELECT * FROM student_grade WHERE grade = 'A';
 id | student_id |  subject  | grade | marks
----+------------+-----------+-------+-------
  1 |          1 | Chemistry | A     |
  7 |          3 | Chemistry | A     |
  8 |          3 | Physics   | A     |
  9 |          3 | Biology   | A     |
 15 |          5 | Biology   | A     |
 20 |          7 | Physics   | A     |
 21 |          7 | Biology   | A     |
 24 |          8 | Biology   | A     |
 29 |         10 | Physics   | A     |
(9 rows)


views_index_example=# UPDATE student_grade
views_index_example-# SET marks = 95
views_index_example-# WHERE grade = 'A';
UPDATE 9
views_index_example=# UPDATE student_grade
views_index_example-# SET marks = 83
views_index_example-# WHERE grade = 'B';
UPDATE 9
views_index_example=# SELECT * FROM student_grade WHERE grade = 'D';
 id | student_id | subject | grade | marks
----+------------+---------+-------+-------
(0 rows)


views_index_example=# UPDATE student_grade
views_index_example-# SET marks = 74
views_index_example-# WHERE grade = 'C';
UPDATE 5
views_index_example=# UPDATE student_grade
views_index_example-# SET marks = 62
views_index_example-# WHERE grade = 'D';
UPDATE 0
views_index_example=# UPDATE student_grade
views_index_example-# SET marks = 24
views_index_example-# WHERE grade = 'F';
UPDATE 7
views_index_example=# SELECT * FROM student_grade;
 id | student_id |  subject  | grade | marks
----+------------+-----------+-------+-------
  1 |          1 | Chemistry | A     |    95
  7 |          3 | Chemistry | A     |    95
  8 |          3 | Physics   | A     |    95
  9 |          3 | Biology   | A     |    95
 15 |          5 | Biology   | A     |    95
 20 |          7 | Physics   | A     |    95
 21 |          7 | Biology   | A     |    95
 24 |          8 | Biology   | A     |    95
 29 |         10 | Physics   | A     |    95
  2 |          1 | Physics   | B     |    83
  4 |          2 | Chemistry | B     |    83
 10 |          4 | Chemistry | B     |    83
 12 |          4 | Biology   | B     |    83
 16 |          6 | Chemistry | B     |    83
 17 |          6 | Physics   | B     |    83
 18 |          6 | Biology   | B     |    83
 23 |          8 | Physics   | B     |    83
 30 |         10 | Biology   | B     |    83
  6 |          2 | Biology   | C     |    74
 13 |          5 | Chemistry | C     |    74
 19 |          7 | Chemistry | C     |    74
 25 |          9 | Chemistry | C     |    74
 26 |          9 | Physics   | C     |    74
  3 |          1 | Biology   | F     |    24
  5 |          2 | Physics   | F     |    24
 11 |          4 | Physics   | F     |    24
 14 |          5 | Physics   | F     |    24
 22 |          8 | Chemistry | F     |    24
 27 |          9 | Biology   | F     |    24
 28 |         10 | Chemistry | F     |    24
(30 rows)


views_index_example=# SELECT s.student_name, AVG(CASE WHEN sg.subject = 'Chemistry' THEN sg.marks END) AS chemistry_avg
views_index_example-# FROM student s
views_index_example-# LEFT JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.id, s.student_name;
 student_name | chemistry_avg
--------------+---------------
 Diya         |            74
 Surya        |            83
 April        |            24
 Priya        |            83
 Reen         |            83
 Sneha        |            74
 Jim          |            95
 Sarah        |            24
 Sam          |            74
 Arjun        |            95
(10 rows)


views_index_example=# CREATE VIEW student_summary_view AS
views_index_example-# SELECT s.student_name, s.class, s.section, AVG(CASE WHEN sg.subject = 'Chemistry' THEN sg.marks END) AS chemistry_avg,
views_index_example-#        AVG(CASE WHEN sg.subject = 'Physics' THEN sg.marks END) AS physics_avg,
views_index_example-#        AVG(CASE WHEN sg.subject = 'Biology' THEN sg.marks END) AS biology_avg,
views_index_example-#        AVG(CASE WHEN sg.subject = 'Math' THEN sg.marks END) AS math_avg
views_index_example-# FROM student s
views_index_example-# LEFT JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.id, s.student_name, s.class, s.section;
CREATE VIEW
views_index_example=# SELECT * FROM student_summary_view;
 student_name | class | section | chemistry_avg | physics_avg | biology_avg | math_avg
--------------+-------+---------+---------------+-------------+-------------+----------
 Diya         | 9     | A       |            74 |          24 |          95 |
 Surya        | 10    | B       |            83 |          24 |          83 |
 April        | 10    | B       |            24 |          95 |          83 |
 Priya        | 11    | B       |            83 |          83 |          83 |
 Reen         | 9     | B       |            83 |          24 |          74 |
 Sneha        | 10    | C       |            74 |          95 |          95 |
 Jim          | 10    | A       |            95 |          83 |          24 |
 Sarah        | 9     | A       |            24 |          83 |          95 |
 Sam          | 11    | A       |            74 |          74 |          24 |
 Arjun        | 11    | C       |            95 |          95 |          95 |
(10 rows)


views_index_example=# CREATE VIEW failed_students_view AS
views_index_example-# SELECT DISTINCT s.student_name, s.class, s.section
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# WHERE sg.grade = 'F';
CREATE VIEW
views_index_example=# SELECT * FROM failed_students_view;
 student_name | class | section
--------------+-------+---------
 April        | 10    | B
 Diya         | 9     | A
 Jim          | 10    | A
 Reen         | 9     | B
 Sam          | 11    | A
 Sarah        | 9     | A
 Surya        | 10    | B
(7 rows)


views_index_example=# SELECT * FROM students;
ERROR:  relation "students" does not exist
LINE 1: SELECT * FROM students;
                      ^
views_index_example=# SELECT * FROM student;
 id | student_name | class | section
----+--------------+-------+---------
  1 | Jim          | 10    | A
  2 | Reen         | 9     | B
  3 | Arjun        | 11    | C
  4 | Surya        | 10    | B
  5 | Diya         | 9     | A
  6 | Priya        | 11    | B
  7 | Sneha        | 10    | C
  8 | Sarah        | 9     | A
  9 | Sam          | 11    | A
 10 | April        | 10    | B
(10 rows)


views_index_example=# CREATE VIEW top_performing_students_view AS
views_index_example-# SELECT s.student_name, AVG(CASE WHEN sg.subject = 'Chemistry' THEN sg.marks END +
views_index_example(#                           CASE WHEN sg.subject = 'Physics' THEN sg.marks END +
views_index_example(#                           CASE WHEN sg.subject = 'Biology' THEN sg.marks END) AS average_marks
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.id, s.student_name
views_index_example-# ORDER BY average_marks DESC
views_index_example-# LIMIT 5;
CREATE VIEW
views_index_example=#
views_index_example=# SELECT * FROM top_performing_students_view;
 student_name | average_marks
--------------+---------------
 Surya        |
 April        |
 Sam          |
 Sneha        |
 Priya        |
(5 rows)


views_index_example=# CREATE VIEW top_performing_students_view AS
views_index_example-# SELECT s.student_name, AVG(CASE WHEN sg.subject = 'Chemistry' THEN sg.marks END) AS average_marks
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.id, s.student_name
views_index_example-# LIMIT 5;
ERROR:  relation "top_performing_students_view" already exists
views_index_example=# SELECT * FROM top_performing_chemistry_students_view;
ERROR:  relation "top_performing_chemistry_students_view" does not exist
LINE 1: SELECT * FROM top_performing_chemistry_students_view;
                      ^
views_index_example=#
views_index_example=# CREATE VIEW top_performing_students_view AS
views_index_example-# SELECT s.student_name, AVG(CASE WHEN sg.subject = 'Chemistry' THEN sg.marks END) AS average_marks
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.id, s.student_name
views_index_example-# LIMIT 5;
ERROR:  relation "top_performing_students_view" already exists
views_index_example=# CREATE VIEW top_performing_chemistry_students_view AS
views_index_example-# SELECT s.student_name, AVG(CASE WHEN sg.subject = 'Chemistry' THEN sg.marks END) AS average_marks
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.id, s.student_name
views_index_example-# LIMIT 5;
CREATE VIEW
views_index_example=# SELECT * FROM top_performing_chemistry_students_view;
 student_name | average_marks
--------------+---------------
 Jim          |            95
 Reen         |            83
 Arjun        |            95
 Surya        |            83
 Diya         |            74
(5 rows)


views_index_example=# CREATE VIEW chemistry_students_view AS
views_index_example-# SELECT s.student_name, AVG(CASE WHEN sg.subject = 'Chemistry' THEN sg.marks END) AS average_marks
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.id, s.student_name
views_index_example-# ORDER BY average_marks DESC
views_index_example-# LIMIT 5;
CREATE VIEW
views_index_example=# SELECT *FROM chemistry_students_view;
 student_name | average_marks
--------------+---------------
 Arjun        |            95
 Jim          |            95
 Surya        |            83
 Priya        |            83
 Reen         |            83
(5 rows)


views_index_example=# CREATE VIEW students_view AS
views_index_example-# SELECT s.student_name, AVG(CASE WHEN sg.subject = 'Chemistry' THEN sg.marks END +
views_index_example(#                            CASE WHEN sg.subject = 'Physics' THEN sg.marks END +
views_index_example(#                            CASE WHEN sg.subject = 'Biology' THEN sg.marks END) AS average_marks
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.id, s.student_name
views_index_example-# ORDER BY average_marks DESC
views_index_example-# LIMIT 5;
CREATE VIEW
views_index_example=# SELECT * FROM students_view;
 student_name | average_marks
--------------+---------------
 Surya        |
 April        |
 Sam          |
 Sneha        |
 Priya        |
(5 rows)


views_index_example=# CREATE VIEW top_ AS
views_index_example-# SELECT s.student_name, AVG(sg.marks) AS overall_average_marks
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.student_name
views_index_example-# ORDER BY overall_average_marks DESC;
CREATE VIEW
views_index_example=# SELECT * FROM top_;
 student_name | overall_average_marks
--------------+-----------------------
 Arjun        |                    95
 Sneha        |                    88
 Priya        |                    83
 Jim          |     67.33333333333333
 Sarah        |     67.33333333333333
 April        |     67.33333333333333
 Diya         |     64.33333333333333
 Surya        |    63.333333333333336
 Reen         |    60.333333333333336
 Sam          |    57.333333333333336
(10 rows)


views_index_example=# CREATE VIEW top_students AS
views_index_example-# SELECT s.student_name, sg.subject, AVG(sg.marks) AS overall_average_marks
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.student_name
views_index_example-# ORDER BY overall_average_marks DESC;
ERROR:  column "sg.subject" must appear in the GROUP BY clause or be used in an aggregate function
LINE 2: SELECT s.student_name, sg.subject, AVG(sg.marks) AS overall_...
                               ^
views_index_example=# CREATE VIEW top_students AS
views_index_example-# SELECT s.student_name, sg.subject, AVG(sg.marks) AS overall_average_marks
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.student_name, sg.subject
views_index_example-# ORDER BY overall_average_marks DESC;
CREATE VIEW
views_index_example=# SELECT * FROM top_students;
 student_name |  subject  | overall_average_marks
--------------+-----------+-----------------------
 Arjun        | Chemistry |                    95
 Arjun        | Physics   |                    95
 Sneha        | Physics   |                    95
 Diya         | Biology   |                    95
 Jim          | Chemistry |                    95
 April        | Physics   |                    95
 Arjun        | Biology   |                    95
 Sarah        | Biology   |                    95
 Sneha        | Biology   |                    95
 Priya        | Physics   |                    83
 Surya        | Biology   |                    83
 Priya        | Biology   |                    83
 Surya        | Chemistry |                    83
 Jim          | Physics   |                    83
 Sarah        | Physics   |                    83
 Priya        | Chemistry |                    83
 Reen         | Chemistry |                    83
 April        | Biology   |                    83
 Sneha        | Chemistry |                    74
 Sam          | Physics   |                    74
 Sam          | Chemistry |                    74
 Diya         | Chemistry |                    74
 Reen         | Biology   |                    74
 Surya        | Physics   |                    24
 Diya         | Physics   |                    24
 Sarah        | Chemistry |                    24
 Jim          | Biology   |                    24
 April        | Chemistry |                    24
 Reen         | Physics   |                    24
 Sam          | Biology   |                    24
(30 rows)


views_index_example=# CREATE VIEW top_students_A AS
views_index_example-# SELECT s.student_name, sg.subject, AVG(sg.marks) AS overall_average_marks
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# WHERE sg.grade = 'A'
views_index_example-# GROUP BY s.student_name, sg.subject
views_index_example-# HAVING AVG(sg.marks) = 100
views_index_example-# ORDER BY overall_average_marks DESC;
CREATE VIEW
views_index_example=# SELECT * FROM top_students_A;
 student_name | subject | overall_average_marks
--------------+---------+-----------------------
(0 rows)


views_index_example=# CREATE VIEW top_A AS
views_index_example-# SELECT s.student_name, sg.subject, AVG(sg.marks) AS overall_average_marks
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# WHERE sg.grade = 'A'
views_index_example-# GROUP BY s.student_name, sg.subject
views_index_example-# ORDER BY overall_average_marks DESC;
CREATE VIEW
views_index_example=# SELECT * FROM top_A;
 student_name |  subject  | overall_average_marks
--------------+-----------+-----------------------
 April        | Physics   |                    95
 Arjun        | Biology   |                    95
 Arjun        | Chemistry |                    95
 Arjun        | Physics   |                    95
 Diya         | Biology   |                    95
 Jim          | Chemistry |                    95
 Sarah        | Biology   |                    95
 Sneha        | Biology   |                    95
 Sneha        | Physics   |                    95
(9 rows)


views_index_example=# \dt
             List of relations
 Schema |     Name      | Type  |  Owner
--------+---------------+-------+----------
 public | employees     | table | postgres
 public | student       | table | postgres
 public | student_grade | table | postgres
(3 rows)


views_index_example=# select * from employees;
 pk_emp_id |   type   | first_name | last_name  |            email            |   phone    | gender |    dob     |   place
-----------+----------+------------+------------+-----------------------------+------------+--------+------------+-----------
         1 | Manager  | Jane       | Austen     | janeausten@gmail.com        | 9965473569 | Female | 1775-12-16 | Steventon
         2 | Manager  | Agatha     | Christie   | agathachristie@gmail.com    | 9965473569 | Female | 1890-09-15 | Torquay
         3 | Salesman | Paul       | Addison    | pauladdison@gmail.com       | 9966987469 | Male   | 1886-06-18 | Norway
         4 | Salesman | Michael    | Abbensetts | michaelabbensetts@gmail.com | 9966989879 | Male   | 1896-08-08 | London
         5 | Accounts | Drishya    | K          | migtrdyetts@gmail.com       | 9966989879 | Female | 1996-08-08 | London
(5 rows)


views_index_example=# CREATE VIEW top_performing_students_view AS
views_index_example-# SELECT s.student_name, sg.subject, AVG(sg.marks) AS average_marks
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.student_name, sg.subject
views_index_example-# ORDER BY s.student_name, average_marks DES
views_index_example-#
views_index_example-# ;
ERROR:  syntax error at or near "DES"
LINE 6: ORDER BY s.student_name, average_marks DES
                                               ^
views_index_example=# CREATE VIEW top_sts_view AS
views_index_example-# SELECT s.student_name, sg.subject, AVG(sg.marks) AS average_marks
views_index_example-# FROM student s
views_index_example-# JOIN student_grade sg ON s.id = sg.student_id
views_index_example-# GROUP BY s.student_name, sg.subject
views_index_example-# ORDER BY s.student_name, average_marks DESC;
CREATE VIEW
views_index_example=# WITH ranked_students AS (
views_index_example(#   SELECT
views_index_example(#     student_name,
views_index_example(#     subject,
views_index_example(#     average_marks,
views_index_example(#     ROW_NUMBER() OVER (PARTITION BY subject ORDER BY average_marks DESC) AS rank
views_index_example(#   FROM top_sts_view
views_index_example(# );
ERROR:  syntax error at or near ";"
LINE 8: );
         ^
views_index_example=# WITH ranked_students AS (
views_index_example(#   SELECT
views_index_example(#     student_name,
views_index_example(#     subject,
views_index_example(#     average_marks,
views_index_example(#     ROW_NUMBER() OVER (PARTITION BY subject ORDER BY average_marks DESC) AS rank
views_index_example(#   FROM top_sts_view
views_index_example(# )
views_index_example-#
views_index_example-# SELECT student_name, subject, average_marks
views_index_example-# FROM ranked_students
views_index_example-# WHERE rank <= 5;
 student_name |  subject  | average_marks
--------------+-----------+---------------
 Diya         | Biology   |            95
 Arjun        | Biology   |            95
 Sneha        | Biology   |            95
 Sarah        | Biology   |            95
 Surya        | Biology   |            83
 Arjun        | Chemistry |            95
 Jim          | Chemistry |            95
 Reen         | Chemistry |            83
 Priya        | Chemistry |            83
 Surya        | Chemistry |            83
 April        | Physics   |            95
 Arjun        | Physics   |            95
 Sneha        | Physics   |            95
 Priya        | Physics   |            83
 Jim          | Physics   |            83
(15 rows)


views_index_example=# CREATE OR REPLACE PROCEDURE insert_student(
views_index_example(#     IN student_name VARCHAR(50),
views_index_example(#     IN class VARCHAR(10),
views_index_example(#     IN section VARCHAR(10)
views_index_example(# )
views_index_example-# LANGUAGE SQL
views_index_example-# AS $$
views_index_example$# INSERT INTO student (student_name, class, section)
views_index_example$# VALUES (student_name, class, section);
views_index_example$# $$;
CREATE PROCEDURE
views_index_example=# CALL insert_student('John', '12', 'A');
CALL
views_index_example=# select  * from students;
ERROR:  relation "students" does not exist
LINE 1: select  * from students;
                       ^
views_index_example=# select * from student;
 id | student_name | class | section
----+--------------+-------+---------
  1 | Jim          | 10    | A
  2 | Reen         | 9     | B
  3 | Arjun        | 11    | C
  4 | Surya        | 10    | B
  5 | Diya         | 9     | A
  6 | Priya        | 11    | B
  7 | Sneha        | 10    | C
  8 | Sarah        | 9     | A
  9 | Sam          | 11    | A
 10 | April        | 10    | B
 11 | John         | 12    | A
(11 rows)


views_index_example=# select * from employees;
 pk_emp_id |   type   | first_name | last_name  |            email            |   phone    | gender |    dob     |   place
-----------+----------+------------+------------+-----------------------------+------------+--------+------------+-----------
         1 | Manager  | Jane       | Austen     | janeausten@gmail.com        | 9965473569 | Female | 1775-12-16 | Steventon
         2 | Manager  | Agatha     | Christie   | agathachristie@gmail.com    | 9965473569 | Female | 1890-09-15 | Torquay
         3 | Salesman | Paul       | Addison    | pauladdison@gmail.com       | 9966987469 | Male   | 1886-06-18 | Norway
         4 | Salesman | Michael    | Abbensetts | michaelabbensetts@gmail.com | 9966989879 | Male   | 1896-08-08 | London
         5 | Accounts | Drishya    | K          | migtrdyetts@gmail.com       | 9966989879 | Female | 1996-08-08 | London
(5 rows)


views_index_example=# CREATE OR REPLACE PROCEDURE insert_student(
views_index_example(#     IN student_name VARCHAR(50),
views_index_example(#     IN class VARCHAR(10),
views_index_example(#     IN section VARCHAR(10)
views_index_example(# )
views_index_example-# LANGUAGE SQL
views_index_example-# AS $$
views_index_example$# INSERT INTO student (student_name, class, section)
views_index_example$# VALUES (student_name, class, section);
views_index_example$# $$;
CREATE PROCEDURE
views_index_example=# CALL insert_student('John', '12', 'A');
CALL
views_index_example=# select * from student;
 id | student_name | class | section
----+--------------+-------+---------
  1 | Jim          | 10    | A
  2 | Reen         | 9     | B
  3 | Arjun        | 11    | C
  4 | Surya        | 10    | B
  5 | Diya         | 9     | A
  6 | Priya        | 11    | B
  7 | Sneha        | 10    | C
  8 | Sarah        | 9     | A
  9 | Sam          | 11    | A
 10 | April        | 10    | B
 11 | John         | 12    | A
 12 | John         | 12    | A
(12 rows)


views_index_example=# CREATE OR REPLACE PROCEDURE update_student_grade(
views_index_example(#     IN student_id INT,
views_index_example(#     IN subject VARCHAR(50),
views_index_example(#     IN new_grade VARCHAR(2)
views_index_example(# )
views_index_example-# LANGUAGE SQL
views_index_example-# AS $$
views_index_example$# UPDATE student_grade
views_index_example$# SET grade = new_grade
views_index_example$# WHERE student_id = student_id AND subject = subject;
views_index_example$# $$;
CREATE PROCEDURE
views_index_example=# CALL update_student_grade(1, 'Chemistry', 'A');
CALL
views_index_example=# select * from student_grade;
 id | student_id |  subject  | grade | marks
----+------------+-----------+-------+-------
  1 |          1 | Chemistry | A     |    95
  7 |          3 | Chemistry | A     |    95
  8 |          3 | Physics   | A     |    95
  9 |          3 | Biology   | A     |    95
 15 |          5 | Biology   | A     |    95
 20 |          7 | Physics   | A     |    95
 21 |          7 | Biology   | A     |    95
 24 |          8 | Biology   | A     |    95
 29 |         10 | Physics   | A     |    95
  2 |          1 | Physics   | A     |    83
  4 |          2 | Chemistry | A     |    83
 10 |          4 | Chemistry | A     |    83
 12 |          4 | Biology   | A     |    83
 16 |          6 | Chemistry | A     |    83
 17 |          6 | Physics   | A     |    83
 18 |          6 | Biology   | A     |    83
 23 |          8 | Physics   | A     |    83
 30 |         10 | Biology   | A     |    83
  6 |          2 | Biology   | A     |    74
 13 |          5 | Chemistry | A     |    74
 19 |          7 | Chemistry | A     |    74
 25 |          9 | Chemistry | A     |    74
 26 |          9 | Physics   | A     |    74
  3 |          1 | Biology   | A     |    24
  5 |          2 | Physics   | A     |    24
 11 |          4 | Physics   | A     |    24
 14 |          5 | Physics   | A     |    24
 22 |          8 | Chemistry | A     |    24
 27 |          9 | Biology   | A     |    24
 28 |         10 | Chemistry | A     |    24
(30 rows)


views_index_example=# CREATE OR REPLACE PROCEDURE get_student_grades(
views_index_example(#     IN student_id INT
views_index_example(# )
views_index_example-# LANGUAGE SQL
views_index_example-# AS $$
views_index_example$# SELECT subject, grade
views_index_example$# FROM student_grade
views_index_example$# WHERE student_id = student_id;
views_index_example$# $$;
CREATE PROCEDURE
views_index_example=# CALL get_student_grades(1);
CALL
views_index_example=# SELECT subject, grade
views_index_example-# FROM student_grade
views_index_example-# WHERE student_id = student_id;
  subject  | grade
-----------+-------
 Chemistry | A
 Chemistry | A
 Physics   | A
 Biology   | A
 Biology   | A
 Physics   | A
 Biology   | A
 Biology   | A
 Physics   | A
 Physics   | A
 Chemistry | A
 Chemistry | A
 Biology   | A
 Chemistry | A
 Physics   | A
 Biology   | A
 Physics   | A
 Biology   | A
 Biology   | A
 Chemistry | A
 Chemistry | A
 Chemistry | A
 Physics   | A
 Biology   | A
 Physics   | A
 Physics   | A
 Physics   | A
 Chemistry | A
 Biology   | A
 Chemistry | A
(30 rows)


views_index_example=# CREATE OR REPLACE PROCEDURE up_student_grade(
views_index_example(#     IN p_student_id INT,
views_index_example(#     IN p_subject VARCHAR(50),
views_index_example(#     IN p_new_grade VARCHAR(2)
views_index_example(# )
views_index_example-# LANGUAGE SQL
views_index_example-# AS $$
views_index_example$# UPDATE student_grade
views_index_example$# SET grade = p_new_grade
views_index_example$# WHERE student_id = p_student_id AND subject = p_subject;
views_index_example$# $$;
CREATE PROCEDURE
views_index_example=# CALL up_student_grade(1, 'Chemistry', 'C');
CALL
views_index_example=#
views_index_example=#     select * from student_grade;
 id | student_id |  subject  | grade | marks
----+------------+-----------+-------+-------
  1 |          1 | Chemistry | C     |    95
  7 |          3 | Chemistry | A     |    95
  8 |          3 | Physics   | A     |    95
  9 |          3 | Biology   | A     |    95
 15 |          5 | Biology   | A     |    95
 20 |          7 | Physics   | A     |    95
 21 |          7 | Biology   | A     |    95
 24 |          8 | Biology   | A     |    95
 29 |         10 | Physics   | A     |    95
  2 |          1 | Physics   | A     |    83
  4 |          2 | Chemistry | A     |    83
 10 |          4 | Chemistry | A     |    83
 12 |          4 | Biology   | A     |    83
 16 |          6 | Chemistry | A     |    83
 17 |          6 | Physics   | A     |    83
 18 |          6 | Biology   | A     |    83
 23 |          8 | Physics   | A     |    83
 30 |         10 | Biology   | A     |    83
  6 |          2 | Biology   | A     |    74
 13 |          5 | Chemistry | A     |    74
 19 |          7 | Chemistry | A     |    74
 25 |          9 | Chemistry | A     |    74
 26 |          9 | Physics   | A     |    74
  3 |          1 | Biology   | A     |    24
  5 |          2 | Physics   | A     |    24
 11 |          4 | Physics   | A     |    24
 14 |          5 | Physics   | A     |    24
 22 |          8 | Chemistry | A     |    24
 27 |          9 | Biology   | A     |    24
 28 |         10 | Chemistry | A     |    24
(30 rows)


views_index_example=# CALL up_student_grade(1, 'Chemistry', 'A');
CALL
views_index_example=# CALL up_student_grade(1, 'Chemistry', 'A');
CALL
views_index_example=# CALL up_student_grade(3, 'Chemistry', 'A');
CALL
views_index_example=# CALL up_student_grade(3, 'Physics', 'A');
CALL
views_index_example=# CALL up_student_grade(3, 'Biology', 'A');
CALL
views_index_example=# CALL up_student_grade(5, 'Biology', 'A');
CALL
views_index_example=# CALL up_student_grade(7, 'Physics', 'A');
CALL
views_index_example=# CALL up_student_grade(7, 'Biology', 'A');
CALL
views_index_example=# CALL up_student_grade(8, 'Biology', 'A');
CALL
views_index_example=# CALL up_student_grade(10, 'Physics', 'A');
CALL
views_index_example=#
views_index_example=# CALL up_student_grade(1, 'Physics', 'B');
CALL
views_index_example=# CALL up_student_grade(2, 'Chemistry', 'B');
CALL
views_index_example=# CALL up_student_grade(4, 'Chemistry', 'B');
CALL
views_index_example=# CALL up_student_grade(4, 'Biology', 'B');
CALL
views_index_example=# CALL up_student_grade(6, 'Chemistry', 'B');
CALL
views_index_example=# CALL up_student_grade(6, 'Physics', 'B');
CALL
views_index_example=# CALL up_student_grade(6, 'Biology', 'B');
CALL
views_index_example=# CALL up_student_grade(8, 'Physics', 'B');
CALL
views_index_example=# CALL up_student_grade(10, 'Biology', 'B');
CALL
views_index_example=#
views_index_example=# CALL up_student_grade(2, 'Biology', 'C');
CALL
views_index_example=# CALL up_student_grade(5, 'Chemistry', 'C');
CALL
views_index_example=# CALL up_student_grade(7, 'Chemistry', 'C');
CALL
views_index_example=# CALL up_student_grade(9, 'Chemistry', 'C');
CALL
views_index_example=# CALL up_student_grade(9, 'Physics', 'C');
CALL
views_index_example=#
views_index_example=# CALL up_student_grade(1, 'Biology', 'F');
CALL
views_index_example=# CALL up_student_grade(2, 'Physics', 'F');
CALL
views_index_example=# CALL up_student_grade(4, 'Physics', 'F');
CALL
views_index_example=# CALL up_student_grade(5, 'Physics', 'F');
CALL
views_index_example=# CALL up_student_grade(8, 'Chemistry', 'F');
CALL
views_index_example=# CALL up_student_grade(9, 'Biology', 'F');
CALL
views_index_example=# CALL up_student_grade(10, 'Chemistry', 'F');
CALL
views_index_example=#
views_index_example=#
views_index_example=# select * from student_grade;
 id | student_id |  subject  | grade | marks
----+------------+-----------+-------+-------
  1 |          1 | Chemistry | A     |    95
  7 |          3 | Chemistry | A     |    95
  8 |          3 | Physics   | A     |    95
  9 |          3 | Biology   | A     |    95
 15 |          5 | Biology   | A     |    95
 20 |          7 | Physics   | A     |    95
 21 |          7 | Biology   | A     |    95
 24 |          8 | Biology   | A     |    95
 29 |         10 | Physics   | A     |    95
  2 |          1 | Physics   | B     |    83
  4 |          2 | Chemistry | B     |    83
 10 |          4 | Chemistry | B     |    83
 12 |          4 | Biology   | B     |    83
 16 |          6 | Chemistry | B     |    83
 17 |          6 | Physics   | B     |    83
 18 |          6 | Biology   | B     |    83
 23 |          8 | Physics   | B     |    83
 30 |         10 | Biology   | B     |    83
  6 |          2 | Biology   | C     |    74
 13 |          5 | Chemistry | C     |    74
 19 |          7 | Chemistry | C     |    74
 25 |          9 | Chemistry | C     |    74
 26 |          9 | Physics   | C     |    74
  3 |          1 | Biology   | F     |    24
  5 |          2 | Physics   | F     |    24
 11 |          4 | Physics   | F     |    24
 14 |          5 | Physics   | F     |    24
 22 |          8 | Chemistry | F     |    24
 27 |          9 | Biology   | F     |    24
 28 |         10 | Chemistry | F     |    24
(30 rows)


views_index_example=# CREATE OR REPLACE PROCEDURE up_st_grade(
views_index_example(#     IN p_student_id INT,
views_index_example(#     IN p_subject VARCHAR(50),
views_index_example(#     IN p_new_grade VARCHAR(2)
views_index_example(# )
views_index_example-# LANGUAGE SQL
views_index_example-# AS $$
views_index_example$# UPDATE student_grade
views_index_example$# SET grade = p_new_grade
views_index_example$# WHERE student_id = p_student_id AND subject = p_subject
views_index_example$# ORDER BY id;
views_index_example$# $$;
ERROR:  syntax error at or near "ORDER"
LINE 11: ORDER BY id;
         ^
views_index_example=# CREATE OR REPLACE PROCEDURE up_st_grade(
views_index_example(#     IN p_student_id INT,
views_index_example(#     IN p_subject VARCHAR(50),
views_index_example(#     IN p_new_grade VARCHAR(2)
views_index_example(# )
views_index_example-# LANGUAGE SQL
views_index_example-# AS $$
views_index_example$# UPDATE student_grade sg
views_index_example$# SET sg.grade = p_new_grade
views_index_example$# WHERE sg.student_id = p_student_id AND sg.subject = p_subject
views_index_example$# ORDER BY sg.id;
views_index_example$# $$;
ERROR:  syntax error at or near "ORDER"
LINE 11: ORDER BY sg.id;
         ^
views_index_example=# CREATE OR REPLACE PROCEDURE up_st_grade(
views_index_example(#     IN p_student_id INT,
views_index_example(#     IN p_subject VARCHAR(50),
views_index_example(#     IN p_new_grade VARCHAR(2)
views_index_example(# )
views_index_example-# LANGUAGE SQL
views_index_example-# AS $$
views_index_example$# BEGIN
views_index_example$#     UPDATE student_grade sg
views_index_example$#     SET sg.grade = p_new_grade
views_index_example$#     WHERE sg.student_id = p_student_id AND sg.subject = p_subject;
views_index_example$#
views_index_example$#     SELECT *
views_index_example$#     FROM student_grade
views_index_example$#     WHERE student_id = p_student_id AND subject = p_subject
views_index_example$#     ORDER BY id;
views_index_example$# END;
views_index_example$# $$;
ERROR:  syntax error at or near "UPDATE"
LINE 9:     UPDATE student_grade sg
            ^
views_index_example=# CREATE OR REPLACE PROCEDURE up_st_grade(
views_index_example(#     IN p_student_id INT,
views_index_example(#     IN p_subject VARCHAR(50),
views_index_example(#     IN p_new_grade VARCHAR(2)
views_index_example(# )
views_index_example-# LANGUAGE SQL
views_index_example-# AS $$
views_index_example$# BEGIN
views_index_example$#     START TRANSACTION;
views_index_example$#
views_index_example$#     UPDATE student_grade sg
views_index_example$#     SET sg.grade = p_new_grade
views_index_example$#     WHERE sg.student_id = p_student_id AND sg.subject = p_subject;
views_index_example$#
views_index_example$#     SELECT *
views_index_example$#     FROM student_grade
views_index_example$#     WHERE student_id = p_student_id AND subject = p_subject
views_index_example$#     ORDER BY id;
views_index_example$#
views_index_example$#     COMMIT;
views_index_example$# END;
views_index_example$# $$;
ERROR:  syntax error at or near "START"
LINE 9:     START TRANSACTION;
            ^
views_index_example=# \q
Terminate batch job (Y/N)? ^A