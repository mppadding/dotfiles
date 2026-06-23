vim.pack.add({
  { src = 'https://github.com/ibhagwan/fzf-lua' },
})

require('fzf-lua').setup({})

require('fzf-lua').register_ui_select()

vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', function()
  require('fzf-lua').live_grep({
    rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden",
    glob_flag = "--iglob",
    glob_separator = "%s%-%-"
  })
end
, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fs', function()
  require('fzf-lua').grep({ search = vim.fn.expand('<cword>') })
end, { desc = 'Search word under cursor' })
vim.keymap.set('n', '<leader>fb', require('fzf-lua').buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', require('fzf-lua').help_tags, { desc = 'Help tags' })
vim.keymap.set('n', '<leader>fr', require('fzf-lua').resume, { desc = 'Resume picker' })
vim.keymap.set('n', '<leader>fl', require('fzf-lua').lsp_finder, { desc = 'Lsp Finder' })
vim.keymap.set('n', 'gs', function() require('fzf-lua').lsp_live_workspace_symbols() end, { desc = 'Workspace symbols' })
vim.keymap.set('n', 'gr', function() require('fzf-lua').lsp_references({ async_or_timeout = true }) end,
  { desc = 'LSP references' })
vim.keymap.set({ 'n', 'v' }, '<leader>ca', require('fzf-lua').lsp_code_actions, { desc = 'Code actions' })
vim.keymap.set('n', '<leader>fd', require('fzf-lua').diagnostics_document, { desc = 'Document diagnostics' })
vim.keymap.set('n', '<leader>fD', require('fzf-lua').diagnostics_workspace, { desc = 'Workspace diagnostics' })
