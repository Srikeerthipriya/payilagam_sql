-- Interview question for sales db 

-- 1. Which state generated the highest revenue?
SELECT
    c.state,
    SUM(s.total_amount) AS revenue
FROM customers c
JOIN sale s
ON c.customer_id = s.customer_id
GROUP BY c.state
ORDER BY revenue DESC
LIMIT 1;

--2. Which payment method is used the most?
SELECT
    payment_method,
    COUNT(*) AS total_transactions
FROM sale
GROUP BY payment_method
ORDER BY total_transactions DESC
LIMIT 1;

--3. Find the top-selling product in each category.
SELECT *
FROM (
    SELECT
        p.category,
        p.product_name,
        SUM(s.quantity) AS quantity_sold,
        RANK() OVER
        (
            PARTITION BY p.category
            ORDER BY SUM(s.quantity) DESC
        ) AS rnk
    FROM products p
    JOIN sale s
    ON p.product_id = s.product_id
    GROUP BY p.category, p.product_name
) x
WHERE rnk = 1;

--4. Find the customer with the maximum number of orders.
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS orders_count
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY orders_count DESC
LIMIT 1;

--5. Find monthly revenue growth.
SELECT
    DATE_TRUNC('month', sale_date) AS month,
    SUM(total_amount) AS revenue,
    SUM(total_amount)
    - LAG(SUM(total_amount))
      OVER(ORDER BY DATE_TRUNC('month', sale_date))
      AS growth
FROM sale
GROUP BY DATE_TRUNC('month', sale_date);

--6. Find products with stock quantity less than 20.
SELECT *
FROM products
WHERE stock_quantity < 20;

--7. Find average quantity sold per order.
SELECT
    order_id,
    AVG(quantity) AS average_quantity
FROM sale
GROUP BY order_id;

--8. Find the highest-value order.
SELECT *
FROM orders
ORDER BY amount DESC
LIMIT 1;


--9. Find sales made during weekends.

PostgreSQL

SELECT *
FROM sale
WHERE EXTRACT(DOW FROM sale_date) IN (0,6);

MySQL

SELECT *
FROM sale
WHERE DAYOFWEEK(sale_date) IN (1,7);

--10. Find customers who purchased products from more than one category.
SELECT
    c.customer_id,
    c.name
FROM customers c
JOIN sale s
ON c.customer_id = s.customer_id
JOIN products p
ON s.product_id = p.product_id
GROUP BY c.customer_id, c.name
HAVING COUNT(DISTINCT p.category) > 1;