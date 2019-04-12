#!/usr/bin/env bash

# docker run --rm --name phpmyadmin -d -e PMA_HOST= -p 5050:80 phpmyadmin/phpmyadmin
docker run --rm --name phpmyadmin -d -e PMA_HOST=localhost -p 5050:80 phpmyadmin/phpmyadmin