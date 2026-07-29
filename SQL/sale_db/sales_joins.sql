
-- select * from customers

-- select count(order_id) from orders

-- High Priority Customer based on order count

Select 
c.customer_id, c.name,
count(o.order_id) as order_count
from customers c
join orders o
on c.customer_id = o.customer_id
group by 
c.customer_id,
c.name
order by order_count desc


-- High Priority Customer based on value
Select 
c.customer_id, c.name,
sum(o.amount) as total_value
from customers c
join orders o
on c.customer_id = o.customer_id
group by 
c.customer_id,
c.name
order by total_value desc


--Products 
-- fast moving

select 
p.product_id,p.product_name,
sum(s.quantity) as total_quantity_sale
from products p 
join sale s
on p.product_id = s.product_id
group by 
p.product_id,
p.product_name
order by total_quantity_sale desc 

--  Expensive Unsold Items
select 
p.product_id,
p.product_name,
p.unit_price
from products p
left join sale s
on p.product_id = s.product_id
where s.product_id is null 
order by p.unit_price desc

-- fast moving luxury products
select 
p.product_id,
p.product_name,
p.unit_price,
sum(s.quantity) as total_quantity_sale
from products p 
join sale s
on p.product_id = s.product_id
where p.unit_price > 5000
group by 
p.product_id,
p.product_name,
p.unit_price
order by total_quantity_sale desc 
