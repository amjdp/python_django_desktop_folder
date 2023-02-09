\l

-- Database schema - all of the different tables and all the different relations
-- Database - any collection of related information databases can be stored in different ways
-- Phone Book                           On paper
-- Shopping List                        In your mind
-- Todo List                            On a computer
-- Your 5 Best Friends                  powerpoint
-- Facebook's User Base                 Comments section

-- collection of related information can be stored in different ways

--  DBMS - A special software program that helps users create and maintain a database - 
--   Makes it easy



CREATE DATABASE billing;
\c billing
You are now connected to database "billing" as user "postgres".


CREATE TABLE employees(
    pk_emp_id SERIAL PRIMARY KEY,
    type VARCHAR(100),
    first_name VARCHAR(200), 
    last_name VARCHAR(200),
    email VARCHAR(200),
    phone VARCHAR(100),
    gender VARCHAR(20),
    dob DATE
);

CREATE TABLE category(
    pk_category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(200),
    description VARCHAR(400)
);

CREATE TABLE products(
    pk_products_id SERIAL PRIMARY KEY,
    product_name VARCHAR(200),
    fk_category_id INT,
    description VARCHAR(400),
    price FLOAT,
    added_date DATE,
    FOREIGN KEY(fk_category_id) REFERENCES category(pk_category_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE bills(
    pk_bill_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_phone VARCHAR(50),
    bill_date DATE
);

\d products
\dt  
           List of relations
 Schema |    Name    | Type  |  Owner
--------+------------+-------+----------
 public | bill_items | table | postgres
 public | bills      | table | postgres
 public | category   | table | postgres
 public | employees  | table | postgres
 public | products   | table | postgres
(5 rows)

ALTER TABLE products ADD product_brand VARCHAR(100);
ALTER TABLE employees ADD city VARCHAR(100);
 
ALTER TABLE products DROP COLUMN added_date;
ALTER TABLE products ALTER COLUMN price TYPE INT;
ALTER TABLE products RENAME COLUMN price TO cost;
ALTER TABLE products RENAME TO Items;
DROP TABLE products;


ALTER TABLE employees ADD salary FLOAT;


-- Most SQL databases are vertically scalable, which means that you can increase the load on 
-- a single server by increasing components like RAM, SSD, or CPU. In contrast, NoSQL databases 
-- are horizontally scalable, which means that they can handle increased traffic simply by adding 
-- more servers to the database  .....example : adding floors in building for additional requirements and
--  that would be more complex at one point of time when it reaches it highest possible capacity --SQL and on 
-- other hand we can build seperate buildings on increasing demands -noSQL
-- 
-- 

-- DDL - Data definition language 
-- statements used to create alter and drop database objects.
-- truncate table..

-- DML -Data manipulation language
-- insert retrive update remove and manage data with in a database object