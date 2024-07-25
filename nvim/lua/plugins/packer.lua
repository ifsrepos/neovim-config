local fn = vim.fn

-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[autocmd BufWritePost packer.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'shaunsingh/nord.nvim'
end)
