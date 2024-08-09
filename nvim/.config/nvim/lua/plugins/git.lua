local function config_gitsigns()
    require('gitsigns').setup()
end

local function config_diffview()
end

return {
    { 'rhysd/committia.vim' },
    { 'lewis6991/gitsigns.nvim', config = config_gitsigns },
    { 'sindrets/diffview.nvim',  config = config_diffview },
}
