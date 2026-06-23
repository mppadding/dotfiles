-- Highlight TODO, NOTE, etc. in comments.
local function apply_comment_highlights()
  -- Colors
  vim.api.nvim_set_hl(0, '@comment.error.text',
    { fg = vim.api.nvim_get_hl(0, { name = '@comment.error', link = false }).bg })
  vim.api.nvim_set_hl(0, '@comment.warning.text',
    { fg = vim.api.nvim_get_hl(0, { name = '@comment.warning', link = false }).bg })
  vim.api.nvim_set_hl(0, '@comment.note.text',
    { fg = vim.api.nvim_get_hl(0, { name = '@comment.note', link = false }).bg })
  vim.api.nvim_set_hl(0, '@comment.todo.text',
    { fg = vim.api.nvim_get_hl(0, { name = '@comment.todo', link = false }).bg })

  -- Match [ keyword: ] and [ keyword(xxx): ]
  local match = function(keyword)
    return string.format(' \\=\\(%s\\|%s(.\\{-})\\): \\=', keyword, keyword)
  end

  -- TODO: This doesnt yet match other lines after the first one. We could opt to use treesitter for that.
  -- TODO: This does not match comments only, instead any string with the right pattern will match.
  local match_error = match('ERROR')
  vim.fn.matchadd('@comment.error', match_error)
  vim.fn.matchadd('@comment.error.text', match_error .. '\\s*\\zs.*')

  local match_warning = match('WARN')
  vim.fn.matchadd('@comment.warning', match_warning)
  vim.fn.matchadd('@comment.warning.text', match_warning .. '\\s*\\zs.*')

  local match_note = match('NOTE')
  vim.fn.matchadd('@comment.note', match_note)
  vim.fn.matchadd('@comment.note.text', match_note .. '\\s*\\zs.*')

  local match_todo = match('TODO')
  vim.fn.matchadd('@comment.todo', match_todo)
  vim.fn.matchadd('@comment.todo.text', match_todo .. '\\s*\\zs.*')
end

vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('my.todo_highlight', {}),
  callback = apply_comment_highlights,
})
