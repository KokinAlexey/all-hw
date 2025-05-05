# Домашнее задание к занятию "Система мониторинга Zabbix" - `Кокин Алексей`

---

### Задание 1

1. Прикрепите в файл README.md скриншот авторизации в админке.
2. Приложите в файл README.md текст использованных команд в GitHub.


![скриншот авторизации в админке](https://github.com/KokinAlexey/all-hw/blob/main/hw-09-02-zabbix/images/Screenshot_12.jpg)

```shell
wget https://repo.zabbix.com/zabbix/7.2/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.2+ubuntu24.04_all.deb
dpkg -i zabbix-release_latest_7.2+ubuntu24.04_all.deb
apt update

apt install zabbix-server-pgsql zabbix-frontend-php php8.3-pgsql zabbix-apache-conf zabbix-sql-scripts

sudo -u postgres createuser --pwprompt zabbix
sudo -u postgres createdb -O zabbix zabbix

zcat /usr/share/zabbix/sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix

mcedit /etc/zabbix/zabbix_server.conf

systemctl restart zabbix-server apache2
systemctl enable zabbix-server apache2
```
---

### Задание 2

Установите Zabbix Agent на два хоста.

#### Требования к результатам
1. Приложите в файл README.md скриншот раздела Configuration > Hosts, где видно, что агенты подключены к серверу
2. Приложите в файл README.md скриншот лога zabbix agent, где видно, что он работает с сервером
3. Приложите в файл README.md скриншот раздела Monitoring > Latest data для обоих хостов, где видны поступающие от агентов данные.
4. Приложите в файл README.md текст использованных команд в GitHub

### Решение 2
![скриншот 1](https://github.com/KokinAlexey/all-hw/blob/main/hw-09-02-zabbix/images/Screenshot_13.jpg)
![скриншот 2](https://github.com/KokinAlexey/all-hw/blob/main/hw-09-02-zabbix/images/Screenshot_14.jpg)
![скриншот 3](https://github.com/KokinAlexey/all-hw/blob/main/hw-09-02-zabbix/images/Screenshot_15.jpg)

```shell
wget https://repo.zabbix.com/zabbix/7.2/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.2+ubuntu24.04_all.deb
dpkg -i zabbix-release_latest_7.2+ubuntu24.04_all.deb
apt update 

apt install zabbix-agent

sudo mcedit /etc/zabbix/zabbix_agentd.conf

systemctl restart zabbix-agent
systemctl enable zabbix-agent

```
---
