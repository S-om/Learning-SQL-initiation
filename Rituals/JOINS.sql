-- Basics 
-- NO JOIN

-- Retrieve all data from customers and orders separetely

SELECT * FROM customers;
SELECT * FROM orders;


-- INNER JOIN

-- Get all customers along with their orders but only for customers 
-- who have placed and order 

SELECT 
    customers.id,
    customers.first_name,
    orders.order_id,
    orders.sales
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id

-- Defining the full table name can be very lengthy so what we do is provide alias

SELECT 
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id

-- in INNER JOIN order of the tables doesnt matter 
-- INNER JOIN can be used to i) Recombine Data ii) Filtering

-- LEFT JOIN
-- Get all customers along with the orders including those without orders

SELECT 
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
LEFT JOIN orders as o 
ON c.id = o.customer_id


-- LEFT JOIN can be used to i) Recombine Data ii) Extra Info iii) Filtering (in certain cases)

-- RIGHT JOIN 

-- Get all customers along with their orders , including orders 
-- without matching customers

SELECT 
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
RIGHT JOIN orders as o 
ON c.id = o.customer_id


-- Solving the above task but can only use LEFT JOIN

SELECT 
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM orders as o 
LEFT JOIN customers AS c
ON c.id = o.customer_id



-- FULL JOIN
-- Get all customers and orders , even if there is no match

SELECT 
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id



-- Advanced JOINS

-- LEFT ANTI JOIN

-- Get all customers who havent placed any order 

SELECT *
FROM customers AS c
LEFT JOIN orders as o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL


-- RIGHT ANTI JOIN

-- Get all orders without matching customers

SELECT *
FROM customers AS c
RIGHT JOIN orders as o 
ON c.id = o.customer_id
WHERE c.id IS NULL


-- Solve the above task by using only LEFT JOIN

SELECT *
FROM  orders as o
LEFT JOIN customers AS c
ON c.id = o.customer_id
WHERE c.id IS NULL



-- FULL ANTI JOIN

-- Find customers without orders and orders without customers 

SELECT *
FROM customers AS c 
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL OR o.customer_id IS NULL
--
-- Bonus 

-- Get all customers along with their orders but only for customers who have placed an order 
-- Without using INNER JOIN

SELECT *
FROM customers AS c 
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NOT NULL AND o.customer_id IS NOT NULL

--or

SELECT *
FROM customers AS c 
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL 

-- CROSS JOIN
-- All possible combinations  -Cartesian Join-
-- Normally very small amount of scenarios where it can be used 
-- ,i.e, test data , color combinations for products ,....,

SELECT *
FROM customers
CROSS JOIN orders


