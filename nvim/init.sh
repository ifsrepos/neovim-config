#!/bin/bash

NORD_DIR="${HOME}/.local/share/nvim/site/pack/packer/start/nord.nvim"
PACKER_DIR="${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim"
TREESITTER_DIR="${HOME}/.local/share/nvim/site/pack/packer/start/nvim-treesitter.nvim"
LSP_DIR="${HOME}/.local/share/nvim/site/pack/"

if [ ! -d "$PACKER_DIR" ]; then
	mkdir -p "$PACKER_DIR"
	git clone --depth 1 git@github.com:wbthomason/packer.nvim $PACKER_DIR 
fi

if [ ! -d "$NORD_DIR" ]; then
	mkdir -p "$NORD_DIR"
	git clone git@github.com:shaunsingh/nord.nvim $NORD_DIR
fi

if [ ! -d "$TREESITTER_DIR" ]; then
	mkdir -p "$TREESITTER_DIR"
	git clone git@github.com:nvim-treesitter/nvim-treesitter.git $TREESITTER_DIR
fi

# Install Lua Language Server
rm -rf ${HOME}/lua-language-server
sudo apt install ninja-build -y
git clone https://github.com/LuaLS/lua-language-server ${HOME}/lua-language-server
cd ${HOME}/lua/bash-language-server
./make.sh
echo '[INFO] Add ${HOME}/lua-language-server/bin/ to the PATH in ${HOME}/.bashrc' 
rm -rf ${HOME}/lua-language-server

# Install others language servers
npm install -g pyright
npm install -g bash-language-server
npm install -g typescript typescript-language-server
npm install -g vscode-html-languageserver-bin
npm install -g vscode-css-languageserver-bin
go install github.com/mrtazz/checkmake@latest
sudo apt install clangd
