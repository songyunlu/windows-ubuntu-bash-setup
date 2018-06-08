#!/usr/bin/env bash

sudo apt-get install -y python
python --version

sudo apt-get install -y python-virtualenv
echo 'alias ven="virtualenv"' >> ${HOME}/.zshrc

sudo apt-get install -y python-pip
pip install --upgrade pip
pip --version

sudo apt-get install python3-pip
pip3 --version

