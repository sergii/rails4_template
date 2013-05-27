Ttt
===

1. rename Rails4Application -> в название проекта
>  perl -i -p -e 's/Rails4Application/NAME/g' app/**/*.rb config/**/*.rb
Rakefile
2.a. rename HOSTNAME
3. ln -s ./config/database.yml.example ./config/database.yml
4. Зарегстрировать приложение в errbit


История
=======

layout взяты на основе этого проекта
http://railsapps.github.io/rails-default-application-layout.html
http://railsapps.github.io/twitter-bootstrap-rails.html
