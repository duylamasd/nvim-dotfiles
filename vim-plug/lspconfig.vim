lua << EOF
local nvim_lsp = require'lspconfig'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  --buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    vim.cmd [[augroup Format]]
    vim.cmd [[autocmd! * <buffer>]]
    vim.cmd [[autocmd BufWritePre,InsertLeave <buffer> lua vim.lsp.buf.formatting_sync()]]
    vim.cmd [[augroup END]]
  end

  -- LSPsaga key maps
  buf_set_keymap('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
  --buf_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_Scroll_with_saga(1)<CR>", opts)
  --buf_set_keymap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_Scroll_with_saga(-1)<CR>", opts)
  buf_set_keymap('n', 'gs', "<cmd>lua  require('lspsaga.signaturehelp').signature_help()<CR>", opts)
  buf_set_keymap('n', '<space>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
  --buf_set_keymap('n', '<space>gd', "<cmd>lua require('lspsaga.provider').preview_definition()<CR>", opts)
  buf_set_keymap('n', '<space>ld', "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", opts)
  buf_set_keymap('n', '<space>lc', "<cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostics()<CR>", opts)
  buf_set_keymap('n', '<space>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
  --buf_set_keymap('x', '<leader>ca', ":<C-u<lua require('lspsaga.codeaction').range_code_action()<CR>", opts)
  buf_set_keymap('n', 'gh', "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>", opts)

  local lsp_signature = require'lsp_signature'
  lsp_signature.on_attach({
    bind = true,
    handler_opts = {
      border = "rounded"
    },
    use_lspsaga = true
  }, bufnr)

end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'python'
  },
  init_options = {
    filetypes = {
      javascript = "eslint",
      ["javascript.jsx"] = "eslint",
      javascriptreact = "eslint",
      typescript = "eslint",
      typescriptreact = "eslint",
      ["typescript.tsx"] = "eslint",
    },
    linters = {
      eslint = {
        sourceName = "eslint",
        command = "./node_modules/.bin/eslint",
        rootPatterns = { ".git" },
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json",
        },
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity",
        };
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      }
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
	args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
	rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier',
	args = { '--stdin-filepath', '%filename' },
      },
      black = {
        command = 'black',
	args = { '--quiet', '-' },
      },
    },
    formatFiletypes = {
      javascript = 'prettier',
      javascriptreact = 'prettier',
      ["javascript.jsx"] = 'prettier',
      typescript = 'prettier',
      typescriptreact = 'prettier',
      ["typescript.tsx"] = 'prettier',
      json = 'prettier',
      python = 'black'
    }
  }
}

nvim_lsp.sqlls.setup {
  cmd = {"path/to/command", "up", "--method", "stdio"}
}

nvim_lsp.yamlls.setup {
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
	["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["../path/relative/to/file.yml"] = "/.github/workflows/*",
        ["/path/from/root/of/project"] = "/.github/workflows/*",
      },
    },
  },
}


nvim_lsp.tsserver.setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false

    on_attach(client, bufnr)
  end,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
  capabilities = capabilities,
}

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.graphql.setup {
  capabilities = capabilities
}

nvim_lsp.cssls.setup {
  capabilities = capabilities
}

nvim_lsp.html.setup {
  capabilities = capabilities
}

nvim_lsp.jsonls.setup = {
  capabilities = capabilities
}
EOF
