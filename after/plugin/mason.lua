local status, mason = pcall(require, "mason")
if not status then
  vim.notify("Couldn't load mason.")
  return
end

local mason_lsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_status then
  vim.notify("Couldn't load mason-lspconfig.")
  return
end

local lspstatus, lspconfig = pcall(require, "lspconfig")
if not lspstatus then
  vim.notify("Couldn't load lspconfig.")
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  vim.notify("Couldn't load cmp_nvim_lsp.")
  return
end

mason.setup()

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol
                                                           .make_client_capabilities())

local on_attach = require("utils.lsp-on-attach")

mason_lspconfig.setup({
  ensure_installed = {
    "bashls", "clangd", "cssls", "dockerls", "gopls", "graphql", "html",
    "jsonls", "tsserver", "marksman", "pyright", "rust_analyzer", "vuels",
    "lemminx", "yamlls", "tailwindcss", "svelte", "prismals", "cmake", "dotls",
    "efm", "astro", "taplo", "terraformls", "tflint", "vimls"
  },
  automatic_installation = true
})

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end
}
