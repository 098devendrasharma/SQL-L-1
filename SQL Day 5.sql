-- group by 
use sakila;

/*
select column_name(same name which define in group by),agregate functuon(if other column  want to access use aggreagte function)
from table_name
group by name_of_column 
*/
select customer_id, count(customer_id),sum(amount)
from payment
group by customer_id;

-- group by mostly use on that column where have duplicate values 

select payment_id,count(payment_id)
from payment
group by payment_id;

-- filter the data in group by 
-- where ==> group by ==> aggregation function 

select customer_id, count(customer_id),sum(amount)
from payment
where customer_id >3
group by customer_id;

select customer_id, count(customer_id),sum(amount)
from payment
where count(customer_id) >30
group by customer_id;
--  ****************** Inportant ****************************************************
-- ==> kabhi bhi where condition not apply on aggregation function nahi run hota	*
-- because where clause run at first												*
-- if you need filter data based on aggeration function we have having clause		*
-- if column exist in table ==> use where for filter									*
-- **********************************************************************************
-- filter on aggregation function
select customer_id, count(customer_id),sum(amount)
from payment
group by customer_id
having count(customer_id) >30;

-- where ==> group by ==> having
select amount, count(amount),sum(amount)
from payment
where amount > 2
group by amount
having count(amount)>3000;

select amount, count(*),sum(amount)
from payment
where amount > 2
group by amount
having count(*)>3000;

-- alias ==> as --> use give new name to column  
select amount, count(*) as totalcount ,sum(amount)
from payment
where amount > 2
group by amount
having totalcount>3000 and sum(amount) > 15000;

-- Q
-- get staff id and total no of customer served by each staff
select staff_id,count(customer_id)
from payment
group by staff_id;
-- get total amt and number of payment done for each month 
select extract(year from payment_date ) as years,extract(month from payment_date ) as months,sum(amount), count(amount)
from payment
group by years,months;

-- get the amount and total number of unique customer who have done the payment of each amount
select amount,count(distinct customer_id),count(customer_id) as count_of_unique_coustomer
from payment
group by amount;


-- get the no of transaction achived for each amt for yr 2005 where no transation should be grater than 15
select amount,count(amount) as transaction 
from payment
where year(payment_date) = 2005
group by amount
having transaction > 15;

