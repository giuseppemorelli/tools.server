#!/bin/sh
####################################################
# Script for storage old backup
# Delete all old backup before "TIME" days
#####################################################

# 60 means 60 days OLD (delete backup before these days)
TIME=5

# Folder to get old files ex. /home/backup/DAILY/0/
# !!! USE THE SLASH AND '*' AT THE END !!!
FOLDER_FROM=/home/backup/DAILY/*

# Folder to store old files
# !!! USE THE SLASH AT THE END !!!
FOLDER_TO=/home/backup-week/

mv $FOLDER_FROM $FOLDER_TO
find $FOLDER_TO -mtime +$TIME -exec rm {} -r \;