DATA TRANSFORMER SQL PROJECT

Drop database if exists DATA_TRANSFORMER;
Create database DATA_TRANSFORMER;
use Data_Transformer;

create Table Customer_table(
CustomerID int primary key auto_increment ,
first_name varchar(50) not null,
Last_name varchar(50) not null,
email varchar(50) not null,
registration_date date not null
);

insert into customer_table(first_name,Last_name,email,registration_date) values
('john', 'doe', 'john.doe@gmail.com',  '2022-03-15'),
('jane', 'smith', 'jane.smith@gmail.com','2021-11-02'),
('michael', 'johnson', 'michael.johnson@gmail.com', '2022-05-20'),
('emily', 'davis', 'emily.davis@gmail.com', '2021-08-14'),
('david', 'wilson', 'david.wilson@gmail.com', '2023-01-10'),
('sarah', 'brown', 'sarah.brown@gmail.com', '2022-09-25'),
('james', 'miller', 'james.miller@gmail.com', '2020-12-05');
select * from Customer_table;

CREATE TABLE IF NOT EXISTS Orders_table (
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE NOT NULL,
TotalAmount DECIMAL(10,2) NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customer_table(CustomerID)
);

INSERT INTO Orders_table (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 3, '2023-07-05', 175.25),
(104, 4, '2023-07-08', 300.00),
(105, 5, '2023-07-10', 125.50),
(106, 1, '2023-07-12', 250.75),
(107, 2, '2023-07-15', 180.00);

select * from orders_table;

CREATE TABLE IF NOT EXISTS Employees_table (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Department VARCHAR(50) NOT NULL,
HireDate DATE NOT NULL,
Salary DECIMAL(10,2) NOT NULL
);


INSERT INTO Employees_table (EmployeeID, FirstName, LastName, Department, HireDate, Salary)
VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
(3, 'David', 'Smith', 'IT', '2022-05-10', 65000.00),
(4, 'Emily', 'Brown', 'Finance', '2019-08-25', 70000.00),
(5, 'Michael', 'Davis', 'Sales', '2023-02-14', 48000.00),
(6, 'Sarah', 'Wilson', 'HR', '2020-11-05', 58000.00),
(7, 'James', 'Taylor', 'IT', '2021-07-18', 75000.00);

select * from employees_table;

==========================================================================================

-- 1 Orders with matching customer details 

mysql> SELECT c.CustomerID, c.first_name, c.last_name, o.OrderID, o.OrderDate, o.TotalAmount
    -> FROM customer_table c
    -> INNER JOIN orders_table o ON c.CustomerID = o.CustomerID;
+------------+------------+-----------+---------+------------+-------------+
| CustomerID | first_name | last_name | OrderID | OrderDate  | TotalAmount |
+------------+------------+-----------+---------+------------+-------------+
|          1 | john       | doe       |     101 | 2023-07-01 |      150.50 |
|          2 | jane       | smith     |     102 | 2023-07-03 |      200.75 |
|          3 | michael    | johnson   |     103 | 2023-07-05 |      175.25 |
|          4 | emily      | davis     |     104 | 2023-07-08 |      300.00 |
|          5 | david      | wilson    |     105 | 2023-07-10 |      125.50 |
|          1 | john       | doe       |     106 | 2023-07-12 |      250.75 |
|          2 | jane       | smith     |     107 | 2023-07-15 |      180.00 |
+------------+------------+-----------+---------+------------+-------------+
7 rows in set (0.043 sec)

==========================================================================================

-- 2 Retrieve all customers and their corresponding orders,

mysql> SELECT c.CustomerID, c.first_name, c.last_name, c.email, o.OrderID, o.OrderDate, o.TotalAmount
    -> FROM Customer_table AS c
    -> LEFT JOIN Orders_table AS o ON c.CustomerID = o.CustomerID;
