-- Setup Feline Highlights
require('plugins.configs.feline.colors')

local util = require('plugins.configs.feline.util')

local c = {
    vimode = {
        provider = function()
            return string.format(" %s ", util.vi.mode_text[vim.fn.mode()])
        end,
        hl = function()
            return util.vi.mode_color[vim.fn.mode()]
        end,
        right_sep = { str = " "},
    },
    gitbranch = {
        provider = "git_branch",
        icon = " ",
        hl = "UserSLGitBranch",
        right_sep = { str = "  ", hl = "MiniJump" },
    },
}

local active = {
    { -- left
        c.vimode,
        c.gitbranch
    },
    { -- right
    }
}

require("feline").setup({
    components = { active = active, inactive = {} },
})
--require("feline").setup()
