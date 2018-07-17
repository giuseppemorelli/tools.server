#!/usr/bin/env bash

apt-get update \
&& apt-get install git -y \
&& cd ~ && git clone https://github.com/gmdotnet/tools.server.git \
&& cd ~/tools.server/scripts/docker/ && bash install_docker_debian.sh \
&& groupadd docker \
&& sudo gpasswd -a $USER docker \
&& systemctl restart docker