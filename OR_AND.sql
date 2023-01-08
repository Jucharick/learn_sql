/* ������: �������� ���������� � ������� �� ������������� A. */
SELECT * FROM product
WHERE maker = 'A' AND type = 'pc';

/* ����������� AND */

SELECT * FROM product
WHERE maker = 'A'
INTERSECT
SELECT * FROM product
WHERE type = 'pc';

/* ������: �������� ���������� � ������� �������������� A � B. */
SELECT * FROM product
WHERE maker = 'A' OR maker = 'B';

/* ����������� OR */
SELECT * FROM product
WHERE maker = 'A'
UNION
SELECT * FROM product
WHERE maker = 'B';

/* ������: �������� ���������� � ������� �� �������������� A � B. */
SELECT * FROM product
WHERE (maker = 'A' OR maker = 'B') AND type = 'pc';

/* ����� �������� ����� ����������� */
SELECT * FROM product
WHERE maker = 'A' OR maker = 'B'
INTERSECT
SELECT * FROM product
WHERE  type = 'pc';

/* ������������� ����� */

SELECT * FROM product
WHERE (maker = 'A' AND type = 'pc')
    OR (maker = 'B' AND type = 'pc');

/* ����� ����������� */
SELECT * FROM product
WHERE maker = 'A' AND type = 'pc'
UNION
SELECT * FROM product
WHERE maker = 'B' AND type = 'pc';