USE DATABASE SQL; 
USE SCHEMA PUBLIC; 

CREATE TABLE customers (
 customer_id INT PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 gender VARCHAR(10),
 city VARCHAR(50),
 age INT
);

INSERT INTO customers (customer_id, first_name, last_name, gender, city, age)
VALUES
 (1, 'John', 'Doe', 'Male', 'New York', 35),
 (2, 'Jane', 'Smith', 'Female', 'Los Angeles', 28),
 (3, 'Michael', 'Johnson', 'Male', 'Chicago', 45),
 (4, 'Emily', 'Davis', 'Female', 'Houston', 22),
 (5, 'David', 'Wilson', 'Male', 'Miami', 40),
 (6, 'Lisa', 'Brown', 'Female', 'New York', 32),
 (7, 'William', 'Lee', 'Male', 'Los Angeles', 29),
 (8, 'Sarah', 'White', 'Female', 'Chicago', 50),
 (9, 'James', 'Harris', 'Male', 'Houston', 37),
 (10, 'Maria', 'Martin', 'Female', 'Miami', 24);

 SELECT * FROM CUSTOMERS;

 --1. Retrieve the first and last names of all customers.

 SELECT FIRST_NAME|| ' ' ||LAST_NAME AS CUST_FULLNAME
 FROM CUSTOMERS;

 --2. Find the total number of customers in the dataset.

 SELECT COUNT(DISTINCT(CUSTOMER_ID)) AS TOT_NO_CUST
 FROM CUSTOMERS;

 --3. Get the names of male customers.
  SELECT FIRST_NAME|| ' ' ||LAST_NAME AS CUST_FULLNAME, GENDER
  FROM CUSTOMERS
  WHERE GENDER = 'Male';

  --4. Find customers who are aged 30 or older.
  SELECT FIRST_NAME|| ' ' ||LAST_NAME AS CUST_FULLNAME, AGE
  FROM CUSTOMERS
  WHERE AGE >=30;

  --5. List customers from New York.
   SELECT FIRST_NAME|| ' ' ||LAST_NAME AS CUST_FULLNAME, CITY
  FROM CUSTOMERS
  WHERE CITY = 'New York';

  --6. Retrieve customers whose first name starts with 'J'
  SELECT * FROM CUSTOMERS
  WHERE FIRST_NAME LIKE 'J%';

  --7. Find customers aged between 25 and 35 (inclusive).
  SELECT * FROM CUSTOMERS
  WHERE AGE BETWEEN 25 AND 35;

  --8. Get female customers from Los Angeles or male customers from Chicago.
  SELECT * FROM CUSTOMERS
  WHERE (GENDER = 'Female' AND CITY = 'Los Angeles') OR (GENDER = 'Male' AND CITY = 'Chicago');

  --9. List customers who are either from Miami or aged 50 or older.
  SELECT * FROM CUSTOMERS
  WHERE CITY ='Miami' OR AGE >=50;

  --10. Find customers with names 'John' or 'Jane' and aged less than 30.
  SELECT * FROM CUSTOMERS
  WHERE (FIRST_NAME IN ('John','Jane')) AND AGE <30;