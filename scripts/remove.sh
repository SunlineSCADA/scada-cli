#!/bin/sh
set -e
echo "Remove database \`${DB_DATABASE}\`"
mysql -h${DB_HOST} -u${DB_ROOT_USER} -p${DB_ROOT_PASSWORD} -e "DROP USER '${DB_USER}'@'%'"
mysql -h${DB_HOST} -u${DB_ROOT_USER} -p${DB_ROOT_PASSWORD} -e "DROP DATABASE \`${DB_DATABASE}\`"
echo "Cleanup files"
rm -rf /scada/data /scada/config.json /scada/docker-compose.yml
echo "All done!"