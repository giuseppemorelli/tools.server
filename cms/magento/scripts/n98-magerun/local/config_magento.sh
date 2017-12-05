#!/usr/bin/env bash

###########################
## MAGENTO CONFIGURATION ##
## version 1.1.0         ##
###########################

# Import config file
. ./config/mageconfig.cfg

# Create local.xml file
echo "## Create 'local.xml' file ##"
cd "$MAGENTO_PATH""app/etc/"
if [ ! -f "$MAGENTO_LOCALXML" ]; then
    echo "Model "$MAGENTO_LOCALXML" not found!" >&2
    exit;
else
    rm local.xml
    cp "$MAGENTO_LOCALXML" local.xml
    echo "local.xml created!"
fi

# n98-magerun scripts
cd "$MAGENTO_PATH"
n98-magerun script -d url="$MAGENTO_URL" \
-d email="$MAGENTO_EMAIL" -d mage_config="$MAGENTO_MAGE_CONFIG" \
-d mage_config_env="$MAGENTO_MAGE_CONFIG_ENV" \
-d url_store2="$MAGENTO_URL2" -d store_id2="$MAGENTO_STORE_ID_2" \
"$PROJECT_PATH""$N98MAGERUN_SCRIPT"

n98-magerun admin:user:create local local@local local "Test User" "Test User"

if [ "$SANITIZE" == true ]; then
    cd "$MAGENTO_PATH"
    n98-magerun script "$PROJECT_PATH""$N98MAGERUN_SANITIZE_SCRIPT"
fi