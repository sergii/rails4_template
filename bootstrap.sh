#!/usr/bin/env bash

ORIGINAL_REPO='./rails4_template'

usage()
{
  printf "%b" "
Запуск

 ./bootstrap --name <ИМЯ_ПРОЕКТА> --git <git_repo>
"
}

while (( $# > 0 ))
do
  token="$1"
  shift
  case "$token" in
    --git)
      git=$1
      echo "Кину проект в репозтоирий: $git"
      shift
      ;;
    --name)
      name=$1
      if echo $name | grep -e '^[A-Z]'; then
        echo "Название проекта: $name"
      else
        echo "Проект должен называться с заглавной буквы, $name не подходит."
        exit 4
      fi
      shift
      ;;
    help|usage)
      usage
      exit 0
      ;;
    *)
      usage
      exit 12
      ;;
  esac
done

if [ -n "$name" ]; then
  lc_name=`echo $name | tr '[A-Z]' '[a-z]'`
  dest=$lc_name

  echo "Создаю проект в каталоге $dest"

  if git clone --depth 1 --branch master $ORIGINAL_REPO $dest && cd $dest; then
    rm -rf .git
   
    echo "Именую проект" 
    perl -i -p -e "s/Rails4Template/$name/g" */**/*.rb **/*.rb Rakefile

    echo "Устанавливаю настройки базы"
    cp ./config/database.yml.example ./config/database.yml
    perl -i -p -e "s/ttt/$lc_name/g" ./config/database.yml

    pwd | grep -v rails4_template | rm ./bootstrap.sh # Самоуничтажаемся

    bundle

    if [ -n "$git" ]; then
      git init
      git remote add origin $git
      git add .
      git commit -m 'first commit'
      git push
    fi

  else
    echo "Ощутил проблемы при клонировании шаблона"
  fi

else
  usage
  exit 2
fi
