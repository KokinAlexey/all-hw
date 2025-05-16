# Домашнее задание к занятию "Кластеризация и балансировка нагрузки" - `Кокин Алексей`

---

### Задание 1
- Запустите два simple python сервера на своей виртуальной машине на разных портах
- Установите и настройте HAProxy, воспользуйтесь материалами к лекции по [ссылке](2/)
- Настройте балансировку Round-robin на 4 уровне.
- На проверку направьте конфигурационный файл haproxy, скриншоты, где видно перенаправление запросов на разные серверы при обращении к HAProxy.

### Результат 1
![Задание 1](https://github.com/KokinAlexey/all-hw/blob/main/hw-10-01-keepalived/images/img1.jpg)  
[haproxy.cfg](https://github.com/KokinAlexey/all-hw/blob/main/hw-10-02-haproxy/conf/haproxy1.cfg)

------

### Задание 2
- Запустите три simple python сервера на своей виртуальной машине на разных портах
- Настройте балансировку Weighted Round Robin на 7 уровне, чтобы первый сервер имел вес 2, второй - 3, а третий - 4
- HAproxy должен балансировать только тот http-трафик, который адресован домену example.local
- На проверку направьте конфигурационный файл haproxy, скриншоты, где видно перенаправление запросов на разные серверы при обращении к HAProxy c использованием домена example.local и без него.

### Результат 2
![Задание 1](https://github.com/KokinAlexey/all-hw/blob/main/hw-10-01-keepalived/images/img2.jpg)  
[haproxy.cfg](https://github.com/KokinAlexey/all-hw/blob/main/hw-10-02-haproxy/conf/haproxy2.cfg)



