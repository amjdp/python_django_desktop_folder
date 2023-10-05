INSERT INTO category(category_name, description) VALUES (
    'Grocery',
    'food and grains, daily needs, spices, frozen items, packet foods'
);

INSERT INTO category(category_name, description) VALUES (
  'Stationery',
    'books, pens, school items, sheets'
);

-- --------------------------------------------------------------------------------



INSERT INTO category VALUES (
    1,
    'Grocery',
    'food and grains, daily needs, spices, frozen items, packet foods'
);

INSERT INTO category VALUES(
    2,
    'Stationery',
    'books, pens, school items, sheets'
);

INSERT INTO products VALUES(
    1,
    'Classmate Notebook',
    2,
    '200 pages, 40x40 cm, lined notebook',
    45,
    '2020-06-09'
);

SELECT * FROM products;
SELECT * FROM category;
 pk_category_id | category_name |                           description
----------------+---------------+------------------------------------------------------------------
              1 | Grocery       | food and grains, daily needs, spices, frozen items, packet foods
              2 | Stationery    | books, pens, school items, sheets
(2 rows)

INSERT INTO category VALUES (
    3,
    'Fancy',
    'Beauty and personal care'
);

ERROR:  duplicate key value violates unique constraint "category_pkey"
DETAIL:  Key (pk_category_id)=(2) already exists.

SELECT * FROM category;
 pk_category_id | category_name |                           description
----------------+---------------+------------------------------------------------------------------
              1 | Grocery       | food and grains, daily needs, spices, frozen items, packet foods
              2 | Stationery    | books, pens, school items, sheets
              3 | Fancy         | Beauty and personal care
(3 rows)

INSERT INTO products VALUES(
    2,
    'Maybelline eyeliner',
    3,
    'Black color, water proof',
    45,
    '2020-06-09'
);

ERROR:  insert or update on table "products" violates foreign key constraint "products_fk_category_id_fkey1"
DETAIL:  Key (fk_category_id)=(3) is not present in table "category".



INSERT INTO category VALUES (
    3,
    'Fancy',
    'Beauty and personal care'
);

INSERT INTO products VALUES(
    2,
    'Maybelline eyeliner',
    3,
    'Black color, water proof',
    380,
    '2020-06-09'
);

INSERT INTO products VALUES(
    3,
    'Maggi noodles',
    1,
    'Chicken flavoured, 2 pack in one set',
    30,
    '2020-09-30'
);

INSERT INTO products VALUES(
    4,
    'Technotip pen',
    2,
    'Black ink',
    10,
    '2020-09-12'
);

SELECT * FROM products;
 pk_products_id |    product_name     | fk_category_id |             description              | price | added_date
----------------+---------------------+----------------+--------------------------------------+-------+------------
              1 | Classmate Notebook  |              2 | 200 pages, 40x40 cm, lined notebook  |    45 | 2020-06-09
              2 | Maybelline eyeliner |              3 | Black color, water proof             |    45 | 2020-06-09
              3 | Maggi noodles       |              1 | Chicken flavoured, 2 pack in one set |    30 | 2020-09-30
              4 | Technotip pen       |              2 | Black ink                            |    10 | 2020-09-12
(4 rows)

INSERT INTO category VALUES (
    4,
    'Electronics',
    'gadgets,home appliances'
);

INSERT INTO category VALUES (
    5,
    'Sports',
    'Sports and fitness'
);

SELECT * FROM category;
 pk_category_id | category_name |                           description
----------------+---------------+------------------------------------------------------------------
              1 | Grocery       | food and grains, daily needs, spices, frozen items, packet foods
              2 | Stationery    | books, pens, school items, sheets
              3 | Fancy         | Beauty and personal care
              4 | Electronics   | gadgets,home appliances
              5 | Sports        | Sports and fitness
(5 rows)

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

INSERT INTO bills VALUES(
    1,
    'Athira',
    '9898765432',
    '2020-10-01'
);

INSERT INTO bills VALUES(
    2,
    'Krishna',
    '7898765432',
    '2020-10-02'    
);

INSERT INTO bills VALUES(
    3,
    'Vishnu',
    '9987659432',
    '2020-11-22'    
);

INSERT INTO bills VALUES(
    4,
    'Amir',
    '9987009432',
    '2020-11-22'   
);

INSERT INTO bills VALUES(
    (2,
    'Krishna',
    '7898765432',
    '2020-10-02'),
    (3,
    'Vishnu',
    '9987659432',
    '2020-11-22'),
    (4,
    'Amir',
    '9987009432',
    '2020-11-22')
);

SELECT * FROM bills;
 pk_bill_id | customer_name | customer_phone | bill_date
------------+---------------+----------------+------------
          1 | Athira        | 9898765432     | 2020-10-01
          2 | Krishna       | 7898765432     | 2020-10-02
          3 | Vishnu        | 9987659432     | 2020-11-22
          4 | Amir          | 9987009432     | 2020-11-22
(4 rows)

SELECT * FROM employees;
 pk_emp_id |   type   | first_name | last_name  |            email            |   phone    | gender |    dob     |   city
-----------+----------+------------+------------+-----------------------------+------------+--------+------------+-----------
         1 | Manager  | Jane       | Austen     | janeausten@gmail.com        | 9965473569 | Female | 1775-12-16 | Steventon
         2 | Manager  | Agatha     | Christie   | agathachristie@gmail.com    | 9965473569 | Female | 1890-09-15 | Torquay
         3 | Salesman | Paul       | Addison    | pauladdison@gmail.com       | 9966987469 | Male   | 1886-06-18 | Norway
         4 | Salesman | Michael    | Abbensetts | michaelabbensetts@gmail.com | 9966989879 | Male   | 1896-08-08 | London
         5 | Accounts | Drishya    | K          | migtrdyetts@gmail.com       | 9966989879 | Female | 1996-08-08 | London
