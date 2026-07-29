--High Priority Customer
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS order_count,
    SUM(o.total_amount) AS total_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_order_value DESC, order_count DESC;
-- value, order count

--Products 
-- fast moving
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC;
-- fast moving luxury products
SELECT
    p.product_id,
    p.product_name,
    p.price,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE p.price > 1000
GROUP BY p.product_id, p.product_name, p.price
ORDER BY total_quantity_sold DESC;

-- Expensive Unsold Items
SELECT
    p.product_id,
    p.product_name,
    p.price
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL
ORDER BY p.price DESC;