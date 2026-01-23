-- Single Row Functions 

--- String Functions

---- Manipulations

-- CONCAT


CREATE TABLE pp (
    id INT NOT NULL ,
    firstName VARCHAR(50),
    lastName VARCHAR (50),
    CONSTRAINT pk_pp PRIMARY KEY(id)
)

INSERT INTO pp 
VALUES
    (1 , 'Somesh' , 'Mohanty'),
    (2 , 'Shree' , 'Kanungo'),
    (3 , 'Seeddhartha' , 'Mohantee')

SELECT * FROM pp


SELECT 
    id,
    CONCAT(firstName ,' ',lastName) AS fullName
FROM pp 

USE SalesDB
SELECT 
    CONCAT(FirstName , ' ' , Country) AS name_country
 FROM Sales.Customers


SELECT 
    CONCAT_WS( ' ', FirstName , Country) AS name_country
 FROM Sales.Customers


SELECT 
    LastName ,
    LOWER(LastName) AS lower_name,
    UPPER(LastName) AS upper_name
FROM Sales.Customers

USE MyDatabase
-- TRIM 

SELECT
    first_name,
    LEN(first_name) AS len_name
FROM customers
WHERE first_name != TRIM(first_name)


SELECT
    first_name,
    LEN(first_name) AS len_name,
    TRIM(first_name) AS trimmed_name,
    LEN(TRIM(first_name)) AS len_trimmed_name
FROM customers

-- REPLACE

SELECT 
    '123-456-7890' ,
    REPLACE('123-456-7890' , '-' , '') AS replaced_number


SELECT 
'report.txt',
REPLACE('report.txt' , '.txt','.csv')


-- Count the length of each customers length 

SELECT
    first_name,
    LEN(first_name) AS len_name
FROM customers
 
SELECT
    LEFT(TRIM(first_name) , 2) AS left_two_elements,
    RIGHT(TRIM(first_name) , 2) AS right_two_elements
FROM customers



-- Retrive a customers first name after removing the first character.

SELECT 
    first_name,
    SUBSTRING(TRIM(first_name) , 2 , LEN(TRIM(first_name))) removed_char
FROM customers



-- Number Functions

SELECT ROUND(3.156 , 1)


SELECT ABS(-10)


USE SalesDB
SELECT ABS(Sales) Sales FROM Sales.Orders



