# E-Commerce SQL Data Analysis

## Project Overview

This project focuses on analyzing a simulated e-commerce dataset using SQL. The goal is to explore customer behavior, understand product demand, and identify patterns in orders and revenue.

The dataset contains information about customers, products, orders, and order items. By joining these tables and performing SQL analysis, useful insights about sales performance, customer activity, and product demand can be extracted.

This project demonstrates practical SQL skills such as **joins, aggregations, grouping, filtering, subqueries, and sorting**, which are commonly used in real-world data analysis.

---

# Problem Statement

E-commerce businesses generate large volumes of transactional data every day. Analyzing this data helps businesses understand customer behavior, identify best-selling products, and monitor revenue trends.

The objective of this project is to analyze an e-commerce dataset to answer key business questions such as:

* How much revenue has the business generated?
* Which products sell the most?
* Who are the top customers by spending?
* Which product categories generate the most revenue?
* How do revenue and orders change over time?

By answering these questions using SQL, businesses can gain insights that help improve decision-making, marketing strategies, and inventory management.

---

# Dataset

The dataset used in this project was **synthetically generated using Python, Faker, and Pandas**. It simulates a simple e-commerce database with four related tables.

### customers.csv

Contains customer information.

* customer_id
* name
* email
* city
* signup_date

### products.csv

Contains product details.

* product_id
* product_name
* category
* price

### orders.csv

Contains information about customer orders.

* order_id
* customer_id
* order_date
* status

### order_items.csv

Contains information about the products included in each order.

* order_item_id
* order_id
* product_id
* quantity

---

# Tools Used

The following tools and technologies were used in this project:

* **SQL (MySQL)** 
* **Python** 
* **Pandas** 
* **Faker** 
* **VS Code**
* **Git & GitHub** 

---

# Database Setup

Create the database used for the project.

```sql
CREATE DATABASE IF NOT EXISTS e_com;
```

Select the database.

```sql
USE e_com;
```

Import the CSV files into their respective tables.

---

# Project Workflow

1. Generated synthetic e-commerce data using Python.
2. Created multiple related tables representing customers, products, and orders.
3. Imported the dataset into a MySQL database.
4. Performed SQL analysis using multiple queries.
5. Extracted insights related to product demand, revenue trends, and customer behavior.

---

# SQL Analysis Queries

### 1. Total Revenue Generated

```sql
SELECT SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;
```

---

### 2. Total Number of Orders

```sql
SELECT COUNT(*) AS total_orders
FROM orders;
```

---

### 3. Top 10 Selling Products

```sql
SELECT p.product_name,
SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 10;
```

---

### 4. Top 5 Customers by Spending

```sql
SELECT c.name,
SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;
```

---

### 5. Revenue by Product Category

```sql
SELECT p.category,
SUM(p.price * oi.quantity) AS revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;
```

---

### 6. Number of Customers per City

```sql
SELECT city,
COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;
```

---

### 7. Average Order Value

```sql
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
```

---

### 8. Monthly Revenue Trend

```sql
SELECT DATE_FORMAT(o.order_date,'%Y-%m') AS month,
SUM(p.price * oi.quantity) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;
```

---

### 9. Products Never Ordered

```sql
SELECT product_name
FROM products
WHERE product_id NOT IN
(
SELECT DISTINCT product_id
FROM order_items
);
```

---

### 10. Orders by Status

```sql
SELECT status,
COUNT(*) AS total_orders
FROM orders
GROUP BY status;
```

---

# Key Insights

* **34.7% of orders are Delivered**, indicating that a significant portion of orders are successfully fulfilled.

* **33.7% of orders are Cancelled**, which may indicate order issues, stock problems, or changes in customer decisions.

* **31.6% of orders are Shipped**, meaning these orders are currently in transit and may eventually be delivered or cancelled.

* Some products appear more frequently in orders, indicating **higher demand compared to other products**.

* **Smartphones are among the most frequently ordered products**, suggesting strong customer demand.

* A small group of customers places significantly more orders than others, indicating the presence of **high-value customers**.

* **Kolkata generates the highest number of customers and orders**, suggesting stronger market demand in that city.

* Product categories such as **Electronics and Gadgets contribute the majority of sales**.

* Order activity is **distributed throughout the year**, indicating consistent purchasing behavior.
---

# Conclusion

This project demonstrates how SQL can be used to analyze relational e-commerce data and extract meaningful business insights.

By combining multiple tables and applying SQL operations such as joins, grouping, aggregations, and subqueries, it is possible to uncover patterns in customer behavior, product demand, and revenue generation.

The analysis highlights best-selling products, high-value customers, and revenue trends. These insights can help businesses make better decisions related to marketing strategies, inventory planning, and customer engagement.

This project also showcases practical SQL skills that are commonly required in real-world data analysis roles.
