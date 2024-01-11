USE DATABASE SQL; 
USE SCHEMA PUBLIC; 

CREATE TABLE sales (
 order_id INT PRIMARY KEY,
 customer_id INT,
 product_id INT,
 product_name VARCHAR(50),
 quantity INT,
 unit_price DECIMAL(10, 2),
 order_date DATE
);

INSERT INTO sales (order_id, customer_id, product_id, product_name, quantity, unit_price, order_date)
VALUES
 (1, 101, 1, 'Widget A', 5, 10.00, '2023-01-15'),
 (2, 102, 2, 'Widget B', 2, 12.50, '2023-01-16'),
 (3, 103, 1, 'Widget A', 3, 10.00, '2023-01-16'),
 (4, 104, 3, 'Widget C', 1, 15.75, '2023-01-17'),
 (5, 105, 2, 'Widget B', 4, 12.50, '2023-01-17'),
 (6, 106, 1, 'Widget A', 2, 10.00, '2023-01-18'),
 (7, 107, 4, 'Widget D', 3, 20.00, '2023-01-18'),
 (8, 108, 2, 'Widget B', 5, 12.50, '2023-01-19'),
 (9, 109, 1, 'Widget A', 1, 10.00, '2023-01-19'),
 (10, 101, 3, 'Widget C', 2, 15.75, '2023-01-20');

 SELECT * FROM SALES;

 --1. Retrieve the total sales quantity and revenue for each product.

 SELECT PRODUCT_NAME, SUM(QUANTITY) AS TOTAL_SALES_QUANTITY, SUM(QUANTITY*UNIT_PRICE) AS TOTAL_REVENUE
 FROM SALES
 GROUP BY PRODUCT_NAME;

 --2. Find the total revenue for each customer
 SELECT CUSTOMER_ID, SUM(QUANTITY*UNIT_PRICE) AS TOTAL_REVENUE
 FROM SALES
 GROUP BY CUSTOMER_ID;

 --3. Get the products with more than 10 units sold in a single order.

 SELECT * FROM SALES
 WHERE QUANTITY>10;

 --4. List the customers who have placed orders on at least three different dates.
 SELECT CUSTOMER_ID,COUNT(DISTINCT(ORDER_DATE))
 FROM SALES
 GROUP BY CUSTOMER_ID
 HAVING COUNT(ORDER_DATE)>=3;
 
--5. Calculate the average unit price of products

SELECT PRODUCT_ID, PRODUCT_NAME, ROUND(AVG(UNIT_PRICE),2)
FROM SALES
GROUP BY PRODUCT_ID, PRODUCT_NAME;

--6. Find the products with an average unit price greater than $12.00

SELECT PRODUCT_ID, PRODUCT_NAME, ROUND(AVG(UNIT_PRICE),2) AS AVG_UNIT_PRICE
FROM SALES
GROUP BY PRODUCT_ID, PRODUCT_NAME
HAVING ROUND(AVG(UNIT_PRICE),2)>12;

--7. Retrieve the customers who have spent more than $100.00 in total.
SELECT CUSTOMER_ID, SUM(QUANTITY*UNIT_PRICE) AS TOTAL_REVENUE
FROM SALES
GROUP BY 1
HAVING TOTAL_REVENUE > 100;

--8. List the customers who have purchased 'Widget B' and 'Widget A' in the same order.
SELECT CUSTOMER_ID, PRODUCT_NAME
FROM SALES
WHERE PRODUCT_NAME= 'Widget B' AND PRODUCT_NAME= 'Widget A';