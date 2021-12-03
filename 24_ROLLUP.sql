-- The ROLLUP Operator (only available in MySQL) --
USE sql_invoicing;

SELECT 
    client_id, SUM(invoice_total) AS total_sales
FROM
    invoices
GROUP BY client_id WITH ROLLUP;
-- applies to columns that aggregate values

SELECT 
    state, city, SUM(invoice_total) AS total_sales
FROM
    invoices i
        JOIN
    clients c USING (client_id)
GROUP BY state, city WITH ROLLUP;
-- when used with grouping multiple columns results in
-- summary values for each group as well as the entire result set

SELECT 
    pm.name AS payment_method, SUM(p.amount) AS total
FROM
    payments p
        JOIN
    payment_methods pm ON p.payment_method = pm.payment_method_id
GROUP BY pm.name WITH ROLLUP;