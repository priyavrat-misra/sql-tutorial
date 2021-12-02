-- Updating rows
-- > Updating single row < --
USE sql_invoicing;

UPDATE invoices 
SET 
    payment_total = 10,
    payment_date = '2019-03-01'
WHERE
    invoice_id = 1;

UPDATE invoices 
SET 
    payment_total = DEFAULT,
    payment_date = DEFAULT
WHERE
    invoice_id = 1;

UPDATE invoices 
SET 
    payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE
    invoice_id = 3;


-- > Updating multiple rows < --
USE sql_invoicing;

UPDATE invoices 
SET 
    payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE
    client_id = 3;
    
UPDATE invoices 
SET 
    payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE
    client_id IN (3, 4);

-- if we want to update all rows in the table
UPDATE invoices 
SET 
    payment_total = invoice_total * 0.5,
    payment_date = due_date;

-- > give all customers born before 1990 50 extra points
USE sql_store;

UPDATE customers 
SET 
    points = points + 50
WHERE
    birth_date < '1990-01-01';


-- > Using sub-queries in updates
USE sql_invoicing;

UPDATE invoices 
SET 
    payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE
    client_id = (SELECT 
            client_id
        FROM
            clients
        WHERE
            name = 'Myworks');

UPDATE invoices 
SET 
    payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE
    client_id IN (SELECT   -- `IN` because the sub-query returns multiple records
            client_id
        FROM
            clients
        WHERE
            state IN ('CA' , 'NY'));

USE sql_store;
UPDATE orders 
SET 
    comments = 'Gold customer'
WHERE
    customer_id IN (SELECT 
            customer_id
        FROM
            customers
        WHERE
            points > 3000);