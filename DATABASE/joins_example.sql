
CREATE TABLE students(
    pk_student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100),
    gender VARCHAR(50)
);

CREATE TABLE marks(
    pk_mark_id SERIAL PRIMARY KEY,
    fk_student_id INT,
    marks INT,
    FOREIGN KEY(fk_student_id) REFERENCES students(pk_student_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO students VALUES(
    1,
    'Anjali',
    'Female'
);

INSERT INTO students VALUES(
    2,
    'Arun',
    'Male'
);

INSERT INTO students VALUES(
    3,
    'Ayisha',
    'Female'
);

UPDATE students SET gender= 'Female' WHERE pk_student_id = 1;

SELECT * FROM students;

INSERT INTO marks VALUES(
    1,
    1,
   30
);

INSERT INTO marks VALUES(
    2,
    1,
   40
);

INSERT INTO marks VALUES(
    3,
    1,
   45
);

INSERT INTO marks VALUES(
    4,
    2,
   45
);

INSERT INTO marks VALUES(
    5,
    2,
   35
);

SELECT * FROM marks;

SELECT * FROM students JOIN marks ON students.pk_student_id = marks.fk_student_id; 

SELECT * FROM students LEFT JOIN marks ON students.pk_student_id = marks.fk_student_id;

SELECT * FROM students RIGHT JOIN marks ON students.pk_student_id = marks.fk_student_id;

INSERT INTO marks VALUES(
    6,
    4,
   50
); 

-- cascade .. doesn't work

CREATE TABLE teachers(
    pk_teacher_id SERIAL PRIMARY KEY,
    teacher_name VARCHAR(100),
    phone VARCHAR(50)
);

INSERT INTO teachers VALUES(
    1,
    'Salini',
    '9895889624'
);

INSERT INTO teachers VALUES(
    2,
    'Ancy',
    '9896987524'
);

INSERT INTO teachers VALUES(
    3,
    'Jeena',
    '9896954789'
);

SELECT * FROM teachers;

SELECT * FROM teachers WHERE pk_teacher_id IN (SELECT pk_teacher_id FROM teachers WHERE teacher_name = 'Salini');

--  == single value, IN multiple value