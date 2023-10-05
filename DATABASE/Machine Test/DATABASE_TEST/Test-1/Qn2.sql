-- Using the same stock table as in the previous question, write a query to retrieve the date and the  
-- qty for the row(s) with the second highest qty in the entire table. Your query should work without  
-- needing any modification to give the second highest result for any set of data in the table, not just  
-- for the data given. Use the stock table in your query; you don’t need to use the view you created  
-- for the previous question. The result should be: 
-- dt qty 
-- ---------- ----------- 
-- 2019-12-16 402



-- SOLUTION

-- To retrieve the date and quantity for the row(s) with the second highest quantity 
-- in the entire stock table, you can use the following SQL query:

SELECT dt, qty
FROM stock
WHERE qty = (
  SELECT DISTINCT qty
  FROM stock
  ORDER BY qty DESC
  OFFSET 1 ROW FETCH NEXT 1 ROW ONLY
);

-- This query uses a subquery to find the second highest quantity in the table by sorting the 
-- quantities in descending order and then skipping the first row using the OFFSET clause and 
-- fetching the next row using the FETCH NEXT clause. The outer query then selects the date (dt) 
-- and quantity (qty) for the rows that match the second highest quantity.

-- Note that if there are multiple rows with the same second highest quantity, this query will 
-- return all of them. If you only want a single row, you can modify the query to use 
-- the FETCH FIRST clause instead of FETCH NEXT:

SELECT dt, qty
FROM stock
WHERE qty = (
  SELECT DISTINCT qty
  FROM stock
  ORDER BY qty DESC
  OFFSET 1 ROW FETCH FIRST 1 ROW ONLY
);

-- This will return only the first row with the second highest quantity.