-- The IS NULL Operator --
USE sql_store;

-- > find the customers who don't have a phone number
SELECT * FROM customers WHERE phone IS NULL;

-- > find customers who have a phone number
SELECT * FROM customers WHERE phone IS NOT NULL;

-- > get the orders that are not shipped
SELECT * FROM orders WHERE shipped_date IS NULL OR shipper_id IS NULL;