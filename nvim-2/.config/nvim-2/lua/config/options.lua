-- stylua: ignore start
-- Interface
vim.opt.showmatch = true      -- Show matching brackets

vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers

vim.opt.wrap = false          -- Dont wrap long lines around

-- Tabs/spacing
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.tabstop = 4        -- Show tabs as 4 spaces
vim.opt.shiftwidth = 4     -- Insert 4 spaces instead of a tab
vim.opt.shiftround = true  -- Round shifts with >/< to multiples of shiftwidth

vim.opt.smartindent = true -- Smart identation based on language

-- Searching
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true  -- When searching in upper case, force case sensitivity
vim.opt.gdefault = true   -- Always enable global flag in search(-replaces)

-- Performance/Security
vim.opt.secure = true -- Disallow :autocmd, shell and write commands in local rc files

-- TODO: Change such that lazyredraw is only set when we execute a macro
--vim.opt.lazyredraw = true -- Lazyredraw makes macros faster

vim.opt.updatetime = 300 -- Remove noticable delay

vim.opt.undofile = true  -- Make undo persistent

-- Colorscheme
vim.opt.termguicolors = true -- Use TrueColors
vim.opt.cursorline = true    -- Highlight current line

--vim.cmd('set colorcolumn=120') 		-- Set color highlight on column 120
-- stylua: ignore end
