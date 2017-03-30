#!/bin/bash
##########################################################
# Script for full backup MySQL databases (External server)
#
# Usage
# backup_database.sh <number_of_backup_db_expected>
##########################################################

TIMESTAMP=$(date +"%F_%H-%M-%S")
# Absolute path of folder backup
BACKUP_ROOT=/home/backup-db
# Folder's name of backup
BACKUP_DIR="$BACKUP_ROOT/$TIMESTAMP"
# MySQL username and password
MYSQL_USER="backup"
MYSQL_PASSWORD="backup"
# Mysql and mysqldump bin command file
MYSQL=/usr/bin/mysql
MYSQLDUMP=/usr/bin/mysqldump

# Counter of backup database done
counter=0

# Input parameter: number of backup database expected
if [ -z $1 ]
then
 # no input found
 param=999
else
 param=$1
fi

mkdir -p $BACKUP_DIR
databases=`$MYSQL --user=$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema)"`

for db in $databases; do
  $MYSQLDUMP --force  --single-transaction --add-drop-table  --create-options --set-charset --quick --extended-insert --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases $db | gzip > "$BACKUP_DIR/$db.gz"

 if [ "$?" -eq "0" ]; then
        echo "$db BACKUP OK"
 else
        echo "#### WARNING : #####  $db BACKUP FAILED!!"
 fi
 let counter=$counter+1
done

# Check counter and input parameter are OK
if [ $counter -ne $param ]
then
    echo "---------------------------------------------"
    echo "#### WARNING!!! LOW databases backup made"
    echo "DB BACKUP EXPECTED: $param"
    echo "DB BACKUP DONE: $counter"
fi

echo "---------------------------------------------"
echo "DB INPUT PARAMETER: $param"
echo "DB BACKUP DONE: $counter"
echo "---------------------------------------------"