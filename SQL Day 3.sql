use sakila;
--  6. Trim Function
select char_length('  hey  ');
select trim('  hey  ');
select char_length(trim('  hey  '));

select trim('  hey   ');
select char_length(rtrim('  hey   '));

select ltrim('  hey   ');
select char_length(ltrim('  hey   '));

-- 7. replace
select first_name,replace(first_name,'E','#')
from actor;

-- 8. locate

-- 9. lpad
select first_name,lpad(first_name,5,'@')
from actor;

-- 10. rpad
select first_name,rpad(first_name,5,'@')
from actor;


-- ******************************************************************************************
-- ***************** Numaric Function *******************************************************
-- ==> 1. round : round off decimal
select round(11.49);
select round(11.50);  
select round(11.6 ,1);  -- only the decimal part ==> if not value after .6 then not change 
select round(11.65 ,1);  -- only the decimal part
select round(11.64 ,1);  -- only the decimal part
select round(11.654 ,2);  -- only the decimal part
select round(11.646 ,2);  -- only the decimal part

-- ==>round : round off nearest 10 place of whole number or iteger
select round(115.646 ,-1);
select round(155.646 ,-2);
select round(145.646 ,-2);
select round(415.646 ,-3);
select round(715.646 ,-3);
 -- ==> 2. Trancate ==> not round off but use to extract value 
select round(6546.637 , 2 ), truncate(6546.637 , 2);

-- other functions 
select mod(10,3), mod(10,2), floor(6.9999), ceil(4.00002);


-- Date Function [Important]
-- work on date:
--  build in function 
select current_date(),current_time(),current_timestamp(),now(); 
 -- adddate ==> add day from date
 select now(), adddate(now(),2);
 
 select now(), adddate(now(),interval 2 day);
 
 select now(), adddate(now(),interval 2 month);
 
 select now(), adddate(now(),interval 2 hour);
 
 select now(), adddate(now(),interval 2 year);
 -- if reduce or subtract date
 select now(), adddate(now(),interval -2 day);
 
 select now(), adddate(now(),interval -2 month);
 
 select now(), adddate(now(),interval -2 hour);
 
 select now(), adddate(now(),interval -2 year);
 
 -- year and month
 select now(),year(now()),last_day(now());
 
 -- extraxt 
 select now(),extract(month from now());
 select now(),extract(QUARTER from now());
 select now(),date_format(now(),'Year is %Y, my Month %M');
 
 -- adddate(),now(),current_time(),extract(),year(),month(),date_format()
 select payment_date,year(payment_date),extract(month from payment_date),
 date_format(payment_date,'Hours of shopping is %H'),
 datediff(payment_date,now())
 from payment;
 
 -- orderby , alias, aggregate 