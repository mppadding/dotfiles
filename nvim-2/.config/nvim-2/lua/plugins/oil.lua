-- A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer
vim.pack.add({
  { src = 'https://github.com/stevearc/oil.nvim' },
})

require('oil').setup({
  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set('n', '-', require('oil').open, { desc = 'Open parent directory' })
