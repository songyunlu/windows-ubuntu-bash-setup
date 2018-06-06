#!/usr/bin/env bash

sudo apt-get remove -y docker docker-engine docker.io
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
docker version
echo 'export DOCKER_HOST="tcp://127.0.0.1:2375"' >> ~/.zshrc
echo 'alias d="docker"' >> ~/.zshrc

sudo curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
echo 'alias dc="docker-compose"' >> ~/.zshrc

base=https://github.com/docker/machine/releases/download/v{DOCKER_MACHINE_VERSION} &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo install /tmp/docker-machine /usr/local/bin/docker-machine
docker-machine --version
echo 'alias dm="docker-machine"' >> ~/.zshrc

