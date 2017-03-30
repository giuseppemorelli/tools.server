#!/bin/sh

#############################################
## Change folder permission for web folder ##
#############################################

# INPUT: web folder
if [ -z $1 ]
then
 # no input
 echo "(1) NO FOLDER CHOOSED"
 echo "Example: /var/www/project.com/"
 exit
fi

# FOLDERS
cd "$1"
chmod 755 "$1"
find . -type d -exec chmod 755 {} +

# FILES
find . -type f -exec chmod 644 {} +

# EXECUTABLE FILES
find . -type f -name *.sh -exec chmod 744 {} +
find . -type f -name *.phar -exec chmod 744 {} +
# EXCEPTIONS
find . -type f -name mysqltuner.pl -exec chmod 744 {} +

