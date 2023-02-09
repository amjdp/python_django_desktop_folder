DDL MACHINE TEST 1 - Duration 1hour - Marks 15 - (11 Qns)

postgres=# CREATE DATABASE sql_machine_test;
CREATE DATABASE

#1

postgres=# CREATE TABLE tbl_stock(
     pk_int_stock_Id SERIAL PRIMARY KEY, 
     vchr_name VARCHAR(20),
     int_quantity INT,
     int_price INT
     );
CREATE TABLE
postgres=# \d tbl_stock
                                              Table "public.tbl_stock"
     Column      |         Type          | Collation | Nullable |                      Default
-----------------+-----------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer               |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(20) |           |          |
 int_quantity    | integer               |           |          |
 int_price       | integer               |           |          |
Indexes:
    "tbl_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)

#2

postgres=# ALTER TABLE tbl_stock ALTER COLUMN int_price TYPE FLOAT;
ALTER TABLE
postgres=# \d tbl_stock
                                              Table "public.tbl_stock"
     Column      |         Type          | Collation | Nullable |                      Default
-----------------+-----------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer               |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(20) |           |          |
 int_quantity    | integer               |           |          |
 int_price       | double precision      |           |          |
Indexes:
    "tbl_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)


#3

postgres=# CREATE TABLE tbl_supplier(
     pk_int_supplier_id SERIAL PRIMARY KEY,
     vchr_supplier_name VARCHAR(25)
     );
CREATE TABLE
postgres=# \d tbl_supplier
                                                 Table "public.tbl_supplier"
       Column       |         Type          | Collation | Nullable |
 Default
--------------------+-----------------------+-----------+----------+----------------------------------------------------------
 pk_int_supplier_id | integer               |           | not null | nextval('tbl_supplier_pk_int_supplier_id_seq'::regclass)
 vchr_supplier_name | character varying(25) |           |          |
Indexes:
    "tbl_supplier_pkey" PRIMARY KEY, btree (pk_int_supplier_id)

#4

postgres=# ALTER TABLE tbl_stock ADD COLUMN fk_int_supplier  INT;
ALTER TABLE
postgres=# \d tbl_stock
                                              Table "public.tbl_stock"
     Column      |         Type          | Collation | Nullable |                      Default
-----------------+-----------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer               |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(20) |           |          |
 int_quantity    | integer               |           |          |
 int_price       | double precision      |           |          |
 fk_int_supplier | integer               |           |          |
Indexes:
    "tbl_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)

#5

postgres=# ALTER TABLE tbl_stock ADD FOREIGN KEY(fk_int_supplier) REFERENCES tbl_supplier(pk_int_supplier_id);
ALTER TABLE
postgres=# \d tbl_stock
                                              Table "public.tbl_stock"
     Column      |         Type          | Collation | Nullable |                      Default
-----------------+-----------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer               |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(20) |           |          |
 int_quantity    | integer               |           |          |
 int_price       | double precision      |           |          |
 fk_int_supplier | integer               |           |          |
Indexes:
    "tbl_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)
Foreign-key constraints:
    "tbl_stock_fk_int_supplier_fkey" FOREIGN KEY (fk_int_supplier) REFERENCES tbl_supplier(pk_int_supplier_id)


#6 

