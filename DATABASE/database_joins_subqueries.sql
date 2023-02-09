-- fetch record from one table ... In some situations we need to fetch data from more than one tables..
-- all RDBMS ..concept of joins
-- separate tables for separate details...student details,attendance,marks
-- Student(Id [pk],Name,Gender) Mark(Id,Student_Id [fk],mark) - connection established b/n two tables -
--  a relationship is made b/n 2 tables
-- we can fetch data from these 2 tables ... we can join tables ,if a relationship like this is present
-- one to one  - student -> Address
-- one to Many - student -> Mark
-- many to many - Student -> Friends
-- join - combine columns of multiple tables - 
-- INNER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN, CROSS JOIN
-- INNER JOIN - table 1 & table 2 - records exists in 2 tables - conditions apply to both tables
-- LEFT JOIN - priority to LEFT table - left table records & common records(conditions satisfy) - (doesn't check if the record is present or not in the right table)
-- RIGHT JOIN - priority to RIGHT table - right table records & common records(conditions satisfy) - (doesn't check if the record is present or not in the left table)

-- INNER JOIN
-- student details & mark details - to get details of a particular student
-- a + b
--  table1 join table2
-- select * from students join marks students.id = marks.student_id
-- select * from students join marks on students.id = marks.student_id 
-- inner join and join are same(keyword)

-- LEFT JOIN - record in left table if not present in right



-- subqueries - multiple queries in a single line
-- select * from teachers where id = 5
-- select id from teachers where teacher_name = 'sunil'
-- select * from teachers where id = (select id from teachers where teacher_name = 'sunil')




CREATE TABLE bill_items(
    item_id SERIAL PRIMARY KEY,
    fk_product_id INT,    
    item_price FLOAT,
    item_quantity INT,
    fk_bill_id INT,
    FOREIGN KEY(fk_product_id) REFERENCES products(pk_products_id) ON DELETE CASCADE ON UPDATE CASCADE,  
    FOREIGN KEY(fk_bill_id) REFERENCES bills(pk_bill_id) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO bill_items VALUES(
    1,1,45,2,1
);

INSERT INTO bill_items VALUES(
    2,3,30,3,1
);

INSERT INTO bill_items VALUES(
    3,4,10,1,1
);


INSERT INTO bill_items VALUES(
    4,4,10,4,2
);

INSERT INTO bill_items VALUES(
    5,2,380,2,3
);

SELECT * FROM bill_items;
 item_id | fk_product_id | item_price | item_quantity | fk_bill_id
---------+---------------+------------+---------------+------------
       1 |             1 |         45 |             2 |          1
       2 |             3 |         30 |             3 |          1
       3 |             4 |         10 |             1 |          1
       4 |             4 |         10 |             4 |          2
       5 |             2 |        380 |             2 |          3
(5 rows)

SELECT pk_bill_id, bill_date, customer_name, SUM(item_price * item_quantity) 
AS total_bill FROM bill_items INNER JOIN bills ON pk_bill_id = fk_bill_id 
GROUP BY pk_bill_id ORDER BY pk_bill_id;


 pk_bill_id | bill_date  | customer_name | total_bill
------------+------------+---------------+------------
          1 | 2020-10-01 | Athira        |        190
          2 | 2020-10-02 | Krishna       |         40
          3 | 2020-11-22 | Vishnu        |        760
(3 rows)


CREATE TABLE stocks(
    pk_stock_id SERIAL PRIMARY KEY,
    fk_product_id INT, 
    quantity INT,
    FOREIGN KEY(fk_product_id) REFERENCES products(pk_products_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO stocks VALUES(
    1,1,300
);

INSERT INTO stocks VALUES(
    2,2,50
);

INSERT INTO stocks VALUES(
    3,3,200
);

SELECT * FROM stocks;
 pk_stock_id | fk_product_id | quantity
-------------+---------------+----------
           1 |             1 |      300
           2 |             2 |       50
           3 |             3 |      200
(3 rows)

SELECT product_name,quantity FROM products LEFT JOIN stocks ON pk_products_id = fk_product_id;
    product_name     | quantity
---------------------+----------
 Classmate Notebook  |      300
 Maybelline eyeliner |       50
 Maggi noodles       |      200
 Technotip pen       |
(4 rows)

SELECT product_name,category_name FROM products RIGHT JOIN category ON fk_category_id = pk_category_id;
    product_name     | category_name
---------------------+---------------
 Classmate Notebook  | Stationery
 Maybelline eyeliner | Fancy
 Maggi noodles       | Grocery
 Technotip pen       | Stationery
                     | Sports
                     | Electronics
(6 rows)


SELECT * FROM products WHERE fk_category_id IN (SELECT pk_category_id FROM category WHERE category_name = 'Grocery');

 pk_products_id | product_name  | fk_category_id |             description              | price | added_date
----------------+---------------+----------------+--------------------------------------+-------+------------
              3 | Maggi noodles |              1 | Chicken flavoured, 2 pack in one set |    30 | 2020-09-30
(1 row)


SELECT * FROM products WHERE fk_category_id IN (SELECT pk_category_id FROM category WHERE category_name = 'Fancy');

 pk_products_id |    product_name     | fk_category_id |       description        | price | added_date
----------------+---------------------+----------------+--------------------------+-------+------------
              2 | Maybelline eyeliner |              3 | Black color, water proof |    45 | 2020-06-09
(1 row)

