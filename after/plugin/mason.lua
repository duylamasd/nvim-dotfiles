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

local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  vim.notify("Couldn't load lspsaga.")
  return
end

mason.setup()
saga.init_lsp_saga()

local diagnostic = require("lspsaga.diagnostic")

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  --buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap("n", "<space>rn", "<cmd>Lspsaga rename<CR>", opts)
  --buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap("n", "<space>ca", "<cmd>Lspsaga code_action<CR>", opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  --buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  --buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

  vim.keymap.set("n", "[e", function() diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, opts)
  vim.keymap.set("n", "]e", function() diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, opts)

  if client.server_capabilities.documentFormattingProvider then
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)

    vim.cmd([[augroup Format]])
    vim.cmd([[autocmd! * <buffer>]])
    vim.cmd([[autocmd BufWritePre,InsertLeave <buffer> lua vim.lsp.buf.format { async = false }]])
    vim.cmd([[augroup END]])
  end
end

mason_lspconfig.setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "cssls",
    "diagnosticls",
    "dockerls",
    "gopls",
    "graphql",
    "html",
    "jsonls",
    "tsserver",
    "sumneko_lua",
    "marksman",
    "pyright",
    "rust_analyzer",
    "sqls",
    "vuels",
    "lemminx",
    "yamlls",
    "tailwindcss",
    "svelte",
    "prismals",
    "cmake",
    "dotls",
    "efm",
    "astro",
  }
})

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
}
