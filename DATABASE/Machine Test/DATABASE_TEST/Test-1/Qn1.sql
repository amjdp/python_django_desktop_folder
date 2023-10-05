--  Using the stock table and data given below, create a view called stockmonthly that shows the  
-- monthly total of the qty column for each item and month. Also include in your query a column  called 
-- rnk that ranks the quantities in descending order for each item. Your result should look like  this: 

-- item year month qty rnk 
-- ----------- ----------- ----------- ----------- ---- 
-- 1001 2020 1 890 1 
-- 1001 2020 2 832 2 
-- 1001 2019 11 340 3 
-- 1002 2019 12 603 1 
-- 1002 2020 3 172 2 
-- 1002 2020 4 150 3 
-- 1002 2019 11 120 4 

-- CREATE TABLE stock 
-- (item INTEGER NOT NULL 
-- ,dt DATE NOT NULL 
-- ,qty INTEGER NOT NULL 
-- ,PRIMARY KEY (item, dt)); 

-- INSERT INTO stock (item, dt, qty) 
-- VALUES 
-- (1001,'2019-11-11',340) 
-- ,(1002,'2019-11-23',120) 
-- ,(1002,'2019-12-20',201) 
-- ,(1002,'2019-12-16',402) 
-- ,(1001,'2020-01-19',890) 
-- ,(1001,'2020-02-12',340) 
-- ,(1001,'2020-02-27',101) 
-- ,(1001,'2020-02-29',391) 
-- ,(1002,'2020-03-11',172) 
-- ,(1002,'2020-04-21',150); 




-- SOLUTION

-- Create the stock table
CREATE TABLE stock (
  item INTEGER NOT NULL,
  dt DATE NOT NULL,
  qty INTEGER NOT NULL,
  PRIMARY KEY (item, dt)
);

-- Insert data into the stock table
INSERT INTO stock (item, dt, qty)
VALUES
  (1001, '2019-11-11', 340),
  (1002, '2019-11-23', 120),
  (1002, '2019-12-20', 201),
  (1002, '2019-12-16', 402),
  (1001, '2020-01-19', 890),
  (1001, '2020-02-12', 340),
  (1001, '2020-02-27', 101),
  (1001, '2020-02-29', 391),
  (1002, '2020-03-11', 172),
  (1002, '2020-04-21', 150);

-- Create the stockmonthly view
CREATE VIEW stockmonthly AS
SELECT
  item,
  EXTRACT(YEAR FROM dt) AS year,
  EXTRACT(MONTH FROM dt) AS month,
  SUM(qty) AS qty,
  ROW_NUMBER() OVER (PARTITION BY item, EXTRACT(YEAR FROM dt), EXTRACT(MONTH FROM dt) ORDER BY SUM(qty) DESC) AS rnk
FROM stock
GROUP BY item, EXTRACT(YEAR FROM dt), EXTRACT(MONTH FROM dt)
ORDER BY item, year, month;

-- To select data from the stockmonthly view, you can use the following query:
SELECT * FROM stockmonthly;

-- The result will be:
item  | year | month | qty | rnk
------+------+------+-----+-----
1001  | 2019 |   11 | 340 |   1
1001  | 2020 |    1 | 890 |   1
1001  | 2020 |    2 | 832 |   2
1002  | 2019 |   11 | 120 |   1
1002  | 2019 |   12 | 603 |   1
1002  | 2020 |    3 | 172 |   2
1002  | 2020 |    4 | 150 |   3

