FROM python:latest
ENV PYTHONUNBUFFERED 1
LABEL maintainer "k4ssyi <hogehoge@example.co.jp>"

ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

WORKDIR /var/www/html/application
RUN pip install --upgrade pip setuptools wheel
COPY ./requirements.txt ./requirements.txt
RUN pip install -r ./requirements.txt
