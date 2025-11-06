create database corrdb;
use corrdb;

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into products
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Phone', 'Electronics', 800.00),
(3, 'Chair', 'Furniture', 150.00),
(4, 'Desk', 'Furniture', 300.00),
(5, 'Monitor', 'Electronics', 250.00);

-- Insert data into sales
INSERT INTO sales (sale_id, product_id, quantity, sale_date) VALUES
(1, 1, 3, '2025-09-10'),
(2, 2, 5, '2025-09-11'),
(3, 1, 2, '2025-09-15'),
(4, 3, 7, '2025-09-1');

select *
from products;

select *
from sales;

select category,avg(price)
from products
group by category;

select product_name,p_out.price
from products as p_out
where p_out.price > ( select avg(p_in.price)
							from products as p_in
                            where p_in.category = p_out.category) ;
-- Benifit of exist operator in sub query
-- exists vs in operator

SELECT 
    p.product_name, p.price
FROM
    products AS p
WHERE
    p.product_id IN (SELECT 
            s_in.product_id
        FROM
            sales AS s_in
        WHERE
            s_in.product_id = p.product_id
                AND quantity > 3);

SELECT 
    p.product_name, p.price
FROM
    products AS p
WHERE
    exists (SELECT 
            s_in.product_id
        FROM
            sales AS s_in
        WHERE
            s_in.product_id = p.product_id
                AND quantity > 3);
-- second highest price
select *
from products 
order by price desc
limit 1 ,1;
-- not use 

INSERT INTO products (product_id, product_name, category, price) VALUES
(10, 'Laptop122', 'Electronics', 800.00),
(11, 'TV133', 'Electronics', 800.00);

select * from products;
SELECT 
    MAX(price)
FROM
    products;
SELECT 
    MAX(price)
FROM
    products
WHERE
    price < (SELECT 
            MAX(price)
        FROM
            products);

select * 
from products
where price = (select max(price)
				from products
				where price < (select max(price) from products));
SELECT 
    *
FROM
    products
WHERE
    price = (SELECT 
            MIN(price)
        FROM
            products
        WHERE
            price > (SELECT 
                    MIN(price)
                FROM
                    products));
-- get all info from the  product table product price greater than product id 3
select * from products;
select * from sales;
select * 
from products
where product_id > 3;

select * 
from products as p
where product_id in (select product_id 
from products
where product_id > 3);
-- get                                    where category is same of product as of product id 2
select * 
from products
where product_id > 3;

select * 
from products as p
where product_id in (select product_id 
from products
where product_id = 2);
--                                                                                           2 or 3
select * 
from products as p
where product_id in (select product_id 
from products
where product_id in (2,3));
--                                         where the price of product is grater than amoung all the price if product in furniture category
select * 
from products as p
where product_id >all (select product_id 
from products
where category = "Furniture");
--      pid,pname and total quantiy sold of each product                                    
select * from products;
select * from sales;
select p.product_id,p.product_name, sum(s.quantity)
from products as p
join sales as s
on p.product_id = s.product_id
group by p.product_id,p.product_name;