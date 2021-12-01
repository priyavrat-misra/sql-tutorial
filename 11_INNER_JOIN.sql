-- The INNER JOIN Clause --
USE sql_store;

SELECT * FROM orders INNER JOIN customers ON orders.customer_id = customers.customer_id;
-- the INNER keyword is optional

SELECT order_id, first_name, last_name FROM orders JOIN customers ON orders.customer_id = customers.customer_id;

SELECT 
    order_id, customer_id, first_name, last_name
FROM
    orders
        JOIN
    customers ON orders.customer_id = customers.customer_id;
-- will lead to an error because we didn't mention which customer_id we are referencing,
-- can be fixed as follows
SELECT 
    order_id, orders.customer_id, first_name, last_name
FROM
    orders
        JOIN
    customers ON orders.customer_id = customers.customer_id;

-- can even be made shorter using aliases
SELECT 
    order_id, o.customer_id, first_name, last_name
FROM
    orders o
        JOIN
    customers c ON o.customer_id = c.customer_id;

SELECT oi.* FROM order_items oi JOIN products p ON oi.product_id = p.product_id;


-- > Joining across Databases < --
USE sql_store;
SELECT * FROM order_items oi JOIN sql_inventory.products p ON oi.product_id = p.product_id;

USE sql_inventory;
SELECT * FROM sql_store.order_items oi JOIN products p ON oi.product_id = p.product_id;
-- query will be different depending on the current database


-- > Self Join < --
USE sql_hr;

SELECT * from employees e JOIN employees m ON e.reports_to = m.employee_id;
-- they'll need to have different aliases
SELECT 
    e.employee_id, e.first_name, m.first_name AS manager
FROM
    employees e
        JOIN
    employees m ON e.reports_to = m.employee_id;


-- > Joining multiple tables < --
USE sql_store;
SELECT 
    o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    os.name AS status
FROM
    orders o
        JOIN
    customers c ON o.customer_id = c.customer_id
        JOIN
    order_statuses os ON o.status = os.order_status_id;

USE sql_invoicing;
SELECT 
    p.date, p.invoice_id, p.amount, c.name, pm.name
FROM
    payments p
        JOIN
    clients c ON c.client_id = p.client_id
        JOIN
    payment_methods pm ON p.payment_method = pm.payment_method_id;


-- > Compound Join < --
USE sql_store;
SELECT 
    *
FROM
    order_items oi
        JOIN
    order_item_notes oin ON oi.order_id = oin.order_id
        AND oi.product_id = oin.product_id;


-- > Implicit Join < --
USE sql_store;
SELECT * FROM orders o, customers c WHERE o.customer_id = c.customer_id;
-- is same as
SELECT * FROM orders o JOIN customers c ON o.customer_id = c.customer_id;