local M = {
    vi = {}
}

M.vi.mode_text = {
    n       = "NORMAL ",
    i       = "INSERT ",
    v       = "VISUAL ",
    ['']  = "V-BLOCK",
    V       = "V-LINE ",
    c       = "COMMAND",
    no      = "UNKNOWN",
    s       = "UNKNOWN",
    S       = "UNKNOWN",
    ic      = "UNKNOWN",
    R       = "REPLACE",
    Rv      = "UNKNOWN",
    cv      = "UNKNOWN",
    ce      = "UNKNOWN",
    r       = "REPLACE",
    rm      = "UNKNOWN",
    t       = "INSERT "
}

M.vi.mode_color = {
  n = "UserInvCyan",
  no = "UserInvCyan",
  i = "UserStatus",
  v = "UserInvMagenta",
  V = "UserInvMagenta",
  [""] = "UserInvMagenta",
  R = "UserInvRed",
  Rv = "UserInvRed",
  r = "UserInvBlue",
  rm = "UserInvBlue",
  s = "UserInvMagenta",
  S = "UserInvMagenta",
  [""] = "UserMagenta",
  c = "UserInvYellow",
  ["!"] = "UserInvBlue",
  t = "UserInvBlue",
}

M.palette = function()
    local palette = require('nightfox.palette').load(vim.g.colors_name)

    return palette
end

return M
