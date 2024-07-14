-- Check if packer is installed
local packer_exists = vim.fn.isdirectory(vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim')
if not packer_exists then
	vim.cmd('!git clone https://github.com/wbthomason/packer.nvim '..vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim')
end

-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

-- Initialize packer
return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	-- Add plugins here
	use 'rakr/vim-one'
end)
