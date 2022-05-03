local lsp = require("lsp.lsp")
local on_attach = require("lsp.on-attach")

lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split("package.path", ";")
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
}
