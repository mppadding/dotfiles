local register_lsp = function(server, settings)
    local lsp_settings = require("coq")().lsp_ensure_capabilities({
        on_attach = on_attach_callback,
    })

    local settings = settings or {}

    if settings ~= nil then
        for key,val in pairs(settings) do
            lsp_settings[key] = val
        end
    end

    server.setup(lsp_settings)
end

vim.schedule(function()
    local lsp = require "lspconfig"
    require("packer").loader("coq_nvim coq.artifacts")

    -- Start COQnow
    require("coq")().Now("-s")

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

    -- Lua
    register_lsp(lsp.sumneko_lua, require("plugin.lsp.lua_config"))

    -- TODO:    This currently results in E32: No file name if
    --          NVim is run without a filename (such as $ nvim)
    vim.cmd('e')
end)
