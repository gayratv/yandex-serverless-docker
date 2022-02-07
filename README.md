# Как развернуть Serverless Docker

Присвойте скачанному Docker-образу тег вида cr.yandex/<ID реестра>/<имя Docker-образа>:<тег>:

cr.yandex/crp8nkorq38f8qo0modb
~~~~
docker tag ubuntu cr.yandex/crp8nkorq38f8qo0modb/ubuntu:hello

Загрузите Docker-образ в репозиторий Container Registry:

docker push cr.yandex/crp8nkorq38f8qo0modb/ubuntu:hello


Запустите Docker-образ:

docker run cr.yandex/crp8nkorq38f8qo0modb/ubuntu:hello

=======================
https://cloud.yandex.ru/docs/serverless-containers/quickstart


// --tag , -t		Name and optionally a tag in the 'name:tag' format
docker build -t cr.yandex/crp8nkorq38f8qo0modb/mypril:0.0.1 .
docker push cr.yandex/crp8nkorq38f8qo0modb/mypril:0.0.1 