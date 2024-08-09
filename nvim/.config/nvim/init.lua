vim.g.mapleader = " "
vim.g.editorconfig = true
-- TODO: Benchmark
-- vim.loader.enable()

require("compat")

P = function (t)
    vim.print(t)
    return t
end

dump = function (t)
    vim.print(vim.inspect(t))
    return t
end

local mappings = require("core.mappings")

require("core.options")

mappings.generic()
mappings.telescope()
--mappings.syntax_tree_surfer()
mappings.tabs()
mappings.debug()
--mappings.harpoon()

require("core.plugin_manager")
vim.cmd("colorscheme nordfox")

mappings.nvim_tree()
