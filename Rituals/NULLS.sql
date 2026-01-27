USE SalesDB

SELECT 
    ISNULL(ShipAddress , 'unknown') ShipAddress
FROM Sales.Orders



SELECT 
    ISNULL(ShipAddress , BillAddress) ShipAddress
FROM Sales.Orders