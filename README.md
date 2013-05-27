Что за шаблон?
===

Это шаблон приложения на Rails 4.0 для удобного создания новых проектов,
используя стандартные в компании http://brandymint.ru/ лайауты и
настройки.

Пример
===

    $ \curl -L https://raw.github.com/BrandyMint/rails4_template/master/bootstrap.sh | bash -s Masha


Что при этои происходится?

1. Клонируется проект `rails4_template` в каталог производный от
указанного имени.
2. Рельсовое приложение переименуется в указанное имя
(`Masha::Application`)
3. Базу тоже назовут в ее честь.
4. Запустится `bundle update`
5. Пропишется указанный репозиторий (если указан) и зальется первый
комит.

Что делать дальше?
==================

1. Настроить `./config/application.yml` и `./config/database.yml`
2. Зарегистрировать проект в http://errbit.brandymint.ru/apps и вписать
ключи `./config/initializers/airbrake.rb`

История
=======

layout взяты на основе этого проекта
http://railsapps.github.io/rails-default-application-layout.html
http://railsapps.github.io/twitter-bootstrap-rails.html


Альтернативы
============

* https://github.com/thoughtbot/suspenders
* http://railsapps.github.io/
