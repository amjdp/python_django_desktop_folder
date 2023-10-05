CREATE [OR REPLACE] PROCEDURE procedure_name
(argument_mode(IN/OUT) Parameters data type,......)
LANGUAGE 'plpgsql' --in case of postgresql
AS
$$
BEGIN
    -- SQL statements to be executed
END;
$$;

CALL procedure_name(parameter_value); --calling a procedure


-- -----------------------------------------------------------

CREATE TABLE employees(
    pk_emp_id SERIAL PRIMARY KEY,
    type VARCHAR(100),
    first_name VARCHAR(200), 
    last_name VARCHAR(200),
    email VARCHAR(200),
    phone VARCHAR(100),
    gender VARCHAR(20),
    dob DATE
);


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



-- CREATE OR REPLACE PROCEDURE update_emp(
--     IN pk_emp_id numeric,
--     IN names numeric
-- )
-- LANGUAGE 'plpgsql' --in case of postgresql
-- AS
-- $$
-- BEGIN
--     UPDATE employee
--     SET  = emp_salary
--     WHERE id = emp_id;
-- END;
-- $$;





-- ******************************************************************************

-- Insert Student Procedure:

-- This stored procedure allows you to insert a new student into the "student" table.

CREATE OR REPLACE PROCEDURE insert_student(
    IN student_name VARCHAR(50),
    IN class VARCHAR(10),
    IN section VARCHAR(10)
)
LANGUAGE SQL
AS $$
INSERT INTO student (student_name, class, section)
VALUES (student_name, class, section);
$$;

CALL insert_student('John', '12', 'A');

-- ******************************************************************************
-- Update Student Grade Procedure:

-- This stored procedure allows you to update a student's grade for a specific subject in the "student_grade" table.

-- CREATE OR REPLACE PROCEDURE update_student_grade(
--     IN student_id INT,
--     IN subject VARCHAR(50),
--     IN new_grade VARCHAR(2)
-- )
-- LANGUAGE SQL
-- AS $$
-- UPDATE student_grade
-- SET grade = new_grade
-- WHERE student_id = student_id AND subject = subject;
-- $$;

-- CALL update_student_grade(1, 'Chemistry', 'A');


CREATE OR REPLACE PROCEDURE up_st_grade(
    IN p_student_id INT,
    IN p_subject VARCHAR(50),
    IN p_new_grade VARCHAR(2)
)
LANGUAGE SQL
AS $$
UPDATE student_grade sg
SET sg.grade = p_new_grade
WHERE sg.student_id = p_student_id AND sg.subject = p_subject
ORDER BY sg.id;
$$;

CALL up_student_grade(1, 'Chemistry', 'A');
CALL up_student_grade(3, 'Chemistry', 'A');
CALL up_student_grade(3, 'Physics', 'A');
CALL up_student_grade(3, 'Biology', 'A');
CALL up_student_grade(5, 'Biology', 'A');
CALL up_student_grade(7, 'Physics', 'A');
CALL up_student_grade(7, 'Biology', 'A');
CALL up_student_grade(8, 'Biology', 'A');
CALL up_student_grade(10, 'Physics', 'A');

CALL up_student_grade(1, 'Physics', 'B');
CALL up_student_grade(2, 'Chemistry', 'B');
CALL up_student_grade(4, 'Chemistry', 'B');
CALL up_student_grade(4, 'Biology', 'B');
CALL up_student_grade(6, 'Chemistry', 'B');
CALL up_student_grade(6, 'Physics', 'B');
CALL up_student_grade(6, 'Biology', 'B');
CALL up_student_grade(8, 'Physics', 'B');
CALL up_student_grade(10, 'Biology', 'B');

CALL up_student_grade(2, 'Biology', 'C');
CALL up_student_grade(5, 'Chemistry', 'C');
CALL up_student_grade(7, 'Chemistry', 'C');
CALL up_student_grade(9, 'Chemistry', 'C');
CALL up_student_grade(9, 'Physics', 'C');

CALL up_student_grade(1, 'Biology', 'F');
CALL up_student_grade(2, 'Physics', 'F');
CALL up_student_grade(4, 'Physics', 'F');
CALL up_student_grade(5, 'Physics', 'F');
CALL up_student_grade(8, 'Chemistry', 'F');
CALL up_student_grade(9, 'Biology', 'F');
CALL up_student_grade(10, 'Chemistry', 'F');


-- CREATE OR REPLACE PROCEDURE up_st_grade(
--     IN p_student_id INT,
--     IN p_subject VARCHAR(50),
--     IN p_new_grade VARCHAR(2)
-- )
-- LANGUAGE SQL
-- AS $$
-- BEGIN
--     UPDATE student_grade sg
--     SET sg.grade = p_new_grade
--     WHERE sg.student_id = p_student_id AND sg.subject = p_subject;
    
--     SELECT *
--     FROM student_grade
--     WHERE student_id = p_student_id AND subject = p_subject
--     ORDER BY id;
-- END;
-- $$;


