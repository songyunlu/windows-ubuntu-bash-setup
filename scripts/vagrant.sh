#!/usr/bin/env bash

curl -so /tmp/vagrant.deb -L https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb
sudo dpkg -i /tmp/vagrant.deb
vagrant --version

echo 'export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"' >> ${HOME}/.zshrc
echo 'export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH="/mnt/c"' >> ${HOME}/.zshrc
echo 'alias vg="vagrant"' >> ${HOME}/.zshrc
