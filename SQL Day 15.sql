-- Constraint
-- constraint are basiclly rule which donot allowed invailid data entry

-- 1. NOT NULL

create database regexdb;
use regexdb;
create table test (id int);
insert into test values (10),(11),(10),(null);
select * from test;
create table test2 (id int not null);
insert into test2 values (10),(11),(10),(null); -- give error : id can't be null
insert into test2 values (10),(11),(10);
select * from test2;

-- 2. UNIQUE

create table test3 (id int unique);
insert into test3 values (10),(11),(null); -- give error : unique allow null value 
insert into test3 values (15),(12),(12); -- Error :  Duplicate entry '12' for key 'test3.id'
insert into test3 values (null); -- give error : unique allow null value 
select * from test3 ;

-- 3. Default
create table test4(id int, gender varchar(20));
insert into test4 (id) values (10),(11),(null); -- give error : unique allow null value 
select * from test4;

create table test5(id int, gender varchar(20) default 'male');
insert into test5 (id) values (10),(11),(null);
select * from test5;

-- 4. check
create table test6(id int check (id>5), gender varchar(20) default 'male');
insert into test6 (id) values (10),(3); -- Error : Check constraint 'test6_chk_1' is violated.
-- id should greater than 5
insert into test6 (id) values (10),(6);
select * from test6;

drop table test7;
create table test7(id int check (id>5), gender varchar(20) check (gender in ('male','Framle')));
insert into test7 (id) values (10),(6); -- Error : Check constraint 'test6_chk_1' is violated.
insert into test7 (id,gender) values (11,"Transgender"); -- Error Code: 1136. Column count doesn't match value count at row 1
select * from test7;

drop table test8;
create table test8(id int check (id>5), 
gender varchar(20)  check (gender in ('male','Framle')));
insert into test8 (id) values (10),(6); -- Error : Check constraint 'test6_chk_1' is violated.
insert into test8 (id,gender) values (11,"Transgender"); -- Error Code:Check constraint 'db_test8_gender_chk' is violated.
select * from test8;


create table test9(id int check (id>5), 
gender varchar(20),constraint db_test9_gender_chk check (gender in ('male','Framle')));
insert into test9 (id) values (10),(6); -- Error : Check constraint 'test6_chk_1' is violated.
insert into test9 (id,gender) values (11,"Transgender"); -- Error Code:Check constraint 'db_test8_gender_chk' is violated.
insert into test9 (id,gender) values (11,"Male"); 
select * from test9;

-- 5 PRIMARY KEY
CREATE TABLE test10(ID INT PRIMARY KEY, Gender VARCHAR(20) DEFAULT "Male");     -- Primary key works as Unique
INSERT INTO test10(ID) VALUES(10);
SELECT * FROM test10;

-- 6. Forign Key 
create table product(
pid int primary key,
pname varchar(20));
insert into product value(101,"iphone");
insert into product value(101,"ipad"); -- Error Code: 1062. Duplicate entry '101' for key 'product.PRIMARY'
insert into product value(102,"ipad");

select * from product;

create table orders(
orderid int primary key,
pid int,
price int);

insert into orders values
(1981,200,101),
(1982,250,102),
(1983,275,101),
(1984,500,108);

select * from orders;
-- with foreign key
drop table orders2;
CREATE TABLE orders2 (
    orderid INT PRIMARY KEY,
    price INT,
    pid INT,
    FOREIGN KEY (pid) REFERENCES product(pid)
);
insert into orders2 values
(1981,200,101),
(1982,250,102),
(1983,275,101),
(1984,500,108); -- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`regexdb`.`orders2`, CONSTRAINT `orders2_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`))


insert into orders2 values
(1981, 200, 101),
(1982, 250, 102),
(1983, 275, 101);

select * from orders2;
/*
table employee empid pk 
emp name 
email unique
department id reference fk
table dempartment
department id unique 
deparnmentnamecheck constroin biology or phiysics
also try insert null values
*/

-- -------------------------------
-- Create Department Table
-- -------------------------------
CREATE TABLE department (
    deptid INT NOT NULL,
    deptname VARCHAR(20) NOT NULL,
    CONSTRAINT regexdb_dept_deptid UNIQUE(deptid),
    CONSTRAINT regex_dept_deptname_chkk CHECK (deptname IN ('Biology', 'Physics')),
    PRIMARY KEY (deptid)
);

-- Verify table
SELECT * FROM department;

-- -------------------------------
-- Create Employee Table
-- -------------------------------
CREATE TABLE employee (
    empid INT NOT NULL,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    deptid INT,
    CONSTRAINT regex_emp_deptid FOREIGN KEY (deptid) REFERENCES department(deptid),
    PRIMARY KEY (empid)
);

-- Verify table
SELECT * FROM employee;

-- -------------------------------
-- Test inserting values
-- -------------------------------
-- Insert valid departments
INSERT INTO department (deptid, deptname) VALUES (1, 'Biology');
INSERT INTO department (deptid, deptname) VALUES (2, 'Physics');

-- Try invalid department (should fail due to CHECK)
-- INSERT INTO department (deptid, deptname) VALUES (3, 'Math');

-- Insert employees
INSERT INTO employee (empid, emp_name, email, deptid) VALUES (101, 'Alice', 'alice@example.com', 1);
INSERT INTO employee (empid, emp_name, email, deptid) VALUES (102, 'Bob', 'bob@example.com', 2);

-- Insert NULL email (allowed)
INSERT INTO employee (empid, emp_name, deptid) VALUES (103, 'Charlie', 1);

-- Insert employee with NULL deptid (allowed)
INSERT INTO employee (empid, emp_name, email) VALUES (104, 'David', 'david@example.com');
