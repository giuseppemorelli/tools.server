#!/usr/bin/env bash

## mysql tuner
wget http://mysqltuner.pl/ -O ./mysqltuner
chmod +x ./mysqltuner
mkdir ../bin/
mv ./mysqltuner ../bin/mysqltuner