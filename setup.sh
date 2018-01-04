#!/bin/bash

echo 'umask 022' >> ~/.bashrc
source ~/.bashrc

# update apt-get cacahe and upgrade libs
sudo apt-get update && sudo apt-get upgrade -y

# git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git
git --version

cat << EOF > ~/.gitconfig
[user]
    name = 
    email = 
[core]
    symlinks = false
    autocrlf = true
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
[http]
    sslCAInfo = "/mnt/c/Program Files/Git/mingw64/ssl/certs/ca-bundle.crt"
    sslBackend = openssl
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

# zsh
sudo apt-get install -y zsh

cat <<EOF >> ~/.bashrc
if test -t 1; then
    exec zsh
fi
EOF

# zgen
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

cat <<EOF > ~/.zshrc
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

    # theme
    zgen oh-my-zsh themes/dst.zsh-theme

    # save all to init script
    zgen save
fi
EOF

source ~/.bashrc
source ~/.zshrc

# zip
sudo apt-get install -y zip

# jekyll
sudo apt-add-repository -y ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install -y ruby2.3 ruby2.3-dev build-essential
sudo gem update
sudo gem install jekyll bundler
jekyll -v

# docker
sudo apt-get remove -y docker docker-engine docker.io
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce

# docker-compose
sudo curl -sL https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# docker-machine
curl -so /tmp/docker-machine -L https://github.com/docker/machine/releases/download/v0.12.2/docker-machine-`uname -s`-`uname -m`
chmod +x /tmp/docker-machine
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
docker-machine --version

# python2
sudo apt-get install -y python

# python virtual environment
sudo apt-get install python-virtualenv

# python libs
sudo apt-get install -y python-pip
sudo apt-get install -y python-netaddr
sudo apt-get install -y python-jmespath

# gcloud sdk
sudo apt-get remove -y google-cloud-sdk
curl -so /tmp/google-cloud-sdk.tar.gz -L https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-170.0.1-linux-x86_64.tar.gz
tar zxf /tmp/google-cloud-sdk.tar.gz
sudo mv /tmp/google-cloud-sdk /usr/local/bin
sudo /usr/local/bin/google-cloud-sdk/install.sh -q
sudo /usr/local/bin/google-cloud-sdk/bin/gcloud components install alpha beta kubectl docker-credential-gcr --quiet

# env & alias
cat <<EOF >> ~/.zshrc

source <(kubectl completion zsh)

bindkey '^J' autosuggest-accept
bindkey '^P' history-substring-search-up  
bindkey '^N' history-substring-search-down

export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
export PATH="$PATH:/usr/local/bin/google-cloud-sdk/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/opt/gradle/gradle-4.1/bin"
export PATH="$PATH:$HOME/.local/bin
export DOCKER_HOST="tcp://127.0.0.1:2375"
export VISUAL="vim"
export EDITOR="$VISUAL"
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH="/mnt/c"

alias jk="jekyll"
alias kc="kubectl"
alias vg="vagrant"
alias gd="gradle"
alias d="docker"
alias dc="docker-compose"
alias dm="docker-machine"
EOF

sudo gem install jekyll-feed jekyll-seo-tag

# vim
curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.vim/colors
curl -so ~/.vim/colors/molokai.vim -L https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

cat <<EOF > ~/.vimrc
set nocompatible
set background=dark
syntax on
set ruler
set nu
set t_Co=256
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set paste
set backspace=indent,eol,start
let g:molokai_original = 1
let g:rehash256 = 1
let g:goyo_width = 100
let g:vim_markdown_folding_disabled = 1
let macvim_skip_colorscheme=1
colorscheme molokai
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'dracula/vim'

call plug#end()

map <F12> :Goyo
map <C-n> :NERDTreeToggle<CR>
xnoremap p pgvy
EOF

# ansible
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

# golang
curl -so /tmp/golang.tar.gz -L https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf /tmp/golang.tar.gz

# java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-installer

# sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install -y sbt
sudo apt-get install -y bc

# maven
sudo apt-get install -y maven

# gradle
curl -so /tmp/gradle.zip -L https://services.gradle.org/distributions/gradle-4.1-bin.zip
sudo mkdir /opt/gradle
sudo unzip -d /opt/gradle /tmp/gradle.zip

# vagrant
curl -so /tmp/vagrant.deb -L https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.deb
sudo dpkg -i /tmp/vagrant.deb

# kube-shell
pip install kube-shell

# tox
pip install tox

# others
sudo apt-get install -y htop
sudo apt-get install -y jq

exec zsh
