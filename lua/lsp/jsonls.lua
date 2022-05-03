local lsp = require("lsp.lsp")
local capabilities = require("lsp.capabilities")

lsp.jsonls.setup = {
  capabilities = capabilities
}
