-- AGGREGATE FUNCTIONS

SELECT AVG(price) FROM products;
SELECT SUM(price) FROM products;
SELECT MAX(price) AS most_expensive_product_price FROM products;
SELECT MIN(price) AS cheapest_product_price FROM products;
SELECT COUNT(pk_products_id) AS total_products FROM products;
SELECT COUNT(*) AS total_products FROM products;
SELECT added_date, COUNT(*) AS no_of_products_added FROM products GROUP BY added_date;


SELECT added_date, COUNT(*) AS no_of_products_added FROM products GROUP BY added_date HAVING added_date < '2020-09-30';
 added_date | no_of_products_added
------------+----------------------
 2020-09-12 |                    1
 2020-06-09 |                    2
(2 rows)

SELECT fk_category_id FROM products;
 fk_category_id
----------------
              2
              3
              1
              2
(4 rows)

SELECT DISTINCT fk_category_id FROM products;
 fk_category_id
----------------
              2
              3
              1
(3 rows)

-- SCALAR FUNCTIONS

SELECT UPPER(product_name) FROM products;
        upper
---------------------
 CLASSMATE NOTEBOOK
 MAYBELLINE EYELINER
 MAGGI NOODLES
 TECHNOTIP PEN
(4 rows)

SELECT LOWER(product_name) FROM products;
        lower
---------------------
 classmate notebook
 maybelline eyeliner
 maggi noodles
 technotip pen
(4 rows)

SELECT product_name, LENGTH(product_name) FROM products;
    product_name     | length
---------------------+--------
 Classmate Notebook  |     18
 Maybelline eyeliner |     19
 Maggi noodles       |     13
 Technotip pen       |     13
(4 rows)

SELECT SUBSTRING(product_name, 2, 5) AS ExtractString FROM products;
 extractstring
---------------
 lassm
 aybel
 aggi
 echno

UPDATE products SET price = 45.5 WHERE pk_products_id = 1;
UPDATE 1
 pk_products_id |    product_name     | fk_category_id |             description              | price | added_date
----------------+---------------------+----------------+--------------------------------------+-------+------------
              2 | Maybelline eyeliner |              3 | Black color, water proof             |   380 | 2020-06-09
              3 | Maggi noodles       |              1 | Chicken flavoured, 2 pack in one set |    30 | 2020-09-30
              4 | Technotip pen       |              2 | Black ink                            |    10 | 2020-09-12
              1 | Classmate Notebook  |              2 | 200 pages, 40x40 cm, lined notebook  |  45.5 | 2020-06-09
(4 rows)

SELECT ROUND(price) FROM products;
 round
-------
   380
    30
    10
    46
(4 rows)

SELECT NOW();
              now
----------------------------------
 2022-12-02 00:14:06.345265+05:30
(1 row)

-- SELECT FORMAT (column_name, format) FROM table name;

-- SELECT date_part('year', your_column) FROM your_table;

SELECT date_part('year', added_date) FROM products;
 date_part
-----------
      2020
      2020
      2020
      2020
(4 rows)

SELECT date_part('month', added_date) FROM products;
 date_part
-----------
         6
         9
         9
         6
(4 rows)

SELECT date_part('day', added_date) FROM products;
 date_part
-----------
         9
        30
        12
         9
(4 rows)

SELECT date_part('day', added_date) AS date FROM products;
 date
------
    9
   30
   12
    9
(4 rows)