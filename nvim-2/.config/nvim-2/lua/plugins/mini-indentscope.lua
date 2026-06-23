-- Visualize and work with indent scope
-- * Customizable debounce delay, animation style, and scope computation options.
-- * Implements scope-related motions and textobjects.
--
-- Shows an indent scope like:
-- ```json
-- {
--     "items": [
--         {
--             "id": 1,
--             "name": "Item 1",
--             "description": "This is the first item."
--         },
--         {
--         ╎   "id": 2,
--         ╎   "name": "Item 2",█
--         ╎   "description": "This is the second item."
--         }
--     ]
-- }
-- ```
vim.pack.add({ 'https://github.com/nvim-mini/mini.indentscope' })

require('mini.indentscope').setup({
  mappings = {
    -- Handled natively with treesitter + an/in
    object_scope = '',
    object_scope_with_border = '',

    -- Motions (jump to respective border line; if not present - body line)
    goto_top = '[i',
    goto_bottom = ']i',
  },
})
