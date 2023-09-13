local M = {}

local plugins = {
    "plugins.core",
    "plugins.colorscheme",
    "plugins.treesitter",
    "plugins.telescope",
    "plugins.dap",
}

for k,v in pairs(plugins) do
    vim.list_extend(M, require(v))
end

return M
--return packer.startup(function()
--    --[[
--        UI
--    --]]
--    use({
--        "kyazdani42/nvim-web-devicons",
--        config = "require('plugins.configs.icons')",
--    })
--
--    use({
--        "freddiehaddad/feline.nvim",
--        after = {"nvim-web-devicons"},
--        config = "require('plugins.configs.feline')",
--    })
--
--    use({
--        "glepnir/dashboard-nvim",
--        config = "require('plugins.configs.dashboard')",
--    })
--
--    use({
--        'rafcamlet/nvim-luapad',
--        requires = 'antoinemadec/FixCursorHold.nvim'
--    })
--
--    --[[
--        LSP
--    --]]
--    use({
--        "neovim/nvim-lspconfig",
--    })
--    use({
--        "jose-elias-alvarez/null-ls.nvim",
--    })
--    use({
--        "ms-jpq/coq_nvim",
--        after = "nvim-lspconfig",
--        branch = "coq",
--        run = ":COQdeps",
--        config = "require('lsp')",
--    })
--    use({
--        "ms-jpq/coq.artifacts",
--        branch = "artifacts",
--    })
--    use({
--        "folke/trouble.nvim",
--        requires = "kyazdani42/nvim-web-devicons",
--        config = function()
--            require("trouble").setup {
--            }
--        end
--    })
--    use({
--        "simrat39/rust-tools.nvim"
--    })
--    use({
--        "ckipp01/stylua-nvim",
--        run = "cargo install stylua"
--    })
--    use({
--        "ziontee113/syntax-tree-surfer"
--    })
--    use({
--        "rhysd/committia.vim"
--    })
--    use({
--        'akinsho/bufferline.nvim',
--        tag = "*",
--        after = "nvim-web-devicons",
--        config = "require('plugins.configs.bufferline')",
--    })
--
--    ------
--    -- Under review
--    ------
--    use({
--        'ThePrimeagen/harpoon'
--    })
--   
--    -- Possession is a session management plugin
--    use({
--        'jedrzejboczar/possession.nvim',
--        requires = { 'nvim-lua/plenary.nvim' },
--        config = "require('plugins.configs.possession')",
--    }) 
--
--    use({
--        'folke/which-key.nvim',
--        config = "require('plugins.configs.which_key')",
--    })
--
--    use({
--        'nvim-telescope/telescope-file-browser.nvim',
--        requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
--        after = "telescope.nvim",
--        config = "require('telescope').load_extension('file_browser')"
--    })
--
--    use({
--        'lewis6991/gitsigns.nvim',
--        config = "require('plugins.configs.gitsigns')",
--    })
--
--
--end)
