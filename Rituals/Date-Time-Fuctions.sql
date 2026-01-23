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

SELECT 
    CreationTime,
    DATEPART(YEAR , CreationTime) Year_dp,
    DATEPART(MONTH , CreationTime) Month_dp,
    DATEPART(DAY , CreationTime) Day_dp,
    DATEPART(HOUR , CreationTime) Hour_dp,
    DATEPART(QUARTER , CreationTime) Quarter_dp


FROM Sales.Orders