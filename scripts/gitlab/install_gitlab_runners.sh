#!/usr/bin/env bash

## reference: http://docs.gitlab.com/runner/install/linux-repository.html
## reference: https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/issues/312

curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | bash
apt-get install gitlab-ci-multi-runner -y
gitlab-ci-multi-runner register
cd /tmp/ && wget https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/master/deb/gitlab-ci-multi-runner_amd64.deb
dpkg -i gitlab-ci-multi-runner_amd64.deb