#!/usr/bin/env bash

set -x

umask 022

source env.sh

source scripts/basic.sh
source scripts/git.sh
source scripts/zsh.sh
source scripts/vim.sh
source scripts/python.sh
source scripts/ansible.sh
source scripts/papermill.sh
source scripts/golang.sh
source scripts/openjdk.sh
source scripts/sbt.sh
source scripts/maven.sh
source scripts/gradle.sh
source scripts/aws-cli.sh
source scripts/gcloud-sdk.sh
source scripts/docker.sh
source scripts/vagrant.sh
source scripts/kubernetes.sh
source scripts/jekyll.sh

exec zsh
