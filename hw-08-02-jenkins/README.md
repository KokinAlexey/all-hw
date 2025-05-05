# Домашнее задание к занятию "Что такое DevOps. CI/CD" - `Кокин Алексей`

---

### Задание 1

**Что нужно сделать:**

1. Установите себе jenkins по инструкции из лекции или любым другим способом из официальной документации
2. Установите на машину с jenkins
3. Используя свой аккаунт на GitHub, сделайте себе форк [репозитория](https://github.com/netology-code/sdvps-materials.git).
4. Создайте в jenkins Freestyle Project, подключите получившийся репозиторий к нему и произведите запуск тестов и сборку проекта ```go test .``` и  ```docker build .```.


### Результат 1

![Настройками проекта](https://github.com/KokinAlexey/all-hw/blob/main/hw-08-02-jenkins/images/Screenshot_4.jpg)
![Результатами выполнения сборки](https://github.com/KokinAlexey/all-hw/blob/main/hw-08-02-jenkins/images/Screenshot_3.jpg)

---

### Задание 2

**Что нужно сделать:**

1. Создайте новый проект pipeline.
2. Перепишите сборку из задания 1 на declarative в виде кода.

### Результат 2


![Настройками проекта](https://github.com/KokinAlexey/all-hw/blob/main/hw-08-02-jenkins/images/Screenshot_5.jpg)
![Результатами выполнения сборки 1](https://github.com/KokinAlexey/all-hw/blob/main/hw-08-02-jenkins/images/Screenshot_6.jpg)
![Результатами выполнения сборки 2](https://github.com/KokinAlexey/all-hw/blob/main/hw-08-02-jenkins/images/Screenshot_7.jpg)

---

### Задание 3

**Что нужно сделать:**

1. Установите на машину Nexus.
2. Создайте raw-hosted репозиторий.
3. Измените pipeline так, чтобы вместо Docker-образа собирался бинарный go-файл. Команду можно скопировать из Dockerfile.
4. Загрузите файл в репозиторий с помощью jenkins.

### Результат 3

![Настройками проекта](https://github.com/KokinAlexey/all-hw/blob/main/hw-08-02-jenkins/images/Screenshot_9.jpg)
![Результатами выполнения сборки](https://github.com/KokinAlexey/all-hw/blob/main/hw-08-02-jenkins/images/Screenshot_10.jpg)
![Содержимое Nexus](https://github.com/KokinAlexey/all-hw/blob/main/hw-08-02-jenkins/images/Screenshot_11.jpg)

