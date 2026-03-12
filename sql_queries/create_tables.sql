-- CREATE DATABASE IF NOT EXISTS e_com;
USE e_com;
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
name VARCHAR(150),
email VARCHAR(150),
city VARCHAR(150),
signup_date DATE
);

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(150),
category VARCHAR(150),
price INT
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
status VARCHAR(100)
);

CREATE TABLE order_items (
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT
);