local M = {}

M.setup = function (capabilities, on_attach_cb)
    local tt = require('typescript-tools')

    local opts = {
        capabilities = capabilities,
        on_attach = on_attach_cb,
    }

    tt.setup(opts)
end

return M
