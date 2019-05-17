#!/usr/bin/env bash
DATE=`date +%Y%m%d-%H%M%S`
DBNAME=xxxxx

cd ~/backup-db
/usr/bin/mysqldump -u backup -p5ruc1K4eaQ34wCNr $DBNAME > $DBNAME.sql
tar cfz $DBNAME.sql.tar.gz $DBNAME.sql
mv $DBNAME.sql.tar.gz $DBNAME-"$DATE".sql.tar.gz
rm $DBNAME.sql

# 60 means 60 days OLD (delete backup before these days)
TIME=30

# Folder to store old files
# !!! USE THE SLASH AT THE END !!!
FOLDER=/root/backup-db/

find $FOLDER -mtime +$TIME -exec rm {} -r \;
