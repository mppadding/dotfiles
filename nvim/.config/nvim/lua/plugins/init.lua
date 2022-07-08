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

    use({
        "ellisonleao/gruvbox.nvim",
        --[[requires = {
            "rktjmp/lush.nvim",
        },
        --]]
        config = "require('plugins.configs.gruvbox')"
    })

    use({
        "famiu/feline.nvim",
        after = "nvim-web-devicons",
        config = "require('plugins.configs.feline')",
    })

    use({
        "glepnir/dashboard-nvim",
        config = "require('plugins.configs.dashboard')",
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
end)
