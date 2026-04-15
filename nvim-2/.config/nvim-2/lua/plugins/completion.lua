vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('^1') },
})

--require('blink.cmp').setup({
--  keymap = { preset = 'default' },
--  sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
--})
--
local group = vim.api.nvim_create_augroup('BlinkCmpLazyLoad', { clear = true })

vim.api.nvim_create_autocmd('InsertEnter', {
  pattern = '*',
  group = group,
  once = true,
  callback = function()
    require('blink.cmp').setup({
      --keymap = { preset = 'super-tab' },
      keymap = {
        preset = 'none',
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-k>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-j>'] = { 'scroll_documentation_down', 'fallback' },
        ['<Tab>'] = {
          'select_next',
          function(cmp)
            --if require('luasnip').expand_or_jumpable() then
            --  require('luasnip').expand_or_jump()
            --  return true
            --end
          end,
          'fallback',
        },
        ['<S-Tab>'] = {
          'select_prev',
          function(cmp)
            --if require('luasnip').jumpable(-1) then
            --  require('luasnip').jump(-1)
            --  return true
            --end
          end,
          'fallback',
        },
      },
      appearance = {
        nerd_font_variant = 'mono',
        use_nvim_cmp_as_default = true,
      },
      completion = {
        documentation = { auto_show = true },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    })
  end,
})
