-- Sub qurey/inner query/nested query :- query within query 
/*
-- sql query embbeded in any query
-- sub query firstly excuted
-- more readable 
-- reduce complixity
-- Dinanmic manner
-- alternative of joins
*/
use sakila ;
select *
from actor;

select first_name
from actor
where actor_id = 3;

select * 
from actor
where first_name = 'ED';

select * 
from actor
where first_name = (select first_name
							from actor
							where actor_id = 3);
/* ----- Error Dekhna Hai
select * 
from actor
where first_name like (select first_name
							from actor
							where actor_id = 3) || "%";
*/                  

select amount 
from payment
where payment_id = 3; 

select * 
from payment
where amount = (select amount 
					from payment
						where payment_id = 3);


-- get the payment id ,amt and payment date where the amt of rental id 1476

select rental_id,payment_id,amount,payment_date
from payment
where amount = (select amount
					from payment
						where rental_id = 1476);

-- get the pmt_id amt and pmt date where the month of the table = the month payment id 4

select payment_id,amount,payment_date,monthname(payment_date) as month_name ,month(payment_date)
from payment
where month(payment_date) = (select month(payment_date)
								from payment
								where payment_id = 4);

-- operator >,>=,<,<=,!= 
-- that operator used only scaler subquery (when a subquery return one value)

-- get pmtid , and amt from table where amt = the max amt from the table
select max(amount)
from payment;

select payment_id, amount
from payment
where amount = (select max(amount)
					from payment);

-- single row subquery