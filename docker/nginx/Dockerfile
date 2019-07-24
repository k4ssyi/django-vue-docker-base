FROM nginx:alpine
LABEL maintainer "k4ssyi <hogehoge@example.com>"

ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

# ツールをインストール
RUN apk --update --no-cache add openssl
RUN apk add vim

# ルートディレクトリを作成
RUN mkdir -p /var/www/html

# 設定ファイル
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/sites-available/default
ADD default.conf /etc/nginx/sites-enabled/default
ADD start-nginx.sh /

# 自己証明書を発行
RUN openssl genrsa 2048 > server.key \
 && openssl req -new -key server.key -subj "/C=JP/ST=Tokyo/L=Chuo-ku/O=RMP Inc./OU=web/CN=localhost" > server.csr \
 && openssl x509 -in server.csr -days 3650 -req -signkey server.key > server.crt \
 && cp server.crt /etc/nginx/server.crt \
 && cp server.key /etc/nginx/server.key \
 && chmod 755 -R /var/www/html \
 && chmod 400 /etc/nginx/server.key