+------------+------------+-----------+---------------------------+---------+------------+-------------+
| CustomerID | first_name | last_name | email                     | OrderID | OrderDate  | TotalAmount |
+------------+------------+-----------+---------------------------+---------+------------+-------------+
|          1 | john       | doe       | john.doe@gmail.com        |     101 | 2023-07-01 |      150.50 |
|          1 | john       | doe       | john.doe@gmail.com        |     106 | 2023-07-12 |      250.75 |
|          2 | jane       | smith     | jane.smith@gmail.com      |     102 | 2023-07-03 |      200.75 |
|          2 | jane       | smith     | jane.smith@gmail.com      |     107 | 2023-07-15 |      180.00 |
|          3 | michael    | johnson   | michael.johnson@gmail.com |     103 | 2023-07-05 |      175.25 |
|          4 | emily      | davis     | emily.davis@gmail.com     |     104 | 2023-07-08 |      300.00 |
|          5 | david      | wilson    | david.wilson@gmail.com    |     105 | 2023-07-10 |      125.50 |
|          6 | sarah      | brown     | sarah.brown@gmail.com     |    NULL | NULL       |        NULL |
|          7 | james      | miller    | james.miller@gmail.com    |    NULL | NULL       |        NULL |
+------------+------------+-----------+---------------------------+---------+------------+-------------+
9 rows in set (0.018 sec)

==========================================================================================

-- Retrieve all orders and their corresponding customer details,

mysql> SELECT c.CustomerID, c.first_name, c.last_name, o.OrderID, o.OrderDate, o.TotalAmount
    -> FROM Customer_table AS c
    -> RIGHT JOIN Orders_table AS o ON c.CustomerID = o.CustomerID;
+------------+------------+-----------+---------+------------+-------------+
| CustomerID | first_name | last_name | OrderID | OrderDate  | TotalAmount |
+------------+------------+-----------+---------+------------+-------------+
|          1 | john       | doe       |     101 | 2023-07-01 |      150.50 |
|          2 | jane       | smith     |     102 | 2023-07-03 |      200.75 |
|          3 | michael    | johnson   |     103 | 2023-07-05 |      175.25 |
|          4 | emily      | davis     |     104 | 2023-07-08 |      300.00 |
|          5 | david      | wilson    |     105 | 2023-07-10 |      125.50 |
|          1 | john       | doe       |     106 | 2023-07-12 |      250.75 |
|          2 | jane       | smith     |     107 | 2023-07-15 |      180.00 |
+------------+------------+-----------+---------+------------+-------------+
7 rows in set (0.007 sec)

==========================================================================================

-- 4 FULL OUTER JOIN Using UNION

mysql> SELECT c.CustomerID, c.first_name, c.last_name, o.OrderID, o.OrderDate, o.TotalAmount
    -> FROM Customer_table c
    -> LEFT JOIN Orders_table o ON c.CustomerID = o.CustomerID
    ->
    -> UNION
    ->
    -> SELECT c.CustomerID, c.first_name, c.last_name, o.OrderID, o.OrderDate, o.TotalAmount
    -> FROM Customer_table c
    -> RIGHT JOIN Orders_table o ON c.CustomerID = o.CustomerID;
+------------+------------+-----------+---------+------------+-------------+
| CustomerID | first_name | last_name | OrderID | OrderDate  | TotalAmount |
+------------+------------+-----------+---------+------------+-------------+
|          1 | john       | doe       |     101 | 2023-07-01 |      150.50 |
|          1 | john       | doe       |     106 | 2023-07-12 |      250.75 |
|          2 | jane       | smith     |     102 | 2023-07-03 |      200.75 |
|          2 | jane       | smith     |     107 | 2023-07-15 |      180.00 |
|          3 | michael    | johnson   |     103 | 2023-07-05 |      175.25 |
|          4 | emily      | davis     |     104 | 2023-07-08 |      300.00 |
|          5 | david      | wilson    |     105 | 2023-07-10 |      125.50 |
|          6 | sarah      | brown     |    NULL | NULL       |        NULL |
|          7 | james      | miller    |    NULL | NULL       |        NULL |
+------------+------------+-----------+---------+------------+-------------+
9 rows in set (0.020 sec)

==========================================================================================

