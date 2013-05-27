Что за шаблон?
===

Это шаблон приложения на Rails 4.0 для удобного создания новых проектов,
используя стандартные в компании http://brandymint.ru/ лайауты и
настройки.

Процесс использования
===

   > git clone git@github.com:BrandyMint/rails4_template.git <новый_каталог>
   > git remote set-url origin <url нового репо>`
   > # Переименовываем namespace проекта в нужный
   > ./bootstrap <имя нового проекта>`

Например:

   > git clone git@github.com:BrandyMint/rails4_template.git masha
   > git remote set-url origin https://github.com/BrandyMint/masha
   > ./bootstrap Masha

Новый проект готов к использованию.

Дальнейшие действия
===

1. Настраиваем `./config/application.yml` и `./config/database.yml`
2. `bundle update`
3. Регистрируем проект в http://errbit.brandymint.ru/apps и вписываем
ключи в `./config/initializers/airbrake.rb`

История
=======

layout взяты на основе этого проекта
http://railsapps.github.io/rails-default-application-layout.html
http://railsapps.github.io/twitter-bootstrap-rails.html


Альтернативы
============

* https://github.com/thoughtbot/suspenders
* http://railsapps.github.io/
