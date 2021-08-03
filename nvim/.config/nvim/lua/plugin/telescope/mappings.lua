-- Check if Telescope is installed, if not exit the script
if not pcall(require, "telescope") and not pcall(require, "nvim-mapper") then
    return
end

-- List of mappings with options
TelescopeMapArgs = TelescopeMapArgs or {}

local Mapper = require("nvim-mapper")

-- Function to map a telescope command to a key
-- Uses the Mapper from nvim-mapper to do the mapping (to provide entries in :Telescope mapper)
-- Expects the following table:
--      - key           <leader>ff
--      - command       find_files
--      - help
--          - id        unique id (usually command)
--          - category  Telescope
--          - desc      Description
map_telescope = function(mapping)
    local map_key = vim.api.nvim_replace_termcodes(mapping.key .. mapping.command, true, true, true)


    TelescopeMapArgs[map_key] = mapping.options or {}

    local mode = "n"
    local cmd = string.format("<cmd>lua R('plugin/telescope')['%s'](TelescopeMapArgs['%s'])<CR>", mapping.command, map_key)

    local map_options = {
        noremap = true,
        silent  = true,
    }

    local help = {
        id          = ("telescope_" .. mapping.help.id) or ("telescope_none_" .. map_key),
        category    = mapping.help.category or "No category",
        desc        = mapping.help.desc or "No description provided.",
    }

    if mapping.buffer then
        --vim.api.nvim_set_keymap(mode, key, rhs, map_options)
        Mapper.map(mode, mapping.key, cmd, map_options, help.category, help.id, help.desc)
    else
        --vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
        Mapper.map_buf(0, mode, mapping.key, cmd, map_options, help.category, help.id, help.desc)
    end
end

-- Dotfiles
map_telescope({
    key     = "<leader>en",
    command = "edit_neovim",
    help    = {
        id          = "edit_neovim",
        category    = "Dotfiles",
        desc        = "Edit NeoVim dotfiles",
    },
})
-- map_tele("<leader>ez")

-- Builtin's
map_telescope({
    key     = "<leader>ff",
    command = "find_files",
    help    = {
        id          = "find_files",
        category    = "Telescope",
        desc        = "Find files based on name in current working directory",
    },
})

map_telescope({
    key     = "<leader>fb",
    command = "file_browser",
    help    = {
        id          = "file_browser",
        category    = "Telescope",
        desc        = "File browser in current working directory",
    },
})

-- Grep
map_telescope({
    key     = "<leader>gg",
    command = "live_grep",
    help    = {
        id          = "live_grep",
        category    = "Grep",
        desc        = "Search for a string in your current working directory (respect .gitignore)",
    }
})
map_telescope({
    key     = "<leader>gs",
    command = "grep_string",
    help    = {
        id          = "grep_string",
        category    = "Grep",
        desc        = "Searches for the string under the cursor in the current working directory",
    },
})

-- Git
map_telescope({
    key     = "<leader>Gc",
    command = "git_commits",
    help    = {
        id          = "git_commits",
        category    = "Git",
        desc        = "List of all git commits in project",
    },
})
map_telescope({
    key     = "<leader>Gs",
    command = "git_status",
    help    = {
        id          = "git_status",
        category    = "Git",
        desc        = "Status of git",
    },
})
map_telescope({
    key     = "<leader>Gb",
    command = "git_branches",
    help    = {
        id          = "git_branches",
        category    = "Git",
        desc        = "List of all git branches in project",
    },
})
