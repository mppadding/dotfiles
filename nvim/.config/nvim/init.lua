vim.g.mapleader = " "

local mappings = require("core.mappings")

require("core.options")
mappings.telescope()

require("plugins")
