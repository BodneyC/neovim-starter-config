#!/bin/bash

[[ ! -d "$HOME/gitclones" ]] \
	&& mkdir -p "$HOME/gitclones"

cd "$HOME/gitclones" || exit

[[ ! -d neovim ]] \
	&& git clone https://github.com/neovim/neovim.git

cd neovim || exit

git checkout master
git pull

mkdir "$HOME/.local"
make CMAKE_INSTALL_PREFIX="$(realpath "$HOME/.local")"

NVIM_PATH=$(command -v nvim)
[[ -n "$NVIM_PATH" ]] && cp "$NVIM_PATH"{,.BAK}

make install
