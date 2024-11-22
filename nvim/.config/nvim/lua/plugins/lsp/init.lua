local function config_mason_lspconfig()
    require('mason-lspconfig').setup({
        ensure_installed = {
            'rust_analyzer',
            'lua_ls',
            'yamlls',
            -- Typescript/React
            'ts_ls',
            'eslint',
            -- IaC
            'helm_ls',
            'terraformls'
        },
    })
end

local function config_nvim_cmp()
    vim.opt.completeopt = 'menu,menuone,noinsert'

    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
        snippet = {
            expand = function (args)
                luasnip.lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-k>'] = cmp.mapping.scroll_docs(-4),
            ['<C-j>'] = cmp.mapping.scroll_docs(4),
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<Tab>'] = cmp.mapping(function (fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function (fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
            --{ name = 'copilot' },
            { name = 'nvim_lsp' },
            { name = 'nvim_lsp_signature_help' },
            { name = 'nvim_lua' },
            { name = 'luasnip' },
            { name = 'path' },
        }, {
            { name = 'buffer', keyword_length = 3 },
        }),
        experimental = {
            ghost_text = true,
        },
    })

    vim.fn.sign_define("DiagnosticSignError",
        { text = "", texthl = "DiagnosticSignError", numhl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint" })
    vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "DiagnosticSignError" })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local on_attach_cb = function (client, buf)
        require('lsp-format').on_attach(client, buf)
        require('core.mappings').lsp(buf)
        vim.lsp.inlay_hint.enable()
    end

    local servers = require('plugins.lsp.servers')

    -- TODO: probably better to instead send a table with defaults instead of sending individual fields
    for _, v in pairs(servers.servers) do
        require(servers.root .. v).setup(capabilities, on_attach_cb)
    end
end


local function config_copilot()
    require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
    })
end

return {
    'neovim/nvim-lspconfig',
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = config_nvim_cmp,
    },
    -- Helpers
    { 'lukas-reineke/lsp-format.nvim' },
    { 'mustache/vim-mustache-handlebars' },
    { 'williamboman/mason.nvim',           config = true },
    { 'williamboman/mason-lspconfig.nvim', config = config_mason_lspconfig },
    { 'towolf/vim-helm',                   ft = { 'helm' } }, -- Sets the filetype to helm
    --{ 'zbirenbaum/copilot.lua',            cmd = 'Copilot',                             event = 'InsertEnter', config = config_copilot },
    --{ 'zbirenbaum/copilot-cmp',            dependencies = { 'zbirenbaum/copilot.lua' }, config = true },
    -- Servers
    { 'mrcjkb/rustaceanvim',               ft = { 'rust' } },
    { 'pmizio/typescript-tools.nvim' },
}
