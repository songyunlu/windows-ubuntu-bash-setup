#!/usr/bin/env bash

echo 'umask 022' >> ${HOME}/.bashrc
source ${HOME}/.bashrc

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y zip unzip htop jq

echo 'export PATH="$PATH:$HOME/.local/bin"' >> ${HOME}/.zshrc

# chnage the mount point of windows file system to /c instead of /mnt/c
# The options = "metadata" line is not necessary but it will fix folder and file permissions on WSL mounts so everything isn’t 777 all the time within the WSL mounts.
cat <<EOF > /etc/wsl.conf
[automount]
root = /
options = "metadata"
EOF
