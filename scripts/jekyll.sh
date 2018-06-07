#!/usr/bin/env bash

sudo apt-add-repository -y ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install -y ruby2.3 ruby2.3-dev build-essential
sudo gem update
sudo gem install jekyll bundler
jekyll -v
sudo gem install jekyll-feed jekyll-seo-tag

echo 'alias jk="jekyll"' >> ${HOME}/.zshrc
