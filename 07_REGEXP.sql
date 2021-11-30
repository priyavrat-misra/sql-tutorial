-- The REGEXP Operator --
USE sql_store;

-- > find customers whose last_name has a 'b' in it
SELECT * FROM customers WHERE last_name REGEXP 'b';

-- > find customers whose last_name has two words as 'g' or 'i' or 'm' followed by 'e'
SELECT * FROM customers WHERE last_name REGEXP '[gim]e';

-- > find customers whose last_name has two words 'a' to 'h' followed by 'e'
SELECT * FROM customers WHERE last_name REGEXP '[a-h]e';
-- '[-]' represents a range

-- > find customers whose last_name starts with 'brush'
SELECT * FROM customers WHERE last_name REGEXP '^brush';
-- '^' represents "starts with"

-- > find customers whose last_name ends with 'field'
SELECT * FROM customers WHERE last_name REGEXP 'field$';
-- '$' represents "ends with"

-- > find customers whose last_name has 'field' or 'mac' or ends with 'rose'
SELECT * FROM customers WHERE last_name REGEXP 'field|mac|rose$';
-- '|' represents logical OR

-- > get the customers whose first names are ELKA or AMBUR
SELECT * FROM customers WHERE first_name REGEXP '^elka$|^ambur$';

-- > get the customers whose last names end with EY or ON
SELECT * FROM customers WHERE last_name REGEXP 'ey$|on$';

-- > get the customers whose last names start with MY or contains SE
SELECT * FROM customers WHERE last_name REGEXP '^my|se';

-- > get the customers whose last names contain B followed by R or U
SELECT * FROM customers WHERE last_name REGEXP 'b[ru]';