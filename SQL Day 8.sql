/*

*/
use regex123;

select *
from product;

select *
from orders;

-- update table orders set productid 101 where orderid = 995

select p.pid,p.pname,o.city
from product as p
join orders as o 
where p.pid = o.productid ;

-- new way write inner join
select p.pid,p.pname,o.city
from product as p
inner join orders as o 
on p.pid = o.productid and city = "jaipur";
-- where and on is same on is way to give condition in join

select p.pid,p.pname,o.city,o.productid
from product as p
left join orders as o 
on p.pid = o.productid ;
-- left table ki sare value dega

select p.pid,p.pname,o.city,o.productid
from  orders as o
left join product as p  
on p.pid = o.productid ;

select p.pid,p.pname,o.city,o.productid
from  orders as o
right join product as p  
on p.pid = o.productid ;

use sakila;
select *
from actor;

desc actor;

select *
from film_actor;
desc film_actor; 

select * 
from film;
desc film;

select a.actor_id,a.first_name,fa.actor_id,fa.film_id
from actor as a
join film_actor as fa 
on a.actor_id = fa.actor_id and a.actor_id = 1;

select a.actor_id,a.first_name,fa.actor_id,fa.film_id
from actor as a
join film_actor as fa 
on a.actor_id = fa.actor_id and a.actor_id = 1;

select a.actor_id,a.first_name,fa.actor_id,fa.film_id,f.title
from actor as a
join film_actor as fa 
on a.actor_id = fa.actor_id and a.actor_id = 1
join film as f
on fa.film_id = f.film_id;

-- new table 

drop database regex123;
create database regex123;

use regex123;
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);


INSERT INTO Student (StudentID, StudentName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eva'),
(6, 'Frank'),
(7, 'Grace'),
(8, 'Helen'),
(9, 'Ian'),
(10, 'Jack');


INSERT INTO Enrollment (EnrollmentID, StudentID, CourseName) VALUES
(101, 1, 'Math'),
(102, 2, 'Physics'),
(103, 3, 'Chemistry'),
(104, 1, 'English'),
(105, 5, 'Biology'),
(106, 7, 'History'),
(107, 10, 'Math');

select * 
from enrollment;

select s.studentid,s.studentname,e.enrollmentid
from student as s
inner join enrollment as e
on s.studentid = e.studentid; 

select s.studentid,s.studentname,e.coursename
from student as s
inner join enrollment as e
on s.studentid = e.studentid; 

select s.studentname
from student as s
inner join enrollment as e
on s.studentid = e.studentid; 

select s.studentid,  s.studentname,e.enrollmentid
from student as s
left join enrollment as e
on s.studentid = e.studentid  
where e.enrollmentid is null; 

select s.studentname,count(e.coursename), min(s.studentid) 
from student as s
left join enrollment as e
on s.studentid = e.studentid  
group by s.studentname; 

select e.coursename, count(s.studentid) 
from student as s
inner join enrollment as e
on s.studentid = e.studentid  
group by e.coursename; 
