local refactors = {
    args = {}
}

local lsp_utils     = require("plugin.lsp.utils")
local ts_parsers    = require("nvim-treesitter.parsers")
local ts_locals     = require("nvim-treesitter.locals")
local ts_query      = require("nvim-treesitter.query")
local ts_utils      = require("nvim-treesitter.ts_utils")

refactors.args.swap = function()
    -- Find function based on current cursor position
    -- Get argument list
    -- Swap arguments
    -- Write arguments back again
end

-- TODO:    Clean this up such that we're able to use this code multiple times.
--          e.g. break up the query parsing into its own helper function
--          and probably do the same for the match finding (if applicable)
refactors.args.remove = function()
    -- Find function based on current cursor position
    -- Match any function definition (capture) that has a child (function_declarator)
    -- that has a child (parameter_list, capture)
    local query = "((function_definition (function_declarator (parameter_list) @function.params)) @function.def)"

    local lang = vim.api.nvim_buf_get_option(0, 'ft')

    local success, parsed_query = pcall(function()
        return vim.treesitter.parse_query(lang, query)
    end)

    -- Exit if query parsing failed
    if not success then
        print("[get_range_of_function] Query parsing failed")
        return
    end

    local parser    = ts_parsers.get_parser(0, lang)
    local root      = parser:parse()[1]:root()
    local cursor, _  = unpack(vim.api.nvim_win_get_cursor(0))
    local root_start, _, root_end, _ = root:range()

    local found_func = false
    local arg_start = {0, 0}
    local arg_end = {0, 0}

    for match in ts_query.iter_prepared_matches(parsed_query, root, 0, root_start, root_end) do
        ts_locals.recurse_local_nodes(match, function(_, node, path)
--            local value = ts_utils.get_node_text(node)[1]
            local start_r, start_c, end_r, end_c = ts_utils.get_node_range(node)

            -- Function found in previous loop, which means this is the argument list
            if found_func then
                -- Remove row offsets here
                -- And add/remove offsets for parentheses (capture includes parentheses)
                arg_start[1] = start_r
                arg_start[2] = start_c + 1
                arg_end[1] = end_r
                arg_end[2] = end_c - 1
            end

            -- Check if this node is a function definition and check if the cursor is in the scope.
            if path == "function.def" and lsp_utils.range.in_row_range(start_r + 1, end_r + 1, cursor) then
                found_func = true
            end
        end)

        -- We found a matching function, no need to check the other functions
        if found_func then
            break
        end
    end

    -- Check if we found a matching function, if not quit.
    if found_func == false then
        print("No function found")
        return
    end

    -- Create a range and remove that range from the document
    local range = lsp_utils.range.create(arg_start, arg_end)

    -- Remove arguments
    lsp_utils.text_edit.remove_range(range)
end

return refactors
