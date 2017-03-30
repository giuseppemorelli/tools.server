#!/usr/bin/env bash

##################################
## Remove ALL docker containers ##
##################################

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
