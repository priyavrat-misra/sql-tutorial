-- Inserting rows --
-- > Inserting single row < --
USE sql_store;

INSERT INTO customers
VALUES (DEFAULT, 'John', 'Smith', '1990-01-01', NULL, 'address', 'city', 'CA', DEFAULT);

INSERT INTO customers (birth_date, address, city, state, first_name, last_name)
VALUES ('1990-01-01', 'address', 'city', 'CA', 'John', 'Smith');


-- > Inserting multiple rows < --
USE sql_store;

INSERT INTO shippers (name)
VALUES
	('Shipper1'),
	('Shipper2'),
    ('Shipper3');

INSERT INTO products (name, quantity_in_stock, unit_price)
VALUES
	('Product1', 10, 1.95),
    ('Product2', 11, 1.95),
    ('Product3', 12, 1.95);


-- > Inserting hierarchical rows < --
INSERT INTO orders (customer_id, order_date, status)
VALUES (1, '2019-01-02', 1);
INSERT INTO order_items
VALUES
	(last_insert_id(), 1, 1, 2.95),
    (last_insert_id(), 2, 1, 3.95);