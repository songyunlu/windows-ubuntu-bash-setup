#!/usr/bin/env bash

curl -so /tmp/golang.tar.gz -L https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf /tmp/golang.tar.gz
go version

echo 'export PATH="$PATH:/usr/local/go/bin"' >> ${HOME}/.zshrc
