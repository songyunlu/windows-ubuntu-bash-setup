#!/usr/bin/env bash

echo 'umask 022' >> ~/.bashrc
source ~/.bashrc

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y zip unzip htop jq

echo 'export PATH="$PATH:$HOME/.local/bin' >> ~/.zshrc
