vim.tbl_add_reverse_lookup = function (tbl)
    for k, v in pairs(tbl) do
        tbl[v] = k
    end
end
