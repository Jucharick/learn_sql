--INSERT INTO products (id, product_name, count, price) VALUES ('6', '����', '6', '3200.00');
--INSERT INTO products (id, product_name, count, price) VALUES ('7', '�������', '11', '4500.00');
--INSERT INTO products (id, product_name, count, price) VALUES ('8', '������', '123', '1200.00');
--INSERT INTO products (id, product_name, count, price) VALUES ('9', '����', '1', '45900.40');
--INSERT INTO products (id, product_name, count, price) VALUES ('10', '����������', '3', '3000.00');

--ALTER TABLE MyDataBase.dbo.products
--ADD country varchar(10);

--SELECT * FROM products

--UPDATE products SET country = 'RU' WHERE id = '1';
--UPDATE products SET country = 'RU' WHERE id = '2';
--UPDATE products SET country = 'UA' WHERE id = '3';
--UPDATE products SET country = 'US' WHERE id = '4';
--UPDATE products SET country = 'US' WHERE id = '5';
--UPDATE products SET country = 'US' WHERE id = '6';
--UPDATE products SET country = 'UA' WHERE id = '7';
--UPDATE products SET country = 'RU' WHERE id = '8';
--UPDATE products SET country = 'BL' WHERE id = '9';
--UPDATE products SET country = 'BL' WHERE id = '10';

-- SELECT * FROM products



SELECT TOP 5 * FROM products WHERE count > 0 ORDER BY price DESC 

-- SELECT * FROM products ORDER BY price DESC LIMIT 5
-- ���������� LIMIT �� �������������� MSSQL Express, ������ ��� ����� ��������������� ��������: TOP.