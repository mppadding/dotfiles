function config_telescope()
    require("telescope").setup()
end

function config_telescope_fzf()
    require("telescope").load_extension("fzf")
end

function config_telescope_file_browser()
    require("telescope").load_extension("file_browser")
end

-- TODO: Add lazy loading to telescope
return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = config_telescope,
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", config = config_telescope_fzf },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = config_telescope_file_browser,
    },
    -- { 'nvim-telescope/telescope-media-files.nvim' }
}
