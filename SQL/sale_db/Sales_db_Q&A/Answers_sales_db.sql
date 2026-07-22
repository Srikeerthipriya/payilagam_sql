--1. Display all customer details along with their order details.

SELECT
    c.customer_id,
    c.name,
    c.city,
    c.state,
    o.order_id,
    o.order_date,
    o.amount,
    o.status
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

--2. Find the total number of orders placed by each customer.
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

--3. Display all delivered orders.
SELECT *
FROM orders
WHERE status = 'Delivered';

--4. Find the total sales amount for each product.
SELECT
    p.product_name,
    SUM(s.total_amount) AS total_sales
FROM products p
JOIN sale s
ON p.product_id = s.product_id
GROUP BY p.product_name;

--5. List customers who made purchases using UPI.
SELECT DISTINCT
    c.customer_id,
    c.name
FROM customers c
JOIN sale s
ON c.customer_id = s.customer_id
WHERE s.payment_method = 'UPI';

--6. Find the top 5 customers based on total purchase amount.
SELECT
    c.customer_id,
    c.name,
    SUM(s.total_amount) AS total_purchase
FROM customers c
JOIN sale s
ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_purchase DESC
LIMIT 5;

--7. Find the total revenue generated for each product category.
SELECT
    p.category,
    SUM(s.total_amount) AS revenue
FROM products p
JOIN sale s
ON p.product_id = s.product_id
GROUP BY p.category;

--8. Find the average order amount in each state.
SELECT
    c.state,
    AVG(o.amount) AS average_order_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.state;

--9. Display customers who have placed more than 2 orders.
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) > 2;

--10. Find the most sold product based on quantity.
SELECT
    p.product_name,
    SUM(s.quantity) AS total_quantity
FROM products p
JOIN sale s
ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 1;

--11. Display customer name, product name, quantity purchased, and total amount.
SELECT
    c.name,
    p.product_name,
    s.quantity,
    s.total_amount
FROM sale s
JOIN customers c
ON s.customer_id = c.customer_id
JOIN products p
ON s.product_id = p.product_id;

--12. Find customers who have never placed an order.
SELECT
    c.customer_id,
    c.name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

--13. Find products that have never been sold.
SELECT
    p.product_id,
    p.product_name
FROM products p
LEFT JOIN sale s
ON p.product_id = s.product_id
WHERE s.sale_id IS NULL;

--14. Display monthly sales revenue.
PostgreSQL
SELECT
    TO_CHAR(sale_date,'Month') AS month,
    SUM(total_amount) AS revenue
FROM sale
GROUP BY TO_CHAR(sale_date,'Month')
ORDER BY MIN(sale_date);
MySQL
SELECT
    MONTHNAME(sale_date) AS month,
    SUM(total_amount) AS revenue
FROM sale
GROUP BY MONTH(sale_date), MONTHNAME(sale_date)
ORDER BY MONTH(sale_date);

--15. Find the total quantity sold for each product category.
SELECT
    p.category,
    SUM(s.quantity) AS total_quantity
FROM products p
JOIN sale s
ON p.product_id = s.product_id
GROUP BY p.category;

--16. Find the customer who spent the highest amount.
SELECT
    c.customer_id,
    c.name,
    SUM(s.total_amount) AS total_spent
FROM customers c
JOIN sale s
ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 1;

--17. Find the second highest sale amount.
SELECT total_amount
FROM (
    SELECT
        total_amount,
        DENSE_RANK() OVER(ORDER BY total_amount DESC) AS rnk
    FROM sale
) x
WHERE rnk = 2;

--18. Rank customers based on total purchase amount.
SELECT
    c.customer_id,
    c.name,
    SUM(s.total_amount) AS total_purchase,
    RANK() OVER(ORDER BY SUM(s.total_amount) DESC) AS customer_rank
FROM customers c
JOIN sale s
ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.name;

--19. Find the running total of sales ordered by sale date.
SELECT
    sale_date,
    total_amount,
    SUM(total_amount)
    OVER(
        ORDER BY sale_date
    ) AS running_total
FROM sale;

--20. Find the percentage contribution of each product category to total sales.
SELECT
    p.category,
    SUM(s.total_amount) AS category_sales,
    ROUND(
        SUM(s.total_amount) * 100.0 /
        SUM(SUM(s.total_amount)) OVER (),
        2
    ) AS percentage
FROM products p
JOIN sale s
ON p.product_id = s.product_id
GROUP BY p.category;