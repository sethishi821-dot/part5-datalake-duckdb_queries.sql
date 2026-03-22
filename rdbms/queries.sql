-- =====================================
-- Q1: Customers from Mumbai with total order value
-- =====================================
SELECT 
    c.customer_id,
    c.name,
    SUM(o.quantity * p.price) AS total_order_value
FROM Customers c
JOIN Orders o 
ON c.customer_id = o.customer_id
JOIN Products p 
ON o.product_id = p.product_id
WHERE c.city = 'Mumbai'
GROUP BY c.customer_id, c.name;


-- =====================================
-- Q2: Top 3 products by total quantity sold
-- =====================================
SELECT 
    p.product_id,
    p.product_name,
    SUM(o.quantity) AS total_quantity_sold
FROM Orders o
JOIN Products p 
ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 3;


-- =====================================
-- Q3: Sales reps and number of unique customers handled
-- (Make sure Orders table has sales_rep column)
-- =====================================
SELECT 
    o.sales_rep,
    COUNT(DISTINCT o.customer_id) AS unique_customers
FROM Orders o
GROUP BY o.sales_rep;


-- =====================================
-- Q4: Orders where total value > 10000
-- =====================================
SELECT 
    o.order_id,
    SUM(o.quantity * p.price) AS total_value
FROM Orders o
JOIN Products p 
ON o.product_id = p.product_id
GROUP BY o.order_id
HAVING SUM(o.quantity * p.price) > 10000
ORDER BY total_value DESC;


-- =====================================
-- Q5: Products never ordered
-- =====================================
SELECT 
    p.product_id,
    p.product_name
FROM Products p
LEFT JOIN Orders o 
ON p.product_id = o.product_id
WHERE o.product_id IS NULL;
