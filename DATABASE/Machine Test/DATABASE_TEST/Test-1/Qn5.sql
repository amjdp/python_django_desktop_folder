-- Using the same tables and data as in the previous question, write a stored procedure that retrieves  
-- the names and ratings of people for a given location and language. The location and language  
-- should be specified as parameters when you call your procedure. 
-- When you have written your procedure you should be able to test it 
-- by executing the following  command: 

-- EXEC getskill @language = 'Python', @location = 'London'; 

-- Expected result: 
-- employee_name rating 
-- -------------------- ----------- 
-- Diana 10 
-- Frank 6 


-- SOLUTION

-- To create a stored procedure that retrieves the names and ratings of people for a given location 
-- and language, you can use the following code:

CREATE OR REPLACE FUNCTION getskill(
    language_param VARCHAR(20),
    location_param VARCHAR(20)
)
RETURNS TABLE (employee_name VARCHAR(20), rating INT)
AS $$
BEGIN
    RETURN QUERY
    SELECT p.employee_name, s.rating
    FROM programmer p
    JOIN skill s ON p.employee_name = s.employee_name
    WHERE p.location = location_param AND s.language = language_param;
END;
$$ LANGUAGE plpgsql;


-- This code defines a function called getskill that takes two parameters: 
-- language_param and location_param. 
-- It returns a table with two columns: employee_name and rating.

-- In PostgreSQL, stored procedures are called using the SELECT statement with the function name. 
-- Here's the updated code to call and test the stored procedure:

database_test=# SELECT * FROM getskill('Python', 'London');
 employee_name | rating
---------------+--------
 Diana         |     10
 Frank         |      6
(2 rows)

-- This result shows the names (employee_name) and ratings (rating) of people who have the language 
-- 'Python' and are located in 'London'.

-- Please note that in PostgreSQL, stored procedures are treated as functions, 
-- so you need to use the SELECT statement to execute them and retrieve the results.



