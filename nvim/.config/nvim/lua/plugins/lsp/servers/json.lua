local M = {}

M.setup = function (capabilities, on_attach_cb)
    vim.lsp.config['jsonls'] = {
        capabilities = capabilities,
        on_attach = on_attach_cb,
        settings = {
            json = {
                schemas = {
                    {
                        fileMatch = { "**/polymock.json" },
                        url = "./authorization/polymock.schema.json",
                    }
                }
            }
        }
    }
end

return M
