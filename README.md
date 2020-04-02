# Тестовое задание - простая новостная система

Разработать простую новостную систему. Реализовать добавление, просмотр и удаление новостей. Реализовать систему авторизации пользователей.

Данное приложение реализует функционал API. Клиентскую часть смотри тут [TODO]

## Установка api
* Ruby version:
  - > 2.7.0

* System dependencies:
  - PostgreSQL

* Configuration
  Database settings: Copy file `./config/.env.local.example` to your file `./config/local.env` and fill strings:
  DATABASE_USER_NAME, DATABASE_PASSWORD.


* Database creation && initialization
  ```bash
  rails db:create
  rails db:migrate
  ```

* How to run the test suite
  ```
  rails test
  ```
