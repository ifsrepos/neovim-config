require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "c",
      "lua",
      "python",
      "bash",
      "javascript",
      "html",
      "css"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

