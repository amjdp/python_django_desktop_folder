database_test=#      CREATE TABLE students_table(
database_test(#      pk_student_id VARCHAR(20) PRIMARY KEY,
database_test(#      name VARCHAR(50),
database_test(#      class VARCHAR(20),
database_test(#      email VARCHAR(50),
database_test(#      phone BIGINT,
database_test(#      address VARCHAR(200)
database_test(#      );
CREATE TABLE
database_test=#

database_test=# \d students_table
                      Table "public.students_table"
    Column     |          Type          | Collation | Nullable | Default
---------------+------------------------+-----------+----------+---------
 pk_student_id | character varying(20)  |           | not null |
 name          | character varying(50)  |           |          |
 class         | character varying(20)  |           |          |
 email         | character varying(50)  |           |          |
 phone         | bigint                 |           |          |
 address       | character varying(200) |           |          |
Indexes:
    "students_table_pkey" PRIMARY KEY, btree (pk_student_id)

database_test=# INSERT INTO students_table VALUES
database_test-# ('1','name1','class1','stud1@gmail.com',1234567890,'address1'),
database_test-# ('2','name2','class2','stud2@gmail.com',1234598760,'address2'),
database_test-# ('3','name3','class3','stud3@gmail.com',9876543210,'address3');
INSERT 0 3
database_test=#

database_test=# SELECT * FROM students_table;
 pk_student_id | name  | class  |      email      |   phone    | address
---------------+-------+--------+-----------------+------------+----------
 1             | name1 | class1 | stud1@gmail.com | 1234567890 | address1
 2             | name2 | class2 | stud2@gmail.com | 1234598760 | address2
 3             | name3 | class3 | stud3@gmail.com | 9876543210 | address3
(3 rows)

