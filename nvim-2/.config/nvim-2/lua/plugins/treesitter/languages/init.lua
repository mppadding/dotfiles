return function(language, buf)
  local ok, setup = pcall(require, 'plugins.treesitter.languages.' .. language)
  if ok then setup(buf) end
end
