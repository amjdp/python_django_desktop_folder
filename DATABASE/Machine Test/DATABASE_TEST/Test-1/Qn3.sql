-- Using the table called journey and the sample data given below, write a query to display the  
-- following result. 
-- You can assume that the descr column always contains a hyphen between the start  and end point and 
-- that the distance column always ends with either “mi” or “km”, giving the  distance in either miles or 
-- kilometers. In your answer, multiply the miles by 1.609 to convert the  miles to km for the distance_km 
-- column. 

-- journey_start journey_end distance_km  
-- --------------- -------------- ------------ 
-- London Paris 342.000 
-- New York Los Angeles 3934.005 
-- New York Washington 326.627 
-- Paris Rome 1106.000 

-- CREATE TABLE journey (descr VARCHAR(100) PRIMARY KEY, distance VARCHAR(7) NOT NULL); 

-- INSERT INTO journey (descr, distance) 
-- VALUES 
-- ('London-Paris','342km') 
-- ,('New York-Los Angeles','2445mi') 
-- ,('New York-Washington','203mi') 
-- ,('Paris-Rome',' 1106km');



-- SOLUTION 

-- Assuming the journey table has the following structure:
CREATE TABLE journey (
  descr VARCHAR(100) PRIMARY KEY,
  distance VARCHAR(7) NOT NULL
);

-- And the sample data is inserted into the journey table:
INSERT INTO journey (descr, distance)
VALUES
  ('London-Paris', '342km'),
  ('New York-Los Angeles', '2445mi'),
  ('New York-Washington', '203mi'),
  ('Paris-Rome', '1106km');

          descr         | distance
----------------------+----------
 London-Paris         | 342km
 New York-Los Angeles | 2445mi
 New York-Washington  | 203mi
 Paris-Rome           | 1106km
(4 rows)


SELECT
  TRIM(SPLIT_PART(descr, '-', 1)) AS journey_start,
  TRIM(SPLIT_PART(descr, '-', 2)) AS journey_end,
  CASE
    WHEN distance LIKE '%mi' THEN CAST(SUBSTRING(distance, 1, LENGTH(distance) - 2) AS DECIMAL(10, 3)) * 1.609
    WHEN distance LIKE '%km' THEN CAST(SUBSTRING(distance, 1, LENGTH(distance) - 2) AS DECIMAL(10, 3))
  END AS distance_km
FROM journey;

 journey_start | journey_end | distance_km
---------------+-------------+-------------
 London        | Paris       |     342.000
 New York      | Los Angeles | 3934.005000
 New York      | Washington  |  326.627000
 Paris         | Rome        |    1106.000
(4 rows)


-- In this query, SPLIT_PART is used to split the descr column based on the hyphen. 
-- The TRIM function is applied to remove any leading or trailing spaces in the resulting values. 
-- Additionally, the SUBSTRING function is used to extract the numeric part of the distance column, 
-- and the distances are converted to kilometers as required.