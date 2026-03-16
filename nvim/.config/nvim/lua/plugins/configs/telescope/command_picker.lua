local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local previewers = require "telescope.previewers"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- our picker function: colors
-- Ideas:
-- - Create diff in current file? this can be used to move edits from one commit to another by using an interactive
--      rebase, you'd do the rebase, create a diff on the current file. Amend it, continue rebase and apply the diff in the
--      next commit.

local colors = function (opts)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "Command Runner",
        finder = finders.new_table {
            results = {
                {
                    "Open Terminal",
                    function ()
                        print(vim.api.nvim_buf_get_name(0))
                        vim.cmd("ToggleTerm")
                    end,
                    "Opens a terminal"
                },
                {
                    "Execute Test",
                    function ()
                        -- TODO: Figure out where we are and run the test
                        -- E.G. for fare in `lambik/` -> `just individual-browser-test` with the title (using
                        -- tree-sitter?)
                        -- E.G. for fare in `server/features` -> `just feature-test` with the title (using tree-sitter?)
                        -- E.G. for fare in `engine/features` -> `just feature-test` with the title (using tree-sitter?)
                        print(vim.api.nvim_buf_get_name(0))
                        vim.cmd("ToggleTerm")
                    end,
                    "Opens a terminal"
                },
                {
                    "Git Commit Amend Current File",
                    function ()
                        -- TODO: Amend current file (with a --no-verify)
                        print(vim.api.nvim_buf_get_name(0))
                        vim.cmd("ToggleTerm")
                    end,
                    "Git amends the current file using `--no-verify`"
                }
            },
            entry_maker = function (entry)
                return {
                    value = entry,
                    display = entry[1],
                    ordinal = entry[1],
                }
            end,
        },
        sorter = conf.generic_sorter(opts),
        previewer = previewers.new_buffer_previewer({
            title = "Description",
            define_preview = function (self, entry, status)
                vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, { "    " .. entry.value[1] })
                vim.api.nvim_buf_set_lines(self.state.bufnr, 1, -1, false, { entry.value[3] })
                ns_id = vim.api.nvim_create_namespace("")
                ext_id = vim.api.nvim_buf_set_extmark(self.state.bufnr, ns_id, 0, 0, {
                    hl_mode = "replace",
                    hl_group = "Search",
                    line_hl_group = "DiffText"
                })
            end,
        }),
        attach_mappings = function (prompt_bufnr, map)
            actions.select_default:replace(function ()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                selection.value[2]()
            end)
            return true
        end,
    }):find()
end

-- to execute the function
--colors(require("telescope.themes").get_dropdown({}))


local opts_with_preview = {
    prompt_title = "~ NeoVim dotfiles ~",
    cwd = "~/dotfiles/nvim/.config/nvim",

    layout_strategy = "flex",
    layout_config = {
        width = 0.9,
        height = 0.8,

        horizontal = {
            width = { padding = 0.15 },
        },
        vertical = {
            preview_height = 0.75,
        },
    },
}
colors(opts_with_preview)
