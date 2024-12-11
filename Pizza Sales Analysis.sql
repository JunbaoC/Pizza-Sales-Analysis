-- PIZZA SALES ANALYSIS

-- Create the database
CREATE DATABASE IF NOT EXISTS pizza_sales_db;
USE pizza_sales_db;

-- Create the table
CREATE TABLE IF NOT EXISTS pizza_sales (
    pizza_id VARCHAR(50),
    order_id VARCHAR(50),
    pizza_name_id VARCHAR(50),
    quantity INT,
    order_date DATE,
    order_time TIME,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    pizza_size VARCHAR(5),
    pizza_category VARCHAR(20),
    pizza_ingredients TEXT,
    pizza_name VARCHAR(100)
);

ALTER TABLE pizza_sales MODIFY pizza_name VARCHAR(255);

-- Load data from CSV into the table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Data Model - Pizza Sales.csv'
INTO TABLE pizza_sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS
(
    pizza_id, 
    order_id, 
    pizza_name_id, 
    quantity, 
    @order_date, 
    @order_time, 
    unit_price, 
    total_price, 
    pizza_size, 
    pizza_category, 
    pizza_ingredients, 
    pizza_name
)
SET 
    order_date = STR_TO_DATE(@order_date, '%Y/%m/%d'), 
    order_time = STR_TO_DATE(@order_time, '%H:%i:%s');


-- Remove Duplicate Records
SELECT 
    pizza_id, order_id, COUNT(*) AS count
FROM pizza_sales
GROUP BY pizza_id, order_id
HAVING count > 1;

DELETE t1 FROM pizza_sales t1
INNER JOIN pizza_sales t2 
WHERE 
    t1.pizza_id = t2.pizza_id AND 
    t1.order_id = t2.order_id AND 
    t1.quantity = t2.quantity AND 
    t1.unit_price = t2.unit_price AND 
    t1.total_price = t2.total_price AND 
    t1.pizza_size = t2.pizza_size AND 
    t1.pizza_category = t2.pizza_category AND 
    t1.pizza_ingredients = t2.pizza_ingredients AND 
    t1.pizza_name = t2.pizza_name AND 
    t1.order_date = t2.order_date AND 
    t1.order_time = t2.order_time AND 
    t1.id > t2.id;

-- Check Missing Values
SELECT 
    SUM(CASE WHEN pizza_id IS NULL THEN 1 ELSE 0 END) AS missing_pizza_id,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS missing_order_id,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS missing_quantity,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS missing_order_date,
    SUM(CASE WHEN order_time IS NULL THEN 1 ELSE 0 END) AS missing_order_time,
    SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) AS missing_unit_price,
    SUM(CASE WHEN total_price IS NULL THEN 1 ELSE 0 END) AS missing_total_price,
    SUM(CASE WHEN pizza_size IS NULL THEN 1 ELSE 0 END) AS missing_pizza_size,
    SUM(CASE WHEN pizza_category IS NULL THEN 1 ELSE 0 END) AS missing_pizza_category,
    SUM(CASE WHEN pizza_ingredients IS NULL THEN 1 ELSE 0 END) AS missing_pizza_ingredients,
    SUM(CASE WHEN pizza_name IS NULL THEN 1 ELSE 0 END) AS missing_pizza_name
FROM pizza_sales;

-- Fill missing quantities with 1
UPDATE pizza_sales
SET quantity = 1
WHERE quantity IS NULL;

-- Fill missing unit prices with the average unit price
UPDATE pizza_sales
SET unit_price = (SELECT AVG(unit_price) FROM pizza_sales WHERE unit_price IS NOT NULL)
WHERE unit_price IS NULL;

-- Analysis Queries

-- Sales by Pizza Size and Category
SELECT 
    pizza_size,
    pizza_category,
    SUM(total_price) AS total_sales,
    SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_size, pizza_category
ORDER BY total_sales DESC;

-- Monthly Sales Trends
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    SUM(total_price) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY sales_month
ORDER BY sales_month;

-- Hourly Order Volumes
SELECT 
    HOUR(order_time) AS order_hour,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY order_hour
ORDER BY order_hour;

-- Top 10 Most Popular Pizzas
SELECT 
    pizza_name,
    SUM(total_price) AS total_sales,
    SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_sales DESC
LIMIT 10;

-- Export Query Results
SELECT 
    HOUR(order_time) AS order_hour,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_volume_by_hour.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
FROM pizza_sales
GROUP BY order_hour
ORDER BY order_hour;

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    SUM(total_price) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/monthly_sales_trends.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
FROM pizza_sales
GROUP BY sales_month
ORDER BY sales_month;
