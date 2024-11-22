local M = {}

M.setup = function (capabilities, on_attach_cb)
    local tf = require('lspconfig')['jsonls']

    local opts = {
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

    tf.setup(opts)
end

return M
