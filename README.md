Что за шаблон?
===

Это шаблон приложения на Rails 4.0 для удобного создания новых проектов,
используя стандартные в компании http://brandymint.ru/ лайауты и
настройки.


Пример
===

    $ \curl -L https://raw.github.com/BrandyMint/rails4_template/master/bootstrap.sh | bash --name Masha

Процесс использования
===

1. Создаем пустой репозиторий на github.
2. Придумать название для проекта.
3. Заинициализировать проект на основе шаблона:

    > git clone git@github.com:BrandyMint/rails4_template.git <новый_каталог>
    > ./set_name.sh <ИмяНовогоПроекта>  # Переименовываем namespace проекта в нужный

Например:

    > git clone git@github.com:BrandyMint/rails4_template.git masha
    > cd masha
    > git remote set-url origin https://github.com/BrandyMint/masha
    > ./set_name.sh Masha


Что делать с git-ом?
    > git remote set-url origin <url нового репо>
    > git add .
    > git commit -m 'first commit'
    > git push
    > ./s                               # запускаем web-сервер

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
