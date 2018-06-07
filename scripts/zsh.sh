#!/usr/bin/env bash

sudo apt-get install -y zsh

cat <<EOF >> ${HOME}/.bashrc
if test -t 1; then
    exec zsh
fi
EOF

git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

cat <<EOF >> ${HOME}/.zshrc
umask 022
export ZGEN_RESET_ON_CHANGE="${HOME}/.zshrc"
# load zgen
source "${HOME}/.zgen/zgen.zsh"
# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"
    zgen oh-my-zsh
    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/vi-mode
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
    zgen load tarruda/zsh-autosuggestions
    zgen load TBSliver/zsh-plugin-colored-man
    # bulk load
    zgen loadall <<EOPLUGINS
        # plugins here
EOPLUGINS
    # ^ can't indent this EOPLUGINS
    # completions
    zgen load zsh-users/zsh-completions src
    zgen load ahmetb/kubectx completion
    # theme
    zgen oh-my-zsh themes/dst.zsh-theme
    # save all to init script
    zgen save
fi
EOF

source ${HOME}/.bashrc

echo 'bindkey '^J' autosuggest-accept' >> ${HOME}/.zshrc
echo 'bindkey '^P' history-substring-search-up' >> ${HOME}/.zshrc  
echo 'bindkey '^N' history-substring-search-down' >> ${HOME}/.zshrc

