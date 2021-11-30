-- The SELECT Clause --
USE sql_store; -- selects the sql_store schema

SELECT * FROM  customers WHERE customer_id = 1;
SELECT * FROM customers ORDER BY first_name;
SELECT 1, 2;
SELECT 1;
SELECT first_name, last_name FROM customers;
SELECT DISTINCT state FROM customers;
SELECT name, unit_price, unit_price * 1.1 AS new_price FROM products;

SELECT 
    last_name,
    first_name,
    points,
    (points + 10) * 100 AS 'discount factor'
FROM
    customers;