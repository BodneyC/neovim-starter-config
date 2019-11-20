#!/usr/bin/env bash

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo pacman -S xclip

$(command -v python2) -m pip install --user pynvim
$(command -v python3) -m pip install --user pynvim

npm i -g neovim || sudo npm i -g neovim

gem install neovim neovim-ruby-host

nvim +UpdateRemotePlugins