-- 5 Find customers whose order amount is greater than the average order amount.

mysql> SELECT c.CustomerID, c.first_name, c.last_name, o.TotalAmount
    -> FROM Customer_table AS c
    -> INNER JOIN Orders_table AS o ON c.CustomerID = o.CustomerID
    -> WHERE o.TotalAmount > (SELECT AVG(TotalAmount) FROM Orders_table);
+------------+------------+-----------+-------------+
| CustomerID | first_name | last_name | TotalAmount |
+------------+------------+-----------+-------------+
|          2 | jane       | smith     |      200.75 |
|          4 | emily      | davis     |      300.00 |
|          1 | john       | doe       |      250.75 |
+------------+------------+-----------+-------------+
3 rows in set (0.011 sec)

==========================================================================================

-- 6 Use a subquery to find employees whose salary is greater than the average salary of all employees.

mysql> SELECT EmployeeID, FirstName, LastName, Department, Salary
    -> FROM Employees_table
    -> WHERE Salary > (SELECT AVG(Salary) FROM Employees_table)
    -> ORDER BY Salary DESC;
+------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          7 | James     | Taylor   | IT         | 75000.00 |
|          4 | Emily     | Brown    | Finance    | 70000.00 |
|          3 | David     | Smith    | IT         | 65000.00 |
+------------+-----------+----------+------------+----------+
3 rows in set (0.024 sec)


==========================================================================================

-- 7 Extract the year and month from an order date

mysql> SELECT OrderID, OrderDate,
    -> YEAR(OrderDate) AS OrderYear,
    -> MONTH(OrderDate) AS OrderMonth
    -> FROM Orders_table;
+---------+------------+-----------+------------+
| OrderID | OrderDate  | OrderYear | OrderMonth |
+---------+------------+-----------+------------+
|     101 | 2023-07-01 |      2023 |          7 |
|     102 | 2023-07-03 |      2023 |          7 |
|     103 | 2023-07-05 |      2023 |          7 |
|     104 | 2023-07-08 |      2023 |          7 |
|     105 | 2023-07-10 |      2023 |          7 |
|     106 | 2023-07-12 |      2023 |          7 |
|     107 | 2023-07-15 |      2023 |          7 |
+---------+------------+-----------+------------+
7 rows in set (0.006 sec)

==========================================================================================

-- 8 Calculate the number of days since each order

mysql> SELECT OrderID, OrderDate, CURDATE() AS CurrentDate,
    -> DATEDIFF(CURDATE(), OrderDate) AS DaysSinceOrder
    -> FROM Orders_table
    -> ORDER BY OrderDate;
+---------+------------+-------------+----------------+
| OrderID | OrderDate  | CurrentDate | DaysSinceOrder |
+---------+------------+-------------+----------------+
|     101 | 2023-07-01 | 2026-10-18  |           1205 |
|     102 | 2023-07-03 | 2026-10-18  |           1203 |
|     103 | 2023-07-05 | 2026-10-18  |           1201 |
|     104 | 2023-07-08 | 2026-10-18  |           1198 |
|     105 | 2023-07-10 | 2026-10-18  |           1196 |
|     106 | 2023-07-12 | 2026-10-18  |           1194 |
|     107 | 2023-07-15 | 2026-10-18  |           1191 |
+---------+------------+-------------+----------------+
7 rows in set (0.009 sec)

==========================================================================================

-- 9 Format the order date as DD-MMM-YYYY

mysql> SELECT OrderID, OrderDate,
    -> DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate
    -> FROM Orders_table
    -> ORDER BY OrderDate;
+---------+------------+---------------+
| OrderID | OrderDate  | FormattedDate |
+---------+------------+---------------+
|     101 | 2023-07-01 | 01-Jul-2023   |
|     102 | 2023-07-03 | 03-Jul-2023   |
|     103 | 2023-07-05 | 05-Jul-2023   |
|     104 | 2023-07-08 | 08-Jul-2023   |
|     105 | 2023-07-10 | 10-Jul-2023   |
|     106 | 2023-07-12 | 12-Jul-2023   |
|     107 | 2023-07-15 | 15-Jul-2023   |
+---------+------------+---------------+
7 rows in set (0.008 sec)


