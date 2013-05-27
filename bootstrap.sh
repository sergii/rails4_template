#!/usr/bin/env bash

ORIGINAL_REPO='./rails4_template'

usage()
{
  printf "%b" "
Запуск

 ./bootstrap -n <ИМЯ_ПРОЕКТА>
"
}

while (( $# > 0 ))
do
  token="$1"
  shift
  case "$token" in
    --name)
      name=$1
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
  dest=$name

  echo "Назову-ка я проект $name"

  if git clone --depth 1 --branch master $ORIGINAL_REPO $dest && cd $dest; then
    rm -rf .git
    
    perl -i -p -e "s/Rails4Template/$NAME/g" **/*.rb **/*.rb Rakefile
    cp ./config/database.yml.example ./config/database.yml
    perl -i -p -e "s/ttt_/$NAME_/g" ./config/database.yml

    pwd | grep -v rails4_template | rm ./bootstrap.sh # Самоуничтажаемся
  else
    echo "Ощутил проблемы при клонировании шаблона"
  fi

else
  usage
  exit 2
fi
