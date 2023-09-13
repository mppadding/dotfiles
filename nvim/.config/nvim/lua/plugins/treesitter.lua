return {
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = "require('plugins.configs.treesitter')" },
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" }
}
