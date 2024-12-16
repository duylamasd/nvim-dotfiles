local M = {
  "Saghen/blink.cmp",
  dependencies = { "giuxtaposition/blink-cmp-copilot" },
  opts = {
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      providers = { copilot = { name = "copilot", module = "blink-cmp-copilot" } },
    },
  },
}

return M
