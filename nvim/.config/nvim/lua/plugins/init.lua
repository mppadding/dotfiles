local present, packer = pcall(require, "plugins.packerInit")

if not present then
    return false
end

local use = packer.use

-- Auto compile packer plugins when changed
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins/init.lua source <afile> | PackerCompile
  augroup end
]])

return packer.startup(function()
    use({
        "wbthomason/packer.nvim",
        event = "VimEnter",
    })

    --[[
        Libraries
    --]]
    use({
        "nvim-lua/plenary.nvim",
    })

    --[[
        UI
    --]]
    use({
        "kyazdani42/nvim-web-devicons",
        config = "require('plugins.configs.icons')",
    })

    --use({
    --    "ellisonleao/gruvbox.nvim",
    --    config = "require('plugins.configs.gruvbox')"
    --})

    use({
        "EdenEast/nightfox.nvim",
        config = "require('plugins.configs.nightfox')"
    })

    use({
        "freddiehaddad/feline.nvim",
        after = {"nvim-web-devicons"},
        config = "require('plugins.configs.feline')",
    })

    use({
        "glepnir/dashboard-nvim",
        config = "require('plugins.configs.dashboard')",
    })

    use({
        'rafcamlet/nvim-luapad',
        requires = 'antoinemadec/FixCursorHold.nvim'
    })

    --[[
        LSP
    --]]
    use({
        "neovim/nvim-lspconfig",
    })
    use({
        "jose-elias-alvarez/null-ls.nvim",
    })
    use({
        "ms-jpq/coq_nvim",
        after = "nvim-lspconfig",
        branch = "coq",
        run = ":COQdeps",
        config = "require('lsp')",
    })
    use({
        "ms-jpq/coq.artifacts",
        branch = "artifacts",
    })
    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
            }
        end
    })
    use({
        "simrat39/rust-tools.nvim"
    })
    use({
        "ckipp01/stylua-nvim",
        run = "cargo install stylua"
    })

    --[[
        Telescope
    --]]
    use({
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        requires = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make",
            },
            {
                "nvim-telescope/telescope-media-files.nvim",
            },
        },
    })

    --[[ Disabled, alacritty does not support uberzug (and uberzug does not support Wayland)
    use({
        "nvim-telescope/telescope-media-files.nvim",
        after = "telescope.nvim",
        config = "require('telescope').load_extension('media_files')"
    })
    --]]

    --[[
        Treesitter
    --]]
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = "require('plugins.configs.treesitter')",
    })
    use({
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
    })
    use({
        "ziontee113/syntax-tree-surfer"
    })

    use({
        "rhysd/committia.vim"
    })
    use({
        'akinsho/bufferline.nvim',
        tag = "*",
        after = "nvim-web-devicons",
        config = "require('plugins.configs.bufferline')",
    })
    use({
        'mfussenegger/nvim-dap',
        config = "require('plugins.configs.dap')",
    })
    use({
        'rcarriga/nvim-dap-ui',
        requires = {'mfussenegger/nvim-dap'},
        config = "require('plugins.configs.dapui')"
    })
    use({
        'theHamsta/nvim-dap-virtual-text',
        config = "require('plugins.configs.dap_virtual')",
        requires = {'mfussenegger/nvim-dap'},
    })


    ------
    -- Under review
    ------
    use({
        'Shatur/neovim-cmake',
        config = "require('plugins.configs.cmake')"
    })

    use({
        'ThePrimeagen/harpoon'
    })
   
    -- Possession is a session management plugin
    use({
        'jedrzejboczar/possession.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = "require('plugins.configs.possession')",
    }) 

    use({
        'folke/which-key.nvim',
        config = "require('plugins.configs.which_key')",
    })

    use({
        'nvim-telescope/telescope-file-browser.nvim',
        requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
        after = "telescope.nvim",
        config = "require('telescope').load_extension('file_browser')"
    })

    use({
        'lewis6991/gitsigns.nvim',
        config = "require('plugins.configs.gitsigns')",
    })


end)
