CREATE TABLE Course (
    course_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    course_name VARCHAR(100) NOT NULL UNIQUE,
    duration    VARCHAR(30),
    fee         INTEGER
);

CREATE TABLE Student (
    student_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email        VARCHAR(100) UNIQUE,
    age          INTEGER,
    gender       VARCHAR(10),
    mark         INTEGER,
    courseid     INTEGER,
    FOREIGN KEY (courseid) REFERENCES Course(course_id)
);

INSERT INTO Course (course_name, duration, fee) VALUES
('Python','3 months',15000),
('Java','4 months',18000),
('Web Development','6 months',25000),
('Data Science','8 months',40000);

INSERT INTO Student (student_name, email, age, gender, mark, courseid) VALUES
('Arun','arun@example.com',20,'Male',92.5,1),
('Abin','abin@example.com',22,'Female',85,1),
('Paul','paul@example.com',24,'Male',78,1),
('Divya','divya@example.com',27,'Female',88.5,2);

--1
SELECT * FROM Student WHERE mark > 80 ORDER BY mark DESC;

--2
SELECT MAX(mark) , MIN(mark) , AVG(mark) FROM Student;

--3
SELECT student_name, mark FROM Student ORDER BY mark DESC;

--4
SELECT student_name, mark FROM Student WHERE age BETWEEN 18 AND 25 ORDER BY age;

--5
SELECT courseid, COUNT(*) AS total_students FROM Student GROUP BY courseid;

--6
SELECT courseid, COUNT(*) AS total_students FROM Student GROUP BY courseid HAVING COUNT(*) > 2;


--9
SELECT student_name, mark FROM Student WHERE mark > (SELECT AVG(mark) FROM Student);

