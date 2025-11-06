/*
operator
function : 
	1. Scaler Function : string,date,numaric
Group By : operation perform same set of row
	sum, avg,count
 ==> where and having
Noemlaization : 
	1NF 
    2NF ==> partial dependacy (non key attribute on key value)
			Eg : 1. a Math 50
				 1. a Eng 60
Table 1				Table 2
 1.  a				1.  Math 50
					1.  Eng  60

Inner Join : inner join is type of join that join on based on common values
inner join on
inner join using ==> if both table same coulmn

left join

right join

natural join 
cartesion / cross join

self join --> when join a table with itself
 empid  name  mangerid

table1 join table2 join table3
where table1.conition = table2.conition and table2.conition = table3.conition

table join table2 
on 
table2 join table3
on cond
==================================================================
subquery
single row query if inner query return 1 column >,<,<=,>=

multi row subquery
in  ,  =any
>any, <any
>all , <all

-- ==========================================
-- Example: EXISTS vs IN in SQL
-- ==========================================

-- 1. Create sample tables
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 2. Insert sample data
INSERT INTO Customers (customer_id, customer_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

INSERT INTO Orders (order_id, customer_id, order_amount) VALUES
(101, 1, 250.00),
(102, 2, 150.00),
(103, 1, 300.00),
(104, 3, 200.00);

-- ==========================================
-- 3. Using EXISTS
-- Returns customers who have at least one order
-- ==========================================
SELECT *
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);

-- ==========================================
-- 4. Using IN
-- Returns customers who have at least one order
-- ==========================================
SELECT *
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
);

-- ==========================================
-- 5. Using IN with NULL in subquery (to show difference)
-- Adding a customer_id = NULL in Orders
-- ==========================================
INSERT INTO Orders (order_id, customer_id, order_amount) VALUES
(105, NULL, 500.00);

-- Using IN (might give unexpected results with NULL)
SELECT *
FROM Customers
WHERE customer_id IN (
    SELECT
=====================================================================================================
single row and multiple row subquery independent ,subquery exquted at first 
subquery run at one time and results are compare with out query

correlated : inner query depend on oueter query

correlated subquery subquery dependent on outer query 
Hint 
Emp_id Ename,deptid,deptname,salary 

constrain :
	1. not null
	2. unique
	3. defalult
	4. check 
	5. Primary Key
	6. Foreign Key
 

*/
/*
Data Types :
	1. numeric ==> tinyint,smallint,mediumint,int,bigint
			tinyint = -128 to 127 (1byte) 2**8
            smallint = 2 ** 16 (2byte)
            mediumint = 2**24   3
            int                 4
            bigint    = 2**64   8
    2. float and double ==> store decimal
			float ==> sepecific some number 4 byte
            double ==> 8byte
	3. String : 
		Char : fixed length of character, trancate all the white spases from last 
        and varchar : 
        
*/
use regexdb;
create table tushar1(id tinyint); # id tinyint "unsigned" use keyword ignor negative  
insert into tushar1 values (127);
create table tushar2(id float, id2 double);
insert into tushar2 values(10.2565348,1012258545555); 
select * from tushar2;

create table tushar3(id2 double(5,2));
insert into tushar3 values(10.2565348); 
insert into tushar3 values(101.2565348); 
insert into tushar3 values(10145.2565348);  -- Error Code: 1264. Out of range value for column 'id2' at row 1
select * from tushar3;

create table tushar4(Ename char(5));
insert into tushar4 values('abc'); 
insert into tushar4 values('abcgf'); 
insert into tushar4 values('abc g'); 
insert into tushar4 values('abc gf'); -- Error Code: 1406. Data too long for column 'Ename' at row 1
insert into tushar4 values('abcgsjkkhd');  -- Error Code: 1406. Data too long for column 'Ename' at row 1
insert into tushar4 values('abc                   '); 
select Ename, char_length(Ename) from tushar4;

create table tushar5(Ename varchar(5));
insert into tushar5 values('abc'); 
insert into tushar5 values('abcgf'); 
insert into tushar5 values('abc g');
insert into tushar5 values('abc         '); 
insert into tushar5 values('abc gf'); -- Error Code: 1406. Data too long for column 'Ename' at row 1
insert into tushar5 values('abcgsjkkhd');  -- Error Code: 1406. Data too long for column 'Ename' at row 1
select Ename, char_length(Ename) from tushar5;

CREATE TABLE Employee_Dates (
    birth_date DATE
);
insert into employee_dates values('1998-04-22');
insert into employee_dates values('2025-04-22');
select * from Employee_Dates;

-- date and timestamp

/*
how to store image and pdf file into sql database
*/