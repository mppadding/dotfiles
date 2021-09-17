local map = function(mode, key, cmd, opts)
    local options = opts or {}

    vim.api.nvim_set_keymap(mode, key, cmd, options)
end

local normal = 'n'
local visual = 'v'

-- Copy/pasting into system buffer
map(visual, '<Leader>y',  '"+y',  { noremap = true, silent = true })
map(normal, '<Leader>yy', '"+yy', { noremap = true, silent = true })
map(normal, '<Leader>p',  '"+p',  { noremap = true, silent = true })
