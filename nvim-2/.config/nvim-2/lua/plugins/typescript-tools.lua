vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/pmizio/typescript-tools.nvim' },
})

require('typescript-tools').setup({})
