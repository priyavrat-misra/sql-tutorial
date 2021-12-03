-- The GROUP BY Clause --
-- > group by single column < --
USE sql_invoicing;

SELECT 
    client_id, SUM(invoice_total) AS total_sales
FROM
    invoices
WHERE
    invoice_date >= '2019-07-01'
GROUP BY client_id
ORDER BY total_sales DESC;


-- > group by multiple columns < --
USE sql_invoicing;

SELECT 
    state, city, SUM(invoice_total) AS total_sales
FROM
    invoices i
        JOIN
    clients USING (client_id)
GROUP BY state , city;

SELECT 
    date,
    pm.name AS payment_method,
    SUM(p.amount) AS total_payments
FROM
    payments p
        JOIN
    payment_methods pm ON p.payment_method = pm.payment_method_id
GROUP BY date , p.payment_method
ORDER BY date;