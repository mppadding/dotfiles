-- Debug helpers

--- Functions like the rust dbg!() macro, where
--- the macro will both print the value given as well as
--- return the value.
---
--- ```
--- local value = 10
---
--- -- prints 10
--- local other = dbg(value)
---
--- -- prints 10
--- vim.print(other)
--- ```
---
--- @param t any
--- @return any
dbg = function(t)
  vim.print(t)
  return t
end

--- Functions like the rust dbg!() macro, where
--- the macro will both print the value given (deep inspect)
--- as well as return the value.
---
--- ```
--- local value = 10
---
--- -- prints 10
--- local other = dbg(value)
---
--- -- prints 10
--- vim.print(other)
--- ```
---
--- @param t any
--- @return any
dump = function(t)
  vim.print(vim.inspect(t))
  return t
end
