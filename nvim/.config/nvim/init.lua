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

-- Refactoring
require('refactor/test')

vim.g.gruvbox_contrast_dark = 'hard'

vim.cmd('colorscheme gruvbox')

-- TODO: Move to own config file
--require('lspconfig').cmake.setup{ on_attach=require('completion').on_attach }
