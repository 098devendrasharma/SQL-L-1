show databases;  # "show databases" is shows name of all available database

use sakila; # "use database_name" ==> use the database_name as database

show Tables; -- "show tables" to see all table in database
-- Data access from a particular table use "select" statement ==> this is comes under DQL

select * from actor;

describe actor; -- describe gives the information about table

select actor_id , first_name from actor; -- select statement table it can any case formate

select actor_id , first_name,actor_id 	-- access no of time column name
from actor; 							-- select statement table it can any case formate

select actor_id , first_name,actor_id*5 	-- actor id is come multiple 5 
from actor; 							-- select statement table it can any case formate
-- whenever we made any new column with help of "select" statement but not affect on original database

select * from actor;


-- ************************************************************************************* --
-- apply conditon on any row use where  ==> to filter rows --> RDBMS always work on rows
select * 
from actor 
where actor_id = 3 ;-- also use > < =  not eaual ==> != , <> 

select * 					
from actor
where first_name = 'Nick';  -- Data condtion shuld case sensitive and use single quates

select actor_id,first_name
from actor
where last_name = 'DAVIS' ;

-- Multiple filter ==> "and" use for apply multiple condition 
select * 					
from actor
where first_name = 'Nick' and actor_id = 44 ;  -- Both condition are true

select * 					
from actor
where first_name = 'Nick' or actor_id = 46 ;  -- one condtion is true 


select * 					
from actor
where first_name = 'Nick' or actor_id != 46 ; -- all value shows except 46

select * 					
from actor
where actor_id > 2 and actor_id < 6 ; 

select * 					
from actor
where  actor_id between 2 and  6 ;  -- specific range but lower to higer

select * 					
from actor
where  actor_id not between 2 and  6 ;  -- specific range but lower to higer


select * 					
from actor
where actor_id >= 6 and actor_id >= 2 ;

select * 
from actor
where actor_id = 2 or actor_id =8 or actor_id = 15;

select * 
from actor
where actor_id in (2,8,15);

select * 
from actor
where first_name in ('NICK','DAVIS','ED');

-- Q 1 from the actor table get first name and actor id last name id guniss
select first_name , actor_id 
from actor
where last_name = 'GUINESS';
-- actor id first name where actor id 3 to 18 or name shuold not ED
select  actor_id , first_name
from actor
where (actor_id between 3 and 18) or first_name != 'ED';

-- lst name ator id and first name where fst nam is either Nick or Grace
select  actor_id , first_name
from actor
where  first_name in  ('NICK','GRACE');

-- all clm where actr id is from 2 to 6 or actr id greater than 5 
select *
from actor
where (actor_id between 2 and 6) or actor_id > 5;
