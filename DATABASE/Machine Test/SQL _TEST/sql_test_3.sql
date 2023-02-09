Database-Functions and Joins- MACHINE TEST 3 - Duration 1hour - Marks 20 - (16 Qns)


#1
postgres=# INSERT INTO tbl_stock (vchr_name, int_quantity,int_price,fk_int_supplier) VALUES ('Memory',100,1500,5);
INSERT 0 1
postgres=# SELECT * FROM tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1 
               2 | Keyboad   |            5 |     451.5 |               3
               3 | Modem     |           10 |    1201.5 |               2
               5 | Headphone |           50 |     751.5 |               4
               6 | Memory    |            2 |    3501.5 |               4
               7 | Memory    |          100 |      1500 |               5
(6 rows)


postgres=# UPDATE tbl_stock SET int_price = 1501.5 WHERE pk_int_stock_id = 7;
UPDATE 1
postgres=# SELECT * FROM tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               2 | Keyboad   |            5 |     451.5 |               3
               3 | Modem     |           10 |    1201.5 |               2
               5 | Headphone |           50 |     751.5 |               4
               6 | Memory    |            2 |    3501.5 |               4
               7 | Memory    |          100 |    1501.5 |               5
(6 rows)

OUTPUT

postgres=# SELECT SUM(int_quantity * int_price) FROM tbl_stock AS total_cost;
   sum
----------
 214015.5
(1 row)


#2

postgres=# SELECT SUM(int_quantity) AS total_no_products FROM tbl_stock;
 total_no_products
-------------------
               177
(1 row)

#3

postgres=# SELECT UPPER(vchr_name) AS vchr_name , ROUND(int_price) AS int_price FROM tbl_stock;
 vchr_name | int_price
-----------+-----------
 MOUSE     |       502
 KEYBOAD   |       452
 MODEM     |      1202
 HEADPHONE |       752
 MEMORY    |      3502
 MEMORY    |      1502
(6 rows)

#4

postgres=# SELECT COUNT(DISTINCT vchr_name) AS items FROM tbl_stock;
 items
-------
     5
(1 row)


#5
-- SELECT  MAX(int_price) AS int_price FROM tbl_stock;

postgres=# SELECT vchr_name, int_price FROM tbl_stock WHERE int_price = (SELECT MAX (int_price) FROM tbl_stock );
 vchr_name | int_price
-----------+-----------
 Memory    |    3501.5
(1 row)


#6

postgres=# INSERT INTO tbl_classes (vchr_class_name,fk_int_dept_id)
VALUES('CS100',1),
('CS101',1),
('CS102',1),
('CS103',1),
('EC200',2),
('CC300',3),
('AT400',4);
INSERT 0 7

postgres=# INSERT INTO tbl_enrollment(int_count,fk_int_class_id)
VALUES(40,1),
(15,2),
(10,3),
(12,4),
(60,2),
(14,6),
(200,7);
INSERT 0 7

postgres=# SELECT * FROM tbl_classes;
 pk_int_class_id | vchr_class_name | fk_int_dept_id
-----------------+-----------------+----------------
               1 | CS100           |              1
               2 | CS101           |              1
               3 | CS102           |              1
               4 | CS103           |              1
               5 | EC200           |              2
               6 | CC300           |              3
               7 | AT400           |              4
(7 rows)


postgres=# SELECT * FROM tbl_enrollment;
 pk_int_enrollment_id | int_count | fk_int_class_id
----------------------+-----------+-----------------
                    1 |        40 |               1
                    2 |        15 |               2
                    3 |        10 |               3
                    4 |        12 |               4
                    5 |        60 |               2
                    6 |        14 |               6
                    7 |       200 |               7
(7 rows)


postgres=# SELECT SUM(int_count) AS total_enrollment FROM tbl_enrollment;
 total_enrollment
------------------
              351
(1 row)

#7

postgres=# SELECT COUNT(DISTINCT vchr_class_name) AS no_of_classes FROM tbl_classes;
 no_of_classes
---------------
             7
(1 row)


#8

postgres=# DELETE FROM tbl_stock WHERE fk_int_supplier IN (SELECT pk_int_supplier_id FROM tbl_supplier WHERE vchr_supplier_name = 'Creative');
DELETE 1

postgres=# SELECT * FROM tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               2 | Keyboad   |            5 |     451.5 |               3
               3 | Modem     |           10 |    1201.5 |               2
               5 | Headphone |           50 |     751.5 |               4
               6 | Memory    |            2 |    3501.5 |               4
(5 rows)

#9

postgres=# SELECT * FROM tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               2 | Keyboad   |            5 |     451.5 |               3
               3 | Modem     |           10 |    1201.5 |               2
               5 | Headphone |           50 |     751.5 |               4
               6 | Memory    |            2 |    3501.5 |               4
(5 rows)


postgres=# SELECT concat(vchr_name,int_price) AS Product_price FROM tbl_stock;
 product_price
----------------
 Mouse501.5
 Keyboad451.5
 Modem1201.5
 Headphone751.5
 Memory3501.5
(5 rows)


#10 (2)

CREATE TABLE tbl_student("EnRl No" INT,"Roll No" INT,Name VARCHAR(50),City VARCHAR(50),Mobile VARCHAR(20),Dob DATE);

