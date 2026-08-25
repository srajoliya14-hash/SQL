CREATE DATABASE sql_interview_db;

USE sql_interview_db;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DeptID INT,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    HireDate DATE,
    ManagerID INT,
    Gender CHAR(1),
    Email VARCHAR(100),

    FOREIGN KEY (DeptID)
    REFERENCES Departments(DeptID),

    FOREIGN KEY (ManagerID)
    REFERENCES Employees(EmpID)
);


INSERT INTO Departments (DeptID, DeptName)
VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Finance'),
(40, 'Sales'),
(50, 'Marketing');


INSERT INTO Employees
(EmpID, Name, DeptID, Salary, HireDate, ManagerID, Gender, Email)
VALUES
(101, 'Ravi', 10, 55000, '2022-01-10', NULL, 'M', 'ravi@gmail.com'),
(102, 'Anita', 20, 62000, '2021-05-15', NULL, 'F', 'anita@gmail.com'),
(103, 'Sameer', 10, 48000, '2023-02-20', 101, 'M', 'sameer@gmail.com'),
(104, 'Rahul', 10, 75000, '2020-08-12', 101, 'M', 'rahul@gmail.com'),
(105, 'Neha', 30, 68000, '2022-11-05', NULL, 'F', 'neha@gmail.com'),
(106, 'Amit', 30, 45000, '2024-01-18', 105, 'M', 'amit@gmail.com'),
(107, 'Priya', 40, 58000, '2023-06-25', NULL, 'F', 'priya@gmail.com'),
(108, 'Karan', 40, 72000, '2021-09-30', 107, 'M', 'karan@gmail.com'),
(109, 'Pooja', 50, 52000, '2024-03-10', NULL, 'F', 'pooja@gmail.com'),
(110, 'Arjun', 50, 85000, '2020-12-20', 109, 'M', 'arjun@gmail.com');


select * from employees;

select emp_name, salary from employees;

select * from employees where department_id = 1;

select * from employees where salary>50000;

select * from employees where salary between 40000 and 60000;

select * from employees where departments in (10,20,30);

select * from employees where emp_name like 'A%';

select * from employees where emp_name like '%n';

select * from employees where emp_name like '%ar%';

select * from employees where emp_name like '_____';

select * from employees where  manager_id is null;

 
select emp_name , salary from employees order by salary desc;

select department_id,emp_name from employees order by department_id asc, salary desc;

select emp_name,salary from employees order by salary desc limit 5;

select * from employees where department_id not in (10,20);

select count(*) from employees;

select sum(salary) from employees;

select avg(salary) from employees;

select max(salary) ,min(salary) from employees;

select department_id ,count(*) from employees group by department_id;

select department_id ,avg(salary) from employees group by department_id;

select department_id ,count(*) from employees group by department_id having count(*)>5;

select department_id ,sum(salary) as totalsalary from employees group by department_id order by totalsalary desc;

select count(distinct department_id) as DeptCount from employees ;

select department_id ,avg(salary) from employees group by department_id having avg(salary)>6000;

select  year(hire_date) as hireyear, count(*) from employees group by year(hire_date) order by hireyear;

select department_id ,sum(salary) as totalsalary from employees group by department_id order by totalsalary desc limit 1;

SELECT MAX(Salary) AS SecondHighest FROM Employees WHERE Salary < (SELECT MAX(Salary) FROM Employees);

