#!/usr/bin/env bash

## modman
SRC="https://raw.githubusercontent.com/colinmollenhour/modman/master/modman"
DEST="../../../bin/modman"

mkdir ../../../bin/
curl -s -L $SRC -o $DEST
cd ../../../bin/
chmod +x modman