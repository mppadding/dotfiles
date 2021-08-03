-- Check if Tree Sitter is installed, if not exit the script
if not pcall(require, "nvim-treesitter") then
    return
end

local parsers   = require("nvim-treesitter.parsers")
local locals    = require("nvim-treesitter.locals")
local ts_query  = require("nvim-treesitter.query")
local ts_utils  = require("nvim-treesitter.ts_utils")

local in_range = function(r_begin, r_end, test)
    if r_begin <= test and test <= r_end then
        return true
    end

    return false
end

test = function(query)
    local bufnr     = 0

    local lang      = vim.api.nvim_buf_get_option(bufnr, 'ft')

    local success, parsed_query = pcall(function()
        return vim.treesitter.parse_query(lang, query)
    end)

    if not success then
        print("Query parsing failed")
        return
    end

    local parser    = parsers.get_parser(0, lang)
    local root      = parser:parse()[1]:root()
    local cursor, _  = unpack(vim.api.nvim_win_get_cursor(0))
    local root_start, _, root_end, _ = root:range()

    local func_start = 0
    local func_end   = 0

    for match in ts_query.iter_prepared_matches(parsed_query, root, 0, root_start, root_end) do
        locals.recurse_local_nodes(match, function(_, node, path)
            local value = ts_utils.get_node_text(node)[1]
            local start_r, _, end_r, _ = ts_utils.get_node_range(node)

            start_r = start_r + 1
            end_r   = end_r   + 1

            if func_start ~= 0 then
                if in_range(func_start, func_end, start_r) then
                    print("Found element (", path, ") with value (", value, ")")
                end
            else
                if in_range(start_r, end_r, cursor) then
                    if path == "function.def" then
                        func_start  = start_r
                        func_end    = end_r
                    end
                end
            end
        end)
    end
end

pr = function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))

    vim.api.nvim_buf_set_lines(0, row, row, false, {"Lorem", "Ipsum", "Dolor", "Sit", "Amet"})
end

quer = [[
    ((function_definition) @function.def)
    (function_definition (function_declarator (identifier) @function.id) @function.decl)
    (parameter-list (parameter-declaration)* @params)
]]
