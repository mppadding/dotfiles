local function config_gitsigns()
    require('gitsigns').setup()
end

return {
    { 'rhysd/committia.vim' },
    { 'lewis6991/gitsigns.nvim', config = config_gitsigns },
}
