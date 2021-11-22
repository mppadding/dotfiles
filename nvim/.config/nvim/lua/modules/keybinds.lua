return {
    telescope = {
        builtin = {
            find_files = "<leader>ff",
        },
        git = {
            branches    = "<leader>Gb",
            commits     = "<leader>Gc",
            status      = "<leader>Gs",
        },
        grep = {
            live        = "<leader>gg",
            string      = "<leader>gs",
        },
        custom = {
            edit_neovim = "<leader>en",
        },
    },
    lsp = {
        goto_declaration    = 'gD',
        goto_definition     = 'gd',
        goto_references     = 'gr',
        hover               = 'K',
        diagnostics_line    = '<leader>dd',
        diagnostics_next    = '<leader>dn',
        diagnostics_prev    = '<leader>dN',
        diagnostics_list    = '<leader>dl',
        action_code         = '<leader>C',
        action_rename       = '<leader>cr',
        source_header_swap  = '<A-5>',
    },
    copy_paste = {
        visual_system_yank_line     = '<leader>y',
        system_yank_line            = '<leader>yy',
        system_paste                = '<leader>p',
    },
    movement = {
        function_header = '<leader>mfh', -- Move Function Header, Currently unimplemented
    },
}
