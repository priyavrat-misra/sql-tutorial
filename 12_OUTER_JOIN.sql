-- The OUTER JOIN Clause --
USE sql_store;

SELECT 
    c.customer_id, c.first_name, o.order_id
FROM
    customers c
        LEFT OUTER JOIN
    orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id;
-- is same as:
SELECT 
    c.customer_id, c.first_name, o.order_id
FROM
    orders o
        RIGHT OUTER JOIN
    customers c ON c.customer_id = o.customer_id
ORDER BY c.customer_id;
-- the OUTER keyword is optional

-- > find number of times each product is ordered
SELECT 
    p.product_id, p.name, oi.quantity
FROM
    products p
        LEFT JOIN
    order_items oi ON p.product_id = oi.product_id;


-- > Outer Joins Between Multiple Tables < --
USE sql_store;

-- > get all the customers who have a order or not and for those who
-- > have a order get all the orders whether it has a shipper or not
SELECT 
    c.customer_id, c.first_name, o.order_id, sh.name AS shipper
FROM
    customers c
        LEFT JOIN
    orders o ON c.customer_id = o.customer_id
        LEFT JOIN
    shippers sh ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;

-- > get all orders' date, id, customer, shipper name and status
SELECT 
    o.order_date,
    o.order_id,
    c.first_name AS customer,
    sh.name AS shipper,
    os.name AS status
FROM
    orders o
        JOIN -- because every order has a customer
    customers c ON o.customer_id = c.customer_id
        LEFT JOIN -- because not all order has a shipper_id
    shippers sh ON o.shipper_id = sh.shipper_id
        JOIN
    order_statuses os ON o.status = os.order_status_id;


-- > Self Outer Joins < --
USE sql_hr;
SELECT 
    e.employee_id, e.first_name, m.first_name AS manager
FROM
    employees e
        LEFT JOIN
    employees m ON e.reports_to = m.employee_id;