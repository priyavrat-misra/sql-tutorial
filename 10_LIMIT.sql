-- The LIMIT Clause --
USE sql_store;

SELECT * FROM customers LIMIT 3;
-- outputs the first 3 customers

SELECT * FROM customers LIMIT 15;
-- if limit is greater than number of records present, it'll output all

SELECT * FROM customers LIMIT 6, 3;
-- skips first 6 customers, outputs the next 3

-- > get the top 3 customers with most points
SELECT * FROM customers ORDER BY points DESC LIMIT 3;

-- LIMIT always comes at the end
-- clause order: SELECT -> FROM -> WHERE -> ORDER BY -> LIMIT