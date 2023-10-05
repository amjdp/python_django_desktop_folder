-- Using the programmer and skill tables and the sample data given below, write a query to return the  count of the number of people at each location who have the skill C++ with a rating of 7 or more.  The result should be: 
-- location num 
-- -------------------- ----------- 
-- Dublin 0 
-- London 2 
-- New York 1 

CREATE TABLE programmer (employee_name VARCHAR(20) NOT NULL PRIMARY KEY, location VARCHAR(20)  NOT NULL); 

CREATE TABLE skill (employee_name VARCHAR(20) NOT NULL, language VARCHAR(20) NOT NULL, rating  INT NOT NULL, PRIMARY KEY (employee_name, language)); 

INSERT INTO programmer (employee_name, location)
VALUES 
('Alan','London') 
,('Belinda','New York') 
,('Chuck','New York') 
,('Diana','London') 
,('Ed','New York') 
,('Frank','London') 
,('Gail','Dublin'); 

INSERT INTO skill (employee_name, language, rating) 
VALUES 
('Alan','C++',9) 
,('Alan','Java',6) 
,('Belinda','Java',10) 
,('Belinda','Python',8) 
,('Chuck','C++',7) 
,('Diana','Python',10) 
,('Diana','Java',5) 
,('Ed','Java',8) 
,('Frank','C++',9) 
,('Frank','Python',6) 
,('Gail','Java',6);

database_test=# SELECT * FROM programmer;
 employee_name | location
---------------+----------
 Alan          | London
 Belinda       | New York
 Chuck         | New York
 Diana         | London
 Ed            | New York
 Frank         | London
 Gail          | Dublin
(7 rows)


database_test=# SELECT * FROM skill;
 employee_name | language | rating
---------------+----------+--------
 Alan          | C++      |      9
 Alan          | Java     |      6
 Belinda       | Java     |     10
 Belinda       | Python   |      8
 Chuck         | C++      |      7
 Diana         | Python   |     10
 Diana         | Java     |      5
 Ed            | Java     |      8
 Frank         | C++      |      9
 Frank         | Python   |      6
 Gail          | Java     |      6
(11 rows)

-- Result 

SELECT p.location, COUNT(*) AS num
FROM programmer p
JOIN skill s ON p.employee_name = s.employee_name
WHERE s.language = 'C++' AND s.rating >= 7
GROUP BY p.location;

 location | num
----------+-----
 London   |   2
 New York |   1
(2 rows)