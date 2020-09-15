#!/usr/bin/env bash

[[ $EUID == 0 ]] && {
  echo "Don't run as root"
  exit 1
}

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo pacman -S --noconfirm xclip shellcheck python2-pip python-pip nodejs npm neovim

$(command -v python2) -m pip install --user pynvim
$(command -v python3) -m pip install --user pynvim vint

npm i -g neovim || sudo npm i -g neovim 

hash gem && {
	gem install neovim neovim-ruby-host
}

hash go && {
	go get github.com/x/tools/gopls
	go get golang.org/x/lint/golint
}

nvim +PlugInstall +qall
nvim +AddCocExtensions +qall
nvim +UpdateRemotePlugins
