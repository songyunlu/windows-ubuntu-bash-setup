#!/usr/bin/env bash

sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install -y python3.6
sudo apt-get install -y python3.6-dev
sudo ln -sf /usr/bin/python3.6 /usr/bin/python3
sudo ln -sf /usr/bin/python3 /usr/bin/python
python --version
python3 --version

wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
pip --version

pip install --user virtualenv
echo 'alias ven="virtualenv"' >> ${HOME}/.zshrc
