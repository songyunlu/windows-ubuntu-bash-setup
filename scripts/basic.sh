#!/usr/bin/env bash

echo 'umask 022' >> ${HOME}/.bashrc
source ${HOME}/.bashrc

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y zip unzip htop jq

echo 'export PATH="$PATH:$HOME/.local/bin' >> ${HOME}/.zshrc