INSERT INTO tbl_student VALUES
(11,2,'AKHIL','DELHI','98756579','1986-01-12'),
(6,4,'MAYA','BANGLORE','98734534','1987-11-12'),
(1,8,'ANOOP','BANGLORE','93456535','1990-12-22'),
(20,1,'PAUL','COCHIN','96754555','1991-03-13'),
(3,5,'SANDEEP','DELHI','84865644','1993-06-14');

postgres=# SELECT * FROM tbl_student;
 EnRl No | Roll No |  name   |   city   |  mobile  |    dob
---------+---------+---------+----------+----------+------------
      11 |       2 | AKHIL   | DELHI    | 98756579 | 1986-01-12
       6 |       4 | MAYA    | BANGLORE | 98734534 | 1987-11-12
       1 |       8 | ANOOP   | BANGLORE | 93456535 | 1990-12-22
      20 |       1 | PAUL    | COCHIN   | 96754555 | 1991-03-13
       3 |       5 | SANDEEP | DELHI    | 84865644 | 1993-06-14
(5 rows)

CREATE TABLE tbl_grade("Roll No" INT,Course VARCHAR(20),Grade VARCHAR(10));

INSERT INTO tbl_grade 
VALUES(2,'C','A'),
(2,'JAVA','B'),
(1,'C','B'),
(1,'JAVA','A'),
(4,'PHP','A'),
(4,'JAVA','A'),
(4,'C','B'),
(8,'JAVA','B'),
(5,'PHP','A'),
(5,'JAVA','D');

postgres=# SELECT * FROM tbl_grade;
 Roll No | course | grade
---------+--------+-------
       2 | C      | A
       2 | JAVA   | B
       1 | C      | B
       1 | JAVA   | A
       4 | PHP    | A
       4 | JAVA   | A
       4 | C      | B
       8 | JAVA   | B
       5 | PHP    | A
       5 | JAVA   | D
(10 rows)

postgres=# SELECT Name,course FROM tbl_student  INNER JOIN tbl_grade ON tbl_student."Roll No" = tbl_grade."Roll No" WHERE grade='A';
  name   | course
---------+--------
 AKHIL   | C
 MAYA    | JAVA
 MAYA    | PHP
 PAUL    | JAVA
 SANDEEP | PHP
(5 rows)


#11

-- select count(distinct name) from tbl_student inner join tbl_grade using(RollNo) where grade='B';

postgres=# SELECT COUNT(grade) FROM tbl_grade WHERE grade='B';
 count
-------
     4
(1 row)

#12 (2)

postgres=# SELECT tbl_student.name,tbl_student."Roll No", tbl_grade.course FROM tbl_student  INNER JOIN tbl_grade ON tbl_student."Roll No" = tbl_grade."Roll No" ;
  name   | Roll No | course
---------+---------+--------
 AKHIL   |       2 | C
 AKHIL   |       2 | JAVA
 PAUL    |       1 | C
 PAUL    |       1 | JAVA
 MAYA    |       4 | PHP
 MAYA    |       4 | JAVA
 MAYA    |       4 | C
 ANOOP   |       8 | JAVA
 SANDEEP |       5 | PHP
 SANDEEP |       5 | JAVA
(10 rows)

select tbl_student.name, count(tbl_grade.course) as no_of_course from tbl_grade 
INNER JOIN tbl_student on tbl_student.rollno=tbl_grade.rollno 
group by tbl_student.name,tbl_student.rollno order by tbl_student.name;

  name   | no_of_course
---------+--------------
 Akhil   |            2
 Anoop   |            1
 Maya    |            3
 paul    |            2
 sandeep |            2
(5 rows)



#13 (2)

postgres=# SELECT * FROM tbl_student WHERE city = 'BANGLORE' AND "Roll No" in (SELECT "Roll No" FROM tbl_grade WHERE course='JAVA') ;
 EnRl No | Roll No | name  |   city   |  mobile  |    dob
---------+---------+-------+----------+----------+------------
       6 |       4 | MAYA  | BANGLORE | 98734534 | 1987-11-12
       1 |       8 | ANOOP | BANGLORE | 93456535 | 1990-12-22
(2 rows)

#14 (2)

-- SELECT name FROM tbl_student WHERE name LIKE 'A%';

postgres=# SELECT tbl_student.name,tbl_grade.course FROM tbl_student  INNER JOIN tbl_grade
postgres-# ON tbl_student."Roll No" = tbl_grade."Roll No" WHERE name LIKE 'A%';
 name  | course
-------+--------
 AKHIL | C
 AKHIL | JAVA
 ANOOP | JAVA
(3 rows)

#15

postgres=# SELECT name, date_part('year',age(dob)) AS age FROM tbl_student;
  name   | age
---------+-----
 AKHIL   |  37
 MAYA    |  35
 ANOOP   |  32
 PAUL    |  31
 SANDEEP |  29
(5 rows)


#16 

postgres=# SELECT name, to_char("dob", 'DD-Mon-YYYY') FROM tbl_student;
  name   |   to_char
---------+-------------
 AKHIL   | 12-Jan-1986
 MAYA    | 12-Nov-1987
 ANOOP   | 22-Dec-1990
 PAUL    | 13-Mar-1991
 SANDEEP | 14-Jun-1993
(5 rows)
