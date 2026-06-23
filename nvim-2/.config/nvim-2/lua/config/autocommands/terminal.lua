-- Autocommands to leave/enter terminal mode when terminal loses or gains focus
vim.cmd('autocmd BufWinEnter,WinEnter term://* startinsert')
vim.cmd('autocmd BufLeave term://* stopinsert')
