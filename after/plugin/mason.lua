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
    "astro", "taplo", "terraformls", "tflint", "vimls"
  },
  automatic_installation = true
})

mason_lspconfig.setup_handlers {
  function(server_name)
    if server_name == "denols" then
      lspconfig[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
        flags = {allow_incremental_sync = true, debounce_text_changes = 500}
      }
      return
    end

    if server_name == "tsserver" then
      lspconfig[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("package.json"),
        flags = {allow_incremental_sync = true, debounce_text_changes = 500}
      }
      return
    end

    if server_name == "gopls" then
      lspconfig[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
        flags = {allow_incremental_sync = true, debounce_text_changes = 500},
        settings = {gopls = {usePlaceholders = true}}
      }
    end

    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {allow_incremental_sync = true, debounce_text_changes = 500}
    }
  end
}