==========================================================================================

-- 10 Combine first name and last name using CONCAT()

mysql> SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS FullName,
    -> Department, Salary
    -> FROM Employees_table;
+------------+---------------+------------+----------+
| EmployeeID | FullName      | Department | Salary   |
+------------+---------------+------------+----------+
|          1 | Mark Johnson  | Sales      | 50000.00 |
|          2 | Susan Lee     | HR         | 55000.00 |
|          3 | David Smith   | IT         | 65000.00 |
|          4 | Emily Brown   | Finance    | 70000.00 |
|          5 | Michael Davis | Sales      | 48000.00 |
|          6 | Sarah Wilson  | HR         | 58000.00 |
|          7 | James Taylor  | IT         | 75000.00 |
+------------+---------------+------------+----------+
7 rows in set (0.008 sec)


==========================================================================================

-- 11 Replace John with Jonathan using REPLACE()

mysql> SELECT CustomerID, first_name,
    -> REPLACE(first_name, 'John', 'Jonathan') AS UpdatedFirstName,
    -> last_name, email
    -> FROM Customer_table;
+------------+------------+------------------+-----------+---------------------------+
| CustomerID | first_name | UpdatedFirstName | last_name | email                     |
+------------+------------+------------------+-----------+---------------------------+
|          1 | john       | john             | doe       | john.doe@gmail.com        |
|          2 | jane       | jane             | smith     | jane.smith@gmail.com      |
|          3 | michael    | michael          | johnson   | michael.johnson@gmail.com |
|          4 | emily      | emily            | davis     | emily.davis@gmail.com     |
|          5 | david      | david            | wilson    | david.wilson@gmail.com    |
|          6 | sarah      | sarah            | brown     | sarah.brown@gmail.com     |
|          7 | james      | james            | miller    | james.miller@gmail.com    |
+------------+------------+------------------+-----------+---------------------------+
7 rows in set (0.043 sec)

==========================================================================================

-- 12 Convert names to uppercase and lowercase

mysql> SELECT EmployeeID,
    -> UPPER(FirstName) AS UpperFirstName,
    -> LOWER(LastName) AS LowerLastName
    -> FROM Employees_table;
+------------+----------------+---------------+
| EmployeeID | UpperFirstName | LowerLastName |
+------------+----------------+---------------+
|          1 | MARK           | johnson       |
|          2 | SUSAN          | lee           |
|          3 | DAVID          | smith         |
|          4 | EMILY          | brown         |
|          5 | MICHAEL        | davis         |
|          6 | SARAH          | wilson        |
|          7 | JAMES          | taylor        |
+------------+----------------+---------------+
7 rows in set (0.018 sec)

==========================================================================================

-- 13 Remove extra spaces using TRIM()

mysql> SELECT CustomerID,
    -> email AS OriginalEmail,
    -> TRIM(email) AS CleanEmail
    -> FROM Customer_table;
+------------+---------------------------+---------------------------+
| CustomerID | OriginalEmail             | CleanEmail                |
+------------+---------------------------+---------------------------+
|          1 | john.doe@gmail.com        | john.doe@gmail.com        |
|          2 | jane.smith@gmail.com      | jane.smith@gmail.com      |
|          3 | michael.johnson@gmail.com | michael.johnson@gmail.com |
|          4 | emily.davis@gmail.com     | emily.davis@gmail.com     |
|          5 | david.wilson@gmail.com    | david.wilson@gmail.com    |
|          6 | sarah.brown@gmail.com     | sarah.brown@gmail.com     |
|          7 | james.miller@gmail.com    | james.miller@gmail.com    |
+------------+---------------------------+---------------------------+
7 rows in set (0.033 sec)

==========================================================================================

-- 14 Calculate a running total using SUM()

