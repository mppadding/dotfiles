local text_edit = {}

text_edit.remove_range = function(range)
    edit = {
        range = range,
        newText = "",
    }

    vim.lsp.util.apply_text_edits({edit}, 0)
end

return text_edit
