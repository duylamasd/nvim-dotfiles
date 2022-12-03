local status, null_ls = pcall(require, "null-ls")

if not status then
  vim.notify("Couldn't load null-ls.")
  return
end

local on_attach = require("utils.lsp-on-attach")

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.rustfmt,
  },
  on_attach = on_attach
}
