vim.pack.add({
  { src = 'https://github.com/zbirenbaum/copilot.lua' },
})

local function setup()
  require('copilot').setup({
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = '<Tab>',
        next = '<M-]>',
        prev = '<M-[>',
        dismiss = '<M-e>',
      },
    },
    panel = { enabled = false },
    filetypes = { markdown = true },
  })
end

-- Ensure Copilot is loaded when the user runs the `:Copilot` command
-- If we do not do this, we cannot authenticate the first time.
vim.api.nvim_create_user_command('Copilot', function(opts)
  setup()
  vim.cmd('Copilot ' .. opts.args)
end, { nargs = '*' })

-- Load Copilot when the user enters insert mode for the first time
vim.api.nvim_create_autocmd('InsertEnter', {
  once = true,
  callback = setup,
})
