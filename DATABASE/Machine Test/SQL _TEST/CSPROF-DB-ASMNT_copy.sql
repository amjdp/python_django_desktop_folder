postgres=# CREATE TABLE students_table(
     pk_student_id SERIAL PRIMARY KEY, 
     name VARCHAR(50),
     class VARCHAR(20),
     email VARCHAR(50),
     phone INT,
     address VARCHAR(200)
     );


     CREATE TABLE students_table(
     pk_student_id VARCHAR(20) PRIMARY KEY, 
     name VARCHAR(50),
     class VARCHAR(20),
     email VARCHAR(50),
     phone BIGINT,
     address VARCHAR(200)
     );


sample=#  CREATE TABLE students_table(
sample(#      pk_student_id VARCHAR(20) PRIMARY KEY,
sample(#      name VARCHAR(50),
sample(#      class VARCHAR(20),
sample(#      email VARCHAR(50),
sample(#      phone INT,
sample(#      address VARCHAR(200)
sample(#      );
CREATE TABLE
sample=# \d students_table
                      Table "public.students_table"
    Column     |          Type          | Collation | Nullable | Default
---------------+------------------------+-----------+----------+---------
 pk_student_id | character varying(20)  |           | not null |
 name          | character varying(50)  |           |          |
 class         | character varying(20)  |           |          |
 email         | character varying(50)  |           |          |
 phone         | integer                |           |          |
 address       | character varying(200) |           |          |
Indexes:
    "students_table_pkey" PRIMARY KEY, btree (pk_student_id)

INSERT INTO students_table VALUES
('1','name1','class1','stud1@gmail.com',1234567890,'address1'),
('2','name2','class2','stud2@gmail.com',1234598760,'address2'),
('3','name3','class3','stud3@gmail.com',9876543210,'address3');


ALTER TABLE students_table ALTER COLUMN phone TYPE BIGINT;

SELECT * FROM students_table;
