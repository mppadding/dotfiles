return function(buf)
  local parser = vim.treesitter.get_parser(buf, 'rust')
  if not parser then return end
  local root = parser:parse()[1]:root()
  local query = vim.treesitter.query.parse('rust', [[
    (use_declaration) @fold
  ]])
  for _, node in query:iter_captures(root, buf) do
    pcall(vim.cmd, (node:start() + 1) .. 'foldclose')
  end
end
