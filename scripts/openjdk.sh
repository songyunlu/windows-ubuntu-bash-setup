#!/usr/bin/env bash

sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install -y openjdk-${JAVA_VERSION}-jdk
java -version

echo 'export JAVA_HOME="/usr/lib/jvm/java-${JAVA_VERSION}-openjdk-amd64/jre"' >> ${HOME}/.zshrc