(5 rows)

SELECT * FROM employees WHERE gender = 'Female';
SELECT product_name, price FROM products;
SELECT * FROM products WHERE added_date = '2020-09-30';
SELECT * FROM products WHERE price < 1000;
SELECT product_name, fk_category_id FROM products WHERE price BETWEEN 5 AND 100;

SELECT * FROM products LIMIT 5;

SELECT * FROM employees WHERE first_name LIKE 'D%';
SELECT category_name FROM category WHERE description LIKE '%books%';
SELECT * FROM products WHERE product_name LIKE '_l%';

SELECT * FROM bills WHERE customer_name LIKE 'A%' LIMIT 20;

SELECT pk_bill_id, customer_name, customer_phone FROM bills WHERE customer_phone LIKE '9898______';

UPDATE employees SET phone = '7878901239', email = 'drishyak123@gmail.com' WHERE first_name = 'Drishya' AND last_name = 'K';

DELETE FROM employees WHERE first_name = 'Drishya' AND phone = '7878901239';

UPDATE employees SET phone = '7878901239', email = 'drishyak123@gmail.com' WHERE pk_emp_id = 2;

DELETE FROM employees WHERE pk_emp_id = 2;

INSERT INTO employees(salary) VALUES (10000) WHERE id = 1;




TRUNCATE TABLE table_name RESTART IDENTITY;


DROP SCHEMA public CASCADE;
CREATE SCHEMA public;






create table station(id int, city varchar(21),state varchar(2),lat_n int,long_w int);

SELECT DISTINCT city FROM station WHERE LOWER(city) LIKE '[aeiou]%[aeiou]';

INSERT INTO station VALUES
    (1,
    'Ahrissue',
    'KL',
    45,
    69),
    (2,
    'Ahrissua',
    'KL',
    45,
    69),
    (3,
    'Ahrissui',
    'KL',
    45,
    69),
    (4,
    'Ahrissuo',
    'KL',
    45,
    69),
    (5,
    'ahrissuu',
    'KL',
    45,
    69),
    (6,
    'ehrissua',
    'KL',
    45,
    69),
    (7,
    'Ehrissui',
    'KL',
    45,
    69),
    (8,
    'Ehrissuo',
    'KL',
    45,
    69),
    (9,
    'ehrissuu',
    'KL',
    45,
    69),
    (10,
    'ehrissue',
    'KL',
    45,
    69),
    (11,
    'ihrissua',
    'KL',
    45,
    69),
    (12,
    'ohrissui',
    'KL',
    45,
    69),
    (13,
    'uhrissuo',
    'KL',
    45,
    69),
    (14,
    'uhrissua',
    'KL',
    45,
    69),
    (15,
    'ohrissue',
    'KL',
    45,
    69);



SELECT DISTINCT CITY FROM STATION
WHERE 
LOWER(CITY) LIKE 'A%a' OR 
LOWER(CITY) LIKE 'A%e' OR 
LOWER(CITY) LIKE 'A%i' OR 
LOWER(CITY) LIKE 'A%O' OR 
LOWER(CITY) LIKE 'A%u' OR 
LOWER(CITY) LIKE 'E%a' OR 
LOWER(CITY) LIKE 'E%e' OR 
LOWER(CITY) LIKE 'E%i' OR 
LOWER(CITY) LIKE 'E%o' OR 
LOWER(CITY) LIKE 'E%u' OR 
LOWER(CITY) LIKE 'I%a' OR 
LOWER(CITY) LIKE 'I%e' OR 
LOWER(CITY) LIKE 'I%i' OR 
LOWER(CITY) LIKE 'I%o' OR 
LOWER(CITY) LIKE 'I%u' OR 
LOWER(CITY) LIKE 'O%a' OR 
LOWER(CITY) LIKE 'O%e' OR 
LOWER(CITY) LIKE 'O%i' OR 
LOWER(CITY) LIKE 'O%o' OR 
LOWER(CITY) LIKE 'O%u' OR
LOWER(CITY) LIKE 'U%a' OR 
LOWER(CITY) LIKE 'U%e' OR 
LOWER(CITY) LIKE 'U%i' OR 
LOWER(CITY) LIKE 'U%o' OR 
LOWER(CITY) LIKE 'U%u';





SELECT DISTINCT CITY FROM STATION WHERE LOWER(LEFT(CITY, 1)) IN ('a', 'e', 'i', 'o', 'u') 
AND LOWER(RIGHT(CITY, 1)) IN ('a', 'e', 'i', 'o', 'u');


SELECT DISTINCT city
FROM   station
WHERE  NOT city LIKE 'A%'
       AND NOT city LIKE 'E%'
       AND NOT city LIKE 'I%'
       AND NOT city LIKE 'O%'
       AND NOT city LIKE 'U%'; 


SELECT DISTINCT city
FROM   station
WHERE  NOT city LIKE '%A'
       AND NOT city LIKE '%E'
       AND NOT city LIKE '%I'
       AND NOT city LIKE '%O'
       AND NOT city LIKE '%U'; 

       
SELECT DISTINCT city FROM   station WHERE  NOT city LIKE '%a' AND NOT city LIKE '%e'
AND NOT city LIKE '%i'
AND NOT city LIKE '%o'
AND NOT city LIKE '%u'; 