#!/usr/bin/env bash

sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git
git --version

cat << EOF > ~/.gitconfig
[core]
    symlinks = false
    autocrlf = input
    fscache = true
[color]
    diff = auto
    status = auto
    branch = auto
    interactive = true
[help]
    format = html
[rebase]
    autosquash = true
[diff "astextplain"]
    textconv = astextplain
[filter "lfs"]
    clean = git-lfs clean -- %f
    smudge = git-lfs smudge -- %f
    required = true
    process = git-lfs filter-process
[credential]
    helper = store
EOF

echo 'export VISUAL="vim"' >> ~/.zshrc
echo 'export EDITOR="$VISUAL"' >> ~/.zshrc
