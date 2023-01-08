/* ������: �������� ���������� � ������� �� �������������� A � B. */
SELECT *
FROM PC
WHERE speed >= 500 AND
 price < 800;

/* ������: �������� ���������� ��� ���� ���������, ������� �� �������� ���������� � ����� ������ $300 */
SELECT *
FROM printer
WHERE NOT (type = 'matrix') AND
 price < 300;

/* ������. ����� ������ � ������� ���������� ����������� ���������� �� $400 �� $600: */
SELECT *
FROM PC
WHERE price BETWEEN 400 AND 600;

/* ����� ������, ������� ���������� � ����� �������� ����� ��� �����������, ������� ������������� ������������ 10 ��� 20 �����: */
SELECT model, speed, hd
FROM PC
WHERE hd IN (10, 20);

/* ����� ������, ������� ���������� � ����� �������� ����� �����������, ������� ������������� ������������ 10 ����� ��� 20 ����� � ����������� �������������� �: */
SELECT model, speed, hd
FROM PC
WHERE hd IN (10, 20) AND
model IN (SELECT model
FROM product
WHERE maker = 'A'
);