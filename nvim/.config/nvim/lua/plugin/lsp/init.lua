local keybinds = require('modules/keybinds')

local on_attach_callback = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- Jumping
  buf_set_keymap('n', keybinds.lsp.goto_declaration, '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', keybinds.lsp.goto_definition, '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- Handled by Telescope
  -- buf_set_keymap('n', keybinds.lsp.goto_references, '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  -- Information
  buf_set_keymap('n', keybinds.lsp.hover, '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  -- Diagnostics
  buf_set_keymap('n', keybinds.lsp.diagnostics_line, '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', keybinds.lsp.diagnostics_prev, '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', keybinds.lsp.diagnostics_next, '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', keybinds.lsp.diagnostics_list, '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Not implemented by clangd
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  -- Workspace
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  -- Code Actions
  buf_set_keymap('n', keybinds.lsp.action_code, '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', keybinds.lsp.action_rename, '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

  --vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {})
end

-- Define custom gutter signs for LSP tags
vim.fn.sign_define("LspDiagnosticsSignError",
    {text = "", texthl = "GruvboxRed"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
    {text = "", texthl = "GruvboxYellow"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
    {text = "", texthl = "GruvboxBlue"})
vim.fn.sign_define("LspDiagnosticsSignHint",
    {text = "", texthl = "GruvboxAqua"})

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

local lsp = require "lspconfig"
local coq = require "coq"

-- Python
register_lsp(lsp.pyright)

-- CMake
register_lsp(lsp.cmake)

-- Rust
register_lsp(lsp.rust_analyzer)

-- LaTeX
register_lsp(lsp.texlab)

-- Lua
register_lsp(lsp.sumneko_lua, require("plugin.lsp.lua_config"))

-- C/C++ with clang
register_lsp(lsp.clangd)

-- Start COQnow
coq().Now("-s")
