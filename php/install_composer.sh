#!/usr/bin/env bash

## composer
wget https://getcomposer.org/composer.phar
chmod +x ./composer.phar
mkdir ../bin/
mv ./composer.phar ../bin/composer