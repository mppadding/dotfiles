-- NVim Dotfiles
--  Author:         Matthijs Padding <@mppadding>
--  Description:    NeoVim dotfiles based on Lua plugins
--                  These are my personal dotfiles currently in use while working/studying.
--
--                  The current theme in use is gruvbox combined with TreeSitter for better syntax highlighting
--                  Plugins used:
--                      -   Packer          Plugin Manager
--                      -   Gruvbox         Theme
--                      -   NVim-lsp        Language Server Protocol
--                      -   COQ             NVim Completion
--                      -   Telescope       Extendable Fuzzy Finder over lists
--                      -   NVim-mapper     Telescope mappings list provider
--                      -   TreeSitter      Better syntax highlighting and powerful refactor tool

-- Map leader to SPACE, this needs to be done before any other mapping.
vim.g.mapleader = " "

-- We add the theme here, otherwise other plugins won't follow it
vim.g.gruvbox_contrast_dark = 'hard'

vim.cmd('colorscheme gruvbox')

-- Global functions
require("plugin/globals")

require('modules/options')

require('modules/mappings')

-- Packer
require('plugin')

-- LSP
require('plugin/lsp')

-- Telescope
require('plugin/telescope')
require('plugin/telescope/mappings')

-- Treesitter
require('plugin/tree-sitter')
require('plugin/tree-sitter/test')

-- Luapad
require('plugin/luapad')

-- Refactoring
require('refactor/test')

--local dap = require('dap')
--dap.adapters.lldb = {
--    type = 'executable',
--    command = '/usr/bin/lldb-vscode',
--    name = "lldb"
--}
--dap.configurations.cpp = {
--  {
--    name = "Launch",
--    type = "lldb",
--    request = "launch",
--    program = function()
--      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--    end,
--    cwd = '${workspaceFolder}',
--    stopOnEntry = false,
--    args = {},
--
--    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
--    --
--    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
--    --
--    -- Otherwise you might get the following error:
--    --
--    --    Error on launch: Failed to attach to the target process
--    --
--    -- But you should be aware of the implications:
--    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
--    runInTerminal = false,
--  },
--}
