--- SELECT 
    --  *
	-- 	id, product, price
	--  MAX(price), COUNT, MIN, MAX, AVG, SUM
	-- 	price * 100
	
-- need to all the column in table 
Select * from sales; -- 50 records

-- need for spefic data like product  & price
select product,price from sales;

-- COUNT, MIN, MAX, AVG, SUM
-- no of product count
select count(product) from sales; -- 50
-- min price value 
select min(price) from sales; -- 9.99
--max quantity purchase
select max(quantity) from sales; -- 25
-- average price of product
select avg(price) from sales; -- 99.7
-- total quantity sold
select sum(quantity) from sales; -- 384

-- increase the price to 100
select price*100 
from sales;

-- Find out the following
--      total orders (volume / number of orders)
select count(id) from sales; -- 50 

--      order value (price total / sum)
select sum(price * quantity) as total_revenew
from sales; -- 15725.73

--      lowest order value
select min(price * quantity) as lowest_order
from sales; -- 151.92

--      largest order value
select max(price * quantity) as largest_order
from sales; -- 1249

--      find all the above just for 'Chennai' region
--      total orders (volume / number of orders)
select count(id) from sales 
where region ='Chennai'; -- 10 

--      order value (price total / sum)
select sum(price * quantity) as total_revenew
from sales 
where region ='Chennai'; -- 3190.73

--      lowest order value
select min(price * quantity) as lowest_order
from sales
where region ='Chennai'; -- 219.96

--      largest order value
select max(price * quantity) as largest_order
from sales
where region ='Chennai'; -- 398
