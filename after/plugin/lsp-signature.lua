local status, lsp_signature = pcall(require, "lsp_signature")
if not status then
  vim.notify("Couldn't load lsp_signature.")
  return
end

lsp_signature.setup({
  bind = true,
  handler_opts = {
    border = "rounded",
  },
  floating_window = false,
})
