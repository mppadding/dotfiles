local M = {}

M.setup = function (capabilities, on_attach_cb)
    local tf = require('lspconfig')['helm_ls']

    local opts = {
        capabilities = capabilities,
        on_attach = on_attach_cb,
    }

    tf.setup(opts)
end

return M
