[![CircleCI](https://circleci.com/gh/r72cccp/MetaStudioNewsApiTest.svg?style=svg)](https://circleci.com/gh/r72cccp/MetaStudioNewsApiTest)

# MetaStudioNewsApiTest
Rails backend for MetaStudio test

## Тестовое задание на вакансию Ruby on Rails разработчик в компанию MetaStudio

http://metastudiohq.com
Вопросы и комментарии: info@metastudio.ru

### Задание:

Разработать простую новостную систему. Реализовать добавление, просмотр и удаление новостей. Реализовать систему
авторизации пользователей.

### Детали:

На главной странице должны выводиться новости в виде таблицы, отсортированные по дате добавления. Список новостей должен
содержать следующие колонки:
  * Название (ссылка на просмотр новости)
  * Категория
  * Автор
  * Дата добавления
  * Необходимые поля для регистрации/авторизации: email и password.

Страница просмотра новости доступна всем пользователям и содержать всю информацию о новости
Добавление новостей доступно только авторизованным пользователям.
Добавление новости должно быть организовано в 3 шага со следующими полями:
  * Шаг 1:
    - Заголовок (required, string)
    - Источник новости (required, string)
    - URL источника (not required, string, url)
  * Шаг 2:
    - HTML-текст новости (required, textarea)
  * Шаг 3:
    - Категория новости (required, выбор из списка заданного в конфиге: Авто, Здоровье, Финансы, Происшествия)
    - Возрастная аудитория (not required, выбор из списка заданного в конфиге: 0+, 6+, 12+, 16+, 18+)

На форме добавления новости должна быть возможность вернуться на предыдущие шаги для обновления полей.
Удаление новости доступно только автору новости. Ссылка/кнопка для удаления новости должна отображаться в списке на
главной странице. Удаление новости должно происходить без перезагрузки страницы.



## Требования:

* Использовать Ruby on Rails (React.js по желанию).
* Использовать Twitter Bootstrap
* Разрешается использовать любые gem-ы.
* Покрытие тестами будет плюсом

После выполнения задания нужно прислать ссылку на репозиторий на GitHub или Bitbucket по адресу hr@metastudio.ru, указав
свои контактные данные и количество потраченного на задание времени.


## Install Gems and dependencies
* Ruby version:
  - > 2.7.0

* System dependencies:
  - PostgreSQL

* Configuration
  Database settings:
  - Copy file `./config/.env.local.example` to your file `./config/local.env` and fill strings:
    - Database autentication: `DATABASE_USER_NAME`, `DATABASE_PASSWORD`.
    - Categories: `AGE_CATEGORIES`, `NEWS_CATEGORIES` - as delimited with comma strings

## Database creation && initialization
  ```bash
  rails db:create
  rails db:migrate
  ```

## How to run the test suite
  ```bash
  bundle exec rspec
  ```

  Also, probably you need to initialize test db:
  ```bash
  rails db:migrate RAILS_ENV=test
  ```

## Branch coverage
  See the branch coverage report [here](https://htmlpreview.github.io/?https://github.com/r72cccp/MetaStudioNewsApiTest/blob/master/public/coverage/index.html).

## Deployments
  Master branch of this application accessible on Heroku.
  POST User Authenticate request available on [https://metastudio-news-api.herokuapp.com/authenticate](https://metastudio-news-api.herokuapp.com/authenticate),
  for example.
