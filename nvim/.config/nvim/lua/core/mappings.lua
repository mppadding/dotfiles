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
    buf_set_keymap("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float(0, {scope = 'line'})<CR>", opts)
    buf_set_keymap("n", "<leader>lN", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<leader>ll", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

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

M.tabs = function()
    local opts = { noremap = true, silent = true }

    -- Navigation
    vim.keymap.set("n", "<A-l>", "<cmd>tabnext<CR>", opts)
    vim.keymap.set("i", "<A-l>", "<cmd>tabnext<CR>", opts)
    vim.keymap.set("t", "<A-l>", "<cmd>tabnext<CR>", opts)

    vim.keymap.set("n", "<A-h>", "<cmd>tabprevious<CR>", opts)
    vim.keymap.set("i", "<A-h>", "<cmd>tabprevious<CR>", opts)
    vim.keymap.set("t", "<A-h>", "<cmd>tabprevious<CR>", opts)
end

M.debug = function()
    local opts = { noremap = true, silent = true }

    -- Breakpoints
    vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
    -- TODO: Add conditional
    --vim.keymap.set("n", "<leader>dbc", "<cmd>lua require'dap'.set_breakpoint()<CR>", opts)

    -- Navigation
    vim.keymap.set("n", "<leader>dn", "<cmd>lua require'dap'.step_over()<CR>", opts)
    vim.keymap.set("n", "<F8>", "<cmd>lua require'dap'.step_over()<CR>", opts)

    vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", opts)
    vim.keymap.set("n", "<F7>", "<cmd>lua require'dap'.step_into()<CR>", opts)

    vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<CR>", opts)

    -- Start/Stop
    vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", opts)
    vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
    vim.keymap.set("n", "<F9>", "<cmd>lua require'dap'.continue()<CR>", opts)

    vim.keymap.set("n", "<leader>dq", "<cmd>lua require'dap'.terminate()<CR>", opts)
end

M.harpoon = function()
    local opts = { noremap = true, silent = true }

    -- Breakpoints
    vim.keymap.set("n", "<leader>mm", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
    vim.keymap.set("n", "<leader>ml", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
end

return M
