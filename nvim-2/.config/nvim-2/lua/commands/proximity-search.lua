local M = {}

local function build_regex(patterns, distances)
  local parts = {}
  for i, pattern in ipairs(patterns) do
    local escaped = vim.fn.escape(pattern, '[](){}.*+?^$|\\')
    -- wrap first pattern in a capture group so --replace '$1' returns just that line
    if i == 1 then
      parts[#parts + 1] = '(' .. escaped .. '[^\\n]*)'
    else
      parts[#parts + 1] = escaped
    end
    if distances[i] and i < #patterns then
      parts[#parts + 1] = '([^\\n]*\\n){0,' .. distances[i] .. '}[^\\n]*'
    end
  end
  return table.concat(parts)
end

local function open_grep(patterns, distances)
  local regex = build_regex(patterns, distances)
  Snacks.picker.grep({
    search = regex,
    regex = true,
    args = { '--multiline', '--replace', '$1' },
    prompt = 'Proximity (' .. #patterns .. ' patterns)> ',
    win = {
      input = {
        keys = {
          ['<c-a>'] = { 'add_pattern', mode = { 'n', 'i' } },
        },
      },
    },
    actions = {
      add_pattern = function(picker)
        picker:close()
        vim.schedule(function()
          Snacks.input({ prompt = 'Max lines to pattern ' .. (#patterns + 1) .. ': ' }, function(dist_str)
            if dist_str == nil then return end
            local dist = tonumber(dist_str)
            if not dist or dist <= 0 then dist = 10 end
            distances[#distances + 1] = dist

            Snacks.input({ prompt = 'Pattern ' .. (#patterns + 1) .. ': ' }, function(pattern)
              if pattern == nil or pattern == '' then
                vim.schedule(function() open_grep(patterns, distances) end)
                return
              end
              patterns[#patterns + 1] = pattern
              vim.schedule(function() open_grep(patterns, distances) end)
            end)
          end)
        end)
      end,
    },
  })
end

function M.start()
  Snacks.input({ prompt = 'Pattern 1: ' }, function(pattern)
    if pattern == nil or pattern == '' then return end
    open_grep({ pattern }, {})
  end)
end

return M
