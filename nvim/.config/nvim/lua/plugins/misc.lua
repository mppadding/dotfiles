local mappings = require('core.mappings')

local function config_possession()
    require('possession').setup({})
    require('telescope').load_extension('possession')

    mappings.possession()
end

return {
    { "rafcamlet/nvim-luapad", cmd = { "Luapad", "LuaRun" } },
    { "ckipp01/stylua-nvim",   build = "cargo install stylua" },
    {
        "folke/which-key.nvim",
        config = function ()
            vim.o.timeout = true
            vim.o.timeoutlen = 300

            require("which-key").setup({
                filter = function (mapping)
                    return mapping.desc ~= "ignore"
                end,
            })
        end,
    },
    {
        'jedrzejboczar/possession.nvim',
        config = config_possession,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function ()
            require("toggleterm").setup({
                --open_mapping = [[<Leader>t]],
                insert_mappings = false,
                direction = "float",
                float_opts = {
                    border = "curved",
                    width = function (term)
                        return math.ceil(vim.o.columns * 0.6)
                    end,
                    height = function (term)
                        return math.ceil(vim.o.lines * 0.5)
                    end,
                },
                winbar = {
                    enabled = true,
                    name_formatter = function (term)
                        return term.name
                    end,
                },
            })
        end,
        init = mappings.toggleterm,
    },
}
