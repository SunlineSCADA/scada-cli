#!/bin/sh
set -e
echo "Create database \`${DB_DATABASE}\`"
mysql -h${DB_HOST} -u${DB_ROOT_USER} -p${DB_ROOT_PASSWORD} -e "CREATE DATABASE \`${DB_DATABASE}\`"
mysql -h${DB_HOST} -u${DB_ROOT_USER} -p${DB_ROOT_PASSWORD} -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'"
mysql -h${DB_HOST} -u${DB_ROOT_USER} -p${DB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${DB_DATABASE}\`.* TO '${DB_USER}'@'%'"
echo "Create config.json"
cat /app/configs/config.json | envsubst > /scada/config.json
echo "Create docker-compose.yml"
cat /app/configs/docker-compose.yml > /scada/docker-compose.yml
source /app/scripts/restore.sh