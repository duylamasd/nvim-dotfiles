local lsp = require("lsp.lsp")
local capabilities = require("lsp.capabilities")

lsp.cssls.setup {
  capabilities = capabilities
}
