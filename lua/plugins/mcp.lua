local M = {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "olimorris/codecompanion.nvim",
  },
  cmd = { "MCPHub" },
  build = "npm install -g mcp-hub@latest",
  opts = {
    auto_approve = false,
    extensions = {
      codecompanion = {
        show_result_in_chat = true,
        make_vars = true,
        make_slash_commands = true,
      },
    },
  },
  config = function(_, opts)
    require("mcphub").setup(opts)
  end,
}

return M