postgres=# CREATE TABLE tbl_dept(
postgres(#     pk_int_dept_id SERIAL PRIMARY KEY,
postgres(#     vchr_dept_name VARCHAR(25)
postgres(#     );
CREATE TABLE
postgres=# \d tbl_dept
                                             Table "public.tbl_dept"
     Column     |         Type          | Collation | Nullable |                     Default
----------------+-----------------------+-----------+----------+--------------------------------------------------
 pk_int_dept_id | integer               |           | not null | nextval('tbl_dept_pk_int_dept_id_seq'::regclass)
 vchr_dept_name | character varying(25) |           |          |
Indexes:
    "tbl_dept_pkey" PRIMARY KEY, btree (pk_int_dept_id)

#7

postgres=# CREATE TABLE tbl_classes(
postgres(#     pk_int_class_id SERIAL PRIMARY KEY,
postgres(#     vchr_class_name VARCHAR(20),
postgres(#     fk_int_dept_id INT,
postgres(#     FOREIGN KEY(fk_int_dept_id) REFERENCES tbl_dept(pk_int_dept_id)
postgres(#     );
CREATE TABLE
postgres=# \d tbl_classes
                                              Table "public.tbl_classes"
     Column      |         Type          | Collation | Nullable |                       Default
-----------------+-----------------------+-----------+----------+------------------------------------------------------
 pk_int_class_id | integer               |           | not null | nextval('tbl_classes_pk_int_class_id_seq'::regclass)
 vchr_class_name | character varying(20) |           |          |
 fk_int_dept_id  | integer               |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (pk_int_class_id)
Foreign-key constraints:
    "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dept(pk_int_dept_id)

#8

postgres=# CREATE TABLE tbl_enrollment(
postgres(#     pk_int_enrollment_id SERIAL PRIMARY KEY,
postgres(#     int_count INT,
postgres(#     fk_int_class_id INT,
postgres(#     FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id)
postgres(#     );
CREATE TABLE
postgres=# \d tbl_enrollment
                                            Table "public.tbl_enrollment"
        Column        |  Type   | Collation | Nullable |                           Default

----------------------+---------+-----------+----------+--------------------------------------------------------------
 pk_int_enrollment_id | integer |           | not null | nextval('tbl_enrollment_pk_int_enrollment_id_seq'::regclass)
 int_count            | integer |           |          |
 fk_int_class_id      | integer |           |          |
Indexes:
    "tbl_enrollment_pkey" PRIMARY KEY, btree (pk_int_enrollment_id)
Foreign-key constraints:
    "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id)

#9

postgres=# ALTER TABLE tbl_classes ADD UNIQUE(vchr_class_name);
ALTER TABLE
postgres=# \d tbl_classes
                                              Table "public.tbl_classes"
     Column      |         Type          | Collation | Nullable |                       Default
-----------------+-----------------------+-----------+----------+------------------------------------------------------
 pk_int_class_id | integer               |           | not null | nextval('tbl_classes_pk_int_class_id_seq'::regclass)
 vchr_class_name | character varying(20) |           |          |
 fk_int_dept_id  | integer               |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (pk_int_class_id)
    "tbl_classes_vchr_class_name_key" UNIQUE CONSTRAINT, btree (vchr_class_name)
Foreign-key constraints:
    "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dept(pk_int_dept_id)
Referenced by:
    TABLE "tbl_enrollment" CONSTRAINT "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id)


#10

postgres=# ALTER TABLE tbl_dept ADD COLUMN vchr_dept_description VARCHAR(20);
ALTER TABLE
postgres=# \d tbl_dept
                                                 Table "public.tbl_dept"
        Column         |         Type          | Collation | Nullable |
Default
-----------------------+-----------------------+-----------+----------+--------------------------------------------------
 pk_int_dept_id        | integer               |           | not null | nextval('tbl_dept_pk_int_dept_id_seq'::regclass)
 vchr_dept_name        | character varying(25) |           |          |
 vchr_dept_description | character varying(20) |           |          |
Indexes:
    "tbl_dept_pkey" PRIMARY KEY, btree (pk_int_dept_id)
Referenced by:
    TABLE "tbl_classes" CONSTRAINT "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dept(pk_int_dept_id)

#11 (5)

postgres=# INSERT INTO tbl_supplier(vchr_supplier_name)VALUES
postgres-#     ('Logitech'),
postgres-#     ('Samsung'),
postgres-#     ('I ball'),
postgres-#     ('LG'),
postgres-#     ('Creative');
INSERT 0 5
postgres=# \d tbl_supplier
                                                 Table "public.tbl_supplier"
       Column       |         Type          | Collation | Nullable |
 Default
--------------------+-----------------------+-----------+----------+----------------------------------------------------------
 pk_int_supplier_id | integer               |           | not null | nextval('tbl_supplier_pk_int_supplier_id_seq'::regclass)
 vchr_supplier_name | character varying(25) |           |          |
Indexes:
    "tbl_supplier_pkey" PRIMARY KEY, btree (pk_int_supplier_id)
Referenced by:
    TABLE "tbl_stock" CONSTRAINT "tbl_stock_fk_int_supplier_fkey" FOREIGN KEY (fk_int_supplier) REFERENCES tbl_supplier(pk_int_supplier_id)