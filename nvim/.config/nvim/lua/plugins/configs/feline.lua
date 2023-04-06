local components = {
    active = {},
    inactive = {},
}

-- Left, Mid, Right components
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

-- Remember to change "components.active[1][1]" according to the rest of your config
components.active[1][1] = {
    provider = "HelloWorld",
    colored_icon = false,
    hl = function()
        return {
            name = require("feline.providers.vi_mode").get_mode_highlight_name(),
            fg = "#FFFFFF",
            bg = "oceanblue",
            style = "bold",
        }
    end,
    right_sep = "right_rounded",
    -- Uncomment the next line to disable icons for this component and use the mode name instead
    -- icon = ''
}

require("feline").setup({
    --components = components,
})
