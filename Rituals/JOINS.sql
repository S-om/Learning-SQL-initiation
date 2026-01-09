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

