#!/usr/bin/env bash

curl -so /tmp/gradle.zip -L https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
sudo mkdir /opt/gradle
sudo unzip -d /opt/gradle /tmp/gradle.zip

echo 'export PATH="$PATH:/opt/gradle/gradle-4.1/bin"' >> ~/.zshrc
echo 'alias gd="gradle"' >> ~/.zshrc
