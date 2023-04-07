local mappings = require("core.mappings")

local on_attach_callback = function(client, bufnr)
    mappings.lsp(bufnr)
end

-- Define custom gutter signs for LSP tags

local register_lsp = function(server, settings)
    local lsp_settings = require("coq")().lsp_ensure_capabilities({
        on_attach = on_attach_callback,
    })

    local settings = settings or {}

    if settings ~= nil then
        for key, val in pairs(settings) do
            lsp_settings[key] = val
        end
    end

    server.setup(lsp_settings)
end

local lsp = require("lspconfig")

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.vale,
    },
})

-- Python
register_lsp(lsp.pyright)

-- CMake
register_lsp(lsp.cmake)

-- Rust
local rt = require("rust-tools")

rt.setup({
    tools = {
        inlay_hints = {
            highlight = "DiagnosticVirtualTextInfo",
        },
    },
    server = require("coq").lsp_ensure_capabilities({
        on_attach = function(_, bufnr)
            on_attach_callback(nil, bufnr)

            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    }),
})

-- LaTeX
register_lsp(lsp.texlab)

-- Lua
register_lsp(lsp.lua_ls, require("lsp.lua"))

-- C/C++ with clang
register_lsp(lsp.clangd)

-- Start COQnow
vim.g.coq_settings = {
    ["limits.completion_auto_timeout"] = 0.66,
}
require("coq")().Now("-s")
require("lsp.icons")
