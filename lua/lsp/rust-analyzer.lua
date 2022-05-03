local lsp = require("lsp.lsp")
local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on-attach")

lsp.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 100,
  },
}
