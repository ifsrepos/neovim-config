-- Set mapleader to space
vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>e', ':Ex<CR>', opts)

-- Clear find highlighted results after pressing <ESC>
map('n', '<esc>', ':noh<CR>', opts)

-- Clear substitution highlighted results after pressing <ESC>
vim.api.nvim_exec([[
	augroup ClearSearchHighlight
		autocmd!
		autocmd CmdlineLeave * :noh
		autocmd InsertLeave * :noh
	augroup END
]], false)

-- Window management
map('n', '<leader>v', '<c-w>v', opts) -- Split vertically
map('n', '<leader>h', '<c-w>s', opts) -- Split horizontally

map('n', '-', '<c-w><', opts)         -- Decrease window's width
map('n', '+', '<c-w>>', opts)         -- Increase window's width
map('n', '<c-k>', '<c-w>+', opts)     -- Increase window's height
map('n', '<c-j>', '<c-w>-', opts)     -- Decrease window's height

map('n', '<leader>r', '<c-w>r', opts) -- Rotate windows
map('n', '<leader>x', '<c-w>x', opts) -- Exchange with the next window

-- Window navigation
map('n', '<left>', '<c-w>h', opts)    -- Move to left window
map('n', '<up>', '<c-w>k', opts)      -- Move to upper window
map('n', '<right>', '<c-w>l', opts)   -- Move to right window
map('n', '<down>', '<c-w>j', opts)    -- Move to down window

