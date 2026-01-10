-- MULTI JOINS 

-- Using the SalesDb , Retrieve a list of all orders  along with the related customer , 

SELECT * FROM Sales.Customers ; 
SELECT * FROM Sales.Employees ;
SELECT * FROM Sales.Orders ;  
SELECT * FROM Sales.Products ; 

SELECT 
    so.Sales,
    so.OrderID,
    CONCAT_WS(' ',sc.FirstName,sc.LastName) AS CustomerName,
    sp.Product AS 'ProductName',
    sp.Price,
    CONCAT_WS(' ',se.FirstName,se.LastName) AS SalesPersonName,
    se.Gender
   


FROM Sales.Orders AS so 
LEFT JOIN Sales.Customers as sc
ON so.CustomerID = sc.CustomerID
LEFT JOIN Sales.Products as sp
ON so.ProductID = sp.ProductID
LEFT JOIN Sales.Employees as se
ON so.SalesPersonID = se.EmployeeID

