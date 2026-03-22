-- =====================================
-- Q1: Total number of orders per customer
-- =====================================
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders_flat o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;


-- =====================================
-- Q2: Top 3 customers by total order value
-- =====================================
SELECT 
    c.customer_id,
    c.name,
    SUM(o.quantity * o.price) AS total_order_value
FROM customers c
JOIN orders_flat o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_order_value DESC
LIMIT 3;


-- =====================================
-- Q3: Products purchased by customers from Bangalore
-- =====================================
SELECT 
    DISTINCT p.product_name
FROM customers c
JOIN orders_flat o
ON c.customer_id = o.customer_id
JOIN products p
ON o.product_id = p.product_id
WHERE c.city = 'Bangalore';


-- =====================================
-- Q4: Join all files (Customer + Order + Product)
-- =====================================
SELECT 
    c.name AS customer_name,
    o.order_date,
    p.product_name,
    o.quantity
FROM customers c
JOIN orders_flat o
ON c.customer_id = o.customer_id
JOIN products p
ON o.product_id = p.product_id;