-- CREATE OR REPLACE PROCEDURE up_st_grade(
--     IN p_student_id INT,
--     IN p_subject VARCHAR(50),
--     IN p_new_grade VARCHAR(2)
-- )
-- LANGUAGE SQL
-- AS $$
-- BEGIN
--     -- Start a transaction
--     START TRANSACTION;

--     -- Update the grade for the specified student and subject
--     UPDATE student_grade sg
--     SET sg.grade = p_new_grade
--     WHERE sg.student_id = p_student_id AND sg.subject = p_subject;

--     -- Now, select the updated rows in the desired order
--     SELECT *
--     FROM student_grade
--     WHERE student_id = p_student_id AND subject = p_subject
--     ORDER BY id;

--     -- Commit the transaction
--     COMMIT;
-- END;
-- $$;







-- ******************************************************************************

-- Retrieve Student Grades Procedure:

-- This stored procedure retrieves a student's grades for all subjects from the "student_grade" table.

-- CREATE OR REPLACE PROCEDURE get_student_grades(
--     IN student_id INT
-- )
-- LANGUAGE SQL
-- AS $$
-- SELECT subject, grade
-- FROM student_grade
-- WHERE student_id = student_id;
-- $$;

-- CALL get_student_grades(1);

DROP PROCEDURE [IF EXISTS] procedure_name;

DROP PROCEDURE IF EXISTS get_student_grades;

SELECT proname
FROM pg_proc
WHERE pronamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public');

In this query:

pg_proc is a system catalog table that contains information about stored procedures and functions.
proname is the name of the stored procedure.
pg_namespace is a system catalog table that contains information about database schemas.
nspname is the name of the schema where your procedures are located. You can replace 'public' 
with the name of the schema where your procedures are stored.
When you run this query in your SQL shell, it will display a list of stored procedure names that are located 
in the specified schema. If your procedures are in a different schema, replace 'public' with the appropriate schema name.


-- ******************************************************************************

CREATE OR REPLACE PROCEDURE insert_employee(
    IN emp_type VARCHAR(100),
    IN emp_first_name VARCHAR(200),
    IN emp_last_name VARCHAR(200),
    IN emp_email VARCHAR(200),
    IN emp_phone VARCHAR(100),
    IN emp_gender VARCHAR(20),
    IN emp_dob DATE,
    IN emp_location VARCHAR(100)
)
LANGUAGE SQL
AS $$
INSERT INTO employees (type, first_name, last_name, email, phone, gender, dob, location)
VALUES (emp_type, emp_first_name, emp_last_name, emp_email, emp_phone, emp_gender, emp_dob, emp_location);
$$;

CALL insert_employee(
    'Manager',
    'John',
    'Doe',
    'johndoe@gmail.com',
    '9876543210',
    'Male',
    '1980-01-15',
    'New York'
);


-- ******************************************************************************

CREATE OR REPLACE PROCEDURE update_employee_email(
    IN emp_id INT,
    IN new_email VARCHAR(200)
)
LANGUAGE SQL
AS $$
UPDATE employees
SET email = new_email
WHERE pk_emp_id = emp_id;
$$;

CALL update_employee_email(3, 'newemail@example.com');

-- ******************************************************************************

CREATE OR REPLACE PROCEDURE get_employees_by_type(
    IN emp_type VARCHAR(100)
)
LANGUAGE SQL
AS $$
SELECT *
FROM employees
WHERE type = emp_type;
$$;

CALL get_employees_by_type('Salesman');

-- ******************************************************************************

ALTER TABLE employees ADD COLUMN salary FLOAT;

-- Update Employee Salary Procedure:

-- This stored procedure allows you to update an employee's salary based on their primary key (pk_emp_id).

CREATE OR REPLACE PROCEDURE update_employee_salary(
    IN emp_id INT,
    IN new_salary FLOAT
)
LANGUAGE SQL
AS $$
UPDATE employees
SET salary = new_salary
WHERE pk_emp_id = emp_id;
$$;

CALL update_employee_salary(3, 50000.00);

-- ******************************************************************************************************

-- Retrieve Employees by Salary Range Procedure:

-- This stored procedure retrieves employees whose salaries fall within a specified range.

CREATE OR REPLACE PROCEDURE get_employees_by_salary_range(
    IN min_salary FLOAT,
    IN max_salary FLOAT
)
LANGUAGE SQL
AS $$
SELECT *
FROM employees
WHERE salary BETWEEN min_salary AND max_salary;
$$;

CALL get_employees_by_salary_range(40000.00, 60000.00);

-- ******************************************************************************************************

-- Calculate Average Salary Procedure:

-- This stored procedure calculates the average salary of all employees.

CREATE OR REPLACE PROCEDURE calculate_average_salary()
LANGUAGE SQL
AS $$
DECLARE
    avg_salary FLOAT;
BEGIN
    SELECT AVG(salary) INTO avg_salary FROM employees;
    -- You can perform further actions with avg_salary here or simply return it.
    RAISE NOTICE 'Average Salary: %', avg_salary;
END;
$$;

CALL calculate_average_salary();

-- ******************************************************************************************************