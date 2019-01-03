#!/usr/bin/env bash
docker run --rm --name phpmyadmin -d -e PMA_HOST="$1" -p 5050:80 phpmyadmin/phpmyadmin
