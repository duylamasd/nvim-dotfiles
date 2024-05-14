local M = {
  "windwp/nvim-autopairs",
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({})
  end,
}

return M
