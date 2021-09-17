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
require('plugin/tree-sitter/test')

vim.g.gruvbox_contrast_dark = 'hard'

vim.cmd('colorscheme gruvbox')

-- vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
-- vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
-- vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
-- vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
-- vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
-- vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
-- vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
-- vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

-- TODO: Move to own config file
require('lspconfig').cmake.setup{ on_attach=require('completion').on_attach }
