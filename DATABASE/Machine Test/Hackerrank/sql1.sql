SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID ASC;

Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee 
table in alphabetical order.

SELECT name FROM Employee ORDER BY name;


Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.


SELECT name
FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id ASC;



Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
Write a query to print the respective hacker_id and name of hackers who achieved full scores for 
more than one challenge. Order your output in descending order by the total number of challenges 
in which the hacker earned a full score. If more than one hacker received full scores in same number 
of challenges, then sort them by ascending hacker_id.
