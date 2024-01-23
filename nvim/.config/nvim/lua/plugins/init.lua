local M = {}

local plugins = {
    'plugins.core',
    'plugins.editor',
    'plugins.misc',
    'plugins.git',
    'plugins.ui',
    'plugins.colorscheme',
    'plugins.treesitter',
    'plugins.telescope',
    'plugins.lsp',
    'plugins.dap',
}

for _, v in pairs(plugins) do
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
--    --[[
--        LSP
--    --]]
--    use({
--        "jose-elias-alvarez/null-ls.nvim",
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
--        "ziontee113/syntax-tree-surfer"
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
--        'lewis6991/gitsigns.nvim',
--        config = "require('plugins.configs.gitsigns')",
--    })
--
--
--end)
