#!/bin/bash
apt-get update
apt-get install git -y
cd /home/admin && git clone https://github.com/gmdotnet/tools.server.git
cd /home/admin/tools.server/scripts/docker/ && bash install_docker_debian.sh
groupadd docker
gpasswd -a admin docker
systemctl restart docker