#!/bin/bash

NORD_DIR="~/.local/share/nvim/site/pack/packer/start/nord.nvim"
PACKER_DIR="~/.local/share/nvim/site/pack/packer/start/packer.nvim"

if [ ! -d "$PACKER_DIR" ]; then
	mkdir -p "$PACKER_DIR"
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $PACKER_DIR 
fi

if [ ! -d "$NORD_DIR" ]; then
	mkdir -p "$NORD_DIR"
	git clone https://github.com/shaunsingh/nord.nvim $NORD_DIR
fi