mysql> SELECT OrderID, OrderDate, TotalAmount,
    -> SUM(TotalAmount) OVER
    -> ( ORDER BY OrderDate, OrderID
    -> ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
    -> FROM orders_table
    -> ORDER BY OrderDate, OrderID;
+---------+------------+-------------+--------------+
| OrderID | OrderDate  | TotalAmount | RunningTotal |
+---------+------------+-------------+--------------+
|     101 | 2023-07-01 |      150.50 |       150.50 |
|     102 | 2023-07-03 |      200.75 |       351.25 |
|     103 | 2023-07-05 |      175.25 |       526.50 |
|     104 | 2023-07-08 |      300.00 |       826.50 |
|     105 | 2023-07-10 |      125.50 |       952.00 |
|     106 | 2023-07-12 |      250.75 |      1202.75 |
|     107 | 2023-07-15 |      180.00 |      1382.75 |
+---------+------------+-------------+--------------+
7 rows in set (0.010 sec)

==========================================================================================

-- 15 Rank orders by amount using RANK()

mysql> SELECT
    -> OrderID,
    -> OrderDate,
    -> TotalAmount,
    -> RANK() OVER (ORDER BY TotalAmount DESC) AS OrderRank
    -> FROM Orders_table;
+---------+------------+-------------+-----------+
| OrderID | OrderDate  | TotalAmount | OrderRank |
+---------+------------+-------------+-----------+
|     104 | 2023-07-08 |      300.00 |         1 |
|     106 | 2023-07-12 |      250.75 |         2 |
|     102 | 2023-07-03 |      200.75 |         3 |
|     107 | 2023-07-15 |      180.00 |         4 |
|     103 | 2023-07-05 |      175.25 |         5 |
|     101 | 2023-07-01 |      150.50 |         6 |
|     105 | 2023-07-10 |      125.50 |         7 |
+---------+------------+-------------+-----------+
7 rows in set (0.009 sec)

==========================================================================================

-- 16 Categorize Orders by Discount Using CASE

mysql> SELECT OrderID, TotalAmount,
    -> CASE
    -> WHEN TotalAmount > 1000 THEN '10% Discount'
    -> WHEN TotalAmount > 500 THEN '5% Discount'
    -> ELSE 'No Discount'
    -> END AS DiscountCategory
    -> FROM Orders_table;
+---------+-------------+------------------+
| OrderID | TotalAmount | DiscountCategory |
+---------+-------------+------------------+
|     101 |      150.50 | No Discount      |
|     102 |      200.75 | No Discount      |
|     103 |      175.25 | No Discount      |
|     104 |      300.00 | No Discount      |
|     105 |      125.50 | No Discount      |
|     106 |      250.75 | No Discount      |
|     107 |      180.00 | No Discount      |
+---------+-------------+------------------+
7 rows in set (0.008 sec)

==========================================================================================

-- 17 Categorize Employees by Salary Using CASE

mysql> SELECT
    -> EmployeeID,
    -> CONCAT(FirstName, ' ', LastName) AS EmployeeName, Department, Salary,
    -> CASE
    -> WHEN Salary >= 70000 THEN 'High'
    -> WHEN Salary >= 50000 THEN 'Medium'
    -> ELSE 'Low'
    -> END AS SalaryCategory
    -> FROM Employees_table
    -> ORDER BY Salary DESC;
+------------+---------------+------------+----------+----------------+
| EmployeeID | EmployeeName  | Department | Salary   | SalaryCategory |
+------------+---------------+------------+----------+----------------+
|          7 | James Taylor  | IT         | 75000.00 | High           |
|          4 | Emily Brown   | Finance    | 70000.00 | High           |
|          3 | David Smith   | IT         | 65000.00 | Medium         |
|          6 | Sarah Wilson  | HR         | 58000.00 | Medium         |
|          2 | Susan Lee     | HR         | 55000.00 | Medium         |
|          1 | Mark Johnson  | Sales      | 50000.00 | Medium         |
|          5 | Michael Davis | Sales      | 48000.00 | Low            |
+------------+---------------+------------+----------+----------------+
7 rows in set (0.008 sec)

==========================================================================================


























