-- The CROSS JOIN Clause --
USE sql_store;

-- explicit syntax
SELECT 
    c.first_name AS customer, p.name AS product
FROM
    customers c
        CROSS JOIN
    products p
ORDER BY c.first_name, p.name;

-- implicit syntax
SELECT 
    c.first_name AS customer, p.name AS product
FROM
    customers c,
    products p
ORDER BY c.first_name, p.name;

SELECT p.name, sh.name FROM shippers sh CROSS JOIN products p;
SELECT p.name, sh.name FROM shippers sh, products p;