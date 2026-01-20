-- Type 1 Insert
-- Insert new customers to the customers table 
CREATE TABLE persons (
    id INT NOT NULL , 
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE ,
    phone VARCHAR(10) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY(id)

)

USE MyDatabase -- Given so that errors dont show in Vscode , no significance



SELECT *
FROM customers


-- Adding a single customer 
INSERT INTO customers (id ,first_name , country , score)
VALUES (6 , 'Somesh' , 'India' , 650)

-- Adding multiple customers 

INSERT INTO customers (id , first_name , country ,score) -- mentioning all the columns is not necessary
VALUES 
    (7 , 'Aastha' , 'India' , 900),
    (8 , 'Aditya' , 'UK' , 650)


INSERT INTO customers  -- mentioning all the columns is not necessary
VALUES 
    (9 , 'Sam' , 'USA' , 600),
    (10 , 'Max' , 'UK' , 450)




-- Type 2 Insert
-- Copy data from the 'customers' into 'persons'
INSERT INTO persons (id , person_name , birth_date , phone)
SELECT 
    id,
    first_name,
    NULL,
    'UNKNOWN'
FROM customers


SELECT *
FROM persons

-- UPDATE 
-- Change the score of customer with ID 6 to 0

UPDATE customers
SET 
    score = 0
WHERE id = 6


SELECT * FROM customers

-- Change the score of the customer with ID 10 to 0 and update the country to UK

SELECT * 
FROM customers
WHERE id = 10

UPDATE customers
SET
    score = 0,
    country = 'UK'
WHERE id = 10

-- Update all customers with UNKNOWN phone by setting it to 0000000000

UPDATE persons
SET 
    phone = '0000000000'


SELECT * FROM persons

-- Update all customers with Birth_date as NULL to 2023-12-06

UPDATE persons
SET 
    birth_date = '2023-12-06'
WHERE 
    birth_date IS NULL


-- DELETE

-- Delete all customers with id greater than 5

-- SELECT *
-- FROM customers
-- WHERE id > 5

DELETE FROM customers
WHERE id > 5


SELECT * FROM customers

-- DELETE all data from the persons table 


TRUNCATE TABLE persons -- Here we use TRUNCATE cause in case of large tables
-- DELETE is slow so we use TRUNCATE

