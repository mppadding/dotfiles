vim.g.mapleader = " "

local mappings = require("core.mappings")

require("core.options")

mappings.generic()
mappings.telescope()
mappings.syntax_tree_surfer()
mappings.tabs()
mappings.debug()
mappings.harpoon()

require("core.plugin_manager")
vim.cmd("colorscheme nordfox")

-- Which-key doesnt seem to load automatically so we do this manually
-- This might be an issue with Packer, or with which-key itself
-- We force a load here
require("which-key").load()
