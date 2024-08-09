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
    local eslint = require('lspconfig').eslint

    local opts = {
        capabilities = capabilities,
        on_attach = on_attach_cb,
    }

    eslint.setup(opts)
end

M.setup = function (capabilities, on_attach_cb)
    setup_typescript(capabilities, on_attach_cb)
    setup_eslint(capabilities, on_attach_cb)
end

return M
