local M = {}

M.setup = function (capabilities, on_attach_cb)
    vim.lsp.config['helm_ls'] = {
        capabilities = capabilities,
        on_attach = on_attach_cb,
    }
end

return M
