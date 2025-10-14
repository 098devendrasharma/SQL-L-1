-- Multi row function 
	-- Aggregate function
use sakila;
select amount,round(amount)
from payment;
-- sum 
select sum(amount)
from payment;
--  count
select count(amount)
from payment;

-- filter data
select count(amount) 
from payment
where amount > 5;

select count(*)
from payment;

-- address have null value ==> addrss2 have null value but exclude null
-- count(*) ==> number of rows inculde null values
-- count (column_name) ==> exclude all null value
select count(address_id),count(address2),count(*)
from address;

-- max
SELECT
  MAX(amount),MIN(amount),COUNT(amount),SUM(amount),AVG(amount)
FROM
  payment;
  -- distinct 
select distinct amount
from payment;
-- distinct more than one colunmn return all unique combination
select distinct amount , payment_id
from payment;
-- distinct with count
select count(distinct amount), sum(amount)
from payment;

-- select (distinct amount),count(amount)
-- from payment;


-- 
-- get pmt id and amt for 2005
select payment_id, amount
from payment
where extract(year from payment_date ) = 2005;

-- get unique cstmr who have done paymet in mounth of june
select count(distinct customer_id)
from payment
where extract(month from payment_date ) = 6; 

-- get max amt avg amt and diff b\w max and avg where amt payment > $2 for year 2006 
select max(amount),avg(amount),max(amount)-avg(amount)
from payment
where amount>2 and extract(year from payment_date ) = 2006;

-- Group By ==> grouping simmilar value
select count(payment_id) 
from payment
where customer_id = 4;
-- when we do by group by any column then only that column select not other
-- distint use to find unique values from table and not apply any aggregation function and this is time taking task so we not use distict
-- apply any fuction on distinct but not with distinct 
-- group by
/*
customer_ID		amount
1   			100
1   			100
2   			400
4   			600
2   			700

create group 
1 						2							4
1 	100					2	400						4	600
1	200					2	700
if apply sum function 
	300						1100						600
*/ 
select  customer_id,sum(amount)
from payment
group by customer_id;

select  customer_id,count(amount),sum(amount),avg(amount)
from payment
group by customer_id;

select  amount,sum(amount)
from payment
group by amount;

 