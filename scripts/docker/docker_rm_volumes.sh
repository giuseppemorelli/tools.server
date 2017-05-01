#!/usr/bin/env bash

###############################
## Remove ALL docker volumes ##
###############################

docker volume rm $(docker volume ls -q)
