#!/usr/bin/env bash

curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | bash
apt-get install gitlab-ci-multi-runner -y
gitlab-ci-multi-runner register