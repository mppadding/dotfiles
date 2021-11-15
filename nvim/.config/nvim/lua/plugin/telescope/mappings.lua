-- Check if Telescope is installed, if not exit the script
if not pcall(require, "telescope") and not pcall(require, "nvim-mapper") then
    return
end

-- List of mappings with options
TelescopeMapArgs = TelescopeMapArgs or {}

local Mapper = require("nvim-mapper")
local keybinds = require('modules/keybinds')

-- Function to map a telescope command to a key
-- Uses the Mapper from nvim-mapper to do the mapping (to provide entries in :Telescope mapper)
-- Expects the following table:
--      - key           <leader>ff
--      - command       find_files
--      - help
--          - id        unique id (usually command)
--          - category  Telescope
--          - desc      Description
map_telescope = function(mapping, virtual)
    mapping.command = mapping.command or mapping.help.id
    local map_key = vim.api.nvim_replace_termcodes(mapping.key .. mapping.command, true, true, true)

    TelescopeMapArgs[map_key] = mapping.options or {}

    if virtual == nil then
        virtual = false
    end

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

    if not virtual then
        Mapper.map(mode, mapping.key, cmd, map_options, help.category, help.id, help.desc)
    else
        Mapper.map_virtual(mode, mapping.key, "", map_options, help.category, help.id, help.desc)
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

-- LSP Jumping (Virtual)
map_telescope({
    key     = keybinds.lsp.goto_declaration,
    help    = {
        id          = "lsp_goto_declaration",
        category    = "LSP",
        desc        = "Go to declaration",
    },
}, true)
map_telescope({
    key     = keybinds.lsp.goto_definition,
    help    = {
        id          = "lsp_goto_definition",
        category    = "LSP",
        desc        = "Go to definition",
    },
}, true)
--map_telescope({
--    key     = keybinds.lsp.goto_references,
--    help    = {
--        id          = "lsp_goto_references",
--        category    = "LSP",
--        desc        = "List all usages of identifier",
--    },
--}, true)

-- LSP Jumping
map_telescope({
    key     = keybinds.lsp.goto_references,
    command = "lsp_references",
    help    = {
        id          = "lsp_goto_references",
        category    = "LSP",
        desc        = "List all usages of identifier",
    },
})


-- LSP Information (Virtual)
map_telescope({
    key     = keybinds.lsp.hover,
    help    = {
        id          = "lsp_hover",
        category    = "LSP",
        desc        = "Show description of hovered identifier",
    },
}, true)

-- LSP Diagnostics (Virtual)
map_telescope({
    key     = keybinds.lsp.diagnostics_line,
    help    = {
        id          = "lsp_diag_line",
        category    = "LSP",
        desc        = "Show all diagnostics of current line in popup",
    },
}, true)
map_telescope({
    key     = keybinds.lsp.diagnostics_prev,
    help    = {
        id          = "lsp_diag_prev",
        category    = "LSP",
        desc        = "Go to previous diagnostic in file",
    },
}, true)
map_telescope({
    key     = keybinds.lsp.diagnostics_next,
    help    = {
        id          = "lsp_diag_next",
        category    = "LSP",
        desc        = "Go to next diagnostic in file",
    },
}, true)

-- LSP Code Actions (Virtual)
map_telescope({
    key     = keybinds.lsp.action_code,
    help    = {
        id          = "lsp_action_code",
        category    = "LSP",
        desc        = "Show a list of code action for the current identifier/line",
    },
}, true)
map_telescope({
    key     = keybinds.lsp.action_rename,
    help    = {
        id          = "lsp_action_rename",
        category    = "LSP",
        desc        = "Renames an identifier",
    },
}, true)
