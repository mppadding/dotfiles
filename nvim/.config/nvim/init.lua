vim.g.mapleader = " "
-- TODO: Benchmark
-- vim.loader.enable()

P = function (t)
    vim.print(t)
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

-- Which-key doesnt seem to load automatically so we do this manually
-- This might be an issue with Packer, or with which-key itself
-- We force a load here
require("which-key").load()
