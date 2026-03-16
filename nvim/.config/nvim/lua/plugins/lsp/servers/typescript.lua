local M = {}

local function setup_typescript(capabilities, on_attach_cb)
    local tt = require('typescript-tools')

    local opts = {
        capabilities = capabilities,
        on_attach = on_attach_cb,
    }

    tt.setup(opts)
end

local function setup_eslint(capabilities, on_attach_cb)
    vim.lsp.config('eslint', {
        capabilities = capabilities,
        on_attach = on_attach_cb,
    })
end

M.setup = function (capabilities, on_attach_cb)
    setup_typescript(capabilities, on_attach_cb)
    setup_eslint(capabilities, on_attach_cb)
end

return M
