-- The ORDER BY Clause --
USE sql_store;

-- > sort customers based on their first_name in descending order
SELECT * FROM customers ORDER BY first_name DESC;

-- > sort customers based on their state and within each state sort by first_name
SELECT * FROM customers ORDER BY state, first_name;
SELECT * FROM customers ORDER BY state DESC, first_name;
SELECT * FROM customers ORDER BY state, first_name DESC;
SELECT * FROM customers ORDER BY state DESC, first_name DESC;

-- > sort using indices of state and first_name in table
SELECT * FROM customers ORDER BY 8, 2;
-- note: in SQL indexing starts at 1

SELECT first_name, last_name FROM customers ORDER BY 1, 2;
-- note: indices of first_name, last_name are different as we are considering a subset


SELECT first_name, last_name FROM customers ORDER BY birth_date;
SELECT first_name, last_name, 10 AS points FROM customers ORDER BY points, first_name;
-- might not work in other DBMSs

-- > sort order #2 based on the total price in descending order
SELECT *, quantity * unit_price AS total_price FROM order_items WHERE order_id = 2 ORDER BY quantity * unit_price DESC;
SELECT *, quantity * unit_price AS total_price FROM order_items WHERE order_id = 2 ORDER BY total_price DESC;
SELECT *, quantity * unit_price AS total_price FROM order_items WHERE order_id = 2 ORDER BY 5 DESC;
-- expression that we use in the ORDER BY clause doesn't always have to be a column name