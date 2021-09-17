local register_lsp = function(server, settings)
    local lsp_settings = require("coq")().lsp_ensure_capabilities({
        on_attach = on_attach_callback,
    })

    local settings = settings or {}

    if settings ~= nil then
        for key,val in pairs(settings) do
            lsp_settings[key] = value
        end
    end

    server.setup(lsp_settings)
end

vim.schedule(function()
    local lsp = require "lspconfig"
    require("packer").loader("coq_nvim coq.artifacts")

    -- Start COQnow
    require("coq")().COQnow("-s")

    -- Python
    register_lsp(lsp.pyright)

    -- CMake
    register_lsp(lsp.cmake)

    -- C/C++ with clang
    register_lsp(lsp.clangd)

    -- Rust
    register_lsp(lsp.rust_analyzer)

    -- LaTeX
    register_lsp(lsp.texlab)

    vim.cmd('e')
end)

