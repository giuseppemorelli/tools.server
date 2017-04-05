#!/usr/bin/env bash

#########################
## IMAGES OPTIMIZATION ##
## version 1.0.0       ##
#########################

# INPUT: folder with images
if [ -z $1 ]
then
 # no input
 echo "(1) No folder choosed"
 echo "Example: /var/www/project.com/"
 exit
fi

cd "$1"
find -type f -name "*.jpg" -exec jpegoptim --strip-all {} \;
find -type f -name "*.png" -exec optipng {} \;