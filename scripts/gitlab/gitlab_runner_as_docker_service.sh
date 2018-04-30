#!/usr/bin/env bash

set -e

docker pull gitlab/gitlab-runner:latest
docker pull busybox:latest
docker stop gitlab-runner && docker rm gitlab-runner
docker stop gitlab-runner-config && docker rm gitlab-runner-config

docker run -d --name gitlab-runner-config \
    -v /etc/gitlab-runner \
    busybox:latest \
    /bin/true

docker run -d --name gitlab-runner --restart always \
    --volumes-from gitlab-runner-config \
    gitlab/gitlab-runner:latest

sudo gitlab-runner register