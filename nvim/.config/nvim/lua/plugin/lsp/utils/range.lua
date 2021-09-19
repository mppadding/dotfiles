local range = {}

--- Generate a range from line/character positions
range.create = function(t_start, t_end)
    return {
        start = {
            character   = t_start[2],
            line        = t_start[1],
        },
        ['end'] = {
            character   = t_end[2],
            line        = t_end[1],
        }
    }
end

-- Check if a certain test row is in between r_begin and r_end
range.in_row_range = function(r_begin, r_end, test)
    if r_begin <= test and test <= r_end then
        return true
    end

    return false
end

return range
