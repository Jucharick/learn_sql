/* ����� ��� �������, ����� ������� ������� ������������� �� ����� �� */
SELECT *
FROM�Ships
WHERE class LIKE '%o';

/* ����� ��� �������, ����� ������� ������� ������������� �� ����� ��, �� �� �� �go� */
SELECT *
FROM ships
WHERE class NOT LIKE '%go' AND class LIKE '%o';



SELECT * FROM
(
SELECT '5%' name    UNION ALL  
SELECT '55'              UNION ALL
SELECT '5%%'          UNION ALL
SELECT '3%%'          UNION ALL
SELECT 'a5%%'        UNION ALL
SELECT 'abc'             UNION ALL
SELECT 'abc 5% cde' UNION ALL
SELECT '5c2e'           UNION ALL
SELECT 'C2H5OH'      UNION ALL
SELECT 'C25OH'        UNION ALL
SELECT 'C54OH'
) x

/* 1 */
--WHERE name LIKE'5%' -- ���������� � 5
/* 2 */
--WHERE name LIKE '5[%]' -- 5%
/* 3 */
--WHERE name LIKE '5|%' ESCAPE '|'-- 5%
/* 4 */
--WHERE name LIKE '%5|%%' ESCAPE '|' -- 5% � ����� ����� ������
/* 5 */
--WHERE name LIKE '[0-9][a-zA-Z]%' -- ������ �����, ������ �����
/* 6 */ 
--WHERE name LIKE '[a-z][0-9]%' -- ������ �����, ������ �����
/* 7 */
--WHERE name LIKE '[^0-9]%' -- ���������� �� �� �����.
/* 8 */
--WHERE name LIKE '%[02468]%' -- �������� ������ �����.
/* 9 */
--WHERE name LIKE '%[02468][13579]%' -- ���������� ������-��������.


/* ����� ���������� */
SELECT ship, launched
FROM Outcomes o LEFT JOIN
Ships s ON o.ship = s.name;

/* ���������� ��� ������ �� ���� �������� �� ������� Outcomes. ���� ��������� ����������, ������� 1900 */
SELECT ship, CASE
WHEN launched IS NULL THEN 1900
ELSE launched 
END 'year'
FROM Outcomes o LEFT JOIN
Ships s ON o.ship = s.name;