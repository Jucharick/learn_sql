/*
CREATE TABLE book(
    book_id INT IDENTITY(1,1) PRIMARY KEY, 
    title VARCHAR(50),
    author VARCHAR(30),
    price DECIMAL(8, 2),
    amount INT
);
*/
-- для MySql - INT PRIMARY KEY AUTO_INCREMENT / для MS server - INT IDENTITY(1,1) PRIMARY KEY

--INSERT INTO book (title, author, price, amount)
--VALUES ('Мастер и Маргарита', 'Булгаков М.А.', 670.99, 3)

--INSERT INTO book (title, author, price, amount)
--VALUES ('Белая гвардия', 'Булгаков М.А.', 540.50, 5);
--INSERT INTO book (title, author, price, amount)
--VALUES ('Идиот', 'Достоевский Ф.М.', 460.00, 10);
--INSERT INTO book (title, author, price, amount)
--VALUES ('Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 2);

--INSERT INTO book (title, author, price, amount)
--VALUES ('Стихотворения и поэмы', 'Есенин С.А.', 650.00, 15);

  

--INSERT INTO book (title, author, price, amount)
--VALUES ('', 'Иванов С.С.', 50.00, 10);
--INSERT INTO book (title, author, price, amount)
--VALUES ('Дети полуночи', 'Рушди Салман', 950.00, 5);
--INSERT INTO book (title, author, price, amount)
--VALUES ('Лирика', 'Гумилев Н.С.', 460.00, 10);
--INSERT INTO book (title, author, price, amount)
--VALUES ('Поэмы', 'Бехтерев С.С.', 460.00, 10);
--INSERT INTO book (title, author, price, amount)
--VALUES ('Капитанская дочка', 'Пушкин А.С.',  520.50, 7);





--SELECT * FROM book

--SELECT title, amount FROM book;

--SELECT title AS Название, amount 
--FROM book;

--SELECT title, author, price, amount, 
--     price * amount AS total 
--FROM book;

SELECT title, 
    price, 
    ROUND((price*18/100)/(1+18/100), 2) AS tax, 
    ROUND(price/(1+18/100), 2) AS price_tax 
FROM book;

--SELECT title, amount, price, 
--	CASE
--        WHEN author = 'Булгаков М.А.' THEN price * 1.1
--        WHEN author = 'Есенин С.А.' THEN price * 1.05
--        ELSE price 
--	END
--FROM book;

SELECT title, amount, price, 
	ROUND (IIF (author = 'Булгаков М.А.', price * 1.1, IIF(author = 'Есенин С.А.', price * 1.05, price )), 2) as new_price
FROM book;

SELECT title, price 
FROM book
WHERE author IN ('Булгаков М.А.', 'Достоевский Ф.М.');

SELECT author, title, amount AS Количество
FROM book
WHERE price < 750
ORDER BY author, amount DESC;


SELECT title
FROM book
WHERE title LIKE 'Б%';
/* эквивалентное условие
title LIKE 'б%'
*/


SELECT DISTINCT author
FROM book;

SELECT  author
FROM book
GROUP BY author;


/* чтобы проверить запрос, добавьте в таблицу строку */
INSERT INTO book (title, author, price, amount) VALUES ('Черный человек','Есенин С.А.', Null, Null);

SELECT author, COUNT (author) AS 'COUNT(author)', COUNT(amount) AS 'COUNT(amount)', COUNT(*) AS 'COUNT(*)'
FROM book
GROUP BY author;

SELECT author, ROUND(AVG(price),2) AS Средняя_цена
FROM book
GROUP BY author;



SELECT SUM(amount) AS Количество, 
    SUM(price * amount) AS Стоимость
FROM book;


SELECT author,
    MIN(price) AS Минимальная_цена,
    MAX(price) AS Максимальная_цена
FROM book
GROUP BY author
HAVING SUM(price * amount) > 5000;


SELECT author,
    MIN(price) AS Минимальная_цена,
    MAX(price) AS Максимальная_цена
FROM book
WHERE author <> 'Есенин С.А.'
GROUP BY author
HAVING SUM(amount) > 10;

--Другим способом решения примера является запрос:

SELECT author,
    MIN(price) AS Минимальная_цена,
    MAX(price) AS Максимальная_цена
FROM book
GROUP BY author
HAVING SUM(amount) > 10 AND author <> 'Есенин С.А.';



--Задание
--Посчитать стоимость всех экземпляров каждого автора без учета книг «Идиот» и «Белая гвардия». 
--В результат включить только тех авторов, у которых суммарная стоимость книг (без учета книг «Идиот» и «Белая гвардия») более 5000 руб. 
--Вычисляемый столбец назвать Стоимость. Результат отсортировать по убыванию стоимости.
INSERT INTO book (title, author, price, amount) VALUES ('Игрок',' Достоевский Ф.М.', 480.50, 10);
UPDATE book SET amount = 3 WHERE book_id = '4';

SELECT * FROM book

SELECT author, SUM(amount * price) AS Стоимость
FROM  book
WHERE  title <> 'Идиот' AND title <> 'Белая гвардия'
GROUP BY author
HAVING SUM(amount * price)  > 5000
ORDER BY author DESC




--Вложенный запрос


--Вывести информацию о самых дешевых книгах, хранящихся на складе.
--Для реализации этого запроса нам необходимо получить минимальную цену из столбца price таблицы book, 
--а затем вывести информацию о тех книгах, цена которых  равна минимальной. Первая часть  – поиск  минимума – реализуется вложенным запросом.
SELECT title, author, price, amount
FROM book
WHERE price = (
         SELECT MIN(price) 
         FROM book
      );

DELETE FROM book WHERE book_id = '6';


--Вложенный запрос определяет минимальную цену книг во всей таблице (это 460.00), а затем в основном запросе для каждой записи проверяется, 
--равна ли цена минимальному значению, если равна, информация о книге включается в результирующую таблицу запроса.


--Задание
--Вывести информацию (автора, название и цену) о  книгах, цены которых меньше или равны средней цене книг на складе. 
--Информацию вывести в отсортированном по убыванию цены виде. Среднее вычислить как среднее по цене книги.
SELECT author, title, price
FROM book
WHERE price <= (
         SELECT AVG(price) 
         FROM book
      )
ORDER BY price DESC 


--Вывести информацию о книгах, количество экземпляров которых отличается от среднего количества экземпляров книг на складе более чем на 3. 
--То есть нужно вывести и те книги, количество экземпляров которых меньше среднего на 3, или больше среднего на 3.
SELECT title, author, amount 
FROM book
WHERE ABS(amount - (SELECT AVG(amount) FROM book)) >3;


--Задание
--Вывести информацию (автора, название и цену) о тех книгах, цены которых превышают минимальную цену книги 
--на складе не более чем на 150 рублей в отсортированном по возрастанию цены виде.
SELECT author, title, price
FROM book
WHERE ABS(price - (SELECT MIN(price) FROM book )) <= 150
ORDER BY price


--Задание
--Вывести информацию (автора, книгу и количество) о тех книгах, количество экземпляров которых в таблице book не дублируется.
--Во вложенном запросе отберите те значения столбца amount, количество которых, вычисленное с помощью функции count(), равно 1. 
SELECT author, title, amount
FROM book
WHERE amount IN (
        SELECT amount
        FROM book
        GROUP BY amount
        HAVING COUNT(amount)=1
      );


--Задание
--Вывести информацию о книгах(автор, название, цена), цена которых меньше самой большой из минимальных цен, вычисленных для каждого автора.
SELECT author, title, price
FROM book
WHERE price < ANY (
        SELECT AVG(price) 
        FROM book 
        GROUP BY author 
      );