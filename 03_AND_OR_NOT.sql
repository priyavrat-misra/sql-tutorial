-- The AND, OR and NOT Operators --
USE sql_store;

-- > find customers who are born after 1989 or
-- > have points > 1000 and live in Virginia (VA)
SELECT * FROM customers WHERE birth_date > '1990-01-01' OR points > 1000 AND state = 'va';
-- AND has higher precedence than OR

-- > find customers who are born before 1990 and have points < 1000
SELECT * FROM customers WHERE NOT (birth_date > '1990-01-01' OR points > 1000);

-- > from the order_items table, get the items for order #6
-- > where the total price is greater than 30
SELECT * FROM order_items WHERE order_id = 6 AND quantity * unit_price > 30;