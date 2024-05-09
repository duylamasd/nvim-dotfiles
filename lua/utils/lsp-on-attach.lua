-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Mappings.
  local options = { buffer = bufnr }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, options)
  vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, options)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, options)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, options)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, options)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, options)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, options)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, options)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, options)

  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, options)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, options)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, options)
  vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, options)
end

return on_attach