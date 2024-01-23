local function get_diagnostic_label(props)
    local icons = { error = '', warn = '', info = '', hint = '', }
    local label = {}

    for severity, icon in pairs(icons) do
        local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
        if n > 0 then
            table.insert(label, { icon .. ' ' .. n .. ' ', group = 'DiagnosticSign' .. severity })
        end
    end
    if #label > 0 then
        table.insert(label, { '| ' })
    end
    return label
end
local function get_git_diff(props)
    local icons = { removed = "", changed = "", added = "" }
    local labels = {}
    local signs = vim.api.nvim_buf_get_var(props.buf, "gitsigns_status_dict")
    -- local signs = vim.b.gitsigns_status_dict
    for name, icon in pairs(icons) do
        if tonumber(signs[name]) and signs[name] > 0 then
            table.insert(labels, {
                icon .. " " .. signs[name] .. " ",
                group = "Diff" .. name
            })
        end
    end
    if #labels > 0 then
        table.insert(labels, { '| ' })
    end
    return labels
end

local function config_incline()
    require('incline').setup({
        render = function (props)
            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
            local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
            local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "bold"

            local buffer = {
                { get_diagnostic_label(props) },
                { get_git_diff(props) },
                { ft_icon,                    guifg = ft_color }, { " " },
                { filename, gui = modified },
            }
            return buffer
        end
    })
end

local function config_nvim_tree()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup {}
end

local function config_noice()
    local inc_rename, _ = pcall(require, "inc_rename")

    -- TODO: Issue where saving moves the view a couple of lines
    --
    --require("noice").setup({
    --    lsp = {
    --        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    --        override = {
    --            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --            ["vim.lsp.util.stylize_markdown"] = true,
    --            ["cmp.entry.get_documentation"] = true,
    --        },
    --    },
    --    -- you can enable a preset for easier configuration
    --    presets = {
    --        bottom_search = true,         -- use a classic bottom cmdline for search
    --        command_palette = true,       -- position the cmdline and popupmenu together
    --        long_message_to_split = true, -- long messages will be sent to a split
    --        lsp_doc_border = false,       -- add a border to hover docs and signature help
    --        inc_rename = inc_rename,
    --    },
    --})
end

return {
    {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        event = 'LspAttach',
        opts = {
            -- options
        },
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {},
    },
    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = config_nvim_tree,
    },
    { 'b0o/incline.nvim', config = config_incline },
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        dependencies = { 'MunifTanjim/nui.nvim' },
        config = config_noice
    },
}
