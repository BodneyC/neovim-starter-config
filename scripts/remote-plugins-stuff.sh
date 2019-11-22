#!/usr/bin/env bash

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo pacman -S xclip shellcheck python2-pip python-pip

$(command -v python2) -m pip install --user pynvim
$(command -v python3) -m pip install --user pynvim vint

hash npm && { 
	npm i -g neovim || sudo npm i -g neovim 
}

hash gem && {
	gem install neovim neovim-ruby-host
}

hash go && {
	go get github.com/golang/tools/gopls
	go get golang.org/x/golang/golint
}

nvim +UpdateAll
nvim +UpdateRemotePlugins
