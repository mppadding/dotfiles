local opts = { noremap = true, silent = true }
local ignore_opts = { noremap = true, silent = true, desc = 'ignore' }

-- Close buffer
vim.keymap.set('n', '<leader>q', '<cmd>enew<bar>bd #<CR>', { desc = 'Close buffer' })

-- Terminal keybinds
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', ignore_opts)
vim.keymap.set('t', '<C-w>h', '<C-\\><C-n><C-w>h', ignore_opts)
vim.keymap.set('t', '<C-w>j', '<C-\\><C-n><C-w>j', ignore_opts)
vim.keymap.set('t', '<C-w>k', '<C-\\><C-n><C-w>k', ignore_opts)
vim.keymap.set('t', '<C-w>l', '<C-\\><C-n><C-w>l', ignore_opts)
vim.keymap.set('t', '<C-w>s', '<C-\\><C-n><C-w>s', ignore_opts)
vim.keymap.set('t', '<C-w>v', '<C-\\><C-n><C-w>v', ignore_opts)

-- Navigation between tabs
vim.keymap.set('n', '<A-l>', '<cmd>tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('i', '<A-l>', '<cmd>tabnext<CR>', opts)
vim.keymap.set('t', '<A-l>', '<cmd>tabnext<CR>', opts)

vim.keymap.set('n', '<A-h>', '<cmd>tabprevious<CR>', { desc = 'Previous tab' })
vim.keymap.set('i', '<A-h>', '<cmd>tabprevious<CR>', opts)
vim.keymap.set('t', '<A-h>', '<cmd>tabprevious<CR>', opts)

-- LSP
--vim.keymap.set('i', '<Tab>', function()
--  -- Go to next suggestion if autocomplete window is open
--  if vim.fn.pumvisible() == 1 then
--    return '<C-n>'
--  end

--  return '<Tab>'
--end, { expr = true })

--vim.keymap.set('i', '<S-Tab>', function()
--  -- Go to previous suggestion if autocomplete window is open
--  if vim.fn.pumvisible() == 1 then
--    return '<C-p>'
--  end

--  return '<S-Tab>'
--end, { expr = true })

--vim.keymap.set('i', '<CR>', function()
--  -- Complete & close the autocomplete window
--  if vim.fn.pumvisible() == 1 then
--    return '<C-y>'
--  end

--  return '<CR>'
--end, { expr = true })
