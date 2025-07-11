# Домашнее задание к занятию "SQL. Часть 2"

---

### Задание 1

Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию: 
- фамилия и имя сотрудника из этого магазина;
- город нахождения магазина;
- количество пользователей, закреплённых в этом магазине.

**ОТВЕТ:**
```SQl
SELECT CONCAT_WS(" ", stf.first_name, stf.last_name) AS FIO,
       CONCAT_WS(" ", cnt.country, a.district, city.city, a.address) AS Addr,
       count(c.customer_id) AS 'C_Count'
FROM store s
LEFT JOIN staff stf ON stf.staff_id = s.manager_staff_id
LEFT JOIN address a ON a.address_id =s.address_id
LEFT JOIN city  ON city.city_id = a.city_id
LEFT JOIN country cnt   ON cnt.country_id = city.country_id
RIGHT JOIN customer c ON c.store_id = s.store_id
GROUP BY FIO, addr
HAVING C_Count > 300
```  

![Задание 1](https://github.com/KokinAlexey/all-hw/blob/main/hw-12-04-SQL-2/images/Screenshot_1.jpg)


### Задание 2

Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.

**ОТВЕТ:**
```SQl
SELECT count(*) AS 'Films count'
FROM film f 
WHERE f.`length` > (SELECT AVG(film.`length`) FROM film)
```  

![Задание 2](https://github.com/KokinAlexey/all-hw/blob/main/hw-12-04-SQL-2/images/Screenshot_2.jpg)

### Задание 3

Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.

**ОТВЕТ:**
```SQl
SELECT  tb_p.p_year AS YEAR, 
	tb_p.p_month AS MONTH, 
--		tb_p.p_sum AS 'Paymant SUM',
	tb_r.r_count AS 'Rent COUNT'
FROM (
    SELECT YEAR(p.payment_date) AS p_year, 
           MONTH(p.payment_date) AS p_month, 
           sum(p.amount) AS p_sum 
    FROM payment p
    GROUP BY YEAR(p.payment_date), MONTH(p.payment_date)
    ) AS tb_p
    LEFT JOIN ( SELECT YEAR(r.rental_date) AS r_year, 
                       MONTH(r.rental_date) AS r_month, 
                       count(*) AS r_count
		FROM rental r 
		GROUP BY YEAR(r.rental_date), MONTH(r.rental_date)
	      ) AS tb_r ON ( tb_r.r_year = tb_p.p_year AND tb_r.r_month = tb_p.p_month )
ORDER BY p_sum DESC
LIMIT 1
```  

![Задание 3](https://github.com/KokinAlexey/all-hw/blob/main/hw-12-04-SQL-2/images/Screenshot_3.jpg)

