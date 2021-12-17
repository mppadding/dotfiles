local M = {}

M.telescope = function(bufnr)
    local function set_keymap(...)
        vim.api.nvim_set_keymap(...)
    end

    local opts = { noremap = true, silent = true }

    -- Grep
    set_keymap("n", "<leader>gg", "<cmd>Telescope live_grep<CR>", opts)
    set_keymap("n", "<leader>gs", "<cmd>Telescope grep_string<CR>", opts)

    -- LSP
    set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

    --[[
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
        --]]
end

M.lsp = function(bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- Jumping
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    -- Handled by Telescope
    -- buf_set_keymap('n', keybinds.lsp.goto_references, '<cmd>lua vim.lsp.buf.references()<CR>', opts)

    -- Information
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

    -- Diagnostics
    buf_set_keymap("n", "<leader>dd", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "<leader>dN", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "<leader>dn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<leader>dl", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

    -- Not implemented by clangd
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

    -- Workspace
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)

    -- Code Actions
    buf_set_keymap("n", "<leader>C", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
end

return M
