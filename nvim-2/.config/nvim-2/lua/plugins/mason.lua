vim.pack.add({
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
})

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
  },
  automatic_enable = false,
})
