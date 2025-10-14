-- SQL DATABASE RUN ROW BY ROW
use sakila;

select actor_id 
from actor;

select actor_id , actor_id + 4 
from actor;

-- Conditon given by using where

select * 
from actor
where actor_id =4 ;

select * 
from actor
where actor_id >4 and first_name ='JOE' ;

select * 
from actor
where actor_id >4 and actor_id < 10 ;

select * 
from actor
where actor_id between 5 and  9 ;

select * 
from actor
where actor_id =4 or actor_id = 10 ;

select * 
from actor
where actor_id in (4 ,10) ;

-- ********************************************************************************
-- Like Operator (find out and filter on data based on pattern)
select * 
from actor
where first_name = 'NICK';

select * 
from actor
where first_name = 'N';

select * 
from actor
where first_name like 'N';

-- define the pattern use symbol '%' also known as wildcard charcter (zero or more charcter)
select * 
from actor
where first_name like 'N%'; -- extract all name start with N

select * 
from actor
where first_name like '%S'; -- extract all name end with S

-- *****************************************************************************************
select * 
from actor
where first_name like 'S%T'; -- extract all name start with 'S' and end with T

select * 
from actor
where first_name like '%S%'; -- extract all name has charater 'S' 
-- *******************************************************************************************
-- wildcard charcter :- underscore (_) : exactly one character
select * 
from actor 
where first_name like 'S_'; -- extarct all chracter which count 2 and 'S' first character and other one is anything , if use one underscore

select * 
from actor 
where first_name like 'A_%';

select * 
from actor 
where first_name like '_A%';

-- Practice Question :
-- 1. get actr id and fst name wh last two word TE
select actor_id,first_name 
from actor 
where first_name like '%TE';

-- 2. get actr id and fst name wh letter NN should be present in middle
select actor_id,first_name 
from actor 
where first_name like '_%NN%_';

-- 3. get fst and lst name wh lst nam col fst wrd is B and scnd lst wrd is R
select first_name,last_name 
from actor 
where first_name like 'B%R_'; 

-- 4. get all clm wh fst nam should have minimum 4 char
select *
from actor 
where first_name like '____%';

-- 5. get all clm wh actid is 2to 90 and first name S should present in middle and A shold scnd last char
select *
from actor 
where (actor_id between 2 and 90) and first_name like '_%S%A_';

-- *******************************************************************************************************
-- ================= Functions ===============================
-- In Build Function 
-- 1. Scaler Function 		2. Multi Rows Functions
-- 1. Scaler Function  ==> apply on each row and return the output for each row
-- String Function 
-- ==> 1. char_length ==> return count of character in string 
select first_name, char_length(first_name)
from actor;
-- ==> 2. lower() , upper()
select first_name, lower(first_name),upper(first_name)
from actor;
-- ==> 3. concat
select first_name,last_name,concat(first_name,' ',last_name), concat(first_name,' Regex')
from actor;

-- ==> 4. concat_ws
select first_name,last_name,concat_ws(' ','MR.',first_name,last_name), concat_ws(' ',first_name,'Regex')
from actor;

-- ==> 5. substr ==> to extract some portion from sting  ==> substr(column,start_position,total_char)
-- start with 1
select first_name, substr(first_name,1),substr(first_name,1,2),substr(first_name,-2,2)
from actor;

-- 1. charlen vs len 2. trim 3. locate 4. replace 
-- python 2 vs python 3
-- diff datatype in python
-- practical work -- goto SQL zoo chapter 1 select name 