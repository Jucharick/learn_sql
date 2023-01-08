/* Задача: Получить информацию о моделях ПК производителя A. */
SELECT * FROM product
WHERE maker = 'A' AND type = 'pc';

/* Пересечение AND */

SELECT * FROM product
WHERE maker = 'A'
INTERSECT
SELECT * FROM product
WHERE type = 'pc';

/* Задача: Получить информацию о моделях производителей A и B. */
SELECT * FROM product
WHERE maker = 'A' OR maker = 'B';

/* Объединение OR */
SELECT * FROM product
WHERE maker = 'A'
UNION
SELECT * FROM product
WHERE maker = 'B';

/* Задача: Получить информацию о моделях ПК производителей A и B. */
SELECT * FROM product
WHERE (maker = 'A' OR maker = 'B') AND type = 'pc';

/* можно выразить через пересечение */
SELECT * FROM product
WHERE maker = 'A' OR maker = 'B'
INTERSECT
SELECT * FROM product
WHERE  type = 'pc';

/* эквивалентная форма */

SELECT * FROM product
WHERE (maker = 'A' AND type = 'pc')
    OR (maker = 'B' AND type = 'pc');

/* через объединение */
SELECT * FROM product
WHERE maker = 'A' AND type = 'pc'
UNION
SELECT * FROM product
WHERE maker = 'B' AND type = 'pc';