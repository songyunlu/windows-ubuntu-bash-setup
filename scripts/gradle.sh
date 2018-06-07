#!/usr/bin/env bash

curl -so /tmp/gradle.zip -L https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
sudo mkdir /opt/gradle
sudo unzip -d /opt/gradle /tmp/gradle.zip
/opt/gradle/gradle-${GRADLE_VERSION}/bin/gradle --version

echo 'export PATH="$PATH:/opt/gradle/gradle-${GRADLE_VERSION}/bin"' >> ~/.zshrc
echo 'alias gd="gradle"' >> ~/.zshrc
