local o = vim.opt

-- Interface
o.showmatch 		= true 		-- Show matching brackets

o.number		    = true 		-- Show line numbers
o.relativenumber 	= true 		-- Show relative line numbers

o.wrap 			    = false		-- Dont wrap long lines around

-- Tabs/spacing
o.expandtab 		= true 		-- Use spaces instead of tabs
o.tabstop 		    = 4		    -- Show tabs as 4 spaces
o.shiftwidth 		= 4		    -- Insert 4 spaces instead of a tab
o.shiftround 		= true 		-- Round shifts with >/< to multiples of shiftwidth

o.smartindent 		= true 		-- Smart identation based on language

-- Searching
o.ignorecase 		= true 		-- Ignore case when searching
o.smartcase 		= true 		-- When searching in upper case, force case sensitivity
o.gdefault 		    = true 		-- Always enable global flag in search(-replaces)

-- Performance/Security
-- TODO: Probably change this? we could allow malicious RC files to be run.
o.exrc 			    = true 		-- Allow executing local rc files
o.secure 		    = true 		-- Disallow :autocmd, shell and write commands in local rc files

o.lazyredraw 		= true 		-- Lazyredraw makes macros faster

o.updatetime 		= 300 		-- Remove noticable delay

o.undofile 		    = true 		-- Make undo persistent

-- Colorscheme
o.termguicolors 	= true 		-- Use TrueColors

-- Folding
vim.cmd('set foldmethod=expr')
vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')

-- TODO: Change these to lua if possible
vim.cmd('set colorcolumn=120') 		-- Set color highlight on column 120
