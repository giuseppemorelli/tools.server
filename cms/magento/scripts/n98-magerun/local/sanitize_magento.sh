#!/usr/bin/env bash

###########################
## MAGENTO CONFIGURATION ##
## Sanitize section      ##
## version 1.1.0         ##
###########################

# Import config file
. ./config/mageconfig.cfg

cd "$MAGENTO_PATH"
n98-magerun script "$PROJECT_PATH""$N98MAGERUN_SANITIZE_SCRIPT"