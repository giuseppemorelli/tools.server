#!/bin/sh

cd /root/backup-db
var=$(ls *.tar.gz | sort -V | tail -n 1)
rm -rf /tmp/last-db
mkdir /tmp/last-db
cp $var /tmp/last-db/dump.tar.gz