# django-docker-tempalte

Django + PostgreSQL + Nginx + gunicorn設定済みの雛形


### 本番環境で使う場合

※ 参 照
./docker/django/start-server.sh

```bash
# 環境変数ファイル作成
$ touch .env
# gunicorn + NginxでDjangoを動かすための設定
$ echo "DJANGO_ENV=production" >> .env
```

### その他環境変数
以下の環境変数を.envに記入

|変数名|説明|
|--|--|
|ALLOWED_HOSTS|サーバのホスト名またはアドレス|
|SECRET_KEY|Djangoのsettings.pyで記述する秘密鍵|
|DB_NAME|DBの名前|
|DB_USER|DBにログインするユーザ|
|DB_PASSWORD|DBにログインするユーザのパスワード|
|TZ|タイムゾーン|

```bash
# 以下は例なので案件毎に適宜変更して下さい

$ echo "ALLOWED_HOSTS=["127.0.0.1"]" >> .env
$ echo "SECRET_KEY=x!#3nwjted_=u5hq!e&yv#eq8tx+jh0a^vl2rzc)$78v+(hgf9" >> .env
$ echo "DB_NAME=sample" >> .env
$ echo "DB_USER=docker" >> .env
$ echo "DB_PASSWORD=docker" >> .env
$ echo "TZ=Asia/Tokyo" >> .env
```

dockerの環境変数(.env)ファイル
- https://docs.docker.com/compose/environment-variables/#the-env-file

- http://docs.docker.jp/compose/env-file.html

### 初回起動手順
```bash
# dockerイメージのビルド
$ make image # docker-compose -f docker-compose.yml build

# コンテナの起動
$ make up # docker-compose -f docker-compose.yml up -d
```

```bash
# マイグレーション
$ make migrate # docker-compose run --rm django python3 manage.py migrate
```


<img width="1677" alt="startproject" src="https://user-images.githubusercontent.com/46434778/61697152-aa34af80-ad71-11e9-92aa-d4c98e3e4c00.png">
