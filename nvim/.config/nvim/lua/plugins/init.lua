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
        "nvim-lua/plenary.nvim",
    })

    use({
        "wbthomason/packer.nvim",
        event = "VimEnter",
    })

    use({
        "ellisonleao/gruvbox.nvim",
        requires = {
            "rktjmp/lush.nvim",
        },
        config = function()
            vim.g.gruvbox_contrast_dark = "hard"
            vim.cmd("colorscheme gruvbox")
        end,
    })

    use({
        "kyazdani42/nvim-web-devicons",
        config = "require('plugins.configs.icons')",
    })

    use({
        "famiu/feline.nvim",
        after = "nvim-web-devicons",
        config = "require('plugins.configs.feline')",
    })
end)
