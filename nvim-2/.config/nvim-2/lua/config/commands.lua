vim.api.nvim_create_user_command('ProximitySearch', function()
  require('commands/proximity-search').start()
end, { desc = 'Search for multiple patterns within N lines of each other (snacks)' })

-- Plugins
vim.api.nvim_create_user_command('PlugUpdate', function(args)
    print(vim.inspect(args.fargs))
    if #args.fargs == 0 then
      vim.pack.update(nil)
    else
      vim.pack.update(args.fargs)
    end
  end,
  {
    desc = 'Updates given or all plugins',
    complete = 'packadd',
    nargs = '*',
  }
)

vim.api.nvim_create_user_command('PlugDelete', function(args)
  vim.pack.del(args.fargs)
end, {
  complete = 'packadd',
  nargs = '+',
})
