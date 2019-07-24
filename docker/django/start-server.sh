#!/bin/bash

pip install -r /var/www/html/docker/django/requirements.txt
pip freeze -l > /var/www/html/docker/django/requirements.txt

# dockerの環境変数(.env)ファイル
# https://docs.docker.com/compose/environment-variables/#the-env-file
# http://docs.docker.jp/compose/env-file.html

if [ "${DJANGO_ENV}" = 'production' ]; then
    # uwsgi --ini /var/www/html/application/django.ini
    python manage.py migrate
    gunicorn config.wsgi:application -c ../docker/etc/gunicorn.conf
else
    python manage.py migrate --settings config.settings.test
    python manage.py runserver 0.0.0.0:8000 --nostatic --settings config.settings.test
fi
