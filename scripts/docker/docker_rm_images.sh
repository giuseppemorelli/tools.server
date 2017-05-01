#!/usr/bin/env bash

##############################
## Remove ALL docker images ##
##############################

docker rmi $(docker images -q) -f
