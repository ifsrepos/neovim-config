local fn = vim.fn

-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[autocmd BufWritePost packer.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'shaunsingh/nord.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
-- LSP configuration
    use 'neovim/nvim-lspconfig'
-- Autocompletion
    use 'hrsh7th/nvim-cmp' -- Completion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer' -- Buffer source for nvim-cmp
    use 'hrsh7th/cmp-path' -- Path source for nvim-cmp
    use 'hrsh7th/cmp-cmdline' -- Command line source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippet engine
    use 'saadparwaiz1/cmp_luasnip' -- Snippet completion source
-- Error highlighting
    use 'folke/trouble.nvim' -- Optional: for better diagnostics UI
    use 'folke/lsp-colors.nvim' -- Automatically adds missing LSP colors
    use 'folke/lsp-trouble.nvim'
end)
