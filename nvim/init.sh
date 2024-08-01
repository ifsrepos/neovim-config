#!/bin/bash

NORD_DIR="~/.local/share/nvim/site/pack/packer/start/nord.nvim"
PACKER_DIR="~/.local/share/nvim/site/pack/packer/start/packer.nvim"
TREESITTER_DIR="~/.local/share/nvim/site/pack/packer/start/nvim-treesitter.nvim"

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
