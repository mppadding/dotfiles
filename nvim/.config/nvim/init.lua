-- Map leader to SPACE, this needs to be done before any other mapping.
vim.g.mapleader = " "

-- Global functions
require("plugin/globals")

require('modules/options')

-- Packer
require('plugin')

-- Telescope
require('plugin/telescope')
require('plugin/telescope/mappings')

-- Treesitter
require('plugin/tree-sitter/test')

vim.g.gruvbox_contrast_dark = 'hard'

vim.cmd('colorscheme gruvbox')
