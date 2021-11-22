local map = function(mode, key, cmd, opts)
    local options = opts or {}

    vim.api.nvim_set_keymap(mode, key, cmd, options)
end

local keybinds = require("modules.keybinds")

local normal = 'n'
local visual = 'v'

-- Copy/pasting into system buffer
map(visual, keybinds.copy_paste.visual_system_yank_line,  '"+y',  { noremap = true, silent = true })
map(normal, keybinds.copy_paste.system_yank_line, '"+yy', { noremap = true, silent = true })
map(normal, keybinds.copy_paste.system_paste,  '"+p',  { noremap = true, silent = true })
--map(normal, keybinds.lsp.source_header_swap, ":ClangdSwitchSourceHeader", { noremap = true, silent = true })
