local M = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = { "InsertEnter" },
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
  end,
}

return M
