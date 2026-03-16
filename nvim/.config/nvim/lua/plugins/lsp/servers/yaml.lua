local M = {}

M.setup = function (capabilities, on_attach_cb)
    vim.lsp.config['yamlls'] = {
        capabilities = capabilities,
        on_attach = on_attach_cb,
        settings = {
            yaml = {
                schemas = {
                    ["lambik/schema.json"] = "lambik/**/*.yaml",
                    ["engine/features/schema.json"] = "engine/features/**/*.yaml",
                    ["server/features/schema.json"] = "server/features/**/*.yaml",
                }
            }
        }
    }
end

return M
