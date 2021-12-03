-- The HAVING Clause --
USE sql_invoicing;
-- > group clients by invoice_total having more than 500
SELECT 
    client_id, SUM(invoice_total) AS total_sales
FROM
    invoices
    -- WHERE total_sales > 500
	-- not possible because they aren't grouped yet
    -- this can be fixed by using HAVING
GROUP BY client_id
HAVING total_sales > 500;
-- with WHERE we can filter data before they are grouped,
-- with HAVING we can filter data after they are grouped

-- > group clients by invoice_total
-- > with invoice_total > 500 and #invoices > 5
SELECT 
    client_id,
    SUM(invoice_total) AS total_sales,
    COUNT(*) AS no_of_invoices
FROM
    invoices
GROUP BY client_id
HAVING total_sales > 500 AND no_of_invoices > 5;
-- note: the columns we use in HAVING must be a part of SELECT clause,
-- whereas in WHERE we can reference any columns whether they are selected or not

-- > get the customers located in VA who have spent > $100
USE sql_store;

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(oi.unit_price * oi.quantity) AS total
FROM
    customers c
        JOIN
    orders o USING (customer_id)
        JOIN
    order_items oi USING (order_id)
WHERE
    state = 'VA'
GROUP BY c.customer_id
HAVING total > 100;
-- whenever there is a aggregate function in SELECT and we are grouping,
-- then we should group by a super key of the resulting table