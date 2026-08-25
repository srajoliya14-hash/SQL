CREATE DATABASE subquery_practice;
USE subquery_practice;

-- 1. EMPLOYEES
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    manager_id INT,
    hire_year INT
);

INSERT INTO employees VALUES
(101,'Alice Johnson','IT',72000,NULL,2018),
(102,'Bob Smith','IT',65000,101,2019),
(103,'Carol White','HR',58000,NULL,2017),
(104,'David Brown','HR',54000,103,2020),
(105,'Eva Green','Finance',80000,NULL,2016),
(106,'Frank Black','Finance',75000,105,2018),
(107,'Grace Lee','IT',68000,101,2021),
(108,'Henry Wilson','Marketing',60000,NULL,2017),
(109,'Ivy Turner','Marketing',56000,108,2022),
(110,'Jack Davis','Finance',70000,105,2019),
(111,'Karen Moore','IT',63000,101,2020),
(112,'Leo Harris','HR',50000,103,2021),
(113,'Mia Clark','Marketing',62000,108,2018),
(114,'Nate Lewis','Finance',78000,105,2019),
(115,'Olivia Walker','IT',71000,101,2017),
(116,'Paul Hall','HR',53000,103,2020),
(117,'Quinn Young','Marketing',59000,108,2021),
(118,'Rachel King','Finance',82000,105,2016),
(119,'Sam Scott','IT',66000,101,2022),
(120,'Tina Adams','HR',55000,103,2019);


-- 2. ORDERS
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    status VARCHAR(20)
);

INSERT INTO orders VALUES
(1001,201,301,1500,'2024-01-05','Delivered'),
(1002,202,302,2300,'2024-01-12','Delivered'),
(1003,203,303,800,'2024-02-03','Delivered'),
(1004,201,304,3200,'2024-02-14','Delivered'),
(1005,204,301,1100,'2024-03-01','Pending'),
(1006,205,302,4500,'2024-03-15','Delivered'),
(1007,202,303,950,'2024-03-22','Cancelled'),
(1008,206,304,2100,'2024-04-05','Delivered'),
(1009,203,301,1750,'2024-04-18','Pending'),
(1010,207,302,3300,'2024-04-30','Delivered'),
(1011,204,303,680,'2024-05-10','Cancelled'),
(1012,208,304,2900,'2024-05-22','Delivered'),
(1013,205,301,1200,'2024-06-08','Delivered'),
(1014,201,302,2700,'2024-06-15','Pending'),
(1015,209,303,500,'2024-06-28','Delivered'),
(1016,206,304,3800,'2024-07-07','Delivered'),
(1017,207,301,1600,'2024-07-19','Delivered'),
(1018,210,302,4100,'2024-07-25','Delivered'),
(1019,208,303,720,'2024-08-02','Cancelled'),
(1020,209,304,2200,'2024-08-14','Delivered');


-- 3. PRODUCTS
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price INT,
    stock_qty INT
);

INSERT INTO products VALUES
(301,'Laptop','Electronics',55000,30),
(302,'Smartphone','Electronics',22000,80),
(303,'Headphones','Electronics',3500,120),
(304,'Monitor','Electronics',18000,45),
(305,'Keyboard','Accessories',1500,200),
(306,'Mouse','Accessories',900,250),
(307,'Desk Chair','Furniture',8500,40),
(308,'Standing Desk','Furniture',22000,15),
(309,'Webcam','Electronics',4200,70),
(310,'USB Hub','Accessories',1200,180),
(311,'Notebook','Stationery',150,500),
(312,'Pen Set','Stationery',250,600),
(313,'Printer','Electronics',12000,25),
(314,'Scanner','Electronics',9000,20),
(315,'External SSD','Electronics',7500,60),
(316,'Lamp','Furniture',2200,90),
(317,'Whiteboard','Office Supplies',3800,35),
(318,'Cable Organiser','Accessories',600,300),
(319,'Power Bank','Electronics',2800,100),
(320,'Smart Watch','Electronics',15000,55);


-- 4. CUSTOMERS
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    country VARCHAR(30),
    join_year INT
);

