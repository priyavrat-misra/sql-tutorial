-- The IN Operator
USE sql_store;

-- get customers who aren't located in VA, FL or GA
SELECT 
    *
FROM
    customers
WHERE
    NOT (state = 'VA' OR state = 'FL' OR state = 'GA');
        -- note: it can't be replaced with
        -- state = 'VA' or 'FL' or 'GA';
        -- -> (state = 'VA') or 'FL' or 'GA';
        -- -> state = 'VA';

-- same operation but using IN
SELECT * FROM customers WHERE state NOT IN ('VA' , 'FL', 'GA');
    
-- return products with quantity in stock equal to 49, 38, 72
SELECT * FROM products WHERE quantity_in_stock IN (49 , 38, 72);