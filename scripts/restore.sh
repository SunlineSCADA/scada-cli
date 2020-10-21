#!/bin/sh
set -e
if [ "$1" ]; then
echo "Unpack snapshot \`$1\`"
tar -xvf "/scada/$1" -C /tmp
else
echo "Unpack default snapshot"
tar -xvf "/app/snapshot.tar.gz" -C /tmp
fi
echo "Restore database \`${DB_DATABASE}\`"
pv /tmp/dump.sql.gz | gunzip | mysql -h${DB_HOST} -u${DB_USER} -p${DB_PASSWORD} ${DB_DATABASE}
echo "Restore files"
rsync -ahr --delete --progress --exclude '.gitkeep' /tmp/data/ /scada/data/
echo "All done!"