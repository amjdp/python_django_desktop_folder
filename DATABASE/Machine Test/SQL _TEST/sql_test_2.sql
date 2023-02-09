DML MACHINE TEST 2 - Duration 1hour - Marks 15 - (9 Qns)

#1

postgres=# INSERT INTO tbl_stock (vchr_name, int_quantity,int_price,fk_int_supplier)
postgres-#  VALUES ('Mouse',10,500,1),
postgres-#  ('Keyboad',5,450,3),
postgres-#  ('Modem',10,1200,2), 
postgres-#  ('Memory',100,1500,5),
postgres-#  ('Headphone',50,750,4),
postgres-#  ('Memory',2,3500,4);
INSERT 0 6
postgres=# SELECT * FROM tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |       500 |               1
               2 | Keyboad   |            5 |       450 |               3
               3 | Modem     |           10 |      1200 |               2
               4 | Memory    |          100 |      1500 |               5
               5 | Headphone |           50 |       750 |               4
               6 | Memory    |            2 |      3500 |               4
(6 rows)

#2

postgres=# UPDATE tbl_stock SET int_price = CASE pk_int_stock_id
postgres-#  WHEN 1 THEN 501.5
postgres-#  WHEN 2 THEN 451.5
postgres-#  WHEN 3 THEN 1201.5
postgres-#  WHEN 4 THEN 1501.5
postgres-#  WHEN 5 THEN 751.5
postgres-#  WHEN 6 THEN 3501.5
postgres-#  END
postgres-#  ;
UPDATE 6
postgres=# SELECT * FROM tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               2 | Keyboad   |            5 |     451.5 |               3
               3 | Modem     |           10 |    1201.5 |               2
               4 | Memory    |          100 |    1501.5 |               5
               5 | Headphone |           50 |     751.5 |               4
               6 | Memory    |            2 |    3501.5 |               4
(6 rows)

----------------------------------------------------------------------------
TRUNCATE TABLE  tbl_stock;

OR

UPDATE tbl_stock SET int_price = 501.5 WHERE pk_int_stock_id = 1;
UPDATE tbl_stock SET int_price = 451.5 WHERE pk_int_stock_id = 2;
UPDATE tbl_stock SET int_price = 1201.5 WHERE pk_int_stock_id = 3;
UPDATE tbl_stock SET int_price = 1501.5 WHERE pk_int_stock_id = 4;
UPDATE tbl_stock SET int_price = 751.5 WHERE pk_int_stock_id = 5;
UPDATE tbl_stock SET int_price = 3501.5 WHERE pk_int_stock_id = 6;
----------------------------------------------------------------------------

OR

UPDATE tbl_stock SET int_price = int_price + 501.5;

-----------------------------------------------------------------------------

#3 (2)

postgres=# SELECT * FROM tbl_stock WHERE int_price > 1000;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               3 | Modem     |           10 |    1201.5 |               2
               4 | Memory    |          100 |    1501.5 |               5
               6 | Memory    |            2 |    3501.5 |               4
(3 rows)

#4 (2)

-- SELECT * FROM tbl_stock ORDER BY vchr_name ASC;

postgres=# SELECT * FROM tbl_stock ORDER BY vchr_name;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               5 | Headphone |           50 |     751.5 |               4
               2 | Keyboad   |            5 |     451.5 |               3
               4 | Memory    |          100 |    1501.5 |               5
               6 | Memory    |            2 |    3501.5 |               4
               3 | Modem     |           10 |    1201.5 |               2
               1 | Mouse     |           10 |     501.5 |               1
(6 rows)

#5 (2)

postgres=# SELECT * FROM tbl_stock ORDER BY vchr_name LIMIT 3;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               5 | Headphone |           50 |     751.5 |               4
               2 | Keyboad   |            5 |     451.5 |               3
               4 | Memory    |          100 |    1501.5 |               5
(3 rows)

-- List Last 3 row of tbl_stock
-- SELECT * FROM (SELECT * FROM tbl_stock ORDER BY pk_int_stock_id DESC LIMIT 3) sub ORDER BY pk_int_stock_id ASC;
-- postgres=# SELECT * FROM (SELECT * FROM tbl_stock ORDER BY pk_int_stock_id DESC LIMIT 3) sub ORDER BY pk_int_stock_id ASC;
--  pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-- -----------------+-----------+--------------+-----------+-----------------
--                4 | Memory    |          100 |    1501.5 |               5
--                5 | Headphone |           50 |     751.5 |               4
--                6 | Memory    |            2 |    3501.5 |               4
-- (3 rows)


-- select * from tbi_stock order by vchr_name asc fetch first 3 rows only;

#6 (2)

postgres=# SELECT * FROM tbl_stock ORDER BY vchr_name DESC LIMIT 3;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               3 | Modem     |           10 |    1201.5 |               2
               4 | Memory    |          100 |    1501.5 |               5
(3 rows)

#7 (2)

postgres=# SELECT vchr_name, int_quantity, int_price, (int_quantity * int_price) AS "int_quantity * int_price" FROM tbl_stock;
 vchr_name | int_quantity | int_price | int_quantity * int_price
-----------+--------------+-----------+--------------------------
 Mouse     |           10 |     501.5 |                     5015
 Keyboad   |            5 |     451.5 |                   2257.5
 Modem     |           10 |    1201.5 |                    12015
 Memory    |          100 |    1501.5 |                   150150
 Headphone |           50 |     751.5 |                    37575
 Memory    |            2 |    3501.5 |                     7003
(6 rows)

#8 (2)

postgres=# DELETE FROM tbl_stock WHERE fk_int_supplier IN (SELECT pk_int_supplier_id FROM tbl_supplier WHERE vchr_supplier_name = 'Creative');
DELETE 1
postgres=#  select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | Mouse     |           10 |     501.5 |               1
               2 | Keyboad   |            5 |     451.5 |               3
               3 | Modem     |           10 |    1201.5 |               2
               5 | Headphone |           50 |     751.5 |               4
               6 | Memory    |            2 |    3501.5 |               4
(5 rows)

-- OR 

-- DELETE FROM tbl_stock WHERE fk_int_supplier = 5;

#9

postgres=# INSERT INTO tbl_dept(vchr_dept_name,vchr_dept_description) VALUES
postgres-# ('Computer Science','CS'),
postgres-# ('Electronics','EC'),
postgres-# ('Commerce','CC'),
postgres-# ('Arts','AR');
INSERT 0 4
postgres=# SELECT * FROM tbl_dept;
 pk_int_dept_id |  vchr_dept_name  | vchr_dept_description
----------------+------------------+-----------------------
              1 | Computer Science | CS
              2 | Electronics      | EC
              3 | Commerce         | CC
              4 | Arts             | AR
(4 rows)