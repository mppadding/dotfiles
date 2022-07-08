local M = {}

M.telescope = function()
    local opts = { noremap = true, silent = true }

    -- Grep
    vim.keymap.set("n", "<leader>gg", "<cmd>Telescope live_grep<CR>", opts)
    vim.keymap.set("n", "<leader>gs", "<cmd>Telescope grep_string<CR>", opts)

    -- LSP
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

    -- Git
    vim.keymap.set("n", "<leader>Gb", "<cmd>Telescope git_branches<CR>", opts)
    vim.keymap.set("n", "<leader>Gc", "<cmd>Telescope git_commits<CR>", opts)
    vim.keymap.set("n", "<leader>Gs", "<cmd>Telescope git_status<CR>", opts)

    vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", opts)

    --[[
        builtin = {
            find_files = "<leader>ff",
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
    buf_set_keymap("n", "<leader>dd", "<cmd>lua vim.diagnostic.open_float(0, {scope = 'line'})<CR>", opts)
    buf_set_keymap("n", "<leader>dN", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<leader>dl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

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

M.syntax_tree_surfer = function()
    local stf = require("syntax-tree-surfer")
    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "gj", function()
        stf.targeted_jump({
            "function",
            "if_statement",
            "else_clause",
            "else_statement",
            "elseif_statement",
            "for_statement",
            "while_statement",
            "switch_statement",
            "case_statement",
            "function_declarator",
        })
    end, opts)

    -- TODO:
    -- vim.api.nvim_set_hl(0, 'Cursor', { fg = "#ff0000" })
end

return M
