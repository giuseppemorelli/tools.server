#!/usr/bin/env bash

# install dependency
composer install

## cms > magento > n98-magerun
wget https://files.magerun.net/n98-magerun.phar
chmod +x ./n98-magerun.phar
mkdir ./cms/
mkdir ./cms/magento
mv ./n98-magerun.phar ./cms/magento/n98-magerun

## database > mysql
wget http://mysqltuner.pl/ -O ./mysqltuner
chmod +x ./mysqltuner
mkdir ./database/
mkdir ./database/mysql
mv ./mysqltuner ./database/mysql