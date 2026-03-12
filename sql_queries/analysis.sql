USE e_com;
-- Q1 Total Revenue Generated
SELECT SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;

-- Q2 Total numbers of orders
SELECT COUNT(*) AS totla_orders
FROM orders;

-- Q3 Top 10 Selling product
SELECT p.product_name,
SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 10;

-- Q4 Top 5 Customers by spending
SELECT c.name,
SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;

-- Q5 Revenue By product category
SELECT p.category,
SUM(p.price * oi.quantity) AS revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Q6 Numbers of customers per city
SELECT city,
COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

-- Q7 Average Order Value
SELECT AVG(order_total) AS avg_order_value
FROM
(
SELECT o.order_id,
SUM(p.price * oi.quantity) AS order_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id
) t;

-- Q8 Monthly Revenue Trend
SELECT DATE_FORMAT(o.order_date,'%Y-%m') AS month,
SUM(p.price * oi.quantity) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- Q9 Products Never Ordered
SELECT product_name
FROM products
WHERE product_id NOT IN
(
SELECT DISTINCT product_id
FROM order_items
);

-- Q10 Orders by Status
SELECT status,
COUNT(*) AS total_orders
FROM orders
GROUP BY status;

