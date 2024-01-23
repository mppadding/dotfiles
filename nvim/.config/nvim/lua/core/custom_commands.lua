vim.api.nvim_create_user_command('Rename', '!echo % => %:h/', { nargs = '1' })
