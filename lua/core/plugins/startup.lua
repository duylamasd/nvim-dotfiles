local M = {}

M.config = function()
  local startup = require("startup")
  startup.setup({theme = "evil"})
end

return M
