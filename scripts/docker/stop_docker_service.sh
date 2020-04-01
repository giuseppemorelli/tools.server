#!/usr/bin/env bash

sudo systemctl stop docker
sudo killall dockerd
sudo killall containerd
