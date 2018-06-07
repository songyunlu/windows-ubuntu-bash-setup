#!/usr/bin/env bash

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java${JAVA_VERSION}-installer
java -version

echo 'export JAVA_HOME="/usr/lib/jvm/java-${JAVA_VERSION}-oracle"' >> ${HOME}/.zshrc
