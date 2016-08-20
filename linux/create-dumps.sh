#!/bin/sh

dump_directory=/var/backups/dumps

dpkg --get-selections > ${dump_directory}/dpkg-selections.txt
aptitude search '~i' > ${dump_directory}/aptitude-list.txt

## MySQL
#
#$(dpkg-query --showformat='${Status}\n' --show 'mysql-server-*' | grep -c "ok installed")
#PKG_OK=$(dpkg-query -W --showformat='${Status}\n' the.package.name|grep "install ok installed")
#
#for DB in $(mysql -e "SHOW DATABASES" | tail -n+2)
#do
#        mysqldump  --add-drop-database --lock-all-tables $DB > ${dump_directory}/mysql.$DB.sql
#        chmod 600 ${dump_directory}/mysql.$DB.sql
#done
