use sakila;

select customer_id, sum(amount),count(amount) as Total_amt 
from payment
group by customer_id ;

-- sub grouping
select customer_id, amount, sum(amount),count(amount) as Total_amt 
from payment
group by customer_id ,amount;

-- how much amount we have spend in each year
select year(payment_date) as years , sum(amount)
from payment
group by years;

-- how much amount we have spend in each amount for every year
select year(payment_date) as years , amount,sum(amount)
from payment
group by years,amount;

-- how much amount we have spend in each staff for every year
select year(payment_date) as years ,staff_id, sum(amount)
from payment
group by years,staff_id;


select * 
from payment;

-- ======================= order by =============================
-- order by means sorting the data
select *
from payment
order by customer_id; -- ascending order by default
-- order by one column
select *
from payment
order by customer_id desc ; -- descending order by default
-- order by two column
select *
from payment
order by customer_id , amount desc ; -- descending order by default

-- ============= conditional functions =========================
-- function which work on condition
select customer_id,amount,if (amount>3,"High","Low") from payment;
-- if ,elif, else
select customer_id,amount,if (amount>3,"High",if (amount = 5.99,"Avg","Low")) from payment;
-- case
select customer_id,amount,
	case 
		when amount = 2.99 then "low"
		when amount =5.99 then "avg"
        else "high"
	end as id
from payment;

-- Q. select two column cst_id , status if cst_id>1 print "hello"cst_id> 4 "user", otherwise "regex" 
select customer_id,
	case
		when customer_id > 4 then "User"
		when customer_id > 1 then "Hello"
        else "Regex"
	end as status
from payment;

-- haker upto 3 star
-- relationship in my sql
-- primary ,super, candidate
-- join in sql
-- sql zoo chapter 1 to 5