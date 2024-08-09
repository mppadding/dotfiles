local function config_treesitter()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
        ensure_installed = { 'lua', 'rust', 'toml', 'markdown', 'html', 'css', 'javascript', 'query' },
        highlight = {
            enable = true,
        }
    })

    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.wo.foldenable = false
end

return {
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', config = config_treesitter },
}
