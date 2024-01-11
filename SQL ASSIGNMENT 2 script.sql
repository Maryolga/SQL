USE DATABASE SQL; 
USE SCHEMA PUBLIC; 

CREATE TABLE Employees 
(
 employee_id INT PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 department VARCHAR(50),
 hire_date DATE,
 salary INT
);

INSERT INTO Employees (employee_id, first_name, last_name, department, hire_date, salary)
VALUES
 (1, 'John', 'Doe', 'HR', '2020-01-15', 50000),
 (2, 'Jane', 'Smith', 'IT', '2019-04-20', 60000),
 (3, 'Michael', 'Johnson', 'Finance', '2021-08-10', 55000),
 (4, 'Emily', 'Davis', 'Marketing', '2018-02-05', 52000),
 (5, 'David', 'Wilson', 'IT', '2022-03-30', 62000);

select * from EMPLOYEES;

-- 1. Retrieve the first and last names of all employees

select first_name, last_name from employees;


--2. Find the total number of employees in the company

SELECT COUNT(EMPLOYEE_ID) AS TOT_NUM_OF_EMPLOYEES FROM EMPLOYEES;

--3. Get the names of employees who work in the IT department

SELECT FIRST_NAME|| ' ' ||LAST_NAME AS EMP_FULLNAME, DEPARTMENT
FROM EMPLOYEES
WHERE DEPARTMENT = 'IT';

--4. Calculate the average salary of all employees.

SELECT ROUND(AVG(SALARY),2) AS AVERAGE_SALARY_ALL_EMP
FROM EMPLOYEES;

--5. Find the employee with the highest salary.
SELECT EMPLOYEE_ID,FIRST_NAME|| ' ' || LAST_NAME AS EMP_FULLNAME, SALARY
FROM EMPLOYEES
WHERE SALARY = 
(SELECT MAX(SALARY) AS HIGHEST_SAL
FROM EMPLOYEES);

--6. List the employees hired before January 1, 2021, along with their hire dates

SELECT EMPLOYEE_ID,FIRST_NAME|| ' ' || LAST_NAME AS EMP_FULLNAME,HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE<'2021-01-01';

