local M = {}

M.setup = function (capabilities, on_attach_cb)
    vim.g.rustfmt_autosave = 0

    vim.g.rustaceanvim = {
        server = {
            capabilities = capabilities,
            on_attach = on_attach_cb,
            --settings = {
            --    ['rust-analyzer'] = {
            --        checkOnSave = {
            --            extraArgs = { '--target-dir=/tmp/rust-analyzer-check' },
            --        },
            --        ['cargo.targetDir'] = true
            --    }
            --}
        }
    }

    --vim.lsp.config('rustaceanvim', {
    --    capabilities = capabilities,
    --    on_attach = on_attach_cb,
    --    server = {
    --        settings = {
    --            ['rust-analyzer'] = {
    --                checkOnSave = false,
    --                --checkOnSave = {
    --                --    extraArgs = { '--target-dir=/tmp/rust-analyzer-check' },
    --                --},
    --                ['cargo.targetDir'] = true
    --            }
    --        }
    --    }

    --})
end

return M