INSERT INTO customers VALUES
(201,'Aarav Mehta','Mumbai','India',2021),
(202,'Priya Sharma','Delhi','India',2020),
(203,'Rohan Gupta','Pune','India',2022),
(204,'Sunita Patel','Ahmedabad','India',2021),
(205,'Vikram Rao','Bangalore','India',2019),
(206,'Neha Singh','Chennai','India',2023),
(207,'Arjun Kumar','Hyderabad','India',2020),
(208,'Deepa Nair','Kochi','India',2022),
(209,'Sanjay Joshi','Jaipur','India',2021),
(210,'Meera Iyer','Coimbatore','India',2023),
(211,'Ravi Verma','Lucknow','India',2020),
(212,'Anita Das','Kolkata','India',2019),
(213,'Kiran Reddy','Vizag','India',2022),
(214,'Pooja Shah','Surat','India',2021),
(215,'Amit Bose','Nagpur','India',2023),
(216,'Tara Menon','Trivandrum','India',2020),
(217,'Nikhil Kulkarni','Nashik','India',2022),
(218,'Swati Chatterjee','Bhopal','India',2019),
(219,'Rahul Pandey','Patna','India',2021),
(220,'Divya Tiwari','Indore','India',2023);


-- 5. DEPARTMENTS
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30),
    budget INT,
    location VARCHAR(30),
    head_id INT
);

INSERT INTO departments VALUES
(1,'IT',500000,'Bangalore',101),
(2,'HR',200000,'Mumbai',103),
(3,'Finance',600000,'Delhi',105),
(4,'Marketing',300000,'Chennai',108);

select * from departments;

-- 1
 SELECT emp_name, department, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY salary DESC;
 -- 2
 SELECT emp_id, emp_name, department, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

 -- 3

 
SELECT emp_id, emp_name, department, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

 -- 4
SELECT emp_name, department, hire_year
FROM employees
WHERE hire_year = (
    SELECT hire_year
    FROM employees
    WHERE emp_id = 118
)
AND emp_id <> 118;
-- Q5. 
SELECT product_name, category, price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
)
ORDER BY price DESC;
-- Q6. 
SELECT product_id, product_name, category, price
FROM products
WHERE price = (
    SELECT MAX(price)
    FROM products
);


-- Q7. 
SELECT product_id, product_name, category, price
FROM products
WHERE price = (
    SELECT MIN(price)
    FROM products
);

 

Q8. Average order amount se greater orders
SELECT order_id, customer_id, amount
FROM orders
WHERE amount > (
    SELECT AVG(amount)
    FROM orders
)
ORDER BY amount DESC;
-- Q9. 
SELECT order_id, customer_id, amount, order_date
FROM orders
WHERE amount = (
    SELECT MAX(amount)
    FROM orders
);

 
-- Q10. 
SELECT customer_id, customer_name, city
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
)
ORDER BY customer_id;
-- Q11.  
SELECT customer_id, customer_name, city
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
)
ORDER BY customer_id;
-- Q12. 
SELECT product_id, product_name, category, price
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM orders
);
-- Q13.  
SELECT product_id, product_name, category, price
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM orders
);
-- Q14. 
SELECT emp_name, salary
FROM employees
WHERE department IN (
    SELECT dept_name
    FROM departments
    WHERE dept_name = 'Finance'
)
ORDER BY salary DESC;
-- Q15. 

 

SELECT emp_name, department, salary
FROM employees
WHERE salary < (
    SELECT MIN(salary)
    FROM employees
    WHERE department = 'Finance'
)
ORDER BY salary DESC;
-- Q16. 
SELECT dept_name, budget, location
FROM departments
WHERE budget = (
    SELECT MAX(budget)
    FROM departments
);

 

-- Q17.  
SELECT customer_id, customer_name, city
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) = 1
);
-- Q18.  
SELECT customer_id, customer_name, city
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) >= 2
)
ORDER BY customer_id;
-- Q19. 
SELECT product_name, category, price
FROM products
WHERE price > (
    SELECT MAX(price)
    FROM products
    WHERE category = 'Accessories'
)
ORDER BY price DESC;
-- Q20.  
SELECT order_id, customer_id, amount, order_date
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE join_year = 2021
)
ORDER BY order_date;
-- Q21. 
SELECT e.emp_id, e.emp_name, e.department
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees x
    WHERE x.manager_id = e.emp_id
)
ORDER BY e.emp_name;

 

-- Q22.    
SELECT e.emp_id, e.emp_name, e.department
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM employees x
    WHERE x.manager_id = e.emp_id
)
ORDER BY e.emp_id;
-- Q23.  
SELECT c.customer_id, c.customer_name, c.city
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
)
ORDER BY c.customer_id;
-- Q24.  
SELECT c.customer_id, c.customer_name, c.city
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
)
ORDER BY c.customer_id;
-- Q25.  
SELECT p.product_id, p.product_name, p.category
FROM products p
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.product_id = p.product_id
)
ORDER BY p.product_id;
-- Q26.  
SELECT emp_name, department, salary
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    WHERE emp_id = 105
)
AND emp_id <> 105
ORDER BY salary DESC;

 

