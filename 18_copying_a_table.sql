-- Creating a copy of a table --
USE sql_store;

CREATE TABLE orders_archived AS SELECT * FROM orders;
-- note: the copy table won't have the original table's attributes
-- `SELECT * FROM orders` is a sub-query

INSERT INTO orders_archived
SELECT * FROM orders WHERE order_date < '2019-01-01'; -- sub-query


USE sql_invoicing;

CREATE TABLE invoices_archived AS
SELECT 
    i.invoice_id,
    i.number,
    c.name AS client,
    i.invoice_total,
    i.payment_total,
    invoice_date,
    payment_date,
    due_date
FROM
    invoices i
        JOIN
    clients c USING (client_id)
WHERE
    payment_date IS NOT NULL;