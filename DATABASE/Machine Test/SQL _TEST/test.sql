


-- SELECT name, to_char("dob", 'DD-Mon-YYYY') FROM tbl_student;


-- SELECT TO_CHAR(
--     TO_DATE (12::text, 'MM'), 'Mon'
--     ) AS "Month Name";

--  select to_char("created_at", 'DD/bb/YYYY') from image;

-- SELECT name, DATE_FORMAT("dob", "%Y") FROM tbl_student;

-- SELECT DATE_FORMAT(dob, "%e-%b-%Y") FROM tbl_student;  



-- DATE_FORMAT(date, format)

-- Format	Description
-- %a	Abbreviated weekday name (Sun to Sat)
-- %b	Abbreviated month name (Jan to Dec)
-- %c	Numeric month name (0 to 12)
-- %D	Day of the month as a numeric value, followed by suffix (1st, 2nd, 3rd, ...)
-- %d	Day of the month as a numeric value (01 to 31)
-- %e	Day of the month as a numeric value (0 to 31)
-- %f	Microseconds (000000 to 999999)
-- %H	Hour (00 to 23)
-- %h	Hour (00 to 12)
-- %I	Hour (00 to 12)
-- %i	Minutes (00 to 59)
-- %j	Day of the year (001 to 366)
-- %k	Hour (0 to 23)
-- %l	Hour (1 to 12)
-- %M	Month name in full (January to December)
-- %m	Month name as a numeric value (00 to 12)
-- %p	AM or PM
-- %r	Time in 12 hour AM or PM format (hh:mm:ss AM/PM)
-- %S	Seconds (00 to 59)
-- %s	Seconds (00 to 59)
-- %T	Time in 24 hour format (hh:mm:ss)
-- %U	Week where Sunday is the first day of the week (00 to 53)
-- %u	Week where Monday is the first day of the week (00 to 53)
-- %V	Week where Sunday is the first day of the week (01 to 53). Used with %X
-- %v	Week where Monday is the first day of the week (01 to 53). Used with %x
-- %W	Weekday name in full (Sunday to Saturday)
-- %w	Day of the week where Sunday=0 and Saturday=6
-- %X	Year for the week where Sunday is the first day of the week. Used with %V
-- %x	Year for the week where Monday is the first day of the week. Used with %v
-- %Y	Year as a numeric, 4-digit value
-- %y	Year as a numeric, 2-digit value








create table mtest;


CREATE TABLE stock
(item INTEGER NOT NULL
,dt DATE NOT NULL
,qty INTEGER NOT NULL
,PRIMARY KEY (item, dt));



INSERT INTO stock (item, dt, qty)
VALUES
(1001,'2019-11-11',340)
,(1002,'2019-11-23',120)
,(1002,'2019-12-20',201)
,(1002,'2019-12-16',402)
,(1001,'2020-01-19',890)
,(1001,'2020-02-12',340)
,(1001,'2020-02-27',101)
,(1001,'2020-02-29',391)
,(1002,'2020-03-11',172)
,(1002,'2020-04-21',150);


select item, sum(qty) as qty, DATE_PART('month',dt) AS month,DATE_PART('year',dt) AS year, 
          rank() over (PARTITION BY item  order by sum(qty) desc ,DATE_PART('month',dt)) rank  
from stock 
group by DATE_PART('month',dt),DATE_PART('year',dt),item 
order by item,rank;


     
select dt ,qty from stock where qty = (select max(qty) from stock);


select dt ,qty from stock 
order by  qty desc limit 1 offset 1;