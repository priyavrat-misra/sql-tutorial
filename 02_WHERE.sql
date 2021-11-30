-- The WHERE Clause --
USE sql_store;

-- > get the customers who don't live in VA
SELECT * FROM customers WHERE state <> 'va';
-- '<>' is same as '!=';

-- > find customers who are born after 1989
SELECT * FROM customers WHERE BiRtH_DaTe > '1990-01-01';
-- note: birth_date = BiRtH_DaTe

-- > find orders done after 2018
SELECT * FROM orders WHERE order_date >= '2019-01-01';
-- dates must be enclosed with ''