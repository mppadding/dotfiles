local reloader = function()
    RELOAD "plenary"
    RELOAD "popup"
    RELOAD "telescope"
end

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local action_mt = require "telescope.actions.mt"
local sorters = require "telescope.sorters"
local themes = require "telescope.themes"

require("telescope").setup {
    extensions = {
        fzf = {
            override_generic_sorter = true,
            override_file_sorter    = true,
        },
    },
}

-- Load FZF Native extension for faster and better file finding
require("telescope").load_extension("fzf")

local M = {}

-- Do a find_files where we set our neovim dotfiles as location
function M.edit_neovim()
    local opts_with_preview = {
        follow = true,
        prompt_title = "~ NeoVim dotfiles ~",
        shorten_path = false,
        cwd = "~/dotfiles/nvim/.config/nvim",

        layout_strategy = "flex",
        layout_config = {
            width = 0.9,
            height = 0.8,

            horizontal = {
                width = { padding = 0.15 },
            },
            vertical = {
                preview_height = 0.75,
            },
        },
    }

    require("telescope.builtin").find_files(opts_with_preview)
end

return setmetatable({}, {
    __index = function(_, k)
        reloader()

        if M[k] then
            return M[k]
        else
            return require("telescope.builtin")[k]
        end
    end
})
