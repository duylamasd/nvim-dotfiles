local M = {}

M.config = function()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  mason.setup()

  local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol
                                                             .make_client_capabilities())

  local on_attach = require("utils.lsp-on-attach")

  mason_lspconfig.setup({
    ensure_installed = {
      "bashls", "clangd", "cssls", "dockerls", "gopls", "graphql", "html",
      "jsonls", "tsserver", "marksman", "pyright", "rust_analyzer", "vuels",
      "lemminx", "yamlls", "tailwindcss", "svelte", "prismals", "cmake",
      "dotls", "astro", "taplo", "terraformls", "tflint", "vimls"
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
          single_file_support = false,
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
end

return M
