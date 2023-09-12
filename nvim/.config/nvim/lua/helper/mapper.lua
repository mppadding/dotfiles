-- Custom mapping command, this can be used to create vim mappings, but in turn also update tools such as `which-key`
local M = {}

local wk_present, wk = pcall(require, "which-key")

M.map = function(mode, mapping, command)
    local opts = { noremap = true, silent = true }

    vim.keymap.set(mode, mapping, command, opts)

    if wk_present then
        wk.register({
            [mapping] = "Test",
        })
    end
end

return M
