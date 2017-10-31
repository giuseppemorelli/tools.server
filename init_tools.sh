#!/usr/bin/env bash

PHP=`which php`

if [ "$PHP" = "/usr/bin/php" ]; then

    ## composer
    wget https://getcomposer.org/composer.phar
    chmod +x ./composer.phar
    mkdir ./bin/
    mv ./composer.phar ./bin/composer

    ## install dependency
    bin/composer install

    ## n98-magerun
    wget https://files.magerun.net/n98-magerun.phar
    chmod +x ./n98-magerun.phar
    mkdir ./bin/
    mv ./n98-magerun.phar ./bin/n98-magerun

    ## n98-magerun2
    wget https://files.magerun.net/n98-magerun2.phar
    chmod +x ./n98-magerun2.phar
    mkdir ./bin/
    mv ./n98-magerun2.phar ./bin/n98-magerun2

    ## mysql tuner
    wget http://mysqltuner.pl/ -O ./mysqltuner
    chmod +x ./mysqltuner
    mkdir ./bin/
    mv ./mysqltuner ./bin/mysqltuner

    ## modman
    cp ./vendor/colinmollenhour/modman/modman ./bin/
    chmod +x ./bin/modman

else

    echo "Attention! You need to install at least php-cli on your server"

fi