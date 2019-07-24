#!/bin/sh

cd /var/www/html/application/frontend

yarn cache clear --force
yarn install

yarn serve --port 3000
# yarn build
