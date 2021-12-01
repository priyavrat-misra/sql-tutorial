-- The USING Clause --
USE sql_store;

SELECT 
    o.order_id, c.first_name, sh.name AS shipper
FROM
    orders o
        JOIN
    customers c USING (customer_id) -- ON o.customer_id = c.customer_id
        LEFT JOIN
    shippers sh USING (shipper_id); -- ON o.shipper_id = sh.shipper_id
    -- only works if the column name is same across different tables

SELECT 
    *
FROM
    order_items oi
        JOIN
    order_item_notes oin USING (order_id , product_id);
    -- ON oi.order_id = oin.order_id AND oi.product_id = oin.product_id
    
USE sql_invoicing;

SELECT 
    p.date,
    c.name AS client,
    p.amount,
    pm.name AS payment_method
FROM
    payments p
        JOIN
    clients c USING (client_id)
        JOIN
    payment_methods pm ON p.payment_method = pm.payment_method_id;