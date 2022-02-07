# Как развернуть Serverless Docker

Развертывание будет делаться в ubuntu (wsl).
Не забудьте поставить **jq** (JSON processor)
([описание jq](https://stedolan.github.io/jq/))
[doc](https://stedolan.github.io/jq/manual/)

### 1. Cоздайте реестр и репозиторий docker-образов

Реестр — хранилище Docker-образов.

В командах Docker CLI необходимо использовать полное имя, включающее в себя адрес Container Registry:

```docker
docker push cr.yandex/<ID реестра>/<имя Docker-образа>
```

Репозиторий — набор Docker-образов с одинаковым именем.

В командах YC CLI необходимо использовать имя репозитория без адреса Container Registry:
```yc
yc container image list --repository-name=<ID реестра>/<имя Docker-образа>
```

выводе команды в переменной `movies_api_repository_name` вы увидите название репозитория, которое ниже будет
использоваться при загрузке образа. Экспортируйте его в переменную окружения:


### 2. Сконфигурируйте docker для работы с только что созданным репозиторием с помощью команды:

```bash
yc container registry configure-docker
```

### 3. Соберите docker-образ приложения

(файл конфигурации docker-образа традиционно называется [Dockerfile](Dockerfile)) и загрузите его в созданный на предыдущем шаге репозиторий. 

Для этого выполните команду из корня проекта:

```bash
./deploy/docker-build.sh
```

4. Создайте serverless-контейнер, который будет запускаться из выше созданного образа:

```bash
yc sls container create --name movies-api-container --folder-id ${FOLDER_ID}
```

В выводе команды вы увидите идентификатор созданного контейнера, команда экспортирует его в переменную окружения CONTAINER_ID

Разверните ревизию контейнера с версией образа `0.0.1`:





















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