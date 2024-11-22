vim.g.mapleader = " "
vim.g.editorconfig = true
-- TODO: Benchmark
-- vim.loader.enable()

require("compat")

-- Ignore since rust-analyzer keeps tossing this but we show it as pop up
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function (err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end

P = function (t)
    vim.print(t)
    return t
end

dump = function (t)
    vim.print(vim.inspect(t))
    return t
end

local mappings = require("core.mappings")

require("core.options")

mappings.generic()
mappings.telescope()
--mappings.syntax_tree_surfer()
mappings.tabs()
mappings.debug()
--mappings.harpoon()

require("core.plugin_manager")
vim.cmd("colorscheme nordfox")

mappings.nvim_tree()
