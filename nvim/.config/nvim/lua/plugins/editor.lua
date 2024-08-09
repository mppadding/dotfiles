local opts_conform = {
    formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    format_on_save = { timeout_ms = 500 }
}

return {
    { 'github/copilot.vim' },
    { 'danilamihailov/beacon.nvim' },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'AckslD/nvim-neoclip.lua',            dependencies = { 'nvim-telescope/telescope.nvim' }, opts = {} },
    { 'folke/todo-comments.nvim',           dependencies = { 'nvim-lua/plenary.nvim' },         opts = { highlight = { pattern = [[.*<(KEYWORDS)(\(.*\))?\s*:]] }, search = { pattern = [[\b(KEYWORDS)(\(.*\))?:]] } } },
    { 'stevearc/conform.nvim',              event = { 'BufWritePre' },                          cmd = { 'ConformInfo' },                                                                                               opts = opts_conform },
    {
        'folke/flash.nvim',
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {
            modes = {
                search = {
                    enabled = false,
                },
            },
        },
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function () require("flash").jump() end, desc = "Flash" },
            {
                "S",
                mode = { "n", "x", "o" },
                function () require("flash").treesitter() end,
                desc =
                "Flash Treesitter"
            },
            {
                "r",
                mode = "o",
                function () require("flash").remote() end,
                desc =
                "Remote Flash"
            },
            {
                "R",
                mode = { "o", "x" },
                function () require("flash").treesitter_search() end,
                desc =
                "Treesitter Search"
            },
            {
                "<c-s>",
                mode = { "c" },
                function () require("flash").toggle() end,
                desc =
                "Toggle Flash Search"
            },
        },
    },
    { 'smjonas/inc-rename.nvim' }, -- Live LSP renaming
}
