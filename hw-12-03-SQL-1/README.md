# Домашнее задание к занятию "SQL. Часть 1"

---

### Задание 1

Получите уникальные названия районов из таблицы с адресами, которые начинаются на “K” и заканчиваются на “a” и не содержат пробелов.

**ОТВЕТ:**
```SQl
SELECT DISTINCT a.district FROM address a 
WHERE a.district LIKE 'K%a' AND 
      NOT a.district LIKE '% %';
```  

![Задание 1](https://github.com/KokinAlexey/all-hw/blob/main/hw-12-03-SQL-1/images/Screenshot_1.jpg)

### Задание 2

Получите из таблицы платежей за прокат фильмов информацию по платежам, которые выполнялись в промежуток с 15 июня 2005 года по 18 июня 2005 года **включительно** и стоимость которых превышает 10.00.

**ОТВЕТ:**
```SQl
SELECT * FROM payment p 
WHERE (p.payment_date BETWEEN '2005-06-15' AND '2005-06-18') AND
       p.amount > 10;
```  

![Задание 2](https://github.com/KokinAlexey/all-hw/blob/main/hw-12-03-SQL-1/images/Screenshot_2.jpg)

### Задание 3

Получите последние пять аренд фильмов.

**ОТВЕТ:**
```SQl
SELECT * FROM rental r 
ORDER BY r.rental_date DESC, r.rental_id DESC LIMIT 5;
```  

![Задание 3](https://github.com/KokinAlexey/all-hw/blob/main/hw-12-03-SQL-1/images/Screenshot_3.jpg)

### Задание 4

Одним запросом получите активных покупателей, имена которых Kelly или Willie. 

Сформируйте вывод в результат таким образом:
- все буквы в фамилии и имени из верхнего регистра переведите в нижний регистр,
- замените буквы 'll' в именах на 'pp'.

**ОТВЕТ:**
```SQl
SELECT REPLACE(LOWER(c.first_name),'ll','pp') AS f_n, 
       REPLACE(LOWER(c.last_name),'ll','pp') AS l_n  
FROM customer c 
WHERE c.active = 1 AND 
      c.first_name IN ('Kelly','Willie');
```  

![Задание 4](https://github.com/KokinAlexey/all-hw/blob/main/hw-12-03-SQL-1/images/Screenshot_4.jpg)

### Задание 5*

Выведите Email каждого покупателя, разделив значение Email на две отдельных колонки: в первой колонке должно быть значение, указанное до @, во второй — значение, указанное после @.

**ОТВЕТ:**
```SQl
SELECT CONCAT(UCASE(LEFT(SUBSTRING_INDEX(c.email, '@', 1), 1)), 
              LOWER(SUBSTRING(SUBSTRING_INDEX(c.email, '@', 1), 2))) AS NAME, 
       SUBSTRING_INDEX(c.email, '@', -1) AS DOMAIN 
FROM customer c;
```  

![Задание 5](https://github.com/KokinAlexey/all-hw/blob/main/hw-12-03-SQL-1/images/Screenshot_5.jpg)

### Задание 6*

Доработайте запрос из предыдущего задания, скорректируйте значения в новых колонках: первая буква должна быть заглавной, остальные — строчными.

**ОТВЕТ:**
```SQl
SELECT CONCAT(UCASE(LEFT(t2.f_name, 1)),LOWER(SUBSTRING(t2.l_name, 2))) AS First_name,
       CONCAT(UCASE(LEFT(t2.l_name, 1)),LOWER(SUBSTRING(t2.l_name, 2))) AS Last_name,
       t2.`domain` 
FROM (SELECT SUBSTRING_INDEX(t1.full_name , '.', 1) AS f_name, 
             SUBSTRING_INDEX(t1.full_name , '.', -1) AS l_name,
             t1.`domain` 
      FROM (SELECT SUBSTRING_INDEX(c.email, '@', 1) AS full_name, 
                    SUBSTRING_INDEX(c.email, '@', -1) AS domain  
            FROM customer c
            ) t1
      ) t2
```  

![Задание 6](https://github.com/KokinAlexey/all-hw/blob/main/hw-12-03-SQL-1/images/Screenshot_6.jpg)
