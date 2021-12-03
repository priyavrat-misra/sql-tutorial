-- Aggregate Functions --
USE sql_invoicing;

SELECT 
    MAX(invoice_total) AS highest,
    MIN(invoice_total) AS lowest,
    AVG(invoice_total) AS average,
    SUM(invoice_total * 1.1) AS total, -- can have expressions
    COUNT(invoice_total) AS no_of_invoices,
    COUNT(payment_date) AS no_of_payments,  -- will only count non null values
    COUNT(*) AS total_records -- will give the count irrespective of null values
FROM
    invoices;

SELECT 
    MAX(invoice_total) AS highest,
    MIN(invoice_total) AS lowest,
    AVG(invoice_total) AS average,
    SUM(invoice_total) AS total,
    COUNT(DISTINCT client_id) AS total_records -- will not count duplicates
FROM
    invoices
WHERE
    invoice_date > '2019-07-01';

SELECT 
    'first half of 2019' AS date_range,
    SUM(invoice_total) AS total_sales,
    SUM(payment_total) AS total_payments,
    SUM(invoice_total - payment_total) AS what_we_expect
FROM
    invoices
WHERE
    invoice_date BETWEEN '2019-01-01' AND '2019-06-30' 
UNION SELECT 
    'second half of 2019' AS date_range,
    SUM(invoice_total) AS total_sales,
    SUM(payment_total) AS total_payments,
    SUM(invoice_total - payment_total) AS what_we_expect
FROM
    invoices
WHERE
    invoice_date BETWEEN '2019-07-01' AND '2019-12-31' 
UNION SELECT 
    'total' AS date_range,
    SUM(invoice_total) AS total_sales,
    SUM(payment_total) AS total_payments,
    SUM(invoice_total - payment_total) AS what_we_expect
FROM
    invoices
WHERE
    invoice_date BETWEEN '2019-01-01' AND '2019-12-31';