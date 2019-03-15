#!/usr/bin/env bash

sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install -y python3.6
sudo apt-get install -y python3.6-dev

sudo apt-get install -y python3.6-gdbm
sudo apt-get remove -y --purge python-apt
sudo apt-get install -y python-apt
sudo cp /usr/lib/python3/dist-packages/apt_pkg.cpython-3?m-x86_64-linux-gnu.so /usr/lib/python3/dist-packages/apt_pkg.cpython-36m-x86_64-linux-gnu.so

wget https://bootstrap.pypa.io/get-pip.py
sudo python3.6 get-pip.py
pip --version
rm get-pip.py

pip install --user virtualenv
echo 'alias venv="virtualenv"' >> ${HOME}/.zshrc

sudo ln -sf /usr/bin/python3.6 /usr/bin/python3
sudo ln -sf /usr/bin/python3 /usr/bin/python
