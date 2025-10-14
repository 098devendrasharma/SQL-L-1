create database tushardb;
use tushardb;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50),
    EnrollmentYear INT
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50),
    Credits INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);



-- Students Table
INSERT INTO Students VALUES
(1, 'Aditi Sharma', 'Computer Science', 2022),
(2, 'Rohan Patel', 'Mechanical', 2023),
(3, 'Sara Khan', 'Computer Science', 2022),
(4, 'Michael Brown', 'Civil', 2023),
(5, 'Neha Gupta', 'Mechanical', 2024),
(6, 'David Miller', 'Civil', 2022),
(7, 'Priya Verma', 'Computer Science', 2023);

-- Courses Table
INSERT INTO Courses VALUES
(101, 'Data Structures', 'Computer Science', 4),
(102, 'Thermodynamics', 'Mechanical', 3),
(103, 'Fluid Mechanics', 'Civil', 4),
(104, 'DBMS', 'Computer Science', 3),
(105, 'Machine Design', 'Mechanical', 4),
(106, 'Structural Analysis', 'Civil', 3),
(107, 'Operating Systems', 'Computer Science', 4);

-- Enrollments Table
INSERT INTO Enrollments VALUES
(1, 1, 101, '2025-01-10'),
(2, 1, 104, '2025-01-12'),
(3, 2, 102, '2025-01-11'),
(4, 2, 105, '2025-01-15'),
(5, 3, 101, '2025-01-13'),
(6, 3, 107, '2025-01-17'),
(7, 4, 103, '2025-01-16'),
(8, 5, 102, '2025-01-18'),
(9, 6, 103, '2025-01-19'),
(10, 7, 104, '2025-01-20'),
(11, 7, 107, '2025-01-21');

/*
student-->,StudentName ,Department , |StudentID(PK)  |,EnrollmentYear 
courses --> CourseName ,Department , |  			 |	Credits, |CourseID(PK)|
enrollement -->EnrollmentID(PK) ,    |StudentID(FK), |           |CourseID(FK)| ,EnrollmentDate,

*/
-- 1
SELECT 
    department, COUNT(studentid) AS total_students
FROM
    students
GROUP BY department
ORDER BY department;

-- 2
SELECT 
    department, COUNT(courseid) AS total_courses
FROM
    courses
GROUP BY department
ORDER BY department;

-- 3
SELECT 
    c.coursename, COUNT(e.EnrollmentID)
FROM
    courses AS c
        LEFT JOIN
    Enrollments AS e ON c.courseid = e.courseid
GROUP BY c.coursename;  

-- 4
SELECT 
    s.studentname, c.coursename
FROM
    students AS s
        INNER JOIN
    Enrollments AS e
        INNER JOIN
    courses AS c ON e.studentid = s.studentid
        AND c.courseid = e.courseid;

-- 5
SELECT 
    c.coursename, s.studentname
FROM
    students AS s
        INNER JOIN
    Enrollments AS e
        INNER JOIN
    courses AS c ON e.studentid = s.studentid
        AND c.courseid = e.courseid
ORDER BY c.coursename; 

-- 6
SELECT 
    s.studentname, c.coursename
FROM
    students AS s
        LEFT JOIN
    Enrollments AS e ON e.studentid = s.studentid
        LEFT JOIN
    courses AS c ON c.courseid = e.courseid; 

-- 7
SELECT 
    s.studentname, c.coursename
FROM
    courses AS c
        LEFT JOIN
    Enrollments AS e ON c.courseid = e.courseid
        LEFT JOIN
    students AS s ON e.studentid = s.studentid; 

-- 8
SELECT 
    c.coursename, COUNT(s.studentid) AS TotalStudent
FROM
    courses AS c
        LEFT JOIN
    Enrollments AS e ON c.courseid = e.courseid
        LEFT JOIN
    students AS s ON e.studentid = s.studentid
GROUP BY c.coursename
ORDER BY TotalStudent DESC; 


-- 9
SELECT 
    s.studentname, SUM(c.credits) AS TotalCredit
FROM
    students AS s
        JOIN
    Enrollments AS e ON e.studentid = s.studentid
        JOIN
    courses AS c ON c.courseid = e.courseid
GROUP BY s.studentname; 

-- 10
SELECT 
    c.department,
    c.coursename,
    COUNT(e.studentid) AS TotalStudent
FROM
    students AS s
        Inner JOIN
    Enrollments AS e ON e.studentid = s.studentid
        Inner JOIN
    courses AS c ON c.courseid = e.courseid
GROUP BY c.department , c.coursename
ORDER BY c.department; 

/* 
department			coursename			TotalStudent
Civil				Fluid Mechanics			2
Computer Science	Data Structures			2
Computer Science	DBMS					2
Computer Science	Operating Systems		2
Mechanical			Machine Design			1
Mechanical			Thermodynamics			2
*/
use sakila;
select first_name + " " + last_name
from actor;