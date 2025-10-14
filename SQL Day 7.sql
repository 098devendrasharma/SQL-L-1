/*
courseid		coursename		price
	1			math			90
    2			math			100
primary key unique identifier we identity each row in a table --> unique and it can't be null
**********************************************************************************************
Super Key:
courseid		coursename		price
	1			math			90
    2			science			100
	89 			science 		6000
courseid + course name
**********************************************************************************************
Candidate id : minimal superkey
courseid		coursename		price
	1			math			90
    2			science			100
candidate key can be null
*/
-- *****************************************************************************************************************
/* 	Normaliztion in SQL : it is technique to organize your data in database to reduce data redandency and data integrity.
						   we try to convert large table into smaller tabels
To achive normalization we have multiple way : 
	1. 1NF : atomic values (there is no multiple value) 
	Example :
		StudentId		Name		Course
        1				Raj			Math,Science
        2				Anita		English, Math
        *****************************************
        Problem Course has multiple value
	************** After 1NF ************************** 
		StudentID		Name		Course
			1			Raj			Math
            1			Raj			Science
            2			Anita		English
            2			Anita 		Math
   *****************************************************
   2. 2NF : 
	Table should be 1NF
    We should remove partial dependency (non key attribute shuld not depend on key attribute)
courseid		coursename		price
	1			math			90
    1			science			100
	89 			science 		6000
courseid + coursename => primary key (Combination of 2 column)
price ==> non key attribute
price depend on course id
price is partially dependent on primary key attributes --> non key attribute
	************** After 1NF ************************** 
		StudentID		Name		Course
			1			Raj			Math
            1			Raj			Science
            2			Anita		English
            2			Anita 		Math
   *****************************************************
studetid + course = primary key or composite key 
name ==> non key attribute
name depend on student name
name is partially dependent on student id
************** After 1NF ************************** 
		StudentID		Name		Course
			1			Raj			Math
            1			Raj			Science
            2			Anita		English
            2			Anita 		Math
*****************************************************
						**************** After 2NF ***************************
		First Table : Student Table			|			Second Table : StudentCourse Table
	StudentID			StudentName			|		StudentID			Course
    1						Raj				|			1				Math
    2						Anita			|			1				Science
											|			2				English
											|			2				Math
		StudentName ==> Non Key attribute	|
        Student ID ==> Primary Key			|			StudentId + course ==> primary key
											|			StudentID ==> Forign Key : is set relationship 
                                            |	multiple Forign key in a table , forign key create relationship with another table
                                            |	based on the primary key or unique from 
                        In Both Table common element is 'StudentID'
									one to many relationship
*/
-- **********************************************************************************************************************
drop database regex123;
create database  regex123;
use regex123;
create table product(pid  int,  pname  varchar(20), price int);
insert into product values(100,'iphone',4000), (101,'mi tv', 3000),
(102,'fridge',5000), (103,'cover',500);


create table orders( orderid int, city varchar(20), productid int);
insert into orders values(994,'jaipur', 100),(995,'goa',102), (996,'J&K', 100), (997,'japan',102),
(998,'bhutan', 110);


/*
Inner Join is type of join where we combine one or more table based on same column values
*/
select * 
from product;
select * 
from orders; -- productid is forign key

-- find product id and city and product name

select prd.pid,prd.pname
from product as prd; 
/*
	product Table
	pid		pname
	100		iphone
	101		mi tv
	102		fridge
	103		cover
    pid is primary key
*/

select od.productid,od.city
from orders as od;
/*
productid		city
	100			jaipur
	102			goa
	100			J&K
	102			japan
	110			bhutan
	100			jaipur
	102			goa
	100			J&K
	102			japan
	110			bhutan
*/
select prd.pid,prd.pname,od.productid,od.city
from product as prd join orders as od
where prd.pid = od.productid;  
/*
pid		pname	 productid	city
100		iphone		100		jaipur
102		fridge		102		goa
100		iphone		100		J&K
102		fridge		102		japan
100		iphone		100		jaipur
102		fridge		102		goa
100		iphone		100		J&K
102		fridge		102		japan
*/
select prd.pid,prd.pname,od.city
from product as prd 
join orders as od
where prd.pid = od.productid;  
/*
pid		pname	 	city
100		iphone		jaipur
102		fridge		goa
100		iphone		J&K
102		fridge		japan
100		iphone		jaipur
102		fridge		goa
100		iphone		J&K
102		fridge		japan
*/

select prd.pid,prd.pname,od.city
from product as prd 
join orders as od
where prd.pid = od.productid and pname = 'iphone';  
/*
100	iphone	jaipur
100	iphone	J&K
100	iphone	jaipur
100	iphone	J&K
*/
-- types of join in sql 
-- keys super,candidate,composite,primary ,forign,unique
