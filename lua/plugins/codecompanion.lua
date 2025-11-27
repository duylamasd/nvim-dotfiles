local M = {
  "olimorris/codecompanion.nvim",
  tag = "v17.33.0",
  opts = {
    strategies = {
      chat = {
        tools = {
          ["mcp"] = {
            -- Prevent mcphub from loading before needed
            callback = function()
              return require("mcphub.extensions.codecompanion")
            end,
            description = "Call tools and resources from the MCP Servers",
          },
        },
      },
    },
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)
  end,
}

return M