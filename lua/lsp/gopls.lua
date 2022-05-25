local lsp = require("lsp.lsp")
local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on-attach")

lsp.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
