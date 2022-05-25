local lsp = require("lsp.lsp")
local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on-attach")

lsp.tsserver.setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false

    on_attach(client, bufnr)
  end,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
  capabilities = capabilities,
}
