#!/usr/bin/env bash

echo "START RANCHER on localhost:8081"
docker run -d --restart=unless-stopped --name=rancher-server -p 8081:8080 rancher/server:stable