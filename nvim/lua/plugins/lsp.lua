-- lua/plugins/lsp.lua
local lspconfig = require('lspconfig')
local cmp = require('cmp')

-- Setup nvim-cmp.
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For LuaSnip users.
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Next suggestion
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Previous suggestion
    ['<C-Space>'] = cmp.mapping.complete(), -- Trigger completion
    ['<C-e>'] = cmp.mapping.abort(), -- Abort completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
  },
  sources = {
    { name = 'nvim_lsp' }, -- Use LSP as a source for completion
    { name = 'buffer' },   -- Use buffer words as source
  },
})
-- Function to attach completion
local on_attach = function(client, bufnr)
  -- You can add your mappings here
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Setup Lua LSP
lspconfig.lua_ls.setup{
  cmd = { 'lua-language-server' },
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } }, -- Make sure to allow the use of 'vim'
    },
  },
}

-- Setup C/C++ LSP
lspconfig.clangd.setup{ on_attach = on_attach }

-- Setup Bash LSP
lspconfig.bashls.setup{ on_attach = on_attach }

-- Setup Python LSP
lspconfig.pyright.setup{ on_attach = on_attach }

-- Setup JavaScript/TypeScript LSP
lspconfig.ts_ls.setup{ on_attach = on_attach }

-- Setup HTML LSP
lspconfig.html.setup{ on_attach = on_attach }

-- Setup CSS LSP
lspconfig.cssls.setup{ on_attach = on_attach }

-- Additional configuration for diagnostics (optional)
vim.diagnostic.config({
  virtual_text = true,  -- Show diagnostics in virtual text
  signs = true,         -- Enable signs in the sign column
  underline = true,     -- Underline errors/warnings
  update_in_insert = true, -- Update diagnostics while typing
})

