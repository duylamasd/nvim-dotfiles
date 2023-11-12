local M = {}

M.config = function()
  local lsp_signature = require("lsp_signature")

  lsp_signature.setup({
    bind = true,
    handler_opts = {border = "rounded"},
    floating_window = false
  })
end

return M
