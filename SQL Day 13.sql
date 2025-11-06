create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);

select * 
from employees;
select * 
from departments;
-- correlated sub query is type of subquery that is depend and excuted based on outer query

select salary 
from employees 
where empname = "Bob";

select empname,salary 
from employees 
where salary < (select salary 
from employees 
where empname = "Bob");

-- correlated subquert
-- get the name of emplyee who have salry grater then avg(salary) as of employee
select DeptId, round(avg(salary))
from employees
group by DeptId;

select e_outer.empid,e_outer.empname,e_outer.salary,e_outer.deptid
from employees as e_outer
where e_outer.salary >
(select avg(e_inter.salary)
from employees as e_inter
where e_inter.DeptId=e_outer.deptid);


-- ************************************************************
-- correlated more
drop database regex;
create database regex;
use regex;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

select * from Students;
select *  from Courses;

--   last table

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);

select * from Students;
select *  from Courses;
select *  from enrollments;

-- find the name of student who have got higer grades than the average grades of all the student in the same course
-- name of student ==> student table
-- grades of student
-- same course 

select s_outer.StudentName,e_outer.grade
from students as s_outer
join enrollments as e_outer
on s_outer.studentid = e_outer.studentid
where e_outer.grade > 
(select avg(e_inner.grade)
from enrollments as e_inner
where e_inner.courseid = e_outer.courseid);

select courseid, avg(e_inner.grade)
from enrollments as e_inner
group by e_inner.courseid;