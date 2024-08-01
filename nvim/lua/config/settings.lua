-- Enable relative line numbers
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.numberwidth = 3

-- Tabspaces configuration
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Folding based on Tree-sitter
vim.opt.foldmethod = 'expr'
vim.opt.foldenable = false
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
