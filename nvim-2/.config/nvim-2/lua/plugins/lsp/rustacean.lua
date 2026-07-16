vim.pack.add({
  { src = 'https://github.com/mrcjkb/rustaceanvim', version = '^9' }
})

vim.g.rustaceanvim = {
  tools = {
    hover_actions = { replace_builtin_hover = true },
  },
  server = {
    on_attach = function(client, bufnr)
      -- your standard on_attach keymaps here
      vim.keymap.set('n', '<leader>rr', ':RustLsp runnables<CR>', { buffer = bufnr })
      vim.keymap.set('n', '<leader>rt', ':RustLsp testables<CR>', { buffer = bufnr })
      vim.keymap.set('n', '<leader>rd', ':RustLsp debuggables<CR>', { buffer = bufnr })
      vim.keymap.set('n', '<leader>rm', ':RustLsp expandMacro<CR>', { buffer = bufnr })
      vim.keymap.set('n', '<leader>rc', ':RustLsp openCargo<CR>', { buffer = bufnr })
    end,
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = true,
        check = { command = 'clippy' },
        hover = { memoryLayout = { niches = true } },
        imports = {
          -- group imports by module
          granularity = { group = 'module' },
          -- prefer self:: over crate::
          prefix = 'self',
        },
      },
    },
  },
}
