vim.pack.add({
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
})

-- Defer it because it takes a while to load and we don't need it immediately
-- 99.9% of the time, the LSPs are already installed.
vim.defer_fn(function()
  require('mason').setup()
  require('mason-lspconfig').setup({
    ensure_installed = {
      'lua_ls',
      'jsonls',
      'eslint',
      'terraformls',
      'tflint',
      'gopls',
    },
    automatic_enable = false,
  })
end, 100)
