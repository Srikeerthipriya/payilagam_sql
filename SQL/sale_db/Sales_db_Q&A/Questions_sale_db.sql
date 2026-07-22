-- Question foe sales db 

-- Basic Level (1–5)
-- 1. Display all customer details along with their order details.

-- Tables: customers, orders

-- 2. Find the total number of orders placed by each customer.

-- Expected Concepts:

-- JOIN
-- COUNT()
-- GROUP BY
-- 3. Display all delivered orders.

-- Tables: orders

-- 4. Find the total sales amount for each product.

-- Tables: sale, products

-- 5. List customers who made purchases using UPI.

-- Tables: customers, sale

-- Intermediate Level (6–10)
-- 6. Find the top 5 customers based on total purchase amount.

-- Concepts

-- SUM()
-- ORDER BY
-- LIMIT / TOP
-- 7. Find the total revenue generated for each product category.

-- Tables

-- products
-- sale
-- 8. Find the average order amount in each state.

-- Tables

-- customers
-- orders
-- 9. Display customers who have placed more than 2 orders.

-- Concepts

-- GROUP BY
-- HAVING
-- 10. Find the most sold product based on quantity.

-- Tables

-- products
-- sale
-- Advanced Joins (11–15)
-- 11. Display customer name, product name, quantity purchased, and total amount.

-- Tables

-- customers
-- sale
-- products
-- 12. Find customers who have never placed an order.

-- Concepts

-- LEFT JOIN
-- IS NULL
-- 13. Find products that have never been sold.

-- Tables

-- products
-- sale
-- 14. Display monthly sales revenue.

-- Concepts

-- DATE functions
-- GROUP BY Month
-- 15. Find the total quantity sold for each product category.
-- Advanced SQL (16–20)
-- 16. Find the customer who spent the highest amount.

-- Concepts

-- SUM()
-- ORDER BY DESC
-- 17. Find the second highest sale amount.

-- Concepts

-- DENSE_RANK()
-- Subquery
-- 18. Rank customers based on total purchase amount.

-- Concepts

-- Window Functions
-- RANK()
-- DENSE_RANK()
-- 19. Find the running total of sales ordered by sale date.

-- Concepts

-- SUM() OVER()
-- 20. Find the percentage contribution of each product category to total sales.

-- Concepts

-- CTE/Subquery
-- Window Function
-- SUM() OVER()

-- Interview question

-- Which state generated the highest revenue?
-- Which payment method is used the most?
-- Find the top-selling product in each category.
-- Find the customer with the maximum number of orders.
-- Find monthly revenue growth.
-- Find products with stock quantity less than 20.
-- Find average quantity sold per order.
-- Find the highest-value order.
-- Find sales made during weekends.
-- Find customers who purchased products from more than one category.