-- The NATURAL JOIN Clause --
USE sql_store;

SELECT 
    o.order_id, c.first_name
FROM
    customers c
        NATURAL JOIN
    orders o;