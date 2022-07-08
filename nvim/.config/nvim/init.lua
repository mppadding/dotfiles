vim.g.mapleader = " "

local mappings = require("core.mappings")

require("core.options")

mappings.telescope()
mappings.syntax_tree_surfer()

require("plugins")
