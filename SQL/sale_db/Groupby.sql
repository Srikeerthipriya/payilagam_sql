Select * from sales

-- Total Sales & Revenue for each city

Select 
region, 
sum(quantity) as Total_Sales, 
sum(price*quantity) as Revenue
from sales
group by region
order by revenue desc

-- City with revenue more than 1000

Select 
region, 
sum(quantity) as Total_Sales, 
sum(price*quantity) as Revenue
from sales
group by region
having sum(price*quantity) > 1000
order by revenue desc