local M = {}

M.config = function()
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting

  local sources = {
    formatting.black, formatting.prettierd, formatting.prettier,
    formatting.rustfmt, formatting.lua_format.with({
      extra_args = {"--indent-width", "2", "--tab-width", "2"}
    }), formatting.gofmt
  }

  local on_attach = require("utils.lsp-on-attach")

  null_ls.setup {sources = sources, on_attach = on_attach}
end

return M
