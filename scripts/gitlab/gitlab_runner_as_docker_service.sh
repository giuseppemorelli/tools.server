#!/usr/bin/env bash

docker pull gitlab/gitlab-runner:latest
docker stop gitlab-runner && docker rm gitlab-runner
docker stop gitlab-runner-config && docker rm gitlab-runner-config

docker run -d --name gitlab-runner --restart always \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -v /home:/home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest

docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register
