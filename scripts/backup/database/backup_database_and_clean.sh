#!/usr/bin/env bash

#!/usr/bin/env bash
DATE=`date +%Y%m%d-%H%M%S`

cd ~/backup-db
/usr/bin/mysqldump -u backup -p<your password> yourdbname > yourdbname.sql
tar cvfz yourdbname.sql.tar.gz yourdbname.sql
mv yourdbname.sql.tar.gz yourdbname-"$DATE".sql.tar.gz
rm yourdbname.sql

# 60 means 60 days OLD (delete backup before these days)
TIME=30

# Folder to store old files
# !!! USE THE SLASH AT THE END !!!
FOLDER=/root/backup-db/

find $FOLDER -mtime +$TIME -exec rm {} -r \;
