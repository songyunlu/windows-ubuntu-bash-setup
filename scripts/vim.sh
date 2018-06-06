#!/usr/bin/env bash

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

