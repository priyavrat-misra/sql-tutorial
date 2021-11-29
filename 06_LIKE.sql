-- The LIKE Operator
USE sql_store;

-- find customers whose last_name starts with 'b'
SELECT * FROM customers WHERE last_name LIKE 'b%';
-- '%' matches any number of  characters

-- find customers whose last_name starts with 'brush'
SELECT * FROM customers WHERE last_name LIKE 'brush%';

-- find customers whose last_name ends with a 'y'
SELECT * FROM customers WHERE last_name LIKE '%y';

-- find customers whose last_name has a 'b' in it
SELECT * FROM customers WHERE last_name LIKE '%b%';

-- find customers whose last_name has 6 characters and ends with 'y'
SELECT * FROM customers WHERE last_name LIKE '_____y';
-- '_' matches a single character

-- find customers whose last_name has 6 characters, starts with 'b' & ends with 'y'
SELECT * FROM customers WHERE last_name LIKE 'b____y';

-- find customers whose addresses contain TRAIL or AVENUE
SELECT * FROM customers WHERE address LIKE '%trail%' OR address LIKE '%avenue%';

-- find customers whose phone numbers doesn't end with 9
SELECT * FROM customers WHERE phone NOT LIKE '%9';