-- Q27.  
SELECT order_id, customer_id, amount, order_date
FROM orders
WHERE order_date = (
    SELECT MAX(order_date)
    FROM orders
);

 
-- Q28.    
SELECT order_id, customer_id, amount, order_date
FROM orders
WHERE order_date = (
    SELECT MIN(order_date)
    FROM orders
);

 

-- Q29.  



SELECT emp_name, department, salary
FROM employees
WHERE salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE department = 'HR'
)
ORDER BY salary DESC;
-- Q30. 
SELECT order_id, customer_id, amount, status
FROM orders
WHERE status = 'Delivered'
AND amount > (
    SELECT AVG(amount)
    FROM orders
    WHERE status = 'Delivered'
)
ORDER BY amount DESC;
-- Q31 
 
SELECT 
    e.emp_name,
    e.department,
    e.salary,
    ROUND((
        SELECT AVG(x.salary)
        FROM employees x
        WHERE x.department = e.department
    ),2) AS dept_avg
FROM employees e
WHERE e.salary > (
    SELECT AVG(x.salary)
    FROM employees x
    WHERE x.department = e.department
)
ORDER BY e.department, e.salary DESC;

 
-- Q32. 
SELECT
    e.emp_name,
    e.department,
    e.salary,
    (
        SELECT COUNT(*)
        FROM employees x
        WHERE x.department = e.department
        AND x.salary > e.salary
    ) AS higher_earners
FROM employees e
ORDER BY e.department, e.salary DESC;
-- Q33. 
SELECT 
    c.customer_id,
    c.customer_name,
    (
        SELECT SUM(o.amount)
        FROM orders o
        WHERE o.customer_id = c.customer_id
    ) AS total_spend
FROM customers c
WHERE (
    SELECT SUM(o.amount)
    FROM orders o
    WHERE o.customer_id = c.customer_id
) > (
    SELECT AVG(total_spend)
    FROM (
        SELECT customer_id, SUM(amount) AS total_spend
        FROM orders
        GROUP BY customer_id
    ) x
)
ORDER BY total_spend DESC;

  -- Q34
SELECT emp_name, department, salary
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    GROUP BY department
    HAVING AVG(salary) > 65000
)
ORDER BY department, salary DESC;
-- Q35.  
SELECT
    o.order_id,
    o.customer_id,
    o.amount,
    CASE
        WHEN o.amount >= (
            SELECT AVG(x.amount)
            FROM orders x
            WHERE x.customer_id = o.customer_id
        )
        THEN 'Above Avg'
        ELSE 'Below Avg'
    END AS vs_cust_avg
FROM orders o
ORDER BY o.customer_id, o.order_id;
-- Q36. 
SELECT
    p.product_name,
    p.category,
    p.price,
    ROUND((
        SELECT AVG(x.price)
        FROM products x
        WHERE x.category = p.category
    ),2) AS cat_avg
FROM products p
WHERE p.price > (
    SELECT AVG(x.price)
    FROM products x
    WHERE x.category = p.category
)
ORDER BY p.category, p.price DESC;
-- Q37. 
 

SELECT emp_name, department, salary
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE department = 'Marketing'
)
ORDER BY salary DESC;

 
 
-- Q38. 
SELECT emp_name, department, salary
FROM employees
WHERE salary < ALL (
    SELECT salary
    FROM employees
    WHERE department = 'Finance'
)
ORDER BY salary DESC;

 

 
-- Q39.  
SELECT c.customer_id, c.customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
)
AND NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
    AND o.status <> 'Delivered'
)
ORDER BY c.customer_id;

-- Q40
select p.product_id, p.product_name, p.category from products as p  
where product_id in (select product_id from orders  where customer_id in (select customer_id from customers where city = 'mumbai'))
order by product_id;

-- Q41
select emp_name, department, salary from employees where salary =
 (select max(salary) from employees);

-- Q42
select department from employees where NOT EXISTS (select department from employees where salary < 50000)
order by department;

-- Q43
select c.customer_id, c.customer_name from customers c where customer_id =
 (select customer_id from orders o where c.customer_id = o.customer_id );-- error
 
 -- 44
 select emp_name, department, salary, hire_year from employees where salary > (select avg(salary) from employees)
 order by   hire_year, salary desc;
 
 -- 45
 
 
 -- 46
 select emp_name, department, salary from employees where salary in 
 (select distinct salary from employees where salary =' 82000, 80000, 78000') ORDER BY salary DESC limit 3;
 
 -- 47
 select customer_id, customer_name from customers where EXISTS (select customer_id from orders where amount = '1000'  );
 
 -- 48 
 select e.emp_name, e.department, e.salary  from employees as e  where salary = (select avg(salary) ,min(salary) ,
  avg(salary) - min(salary)  from departments order by department );