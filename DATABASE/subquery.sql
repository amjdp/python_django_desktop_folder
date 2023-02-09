CREATE DATABASE query_sample;

\c query_sample
You are now connected to database "query_sample" as user "postgres".

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    email VARCHAR(200),
    phone_number VARCHAR(100),
    hire_date DATE,
    job_id INT,
    salary FLOAT,
    manager_id INT,
    department_id INT
);