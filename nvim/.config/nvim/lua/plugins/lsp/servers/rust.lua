local M = {}

M.setup = function (capabilities, on_attach_cb)
    vim.g.rustfmt_autosave = 0

    vim.g.rustaceanvim = {
        server = {
            capabilities = capabilities,
            on_attach = on_attach_cb,
        }
    }
end

return M
