-- Part Extraction

SELECT 
    OrderID,
    DAY(OrderDate) Day,
    MONTH(OrderDate) Month,
    YEAR(OrderDate) Year,
    CONCAT_WS('-', DAY(OrderDate),MONTH(OrderDate),YEAR(OrderDate)) OverallDate,
    OrderDate,
    ShipDate,
    CreationTime
FROM Sales.Orders


-- SELECT 
--     FirstName,
--     LastName,
--     CONCAT(FirstName,'.mba','@npti.ac.in') MailId

-- FROM Sales.Customers 



-- DATEPART
USE SalesDB



SELECT 
    CreationTime,
    -- DATEPART examples
    DATEPART(HOUR , CreationTime) Hour_dp,
    DATEPART(QUARTER , CreationTime) Quarter_dp,
    -- DATENAME examples
    DATENAME(MONTH, CreationTime) Month_name,
    DATENAME(WEEKDAY, CreationTime) Weekday_name,
    -- DATETRUNC() examples
    DATETRUNC(MINUTE , CreationTime)
FROM Sales.Orders


SELECT 
    DATETRUNC(MONTH , CreationTime) Creation,
    Count(*) No_of_orders
FROM Sales.Orders
GROUP BY DATETRUNC(MONTH , CreationTime)

-- How many orders were placed each year ?

SELECT 
    YEAR(OrderDate),
    COUNT(*) NoOfOrders
FROM Sales.Orders
GROUP BY YEAR(OrderDate)

-- How many orders were placed each month ?

SELECT 
    MONTH(OrderDate),
    COUNT(*) NoOfOrders
FROM Sales.Orders
GROUP BY MONTH(OrderDate)


SELECT 
    DATENAME(MONTH , OrderDate) OrderDate,
    COUNT(*) NoOfOrders
FROM Sales.Orders
GROUP BY DATENAME(MONTH , OrderDate)


-- Show all orders that were placed during the month February

SELECT *
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2



-- Formatting and Casting

/*Date Format 
YYYY-MM-dd HH-mm-ss [International Standard (Iso 8601)]
*/


SELECT 
    OrderDate,
    FORMAT(OrderDate , 'MM-dd-yyyy'),
    FORMAT(OrderDate , 'dd/MM/yyyy')
FROM Sales.Orders


-- Show CreationTime using the following format
-- Day Wed Jan Q1 2025 12:34:56 PM

SELECT 
    CreationTime ,
    'Day ' + FORMAT(CreationTime , 'ddd MMM ')+ 'Q' 
    + DATENAME(QUARTER,CreationTime) + FORMAT(CreationTime , ' yyyy hh:mm:ss tt') CustomFormat
FROM Sales.Orders

SELECT
    FORMAT(OrderDate , 'MMM yy'),
    COUNT(*)
FROM Sales.Orders
GROUP BY FORMAT(OrderDate , 'MMM yy')


-- CONVERT 

SELECT CONVERT(varchar , GETDATE() ,34);
SELECT (CONVERT(varchar , GETDATE() ));


SELECT 
    CONVERT(INT , '123') AS [String to Int CONVERT]


SELECT
    CreationTime,
    CONVERT(VARCHAR , CreationTime , 32) AS [DATETIME to VARCHAR USA Std],
    CONVERT(VARCHAR , CreationTime , 34) AS [DATETIME to VARCHAR EU Std]
FROM Sales.Orders




SELECT CAST('123' AS INT )


-- Calculations

-- Date Add


SELECT
    OrderDate,
    DATEADD(  YEAR , 3 ,OrderDate) ThreeYearsLater,
    DATEADD(  MONTH , -3 ,OrderDate) ThreeMonthsBefore
FROM Sales.Orders


-- Find the average shipping duration in days for each month
SELECT 
    DATENAME(MONTH , OrderDate) OrderMonth,
    AVG(DATEDIFF(DAY , OrderDate , ShipDate) ) AvgShippingDuration
FROM Sales.Orders
GROUP BY DATENAME(MONTH , OrderDate)


-- Calculate the age of Employees
SELECT 
    EmployeeID,
    BirthDate,
    YEAR(GETDATE()) CurrentYear,
    DATEDIFF(YEAR , BirthDate , GETDATE()) Age
FROM Sales.Employees
 

-- Time Gap Analysis
-- Find the number of days between each order and the previous order 

SELECT 
    OrderID,
    OrderDate CurrentOrderDate,
    LAG(OrderDate) OVER (ORDER BY OrderDate) PreviousOrderDate,
    DATEDIFF(day  ,  LAG(OrderDate) OVER (ORDER BY OrderDate) , OrderDate) DateDifference
FROM Sales.Orders


-- Date Validation 

-- ISDATE

SELECT ISDATE('12-05-2025')


    -- CAST(OrderDate AS DATE ) OrderDate
SELECT
    OrderDate,
    ISDATE(OrderDate),
    CASE WHEN ISDATE(OrderDate) = 1 THEN CAST(OrderDate AS DATE ) 
        ELSE '9999-01-01'
    END NewOrderDate
FROM 
(
    
    SELECT '2025-08-20' OrderDate UNION 
    SELECT '2025-08-21'  UNION 
    SELECT '2025-08-23'  UNION 
    SELECT '2025-08'   
)t
-- WHERE ISDATE(OrderDate) = 0