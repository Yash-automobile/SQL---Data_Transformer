# Data Transformer SQL Project

## Project Overview

The **Data Transformer SQL Project** is a MySQL-based database project designed to demonstrate and practice essential SQL concepts used in data analysis. It focuses on managing customer, order, and employee data while performing data retrieval, transformation, filtering, and analysis using SQL queries.

## Project Objectives

- Create and manage relational databases and tables.
- Understand primary keys and foreign key relationships.
- Retrieve and analyze data using SQL joins.
- Perform subqueries and aggregate calculations.
- Extract and format dates using SQL date functions.
- Transform text data using string functions.
- Calculate running totals and rank records using window functions.
- Categorize data using conditional logic with `CASE`.

## Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Tools:** MySQL Workbench / MySQL Command Line Client

## Database Structure

This project contains three tables:

### 1. Customer_table

Stores customer information.

- `CustomerID` – Unique customer identifier
- `first_name` – Customer's first name
- `Last_name` – Customer's last name
- `email` – Customer's email address
- `registration_date` – Customer registration date

### 2. Orders_table

Stores order information.

- `OrderID` – Unique order identifier
- `CustomerID` – Customer associated with the order
- `OrderDate` – Date of the order
- `TotalAmount` – Total order amount

### 3. Employees_table

Stores employee information.

- `EmployeeID` – Unique employee identifier
- `FirstName` – Employee's first name
- `LastName` – Employee's last name
- `Department` – Employee's department
- `HireDate` – Employee's joining date
- `Salary` – Employee's salary

## SQL Concepts Covered

The project demonstrates the following SQL operations:

1. **INNER JOIN** – Retrieve orders with matching customer details.
2. **LEFT JOIN** – Retrieve all customers and their corresponding orders.
3. **RIGHT JOIN** – Retrieve orders with their corresponding customer details.
4. **FULL OUTER JOIN Simulation** – Combine LEFT JOIN and RIGHT JOIN results using `UNION`.
5. **Subqueries** – Find orders above the average order amount.
6. **Average Salary Analysis** – Identify employees earning above the average salary.
7. **Date Extraction** – Extract the year and month from order dates.
8. **Date Difference** – Calculate the number of days since each order.
9. **Date Formatting** – Format dates as `DD-MMM-YYYY`.
10. **CONCAT()** – Combine employee first and last names.
11. **REPLACE()** – Demonstrate text replacement in customer names.
12. **UPPER() and LOWER()** – Convert text to uppercase and lowercase.
13. **TRIM()** – Remove leading and trailing spaces.
14. **Running Total** – Calculate cumulative order amounts using `SUM() OVER()`.
15. **RANK()** – Rank orders according to their total amount.
16. **CASE Statement** – Categorize orders based on discount thresholds.
17. **Salary Categorization** – Classify employees into High, Medium, and Low salary categories.

## How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Download or clone this repository.
3. Open the `DATA_Transformer.sql` file in MySQL Workbench.
4. Execute the database creation and table creation statements.
5. Insert the sample records into the tables.
6. Execute the SQL queries to explore the results.

**Note:** The script drops and recreates the `DATA_TRANSFORMER` database. Running it again will delete the existing database with that name and recreate it. Back up any important data before execution. Remove MySQL command-line prompts and sample output tables if they cause syntax errors in your SQL editor.

## Key Learning Outcomes

Through this project, I practised:

- Relational database design and table relationships.
- Data retrieval and filtering.
- Joining multiple tables.
- Data transformation using built-in SQL functions.
- Analytical calculations using subqueries and aggregate functions.
- Window functions for ranking and cumulative calculations.
- Conditional categorization using `CASE`.

## Future Improvements

- Add more sample customer, order, and employee records.
- Perform sales analysis by customer and month.
- Analyze department-wise salary distributions.
- Add more advanced SQL queries and business insights.
- Connect the database to Power BI to create interactive dashboards.

## Project Files

- `DATA_Transformer.sql` – Contains database creation statements, sample data, and SQL practice queries.
- `README.md` – Project documentation.

