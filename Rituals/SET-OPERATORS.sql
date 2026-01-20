-- ORDER BY can only be used once in each SELECT query 
-- The number of Columns in each query must be same  
USE SalesDB
SELECT 
    FirstName,
    LastName
FROM Sales.Customers

UNION 

SELECT 
    FirstName , 
    LastName
FROM Sales.Employees


-- UNION [Removes duplicates and returns rows]

-- Combine the data from employees and customers into one table 

SELECT 
    FirstName,
    LastName
FROM Sales.Customers

UNION

SELECT 
    FirstName,
    LastName
FROM Sales.Employees


-- UNION ALL [returns all rows including duplicates]

-- Combine the data from employees and customers into one table including duplicates

SELECT 
    FirstName,
    LastName
FROM Sales.Customers

UNION ALL

SELECT 
    FirstName,
    LastName
FROM Sales.Employees;


/* EXCEPT 
- Return all distinct rows from the first query that are not found in the second 
 query
- It is the only set operator where the order of the queries affect the final result
*/

SELECT 
    FirstName,
    LastName
FROM Sales.Customers

EXCEPT

SELECT 
    FirstName,
    LastName
FROM Sales.Employees;


-- Find the employees who are not customers at the same time

SELECT 
    FirstName,
    LastName
FROM Sales.Employees

EXCEPT

SELECT 
    FirstName,
    LastName
FROM Sales.Customers;


-- INTERSECT 
-- Returns common rows between two tables

-- Find the employees who are also customers 

SELECT 
    FirstName,
    LastName
FROM Sales.Employees

INTERSECT

SELECT 
    FirstName,
    LastName
FROM Sales.Customers;

-- Combine information 

-- Orders are stored in separate tables (Orders and OrdersArchive)
-- Combine all orders data into one table without duplicates 

SELECT * FROM Sales.Orders;
SELECT * FROM Sales.OrdersArchive


SELECT 
    'Orders' AS SourceTable
    ,[OrderID]
    ,[ProductID]
    ,[CustomerID]
    ,[SalesPersonID]
    ,[OrderDate]
    ,[ShipDate]
    ,[OrderStatus]
    ,[ShipAddress]
    ,[BillAddress]
    ,[Quantity]
    ,[Sales]
    ,[CreationTime]
FROM Sales.Orders
UNION
SELECT 
    'OrdersArchive' AS SourceTable
    ,[OrderID]
    ,[ProductID]
    ,[CustomerID]
    ,[SalesPersonID]
    ,[OrderDate]
    ,[ShipDate]
    ,[OrderStatus]
    ,[ShipAddress]
    ,[BillAddress]
    ,[Quantity]
    ,[Sales]
    ,[CreationTime]
FROM Sales.OrdersArchive
ORDER BY OrderID



/* DELTA DETECTION
- Identifying the differences or changes (delta) between two batches of data.
- We use EXCEPT to do this 


- DATA COMPLETENESS CHECK 
- EXCEPT operator an be used to compare tables to detect discripancies between databases

*/

SELECT FirstName , LastName FROM Sales.Employees
EXCEPT
SELECT FirstName , LastName FROM Sales.Customers


