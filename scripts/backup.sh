#!/bin/sh
set -e
echo "Dump database \`${DB_DATABASE}\`"
mysqldump -h${DB_HOST} -u${DB_USER} -p${DB_PASSWORD} ${DB_DATABASE} | gzip > /tmp/dump.sql.gz
echo "Create archive \`$1\`"
tar -zcvf "/scada/$1" -C /scada data -C /tmp dump.sql.gz
echo "All done!"