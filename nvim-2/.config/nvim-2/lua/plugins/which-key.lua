-- WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as
-- you type.
vim.pack.add({
  { src = 'https://github.com/folke/which-key.nvim' },
})

require('which-key').setup({})
