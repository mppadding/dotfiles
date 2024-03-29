require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "cpp", "lua", "python", "query", "rust" },

    auto_install = true,

    -- Hightlighting Module
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    -- Playground Module
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,         -- Debounced time for highlighting nodes in the playground from the source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<CR>",
            show_help = "?",
        },
    },
})
