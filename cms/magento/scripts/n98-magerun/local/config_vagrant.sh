#!/usr/bin/env bash

###########################
## MAGENTO CONFIGURATION ##
## version 1.0.2         ##
###########################

# Import config file
. ./vagrant.cfg

# Create local.xml file
echo "## Create 'local.xml' file ##"
cd "$PATHMAGENTO""app/etc/"
if [ ! -f "$LOCALXML" ]; then
    echo "Model "$LOCALXML" not found!"
    exit;
else
    rm local.xml
    ln -s "$LOCALXML" local.xml
    echo "local.xml created!"
fi

# n98-magerun scripts
cd "$PATHMAGENTO"
n98-magerun script -d url="$URL" -d email="$EMAIL" -d mage_config="$MAGE_CONFIG" -d mage_config_env="$MAGE_CONFIG_ENV" \
-d url_store2="$URL2" -d store_id2="$STORE_ID_2" \
"$PATHPROJECT""$N98MAGERUN_SCRIPT"