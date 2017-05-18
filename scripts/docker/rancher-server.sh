#!/usr/bin/env bash

echo "START RANCHER on localhost:8080"
docker run -d --restart=unless-stopped --name=rancher-server -p 8080:8080 rancher/server:stable
iptables -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT