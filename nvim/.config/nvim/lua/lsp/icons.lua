--local colors = require("gruvbox.base")

vim.fn.sign_define("DiagnosticSignError",   { text = "", texthl = "GruvboxRed" })
vim.fn.sign_define("DiagnosticSignWarn",    { text = "", texthl = "GruvboxYellow" })
vim.fn.sign_define("DiagnosticSignInfo",    { text = "", texthl = "GruvboxBlue" })
vim.fn.sign_define("DiagnosticSignHint",    { text = "", texthl = "GruvboxAqua" })

--vim.api.nvim_set_hl(0, 'STS_highlight', colors.GruvboxOrangeBold)
